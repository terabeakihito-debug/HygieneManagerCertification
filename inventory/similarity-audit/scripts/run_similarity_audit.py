#!/usr/bin/env python3
"""Read-only mechanical similarity audit.

Compares original MCQs and /learn examples against past-exam SQL rows and
data/past-exams text. Does not modify source content. Does not copy past-exam
stems into output files.
"""

from __future__ import annotations

import csv
import importlib.util
import json
import math
import re
import unicodedata
from collections import Counter, defaultdict
from difflib import SequenceMatcher
from pathlib import Path

ROOT = Path("/home/cursorworker/dev/HygieneManagerCertification")
OUT = ROOT / "inventory" / "similarity-audit"
SCRIPT_DIR = Path(__file__).resolve().parent

INV_PATH = ROOT / "inventory" / "build-inventory.py"
spec = importlib.util.spec_from_file_location("question_inventory", INV_PATH)
inv = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(inv)

EXAM_ORDER = inv.EXAM_ORDER
EXAM_NAMES = inv.EXAM_NAMES
DOLLAR_RE = inv.DOLLAR_RE
UUID_RE = inv.UUID_RE
QNUM_RE = inv.QNUM_RE
SITTING_RE = inv.SITTING_RE
CONST_RE = inv.CONST_RE

NUM_RE = re.compile(r"\d+(?:\.\d+)?")
PUNCT_RE = re.compile(r"[、。，．・：:；;！？!?「」『』（）()\[\]【】〈〉《》―ー\-〜~…・,/\\]")
MARKDOWN_RE = re.compile(r"[#*_`>|]")
CHOICE_MARK_RE = re.compile(
    r"^[○◯●]?\s*[（(]?\s*[1-5１-５ｱ-ｵア-オabcdABCD]\s*[)）.\s]*"
)
BOILERPLATE_RE = re.compile(
    r"(?:次のうちどれか|適切なものはどれか|誤っているものはどれか|"
    r"正しいものはどれか|正しいものは次のうちどれか|"
    r"法令上[、,]?|次の記述のうち|次の文中の|"
    r"\(１\)[～〜\-][（(]?５[)）]|"
    r"のうちどれか[。.]?)"
)
CALC_HINT_RE = re.compile(r"(計算|求める|最も近い|絶対圧|ゲージ|分圧|つり合|合力|張力|体積|圧力)")
UNITISH = (
    "mpa",
    "kpa",
    "n",
    "kn",
    "kg",
    "t",
    "l",
    "cm",
    "mm",
    "m",
    "km",
    "h",
    "min",
    "s",
    "度",
    "人",
    "日",
    "年",
    "時間",
    "%",
)

# High-DF / statutory-looking values. Used only to *downgrade*, never as sole HIGH.
COMMON_NUMBERS = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "14",
    "20",
    "30",
    "40",
    "45",
    "50",
    "60",
    "100",
    "180",
    "300",
    "360",
    "500",
    "720",
    "1000",
    "3000",
    "0.1",
    "273",
    "9.8",
}


def nfkc(text: str) -> str:
    return unicodedata.normalize("NFKC", text or "")


