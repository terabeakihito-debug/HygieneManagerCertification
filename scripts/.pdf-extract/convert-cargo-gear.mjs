import { readFileSync, writeFileSync } from "node:fs";

const SUPER = {
  "０": "⁰",
  "１": "¹",
  "２": "²",
  "３": "³",
  "４": "⁴",
  "５": "⁵",
  "６": "⁶",
  "７": "⁷",
  "８": "⁸",
  "９": "⁹",
};

function toSuper(value) {
  return [...value].map((ch) => SUPER[ch] ?? ch).join("");
}

function isFurigana(line) {
  return /^[ぁ-んァ-ンゝゞー 　]+$/.test(line) && line.replace(/\s/g, "").length <= 6;
}

function isSkip(line) {
  return (
    !line ||
    line.startsWith("----- page") ||
    /^揚\s*貨\s+\d+\/\d+$/.test(line) ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕") ||
    line.includes("は解答しないでください") ||
    line.startsWith("（終") ||
    line === "止め方 図" ||
    line === "止め方" ||
    line === "図" ||
    line === "形状名称 立体図形 体積計算式" ||
    line === "張力" ||
    line === "大 → 小" ||
    line === "小 → 大" ||
    line === "電流Ｉ" ||
    line === "元の位置" ||
    line === "水平面" ||
    line === "支点"
  );
}

function isDiagramJunk(line) {
  return (
    /^[Ａ-Ｅ]$/.test(line) ||
    /^[Ａ-Ｅ](\s+[Ａ-Ｅ])+$/.test(line) ||
    /^(Ｏ|Ｐ[１２3]|Ｐ1|Ｐ2|Ｐ3|Ｗ|Ｆ|Ｆ＝|g|半径|高さ|直径|縦|横|直角|高|さ)$/.test(line) ||
    /^Ｆ＝/.test(line) ||
    /^[0-9]+㎏$/.test(line) ||
    /^[0-9]+kg$/.test(line) ||
    /^[0-9]+°$/.test(line) ||
    /^\d+ｍ$/.test(line) ||
    /^\d+cm$/.test(line) ||
    /^\d+Ω$/.test(line) ||
    /^\d+Ｖ$/.test(line) ||
    /^Ｆ\(\d+Ｎ\)$/.test(line) ||
    /^Ｗ Ｆ/.test(line) ||
    /^Ｆ?\d+kg(\s+\d+kg)*$/.test(line) ||
    /^F\d+kg/.test(line)
  );
}

function isNewBlock(line) {
  return (
    /^問\s*[０-９0-9]+/.test(line) ||
    /^〔.+〕$/.test(line) ||
    /^[○〇]?\s*（[１-５]）/.test(line)
  );
}

function isSuperLine(line) {
  return /^[０-９]+$/.test(line) && line.length <= 2;
}

function convert(text, extras) {
  const raw = text.split("\n").map((line) => line.trimEnd());
  const firstSection = raw.findIndex((line) => line.trim() === "〔揚貨装置に関する知識〕");
  const body = [];
  for (const rawLine of raw.slice(firstSection)) {
    const line = rawLine.trim();
    if (isSkip(line)) continue;
    if (isFurigana(line)) continue;
    if (isDiagramJunk(line)) continue;
    if (isSuperLine(line) && body.length > 0) {
      body[body.length - 1] += toSuper(line);
      continue;
    }
    const normalized = line
      .replace(/^[○〇]\s*（/, "○（")
      .replace(/^〇（/, "○（")
      .replace(/\s*揚\s*貨\s+\d+\/\d+\s*/g, "")
      .replace(
        /「原動機及び電気」並びに「力学」の免除者は、問[２2][１1]～問[４4][０0]は解答しないでください。/g,
        "",
      )
      .trim();
    if (!normalized || isDiagramJunk(normalized)) continue;
    if (!isNewBlock(normalized) && body.length > 0 && !/^〔/.test(body[body.length - 1])) {
      body[body.length - 1] += normalized;
      continue;
    }
    body.push(normalized);
  }

  const out = [];
  let currentQ = null;
  for (const line of body) {
    const qMatch = line.match(/^問\s*([０-９0-9]+)\s+(.*)$/);
    if (qMatch) {
      const n = Number(
        qMatch[1].replace(/[０-９]/g, (ch) => String("０１２３４５６７８９".indexOf(ch))),
      );
      currentQ = n;
      out.push("");
      let stem = qMatch[2];
      if (extras[n]) {
        stem = `${stem}${extras[n]}`;
      }
      out.push(`問${n} ${stem}`);
      continue;
    }
    if (/^〔.+〕$/.test(line)) {
      out.push("");
      out.push(line);
      out.push("");
      currentQ = null;
      continue;
    }
    const choice = line.match(/^([○〇])?（([１-５])）(.*)$/);
    if (choice) {
      const mark = choice[1] ? "○" : "";
      let text = choice[3]
        .trim()
        .replace(/\s+/g, " ")
        .replace(/F\d+kg(?:\s+\d+kg)*$/g, "")
        .trim();
      if (currentQ && COLUMN_QUESTIONS[currentQ]) {
        text = formatColumns(text, COLUMN_QUESTIONS[currentQ]);
      }
      out.push(`${mark}（${choice[2]}）${text}`);
      continue;
    }
    if (currentQ) {
      out[out.length - 1] += line;
      continue;
    }
    out.push(line);
  }
  return out;
}

