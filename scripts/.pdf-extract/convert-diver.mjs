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
    /^潜水\s+\d+\/\d+$/.test(line) ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕") ||
    line.startsWith("（終") ||
    line === "水面" ||
    line === "浮上" ||
    line === "10ｍ" ||
    line === "30cm" ||
    line === "h" ||
    line === "空気" ||
    line === "入射光" ||
    line === "水" ||
    line === "青色" ||
    line === "白色" ||
    line === "マスク" ||
    line === "体の各組織" ||
    line === "心臓" ||
    line === "肺" ||
    line === "a b" ||
    /^質量 /.test(line) ||
    /^断面積 /.test(line) ||
    /^重り/.test(line)
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
  const firstSection = raw.findIndex((line) => line.trim() === "〔潜水業務〕");
  const body = [];
  for (const rawLine of raw.slice(firstSection)) {
    const line = rawLine.trim();
    if (isSkip(line)) continue;
    if (isFurigana(line)) continue;
    if (isSuperLine(line) && body.length > 0) {
      body[body.length - 1] += toSuper(line);
      continue;
    }
    const normalized = line
      .replace(/^[○〇]（/, "○（")
      .replace(/^〇（/, "○（")
      .replace(/蝶\s*ね/, "蝶ねじ")
      .replace(/蝶ねじじ/, "蝶ねじ");
    if (!isNewBlock(normalized) && body.length > 0 && !/^〔/.test(body[body.length - 1])) {
      const prev = body[body.length - 1];
      if (/^[Ａ-Ｅ]$/.test(normalized) || normalized === "Ａ Ｂ" || normalized === "Ａ Ｂ Ｃ") {
        continue;
      }
      body[body.length - 1] += normalized;
      continue;
    }
    if (/^[Ａ-Ｅ]$/.test(normalized) || normalized === "Ａ Ｂ" || normalized === "Ａ Ｂ Ｃ") {
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
      let text = choice[3].trim().replace(/\s+/g, " ");
      if (currentQ && COLUMN_QUESTIONS[currentQ]) {
        text = formatColumns(text, COLUMN_QUESTIONS[currentQ]);
      }
      if (currentQ === 7 && choice[2] === "５") {
        text = text.replace(
          /国際信\s*号書Ａ旗板を掲揚する。?/,
          "国際信号書Ａ旗板(青色・白色)を掲揚する。",
        );
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

const COLUMN_QUESTIONS = {
  1: ["Ａ", "Ｂ"],
  11: ["Ａ", "Ｂ", "Ｃ"],
  14: ["Ａ", "Ｂ", "Ｃ"],
  28: ["Ａ", "Ｂ", "Ｃ"],
  36: ["Ａ", "Ｂ"],
  40: ["Ａ", "Ｂ", "Ｃ"],
};

function formatColumns(text, labels) {
  const parts = text.split(/\s+/).filter(Boolean);
  if (parts.length < labels.length) {
    return text;
  }
  // Last `labels.length` tokens are the values; anything before is leftover.
  const values = parts.slice(-labels.length);
  return labels.map((label, i) => `${label}：${values[i]}`).join("　");
}

const jobs = [
  {
    input: "/tmp/diver-pdfs/2026-04/text.txt",
    output: "data/past-exams/diver_2026-04.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 潜水士免許試験 令和8年4月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260419-1.pdf",
    ],
    extras: {
      11: "\n図: /exam-figures/diver/2026-04/q11.jpg",
      22: "\n図: /exam-figures/diver/2026-04/q22.jpg",
      31: " イ Ｖ＝40（0.03Ｄ＋0.4）／Ｐ  ロ Ｖ＝60（0.03Ｄ＋0.4）／Ｐ",
    },
  },
];

for (const job of jobs) {
  const body = convert(readFileSync(job.input, "utf8"), job.extras);
  const converted = `${[...job.header, "", ...body].join("\n").replace(/\n{3,}/g, "\n\n").trim()}\n`;
  writeFileSync(job.output, converted, "utf8");
  const questions = converted.match(/^問\d+/gm) ?? [];
  const corrects = converted.match(/^○（/gm) ?? [];
  console.log(`${job.output} questions=${questions.length} corrects=${corrects.length}`);
}