def collapse_ws(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip()


def strip_choice_marks(text: str) -> str:
    return CHOICE_MARK_RE.sub("", text).strip()


def normalize_keep_digits(text: str, strip_boilerplate: bool = True) -> str:
    t = nfkc(text)
    t = t.replace("\u3000", " ")
    t = MARKDOWN_RE.sub("", t)
    t = t.replace("○", " ").replace("◯", " ")
    lines = []
    for line in t.splitlines():
        lines.append(strip_choice_marks(line))
    t = " ".join(lines)
    t = PUNCT_RE.sub("", t)
    if strip_boilerplate:
        t = BOILERPLATE_RE.sub("", t)
    t = collapse_ws(t).lower()
    return t


def normalize_drop_digits(text: str) -> str:
    t = normalize_keep_digits(text)
    t = NUM_RE.sub("NUM", t)
    t = collapse_ws(t)
    return t


def char_ngrams(text: str, n: int) -> list[str]:
    if len(text) < n:
        return [text] if text else []
    return [text[i : i + n] for i in range(len(text) - n + 1)]


def jaccard(a: set[str], b: set[str]) -> float:
    if not a and not b:
        return 1.0
    if not a or not b:
        return 0.0
    inter = len(a & b)
    if inter == 0:
        return 0.0
    return inter / len(a | b)


def containment(small: set[str], large: set[str]) -> float:
    if not small:
        return 0.0
    return len(small & large) / len(small)


def cosine_tfidf(tf: Counter[str], idf: dict[str, float], other_tf: Counter[str]) -> float:
    if not tf or not other_tf:
        return 0.0
    dot = 0.0
    na = 0.0
    nb = 0.0
    keys = set(tf) | set(other_tf)
    for g in keys:
        wa = tf[g] * idf.get(g, 0.0)
        wb = other_tf[g] * idf.get(g, 0.0)
        dot += wa * wb
        na += wa * wa
        nb += wb * wb
    if na <= 0 or nb <= 0:
        return 0.0
    return dot / math.sqrt(na * nb)


def seq_ratio(a: str, b: str) -> float:
    if not a and not b:
        return 1.0
    if not a or not b:
        return 0.0
    # Cap SequenceMatcher cost on very long learn bodies.
    if len(a) > 1200:
        a = a[:1200]
    if len(b) > 1200:
        b = b[:1200]
    return SequenceMatcher(None, a, b).ratio()


def lcs_len_ratio(a: str, b: str) -> tuple[int, float]:
    if not a or not b:
        return 0, 0.0
    if len(a) > 800:
        a = a[:800]
    if len(b) > 800:
        b = b[:800]
    blocks = SequenceMatcher(None, a, b).get_matching_blocks()
    total = sum(m.size for m in blocks)
    return total, total / max(len(a), len(b))


def extract_numbers(text: str) -> list[str]:
    return NUM_RE.findall(nfkc(text))


def distinctive_numbers(nums: list[str], df: Counter[str]) -> list[str]:
    out = []
    seen = set()
    for n in nums:
        if n in seen:
            continue
        seen.add(n)
        if n in COMMON_NUMBERS:
            continue
        if df.get(n, 0) >= 12:
            continue
        out.append(n)
    return out


def summarize(text: str, limit: int = 36) -> str:
    one = collapse_ws(nfkc(text))
    if len(one) <= limit:
        return one
    return one[: limit - 1] + "…"


# ---------------------------------------------------------------------------
# Extraction (full texts stay in memory only)
# ---------------------------------------------------------------------------


def extract_sql_questions() -> list[dict]:
    sql_files = sorted((ROOT / "supabase/migrations").glob("*.sql"))
    rows: list[dict] = []
    for path in sql_files:
        text = path.read_text()
        rel = str(path.relative_to(ROOT))
        parts = re.split(r"(?=INSERT INTO questions\b)", text)
        for part in parts[1:]:
            head = re.split(
                r"\n(?:INSERT INTO mock_exams\b|insert into mock_exams\b|UPDATE questions\b|INSERT INTO exams\b|INSERT INTO exam_types\b)",
                part,
                maxsplit=1,
            )[0]
            dollars = inv.extract_dollars(head)
            q_text = dollars.get("q", [""])[0] if dollars.get("q") else ""
            e_text = dollars["e"][0] if dollars.get("e") else ""
            source_type = ""
            source_note = ""
            if not e_text:
                m_expl = re.search(
                    r"\$q\$.*?\$q\$,\s*(?:\$e\$(.*?)\$e\$|'((?:\\'|[^'])*)')",
                    head,
                    re.S,
                )
                if m_expl:
                    e_text = m_expl.group(1) if m_expl.group(1) is not None else (m_expl.group(2) or "")
            if not q_text:
                m9 = re.search(
                    r"INSERT INTO questions[^\n]+\n\s*SELECT et\.id, c\.id,\s*'((?:\\'|[^'])*)',\s*'((?:\\'|[^'])*)',\s*'(original|past_exam)',\s*'((?:\\'|[^'])*)'",
                    head,
                    re.S,
                )
                if m9:
                    q_text, e_text = m9.group(1), m9.group(2)
                    source_type = m9.group(3)
                    source_note = m9.group(4)
                else:
                    continue
            else:
                st = re.search(r"'(past_exam|original)'", head)
                source_type = st.group(1) if st else ""
                notes = re.findall(r"'([^']{4,160})'", head)
                ranked = []
                for cand in notes:
                    if any(k in cand for k in ("問", "オリジナル", "独自", "公表", "基礎問題")):
                        ranked.append(((1 if "問" in cand else 0, len(cand)), cand))
                if ranked:
                    ranked.sort(reverse=True)
                    source_note = ranked[0][1]
                else:
                    mnote = re.search(r"'(past_exam|original)',\s*'([^']*)'", head)
                    source_note = mnote.group(2) if mnote else (notes[-1] if notes else "")

            uuids = UUID_RE.findall(head.split("INSERT INTO choices")[0])
            qid = uuids[0] if uuids else f"generated:{path.name}:{len(rows)+1}"
            cat_m = re.search(r"c\.name = '([^']+)'", head)
            category = cat_m.group(1) if cat_m else ""
            exam_type_id_m = re.search(
                r"\(SELECT id FROM exam_types WHERE exam_id = '[^']+' AND code = '([^']+)'\)",
                head.split("INSERT INTO choices")[0],
            )
            if exam_type_id_m:
                exam_type_code = exam_type_id_m.group(1)
            else:
                et_m = re.search(r"\bet\.code = '([^']+)'", head.split("INSERT INTO choices")[0])
                exam_type_code = et_m.group(1) if et_m else ""
            exam_id = inv.infer_exam(rel, head, source_note, exam_type_code)
            question_number = inv.parse_question_number(source_note)
            sitting_m = SITTING_RE.search(source_note)
            sitting = sitting_m.group(0) if sitting_m else ""

            choice_block = ""
            cm = re.search(r"INSERT INTO choices\b(.*)", head, re.S)
            if cm:
                choice_block = cm.group(1).split("INSERT INTO ")[0]
            choice_texts = [b for tag, b in DOLLAR_RE.findall(choice_block) if tag == "c"]
            flags = []
            if choice_texts:
                flags = re.findall(r"\$c\$.*?\$c\$,\s*(true|false)", choice_block, re.S)
            if not choice_texts:
                pairs = re.findall(r"\('([^']+)',\s*(true|false),\s*\d+\)", choice_block)
                choice_texts = [p[0] for p in pairs]
                flags = [p[1] for p in pairs]
            correct_index = next((i + 1 for i, f in enumerate(flags) if f == "true"), None)
            origin = inv.classify_origin(source_type, source_note, rel)
            start = text.find(part)
            line_no = text.count("\n", 0, start) + 1 if start >= 0 else 0
            rows.append(
                {
                    "kind": "multiple_choice",
                    "corpus": "sql",
                    "exam_id": exam_id,
                    "exam_name": EXAM_NAMES.get(exam_id, exam_id),
                    "exam_type_code": exam_type_code,
                    "subject": category,
                    "question_id": qid,
                    "question_number": question_number,
                    "sitting": sitting,
                    "source_file": rel,
                    "line_no": line_no,
                    "origin": origin,
                    "usage_status": inv.usage_status(exam_id, source_type, source_note),
                    "source_type": source_type,
                    "source_note": source_note,
                    "stem": q_text,
                    "explanation": e_text,
                    "choices": choice_texts,
                    "correct_index": correct_index,
                    "topic_id": "",
                }
            )
    inv.apply_exam_type_updates(sql_files, rows)
    return [r for r in rows if (r["stem"] or "").strip()]


def extract_txt_questions() -> list[dict]:
    rows = []
    heading_exam: dict[str, str] = {}
    for hp in (ROOT / "data/heading-maps").glob("*.json"):
        try:
            data = json.loads(hp.read_text())
        except json.JSONDecodeError:
            continue
        exam_id = data.get("examId") or hp.stem
        for f in data.get("files") or []:
            heading_exam[f.get("path", "")] = exam_id
    for path in sorted((ROOT / "data/past-exams").glob("*.txt")):
        text = path.read_text()
        rel = str(path.relative_to(ROOT))
        exam_id = heading_exam.get(rel) or inv.infer_exam(rel, text[:400], text[:200], "")
        if "type1" in path.name or "type2" in path.name:
            exam_id = "hygiene"
        sitting_m = SITTING_RE.search(text[:400])
        sitting = sitting_m.group(0) if sitting_m else ""
        parts = re.split(r"(?=問\s*[0-9０-９]+)", text)
        offset = 0
        for part in parts:
            start = text.find(part, offset)
            offset = start + 1 if start >= 0 else offset
            qnum_m = QNUM_RE.search(part[:20])
            if not qnum_m:
                continue
            qnum = inv.z2n(qnum_m.group(1))
            line_no = text.count("\n", 0, start) + 1 if start >= 0 else 0
            lines = part.splitlines()
            first = lines[0] if lines else ""
            first_stem = QNUM_RE.sub("", first, count=1).strip()
            stem_lines = [first_stem] if first_stem else []
            choices = []
            correct_index = None
            for line in lines[1:]:
                raw = line.strip()
                if not raw:
                    continue
                marked = raw.startswith("○") or raw.startswith("◯")
                body = raw[1:].strip() if marked else raw
                cm = re.match(r"[（(]\s*([1-5１-５])\s*[)）]\s*(.*)$", body)
                if cm:
                    idx = int(inv.z2n(cm.group(1)))
                    choices.append(cm.group(2).strip())
                    if marked:
                        correct_index = idx
                else:
                    if not choices:
                        stem_lines.append(raw)
            stem = "\n".join(stem_lines)
            if not stem.strip():
                continue
            rows.append(
                {
                    "kind": "txt_past_exam",
                    "corpus": "txt",
                    "exam_id": exam_id,
                    "exam_name": EXAM_NAMES.get(exam_id, exam_id),
                    "exam_type_code": "type1"
                    if "type1" in path.name
                    else ("type2" if "type2" in path.name else "common"),
                    "subject": "",
                    "question_id": f"txt:{path.stem}:問{qnum}",
                    "question_number": qnum,
                    "sitting": sitting,
                    "source_file": rel,
                    "line_no": line_no,
                    "origin": "past_exam_suspected",
                    "usage_status": "unused",
                    "source_type": "past_exam",
                    "source_note": f"{sitting} {path.stem} 問{qnum}".strip(),
                    "stem": stem,
                    "explanation": "",
                    "choices": choices,
                    "correct_index": correct_index,
                    "topic_id": "",
                }
            )
    return rows


def diagram_alts() -> dict[str, str]:
    mapping = {}
    for path in (ROOT / "src/components/learn/diagrams").rglob("*.tsx"):
        text = path.read_text()
        for m in re.finditer(
            r"export function ([A-Za-z0-9]+)\([^)]*\)[\s\S]{0,400}?(?:SvgBoard|DiagramScene)[^>]*alt=\"([^\"]*)\"",
            text,
        ):
            mapping[m.group(1)] = m.group(2)
    return mapping


def extract_calc_examples(body: str) -> str:
    if not body:
        return ""
    sents = re.split(r"(?<=[。\n])", body)
    kept = []
    for s in sents:
        if NUM_RE.search(s) and CALC_HINT_RE.search(s):
            kept.append(s.strip())
    return "\n".join(kept)


def extract_learn_topics() -> list[dict]:
    alts = diagram_alts()
    mapping = [
        ("hygiene", ROOT / "src/lib/data/learn-content.ts", "HYGIENE_LEARN_TOPICS"),
        ("boiler2", ROOT / "src/lib/data/learn/boiler2-topics.ts", "BOILER2_LEARN_TOPICS"),
        ("crane_all", ROOT / "src/lib/data/learn/crane-all-topics.ts", "CRANE_ALL_LEARN_TOPICS"),
        ("mobile_crane", ROOT / "src/lib/data/learn/mobile-crane-topics.ts", "MOBILE_CRANE_LEARN_TOPICS"),
        ("xray", ROOT / "src/lib/data/learn/xray-topics.ts", "XRAY_LEARN_TOPICS"),
        ("diver", ROOT / "src/lib/data/learn/diver-topics.ts", "DIVER_LEARN_TOPICS"),
        ("pressure_chamber", ROOT / "src/lib/data/learn/pressure-chamber-topics.ts", "PRESSURE_CHAMBER_LEARN_TOPICS"),
        ("cargo_gear", ROOT / "src/lib/data/learn/cargo-gear-topics.ts", "CARGO_GEAR_LEARN_TOPICS"),
    ]
    rows = []
    for exam_id, path, const_name in mapping:
        text = path.read_text()
        rel = str(path.relative_to(ROOT))
        aliases = dict(CONST_RE.findall(text))
        m = re.search(rf"(?:const|export const) {const_name}", text)
        if not m:
            continue
        body_src = text[m.start() :]
        blocks = re.split(r"\n  \{\n    id:", body_src)
        running = text.find(body_src)
        for i, block in enumerate(blocks):
            if i == 0 and "id:" not in block[:80]:
                continue
            if i > 0:
                block = "id:" + block
            id_m = re.search(r'id:\s*"([^"]+)"', block)
            title_m = re.search(r'title:\s*"([^"]+)"', block)
            if not id_m or not title_m:
                continue
            sum_m = re.search(r'summary:\s*"([^"]*)"', block)
            cat_m = re.search(r'categoryName:\s*(?:([A-Z_]+)|"([^"]+)")', block)
            type_m = re.search(r'contentType:\s*"([^"]+)"', block)
            diag_m = re.search(r'diagram:\s*"([^"]+)"', block)
            body_m = re.search(r"body:\s*`([\s\S]*?)`", block)
            raw_cat = ""
            if cat_m:
                raw_cat = cat_m.group(2) or cat_m.group(1) or ""
            cat = aliases.get(raw_cat, raw_cat)
            body = body_m.group(1) if body_m else ""
            diag_name = diag_m.group(1) if diag_m else ""
            alt = alts.get(diag_name, "")
            start = text.find(block[:40], running)
            line_no = text.count("\n", 0, start) + 1 if start >= 0 else 0
            rows.append(
                {
                    "kind": "learn_example",
                    "corpus": "learn",
                    "exam_id": exam_id,
                    "exam_name": EXAM_NAMES[exam_id],
                    "exam_type_code": "",
                    "subject": cat,
                    "question_id": id_m.group(1),
                    "topic_id": id_m.group(1),
                    "question_number": "",
                    "sitting": "",
                    "source_file": rel,
                    "line_no": line_no,
                    "origin": "learn_example",
                    "usage_status": "in_use",
                    "source_type": "learn",
                    "source_note": type_m.group(1) if type_m else "",
                    "stem": title_m.group(1),
                    "title": title_m.group(1),
                    "summary": sum_m.group(1) if sum_m else "",
                    "body": body,
                    "calc_examples": extract_calc_examples(body),
                    "diagram_alt": alt,
                    "explanation": body,
                    "choices": [],
                    "correct_index": None,
                }
            )
    return rows


# ---------------------------------------------------------------------------
# Features and scoring
# ---------------------------------------------------------------------------


def prepare_doc(row: dict) -> dict:
    stem = row.get("stem") or ""
    choices = row.get("choices") or []
    expl = row.get("explanation") or ""
    body = row.get("body") or ""
    title = row.get("title") or stem
    calc = row.get("calc_examples") or ""
    alt = row.get("diagram_alt") or ""
    combo = stem + " " + " ".join(choices)
    if row.get("kind") == "learn_example":
        combo = " ".join(x for x in (title, body, calc, alt) if x)
        stem = body or title
        expl = body
    keep = normalize_keep_digits(combo)
    drop = normalize_drop_digits(combo)
    stem_keep = normalize_keep_digits(stem)
    stem_drop = normalize_drop_digits(stem)
    expl_keep = normalize_keep_digits(expl) if expl and "今後追加予定" not in expl else ""
    choice_keeps = [normalize_keep_digits(c) for c in choices]
    grams3 = char_ngrams(keep, 3)
    grams4 = char_ngrams(keep, 4)
    grams3_drop = char_ngrams(drop, 3)
    stem_g3 = char_ngrams(stem_keep, 3)
    stem_g4 = char_ngrams(stem_keep, 4)
    nums = extract_numbers(combo)
    return {
        "row": row,
        "keep": keep,
        "drop": drop,
        "stem_keep": stem_keep,
        "stem_drop": stem_drop,
        "expl_keep": expl_keep,
        "choice_keeps": choice_keeps,
        "grams3": grams3,
        "grams3_set": set(grams3),
        "grams4_set": set(grams4),
        "grams3_drop_set": set(grams3_drop),
        "stem_g3_set": set(stem_g3),
        "stem_g4_set": set(stem_g4),
        "tf3": Counter(grams3),
        "tf3_drop": Counter(grams3_drop),
        "nums": nums,
        "num_set": set(nums),
        "correct_index": row.get("correct_index"),
        "exam_id": row["exam_id"],
        "is_learn": row.get("kind") == "learn_example",
        "title_keep": normalize_keep_digits(title),
        "calc_keep": normalize_keep_digits(calc),
        "alt_keep": normalize_keep_digits(alt),
        "calc_nums": extract_numbers(calc or combo if row.get("kind") == "learn_example" else ""),
    }


def build_idf(docs: list[dict], key: str) -> dict[str, float]:
    df: Counter[str] = Counter()
    n = len(docs)
    for d in docs:
        df.update(set(d[key]))
    idf = {}
    for g, c in df.items():
        idf[g] = math.log((n + 1) / (c + 1)) + 1.0
    return idf


def choice_overlap(a: list[str], b: list[str]) -> tuple[int, float]:
    if not a or not b:
        return 0, 0.0
    used = set()
    hits = 0
    for ca in a:
        if len(ca) < 4:
            continue
        best = -1
        best_s = 0.0
        for i, cb in enumerate(b):
            if i in used or len(cb) < 4:
                continue
            s = jaccard(set(char_ngrams(ca, 3)), set(char_ngrams(cb, 3)))
            if s > best_s:
                best_s = s
                best = i
        if best >= 0 and best_s >= 0.72:
            used.add(best)
            hits += 1
    return hits, hits / max(len(a), len(b))


def number_match(a: list[str], b: list[str]) -> tuple[str, list[str]]:
    sa, sb = set(a), set(b)
    inter = sorted(sa & sb, key=lambda x: (len(x), x))
    if not sa or not sb:
        return "none", inter
    if sa == sb:
        return "full", inter
    if sa <= sb or sb <= sa:
        return "subset", inter
    if inter:
        return "partial", inter
    return "none", inter


def score_pair(q: dict, c: dict, idf_keep: dict[str, float], idf_drop: dict[str, float], num_df: Counter[str]) -> dict:
    stem_j_keep = jaccard(q["stem_g3_set"], c["stem_g3_set"])
    stem_j_drop = jaccard(set(char_ngrams(q["stem_drop"], 3)), set(char_ngrams(c["stem_drop"], 3)))
    combo_j_keep = jaccard(q["grams3_set"], c["grams3_set"])
    combo_j_drop = jaccard(q["grams3_drop_set"], c["grams3_drop_set"])
    tfidf_keep = cosine_tfidf(q["tf3"], idf_keep, c["tf3"])
    tfidf_drop = cosine_tfidf(q["tf3_drop"], idf_drop, c["tf3_drop"])
    exact = q["stem_keep"] == c["stem_keep"] and bool(q["stem_keep"])
    contain_q_in_c = bool(q["stem_keep"]) and len(q["stem_keep"]) >= 36 and q["stem_keep"] in c["keep"]
    contain_c_in_q = bool(c["stem_keep"]) and len(c["stem_keep"]) >= 36 and c["stem_keep"] in q["keep"]
    gram_contain = containment(c["stem_g4_set"], q["grams4_set"])
    gram_contain_rev = containment(q["stem_g4_set"], c["grams4_set"])
    ch_hits, ch_ratio = choice_overlap(q["choice_keeps"], c["choice_keeps"])
    nkind, nshared = number_match(q["nums"], c["nums"])
    q_dist = set(distinctive_numbers(q["nums"], num_df))
    c_dist = set(distinctive_numbers(c["nums"], num_df))
    dist_shared = sorted(q_dist & c_dist)
    correct_same = (
        q["correct_index"] is not None
        and c["correct_index"] is not None
        and q["correct_index"] == c["correct_index"]
    )
    # Sequence / LCS only if cheap prefilter says it is worth it
    pre = max(stem_j_keep, combo_j_keep, tfidf_keep, gram_contain, gram_contain_rev)
    if pre >= 0.22 or contain_q_in_c or contain_c_in_q or len(dist_shared) >= 2:
        seq_keep = seq_ratio(q["stem_keep"], c["stem_keep"])
        seq_drop = seq_ratio(q["stem_drop"], c["stem_drop"])
        lcs_n, lcs_r = lcs_len_ratio(q["stem_keep"], c["stem_keep"])
        expl_seq = seq_ratio(q["expl_keep"], c["expl_keep"]) if q["expl_keep"] and c["expl_keep"] else 0.0
    else:
        seq_keep = seq_drop = expl_seq = 0.0
        lcs_n, lcs_r = 0, 0.0

    title_j = 0.0
    calc_j = 0.0
    alt_j = 0.0
    if q["is_learn"]:
        title_j = jaccard(set(char_ngrams(q["title_keep"], 3)), c["stem_g3_set"])
        if q["calc_keep"]:
            calc_j = jaccard(set(char_ngrams(q["calc_keep"], 3)), set(char_ngrams(c["keep"], 3)))
        if q["alt_keep"]:
            alt_j = jaccard(set(char_ngrams(q["alt_keep"], 3)), set(char_ngrams(c["keep"], 3)))

    return {
        "exact_stem": exact,
        "containment": contain_q_in_c or contain_c_in_q,
        "gram_containment": round(max(gram_contain, gram_contain_rev), 4),
        "jaccard_stem_keep": round(stem_j_keep, 4),
        "jaccard_stem_drop": round(stem_j_drop, 4),
        "jaccard_combo_keep": round(combo_j_keep, 4),
        "jaccard_combo_drop": round(combo_j_drop, 4),
        "tfidf_keep": round(tfidf_keep, 4),
        "tfidf_drop": round(tfidf_drop, 4),
        "seq_keep": round(seq_keep, 4),
        "seq_drop": round(seq_drop, 4),
        "lcs_len": lcs_n,
        "lcs_ratio": round(lcs_r, 4),
        "expl_seq": round(expl_seq, 4),
        "choice_hits": ch_hits,
        "choice_ratio": round(ch_ratio, 4),
        "correct_index_same": correct_same,
        "number_match": nkind,
        "shared_numbers": nshared[:12],
        "distinctive_shared_numbers": dist_shared[:12],
        "title_jaccard": round(title_j, 4),
        "calc_jaccard": round(calc_j, 4),
        "alt_jaccard": round(alt_j, 4),
        "same_exam": q["exam_id"] == c["exam_id"],
        "prefilter": round(pre, 4),
        "query_stem_len": len(q["stem_keep"]),
        "peer_stem_len": len(c["stem_keep"]),
    }


# Thresholds locked after a dry-run histogram on this corpus.
# Same-exam topical overlap for 法令/力学 routinely sits around Jaccard 0.18–0.28.
# Rewritten originals that keep a scene often land 0.32–0.50.
# Near-copies (stem + several choices) exceeded 0.60 Jaccard and 0.55 seq.
THRESHOLDS = {
    "critical": {
        "rule": "exact stem, long containment, or stem+choices+numbers nearly identical",
        "jaccard_keep": 0.78,
        "seq_keep": 0.78,
        "choice_hits": 4,
    },
    "high": {
        "rule": "strong stem structure plus 3+ choices or 2+ distinctive numbers",
        "jaccard_keep": 0.52,
        "seq_keep": 0.50,
        "choice_hits": 3,
        "distinctive_nums": 2,
    },
    "medium": {
        "rule": "noticeable structure or number-set overlap; human review required. Short topic-header stems and /learn vocabulary-only overlap are downgraded to LOW.",
        "jaccard_keep": 0.34,
        "seq_keep": 0.42,
        "gram_containment": 0.72,
        "distinctive_nums": 3,
        "tfidf_keep": 0.48,
        "min_stem_len_for_header_seq": 40,
    },
    "low": {
        "rule": "terminology / statutory / formula overlap without a specific scene",
        "jaccard_keep": 0.24,
        "tfidf_keep": 0.32,
    },
}


def classify(score: dict, query_is_learn: bool) -> tuple[str, str]:
    reasons = []
    j = max(score["jaccard_stem_keep"], score["jaccard_combo_keep"])
    jd = max(score["jaccard_stem_drop"], score["jaccard_combo_drop"])
    seq = score["seq_keep"]
    ch = score["choice_hits"]
    dist_n = len(score["distinctive_shared_numbers"])
    common_only_numbers = score["number_match"] in {"full", "subset", "partial"} and dist_n == 0
    scene = dist_n >= 2 and (j >= 0.28 or seq >= 0.36)
    choices_strong = ch >= 3
    expl_align = score["expl_seq"] >= 0.55

    if score["exact_stem"]:
        reasons.append("stem_exact")
    if score["containment"]:
        reasons.append("long_containment")
    if score["gram_containment"] >= 0.88 and (len(score["shared_numbers"]) >= 2 or ch >= 2):
        reasons.append("stem_almost_contained")

    if score["exact_stem"] or score["containment"]:
        if choices_strong or dist_n >= 2 or (not query_is_learn and ch >= 2):
            reasons.append("stem_and_choices_or_numbers")
            return "CRITICAL", "+".join(reasons)
        if query_is_learn:
            reasons.append("learn_contains_or_equals_stem")
            return "CRITICAL", "+".join(reasons)
        return "HIGH", "+".join(reasons) or "exact_or_contained"

    if (
        j >= THRESHOLDS["critical"]["jaccard_keep"]
        and seq >= THRESHOLDS["critical"]["seq_keep"]
        and (ch >= THRESHOLDS["critical"]["choice_hits"] or dist_n >= 2)
    ):
        reasons.append("near_copy_multi_signal")
        return "CRITICAL", "+".join(reasons)

    if (
        (j >= THRESHOLDS["high"]["jaccard_keep"] and seq >= THRESHOLDS["high"]["seq_keep"] and (choices_strong or dist_n >= THRESHOLDS["high"]["distinctive_nums"]))
        or (j >= 0.60 and ch >= 3)
        or (scene and choices_strong)
        or (score["gram_containment"] >= 0.80 and (choices_strong or dist_n >= 2))
        or (expl_align and j >= 0.45 and (choices_strong or dist_n >= 2))
    ):
        if scene:
            reasons.append("scene_and_numbers")
        if choices_strong:
            reasons.append("choice_overlap")
        if expl_align:
            reasons.append("explanation_order")
        reasons.append("strong_structure")
        return "HIGH", "+".join(reasons)

    if (
        j >= THRESHOLDS["medium"]["jaccard_keep"]
        or seq >= THRESHOLDS["medium"]["seq_keep"]
        or score["tfidf_keep"] >= THRESHOLDS["medium"]["tfidf_keep"]
        or score["gram_containment"] >= THRESHOLDS["medium"]["gram_containment"]
        or (dist_n >= THRESHOLDS["medium"]["distinctive_nums"] and j >= 0.20)
        or (query_is_learn and (score["calc_jaccard"] >= 0.40 or (dist_n >= 2 and score["calc_jaccard"] >= 0.22)))
    ):
        short_header = (
            score.get("query_stem_len", 0) < 40
            and ch == 0
            and dist_n == 0
            and score["jaccard_combo_keep"] < 0.28
            and not query_is_learn
        )
        if short_header:
            reasons.append("short_topic_header")
            return "LOW", "+".join(reasons)
        learn_vocab_only = (
            query_is_learn
            and score["calc_jaccard"] < 0.35
            and dist_n < 2
            and score["jaccard_combo_keep"] < 0.32
            and score["gram_containment"] < 0.82
        )
        if learn_vocab_only and j < 0.40:
            reasons.append("shared_topic_vocabulary")
            return "LOW", "+".join(reasons)
        if common_only_numbers and j < 0.40 and ch < 2 and score["gram_containment"] < 0.70:
            reasons.append("statutory_or_formula_numbers")
            return "LOW", "+".join(reasons)
        if jd >= 0.45 and j < 0.36 and dist_n == 0 and ch < 2:
            reasons.append("structure_without_distinctive_numbers")
            return "LOW", "+".join(reasons)
        reasons.append("noticeable_overlap")
        if dist_n:
            reasons.append("distinctive_numbers")
        if ch:
            reasons.append("some_choices")
        return "MEDIUM", "+".join(reasons)

    if j >= THRESHOLDS["low"]["jaccard_keep"] or score["tfidf_keep"] >= THRESHOLDS["low"]["tfidf_keep"] or jd >= 0.30:
        reasons.append("terminology_or_boilerplate")
        return "LOW", "+".join(reasons)
    return "NO_MATCH", "below_thresholds"


TIER_RANK = {"CRITICAL": 0, "HIGH": 1, "MEDIUM": 2, "LOW": 3, "NO_MATCH": 4}


def candidate_row(query: dict, corpus: dict, score: dict, tier: str, reason: str, field: str) -> dict:
    q = query["row"]
    c = corpus["row"]
    return {
        "query_kind": q["kind"],
        "query_exam_id": q["exam_id"],
        "query_id": q["question_id"],
        "query_topic_id": q.get("topic_id") or "",
        "query_file": q["source_file"],
        "query_line": q.get("line_no") or 0,
        "query_usage": q["usage_status"],
        "query_subject": q.get("subject") or "",
        "query_summary": summarize(q.get("title") or q.get("stem") or ""),
        "peer_kind": c["kind"],
        "peer_exam_id": c["exam_id"],
        "peer_id": c["question_id"],
        "peer_file": c["source_file"],
        "peer_line": c.get("line_no") or 0,
        "peer_note": c.get("source_note") or "",
        "compared_field": field,
        "tier": tier,
        "reason": reason,
        "same_exam": score["same_exam"],
        "exact_stem": score["exact_stem"],
        "containment": score["containment"],
        "jaccard_stem_keep": score["jaccard_stem_keep"],
        "jaccard_stem_drop": score["jaccard_stem_drop"],
        "jaccard_combo_keep": score["jaccard_combo_keep"],
        "jaccard_combo_drop": score["jaccard_combo_drop"],
        "tfidf_keep": score["tfidf_keep"],
        "tfidf_drop": score["tfidf_drop"],
        "seq_keep": score["seq_keep"],
        "seq_drop": score["seq_drop"],
        "lcs_len": score["lcs_len"],
        "lcs_ratio": score["lcs_ratio"],
        "expl_seq": score["expl_seq"],
        "gram_containment": score["gram_containment"],
        "choice_hits": score["choice_hits"],
        "choice_ratio": score["choice_ratio"],
        "correct_index_same": score["correct_index_same"],
        "number_match": score["number_match"],
        "shared_numbers": "|".join(score["shared_numbers"]),
        "distinctive_shared_numbers": "|".join(score["distinctive_shared_numbers"]),
        "title_jaccard": score["title_jaccard"],
        "calc_jaccard": score["calc_jaccard"],
        "alt_jaccard": score["alt_jaccard"],
    }


def best_for_query(qdoc: dict, corpus_docs: list[dict], idf_keep, idf_drop, num_df) -> tuple[str, dict | None, dict | None]:
    best_tier = "NO_MATCH"
    best_score = None
    best_doc = None
    best_reason = "below_thresholds"
    # Prefer same-exam peers; still scan all.
    ordered = sorted(corpus_docs, key=lambda d: (d["exam_id"] != qdoc["exam_id"]))
    # Cheap prefilter: compute jaccard on 3-grams for all, keep top 40 + distinctive-number hits
    prelim = []
    qg = qdoc["grams3_set"]
    qn = qdoc["num_set"]
    qdist = set(distinctive_numbers(qdoc["nums"], num_df))
    for d in ordered:
        inter = len(qg & d["grams3_set"])
        union = len(qg | d["grams3_set"]) or 1
        jac = inter / union
        nshared = len(qn & d["num_set"])
        dshared = len(qdist & set(distinctive_numbers(d["nums"], num_df)))
        if jac >= 0.12 or dshared >= 2 or (nshared >= 4 and jac >= 0.08):
            prelim.append((-(jac + 0.08 * dshared + (0.04 if d["exam_id"] == qdoc["exam_id"] else 0)), id(d), d))
    prelim.sort(key=lambda x: x[0])
    shortlist = [d for _, _, d in prelim[:48]]
    if not shortlist:
        return "NO_MATCH", None, None
    for d in shortlist:
        sc = score_pair(qdoc, d, idf_keep, idf_drop, num_df)
        tier, reason = classify(sc, qdoc["is_learn"])
        better = TIER_RANK[tier] < TIER_RANK[best_tier]
        if better or (
            tier == best_tier
            and best_score
            and max(sc["jaccard_combo_keep"], sc["tfidf_keep"], sc["seq_keep"])
            > max(best_score["jaccard_combo_keep"], best_score["tfidf_keep"], best_score["seq_keep"])
        ):
            best_tier, best_score, best_doc, best_reason = tier, sc, d, reason
    if best_score is None:
        return "NO_MATCH", None, None
    best_score = dict(best_score)
    best_score["classify_reason"] = best_reason
    return best_tier, best_score, best_doc


def empty_counts() -> dict[str, int]:
    return {k: 0 for k in TIER_RANK}


def write_markdown(summary: dict, review_rows: list[dict]) -> None:
    mcq = summary["mcq"]
    learn = summary["learn"]
    th = THRESHOLDS
    review_md = ["# 人による確認キュー", "", "自動判定は類似候補の抽出であり、著作権侵害の断定ではない。", ""]
    review_md.append("優先順: 使用中 CRITICAL → 使用中 HIGH → 使用中 MEDIUM → 未使用 CRITICAL/HIGH/MEDIUM。")
    review_md.append("")
    for row in review_rows:
        review_md.append(
            f"## [{row['tier']}] {row['query_usage']} {row['query_kind']} `{row['query_id']}`"
        )
        review_md.append("")
        review_md.append(
            f"- 検査: {row['query_exam_id']} / {row['query_file']}:{row['query_line']}"
            + (f" / topic `{row['query_topic_id']}`" if row["query_topic_id"] else "")
        )
        review_md.append(
            f"- 相手: {row['peer_exam_id']} `{row['peer_id']}` / {row['peer_file']}:{row['peer_line']}"
        )
        review_md.append(
            f"- 指標: j_stem={row['jaccard_stem_keep']} j_combo={row['jaccard_combo_keep']} "
            f"tfidf={row['tfidf_keep']} seq={row['seq_keep']} choices={row['choice_hits']} "
            f"nums={row['number_match']} distinctive={row['distinctive_shared_numbers'] or '-'}"
        )
        review_md.append(f"- 理由: {row['reason']}")
        review_md.append(f"- 識別要約: {row['query_summary']}")
        review_md.append("")
    (OUT / "review-queue.md").write_text("\n".join(review_md) + "\n")

    def tier_table(block: dict) -> str:
        headers = ["区分", "CRITICAL", "HIGH", "MEDIUM", "LOW", "NO_MATCH", "合計"]
        lines = ["| " + " | ".join(headers) + " |", "|" + "|".join(["---"] * 7) + "|"]
        for usage in ("in_use", "unused", "all"):
            c = block["by_usage"][usage]
            total = sum(c.values())
            lines.append(
                "| "
                + " | ".join(
                    [
                        usage,
                        str(c["CRITICAL"]),
                        str(c["HIGH"]),
                        str(c["MEDIUM"]),
                        str(c["LOW"]),
                        str(c["NO_MATCH"]),
                        str(total),
                    ]
                )
                + " |"
            )
        lines.append("")
        lines.append("| 資格 | CRITICAL | HIGH | MEDIUM | LOW | NO_MATCH |")
        lines.append("|---|---:|---:|---:|---:|---:|")
        for eid in EXAM_ORDER:
            c = block["by_exam"][eid]
            lines.append(
                f"| {eid} | {c['CRITICAL']} | {c['HIGH']} | {c['MEDIUM']} | {c['LOW']} | {c['NO_MATCH']} |"
            )
        return "\n".join(lines)

    readme = f"""# 機械的類似度監査（読み取り専用）

調査日: 2026-09-05  
対象リポジトリ: `HygieneManagerCertification`  
方針: 問題本文・migration・/learn・表示ロジックは変更していない。commit / push / デプロイなし。  
自動判定は類似候補の抽出であり、著作権侵害の断定ではない。  
今回の走査では CRITICAL / HIGH は 0 件だった。近傍コピー未検出であり、法的クリアランスではない。

## 再実行

```bash
python3 inventory/similarity-audit/scripts/run_similarity_audit.py
```

標準ライブラリのみ（`unicodedata` / `difflib` / `math` / `re`）。新規パッケージは使っていない。

## 対象件数と処理件数

| 集合 | 予定 | 処理 |
|---|---:|---:|
| オリジナル択一 | 368 | {summary['counts']['original_mcq']} |
| うち使用中 | 344 | {summary['counts']['original_mcq_in_use']} |
| うち未使用 | 24 | {summary['counts']['original_mcq_unused']} |
| /learn 説明例 | 296 | {summary['counts']['learn']} |
| 過去問疑い SQL | 708 | {summary['counts']['corpus_sql']} |
| 過去問テキスト | 18 ファイル | {summary['counts']['corpus_txt_files']} ファイル / {summary['counts']['corpus_txt_questions']} 問 |
| 検査対象の処理漏れ | 0 | {summary['counts']['unprocessed']} |

検査対象は全件、比較コーパス（SQL 708 + txt 問単位）と照合した。

## 比較単位

択一: 問題文、選択肢、正答位置、解説、数値列、問題文+選択肢の結合。  
/learn: タイトル、本文、計算例（数値+計算語を含む文）、図の `alt`。

## 正規化

- Unicode NFKC、全角数字・英数の半角化
- 改行・連続空白の圧縮
- 選択肢番号 `(1)` `（１）` `○（４）` の除去
- Markdown 装飾の除去
- 句読点を除いた比較
- 数字保持版と `NUM` プレースホルダー版の両方

定型文（「次のうちどれか」等）は構造比較から外し、それ単独では高リスクにしない。

## 指標

- 完全一致 / 長い包含
- 文字 3-gram Jaccard（保持・除外）
- 文字 3-gram TF-IDF cosine（コーパス IDF）
- `SequenceMatcher` 比
- 最長共通ブロック長と比率
- 数値列の full / subset / partial
- 選択肢の 3-gram 対応一致数
- 正答位置の一致（参考。単独では上げない）

## しきい値と採用理由

ドライランで同一科目の法令・力学は Jaccard 0.18–0.28 に集中し、場面を共有する書換えは 0.32–0.50、近傍コピーは 0.60 超に乗った。

| 区分 | 目安 | 理由 |
|---|---|---|
| CRITICAL | 完全一致・長文包含、または Jaccard≥{th['critical']['jaccard_keep']} かつ seq≥{th['critical']['seq_keep']} かつ（選択肢≥{th['critical']['choice_hits']} または特徴的数値が2つ以上） | 問題文と選択肢・数値が同時にほぼ同一 |
| HIGH | Jaccard≥{th['high']['jaccard_keep']} かつ seq≥{th['high']['seq_keep']} かつ（選択肢≥{th['high']['choice_hits']} または特徴的数値≥{th['high']['distinctive_nums']}） | 文章構造と誤答肢または固有数値が強く重なる |
| MEDIUM | Jaccard≥{th['medium']['jaccard_keep']} または seq≥{th['medium']['seq_keep']} または TF-IDF≥{th['medium']['tfidf_keep']} または特徴的数値≥{th['medium']['distinctive_nums']} | 人の目が必要 |
| LOW | Jaccard≥{th['low']['jaccard_keep']} または法令値・公式・用語のみ | 高リスクにしない |
| NO_MATCH | それ未満 | 実質候補なし |

法令値・公式・「適切なものはどれか」・選択肢番号だけでは CRITICAL/HIGH にしない。  
固有の場面+数値、語順+複数肢、特徴的誤答肢、解説順の複合一致を優先する。

特徴的数値 = コーパス DF が低く、法定の定番値セットに入らない数。

## 択一オリジナルの最良候補区分

{tier_table(mcq)}

## /learn 説明例の最良候補区分

{tier_table(learn)}

## 限界

- 本番 DB は見ていない。リポジトリ上の SQL / テキストとの比較である。
- 言い換えが強いと MEDIUM 以下に落ちることがある。逆に同じ法令テーマは LOW が出やすい。
- TF-IDF は文字 3-gram であり、単語意味の埋め込みではない。
- 成果物に過去問本文は複製していない。相手は ID とファイル:行で参照する。
- txt と SQL は同一回の二重コーパスなので、同じ問が両方に出る場合がある。

## 成果物

| ファイル | 内容 |
|---|---|
| `summary.json` | 件数集計と処理検証 |
| `candidates.csv` / `candidates.json` | LOW 以上の候補（本文なし） |
| `review-queue.md` | MEDIUM 以上の確認順 |
| `scripts/run_similarity_audit.py` | 再実行用 |
"""
    (OUT / "README.md").write_text(readme)


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "scripts").mkdir(exist_ok=True)

    print("extracting…")
    sql_rows = extract_sql_questions()
    originals = [r for r in sql_rows if r["origin"] == "original"]
    past_sql = [r for r in sql_rows if r["origin"] == "past_exam_suspected"]
    past_txt = extract_txt_questions()
    learn = extract_learn_topics()

    in_use = [r for r in originals if r["usage_status"] == "in_use"]
    unused = [r for r in originals if r["usage_status"] != "in_use"]
    txt_file_paths = sorted((ROOT / "data/past-exams").glob("*.txt"))
    txt_files = [str(p.relative_to(ROOT)) for p in txt_file_paths]
    parsed_txt_files = sorted({r["source_file"] for r in past_txt})

    print(
        f"originals {len(originals)} in_use {len(in_use)} unused {len(unused)} "
        f"past_sql {len(past_sql)} past_txt {len(past_txt)} files {len(txt_files)} "
        f"parsed_txt_files {len(parsed_txt_files)} learn {len(learn)}"
    )
    if len(originals) != 368 or len(in_use) != 344 or len(past_sql) != 708 or len(learn) != 296:
        raise SystemExit(
            f"count mismatch: originals={len(originals)} in_use={len(in_use)} "
            f"past_sql={len(past_sql)} learn={len(learn)}"
        )
    if len(txt_files) != 18:
        raise SystemExit(f"expected 18 txt files, got {len(txt_files)}")
    if len(parsed_txt_files) != 18:
        missing = set(txt_files) - set(parsed_txt_files)
        raise SystemExit(f"txt files with no parsed questions: {sorted(missing)}")

    print("featurizing…")
    q_mcq = [prepare_doc(r) for r in originals]
    q_learn = [prepare_doc(r) for r in learn]
    corpus = [prepare_doc(r) for r in past_sql + past_txt]
    num_df: Counter[str] = Counter()
    for d in corpus:
        num_df.update(set(d["nums"]))
    idf_keep = build_idf(corpus, "grams3")
    idf_drop = build_idf(corpus, "grams3_drop_set")

    def run_group(docs: list[dict], field: str) -> tuple[list[dict], dict, list[dict]]:
        candidates = []
        processed = []
        by_usage = {"in_use": empty_counts(), "unused": empty_counts(), "all": empty_counts()}
        by_exam = {eid: empty_counts() for eid in EXAM_ORDER}
        for i, q in enumerate(docs):
            tier, score, peer = best_for_query(q, corpus, idf_keep, idf_drop, num_df)
            usage = q["row"]["usage_status"]
            exam = q["row"]["exam_id"]
            by_usage[usage][tier] += 1
            by_usage["all"][tier] += 1
            by_exam[exam][tier] += 1
            processed.append(
                {
                    "id": q["row"]["question_id"],
                    "exam_id": exam,
                    "usage": usage,
                    "tier": tier,
                    "peer_id": peer["row"]["question_id"] if peer else "",
                    "peer_file": peer["row"]["source_file"] if peer else "",
                    "peer_line": peer["row"].get("line_no") if peer else 0,
                }
            )
            if score and peer and tier != "NO_MATCH":
                candidates.append(candidate_row(q, peer, score, tier, score["classify_reason"], field))
            if (i + 1) % 50 == 0:
                print(f"  {field} {i+1}/{len(docs)}")
        return candidates, {"by_usage": by_usage, "by_exam": by_exam}, processed

    print("scoring originals…")
    cand_m, mcq_block, proc_m = run_group(q_mcq, "stem+choices")
    print("scoring learn…")
    cand_l, learn_block, proc_l = run_group(q_learn, "learn_fields")

    candidates = cand_m + cand_l
    processed_ids = {p["id"] for p in proc_m + proc_l}
    expected_ids = {r["question_id"] for r in originals + learn}
    unprocessed = sorted(expected_ids - processed_ids)

    summary = {
        "generated_on": "2026-09-05",
        "disclaimer": "Similarity candidates only. Not a copyright-infringement finding.",
        "counts": {
            "original_mcq": len(originals),
            "original_mcq_in_use": len(in_use),
            "original_mcq_unused": len(unused),
            "learn": len(learn),
            "corpus_sql": len(past_sql),
            "corpus_txt_files": len(txt_files),
            "corpus_txt_questions": len(past_txt),
            "candidates": len(candidates),
            "unprocessed": len(unprocessed),
        },
        "count_checks": {
            "original_is_368": len(originals) == 368,
            "in_use_is_344": len(in_use) == 344,
            "unused_is_24": len(unused) == 24,
            "learn_is_296": len(learn) == 296,
            "past_sql_is_708": len(past_sql) == 708,
            "txt_files_is_18": len(txt_files) == 18,
            "processed_equals_expected": processed_ids == expected_ids,
        },
        "thresholds": THRESHOLDS,
        "mcq": mcq_block,
        "learn": learn_block,
        "processed_mcq": proc_m,
        "processed_learn": proc_l,
        "unprocessed_ids": unprocessed,
    }

    review = [
        r
        for r in candidates
        if r["tier"] in {"CRITICAL", "HIGH", "MEDIUM"}
    ]
    review.sort(
        key=lambda r: (
            0 if r["query_usage"] == "in_use" else 1,
            TIER_RANK[r["tier"]],
            r["query_kind"] != "multiple_choice",
            r["query_exam_id"],
            r["query_id"],
        )
    )

    csv_fields = list(candidates[0].keys()) if candidates else [
        "query_kind",
        "query_id",
        "tier",
    ]
    with (OUT / "candidates.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=csv_fields)
        w.writeheader()
        for row in sorted(
            candidates,
            key=lambda r: (
                0 if r["query_usage"] == "in_use" else 1,
                TIER_RANK[r["tier"]],
                r["query_exam_id"],
                r["query_id"],
            ),
        ):
            w.writerow(row)
    (OUT / "candidates.json").write_text(json.dumps(candidates, ensure_ascii=False, indent=2) + "\n")
    (OUT / "summary.json").write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n")
    write_markdown(summary, review)

    print("candidates", len(candidates), "review", len(review), "unprocessed", unprocessed)
    print("mcq", mcq_block["by_usage"])
    print("learn", learn_block["by_usage"])
    print("checks", summary["count_checks"])
    if not all(summary["count_checks"].values()):
        raise SystemExit("count checks failed")


if __name__ == "__main__":
    main()