const COLUMN_QUESTIONS = {};

function formatColumns(text, labels) {
  const parts = text.split(/\s+/).filter(Boolean);
  if (parts.length < labels.length) {
    return text;
  }
  const values = parts.slice(-labels.length);
  return labels.map((label, i) => `${label}：${values[i]}`).join("　");
}

const jobs = [
  {
    input: "/tmp/cargo-gear-pdfs/2025-10/text.txt",
    output: "data/past-exams/cargo_gear_2025-10.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 揚貨装置運転士免許試験 令和7年10月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2025/10/LC20252110.pdf",
    ],
    extras: {
      3: "\n図: /exam-figures/cargo_gear/2025-10/q03.jpg",
      7: "\n図: /exam-figures/cargo_gear/2025-10/q07.jpg",
      31: "\n図: /exam-figures/cargo_gear/2025-10/q31.jpg",
      32: "(天びん棒の支点から力Ｆまでの距離は1ｍ、荷Ｗ(20kg)の位置までの距離は1.5ｍ)",
      33: "\nＡ 円柱：半径²×π×高さ×(1/2)\nＢ 三角柱：縦×横×高さ×(1/2)\nＣ 球：直径³×π×(4/3)\nＤ 円錐体：半径²×π×高さ×(1/3)",
      37: "(Ａ：荷200kg、つり角度60°／Ｂ：荷190kg、つり角度90°／Ｃ：荷180kg、つり角度120°)",
      40: "\n図: /exam-figures/cargo_gear/2025-10/q40.jpg",
    },
    columns: { 2: ["Ａ", "Ｂ", "Ｃ"] },
  },
  {
    input: "/tmp/cargo-gear-pdfs/2026-04/text.txt",
    output: "data/past-exams/cargo_gear_2026-04.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 揚貨装置運転士免許試験 令和8年4月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260410-1.pdf",
    ],
    extras: {
      7: "\n図: /exam-figures/cargo_gear/2026-04/q07.jpg",
      10: "\n図: /exam-figures/cargo_gear/2026-04/q10.jpg",
      23: "\n図: /exam-figures/cargo_gear/2026-04/q23.jpg",
      31: "\n図: /exam-figures/cargo_gear/2026-04/q31.jpg",
      32: "\n図: /exam-figures/cargo_gear/2026-04/q32.jpg",
      38: "(Ａ：荷900㎏、つり角度30°／Ｂ：荷750kg、つり角度60°／Ｃ：荷600kg、つり角度90°／Ｄ：荷500kg、つり角度120°)",
      40: "\n図: /exam-figures/cargo_gear/2026-04/q40.jpg",
    },
    columns: { 34: ["Ａ", "Ｂ", "Ｃ"] },
  },
];

for (const job of jobs) {
  Object.assign(COLUMN_QUESTIONS, job.columns);
  const body = convert(readFileSync(job.input, "utf8"), job.extras);
  const converted = `${[...job.header, "", ...body].join("\n").replace(/\n{3,}/g, "\n\n").trim()}\n`;
  writeFileSync(job.output, converted, "utf8");
  const questions = converted.match(/^問\d+/gm) ?? [];
  const corrects = converted.match(/^○（/gm) ?? [];
  console.log(`${job.output} questions=${questions.length} corrects=${corrects.length}`);
  for (const key of Object.keys(job.columns)) {
    delete COLUMN_QUESTIONS[key];
  }
}
