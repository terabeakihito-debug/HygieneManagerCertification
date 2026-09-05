#!/usr/bin/env python3
"""Re-audit originals + /learn against a read-only past-exam extract.

Queries come from the working tree. Peers come from AUDIT_SOURCE
(default /tmp/audit-source). Does not write past-exam stems into output.
Does not overwrite the deletion-era candidates.csv.
"""

from __future__ import annotations

import csv
import importlib.util
import json
import sys
from collections import Counter
from pathlib import Path

WT = Path("/home/cursorworker/dev/HygieneManagerCertification")
AUDIT_SOURCE = Path(sys.argv[1] if len(sys.argv) > 1 else "/tmp/audit-source")
OUT = WT / "inventory" / "similarity-audit" / "low-review"
SCRIPT = WT / "inventory" / "similarity-audit" / "scripts" / "run_similarity_audit.py"

spec = importlib.util.spec_from_file_location("aud", SCRIPT)
aud = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(aud)


def extract_queries():
    aud.ROOT = WT
    sql_rows = aud.extract_sql_questions()
    originals = [r for r in sql_rows if r["origin"] == "original"]
    learn = aud.extract_learn_topics()
    return originals, learn


def extract_peers():
    aud.ROOT = AUDIT_SOURCE
    sql_rows = aud.extract_sql_questions()
    past_sql = [r for r in sql_rows if r["origin"] == "past_exam_suspected"]
    past_txt = aud.extract_txt_questions()
    return past_sql, past_txt


def main() -> None:
    if not AUDIT_SOURCE.exists():
        raise SystemExit(f"missing audit source: {AUDIT_SOURCE}")
    src = (AUDIT_SOURCE / "SOURCE_REV.txt").read_text().strip() if (AUDIT_SOURCE / "SOURCE_REV.txt").exists() else ""
    print(f"source {AUDIT_SOURCE} {src}")

    print("extracting queries from working tree…")
    originals, learn = extract_queries()
    in_use = [r for r in originals if r["usage_status"] == "in_use"]
    unused = [r for r in originals if r["usage_status"] != "in_use"]
    print(f"originals {len(originals)} in_use {len(in_use)} unused {len(unused)} learn {len(learn)}")
    if len(originals) != 368 or len(in_use) != 344 or len(learn) != 296:
        raise SystemExit(
            f"count mismatch: originals={len(originals)} in_use={len(in_use)} learn={len(learn)}"
        )

    print("extracting peers from temp corpus…")
    past_sql, past_txt = extract_peers()
    txt_files = sorted((AUDIT_SOURCE / "data/past-exams").glob("*.txt"))
    parsed_txt_files = sorted({r["source_file"] for r in past_txt})
    print(f"past_sql {len(past_sql)} past_txt {len(past_txt)} txt_files {len(txt_files)}")
    if len(past_sql) != 708:
        raise SystemExit(f"expected 708 past SQL, got {len(past_sql)}")
    if len(txt_files) != 18:
        raise SystemExit(f"expected 18 txt files, got {len(txt_files)}")
    if len(parsed_txt_files) != 18:
        raise SystemExit(f"txt parse mismatch: {parsed_txt_files}")

    print("featurizing…")
    q_mcq = [aud.prepare_doc(r) for r in originals]
    q_learn = [aud.prepare_doc(r) for r in learn]
    corpus = [aud.prepare_doc(r) for r in past_sql + past_txt]
    num_df: Counter[str] = Counter()
    for d in corpus:
        num_df.update(set(d["nums"]))
    idf_keep = aud.build_idf(corpus, "grams3")
    idf_drop = aud.build_idf(corpus, "grams3_drop_set")

    def run_group(docs: list[dict], field: str):
        candidates = []
        processed = []
        by_usage = {"in_use": aud.empty_counts(), "unused": aud.empty_counts(), "all": aud.empty_counts()}
        by_exam = {eid: aud.empty_counts() for eid in aud.EXAM_ORDER}
        for i, q in enumerate(docs):
            tier, score, peer = aud.best_for_query(q, corpus, idf_keep, idf_drop, num_df)
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
                    "jaccard_combo": score["jaccard_combo_keep"] if score else 0,
                    "tfidf": score["tfidf_keep"] if score else 0,
                    "seq": score["seq_keep"] if score else 0,
                    "reason": score["classify_reason"] if score and "classify_reason" in score else "",
                }
            )
            if score and peer and tier != "NO_MATCH":
                candidates.append(aud.candidate_row(q, peer, score, tier, score.get("classify_reason") or "", field))
            if (i + 1) % 50 == 0:
                print(f"  {field} {i + 1}/{len(docs)}")
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
        "mode": "reaudit_from_temp_extract",
        "audit_source": str(AUDIT_SOURCE),
        "source_rev": src,
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
        "mcq": mcq_block,
        "learn": learn_block,
        "processed_mcq": proc_m,
        "processed_learn": proc_l,
        "unprocessed_ids": unprocessed,
        "new_critical": mcq_block["by_usage"]["all"]["CRITICAL"] + learn_block["by_usage"]["all"]["CRITICAL"],
        "new_high": mcq_block["by_usage"]["all"]["HIGH"] + learn_block["by_usage"]["all"]["HIGH"],
        "new_medium": mcq_block["by_usage"]["all"]["MEDIUM"] + learn_block["by_usage"]["all"]["MEDIUM"],
    }

    OUT.mkdir(parents=True, exist_ok=True)
    csv_fields = list(candidates[0].keys()) if candidates else ["query_id", "tier"]
    with (OUT / "reaudit-candidates.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=csv_fields)
        w.writeheader()
        for row in sorted(
            candidates,
            key=lambda r: (
                aud.TIER_RANK[r["tier"]],
                r["query_exam_id"],
                r["query_id"],
            ),
        ):
            w.writerow(row)
    (OUT / "reaudit-candidates.json").write_text(
        json.dumps(candidates, ensure_ascii=False, indent=2) + "\n"
    )
    (OUT / "reaudit-summary.json").write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n")

    print("candidates", len(candidates), "unprocessed", unprocessed)
    print("mcq", mcq_block["by_usage"])
    print("learn", learn_block["by_usage"])
    print("CRITICAL", summary["new_critical"], "HIGH", summary["new_high"], "MEDIUM", summary["new_medium"])
    print("checks", summary["count_checks"])
    if not all(summary["count_checks"].values()):
        raise SystemExit("count checks failed")
    if summary["new_critical"] or summary["new_high"]:
        raise SystemExit("new CRITICAL or HIGH found")


if __name__ == "__main__":
    main()
