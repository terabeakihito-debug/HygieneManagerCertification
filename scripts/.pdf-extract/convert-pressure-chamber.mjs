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
    /^高圧\s*室\s*内(\s+\d+\/\d+)?$/.test(line) ||
    /^\d+\/\d+$/.test(line) ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕") ||
    line.startsWith("（終") ||
    /攪　乱（かくらん）/.test(line) ||
    /躯　体（くたい）/.test(line) ||
    /洗　掘（せんくつ）/.test(line) ||
    /土　被（どかぶ）/.test(line) ||
    line === "以　上"
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

function convert(text) {
  const raw = text.split("\n").map((line) => line.trimEnd());
  const firstSection = raw.findIndex((line) => line.trim() === "〔圧気工法〕");
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
      .replace(/^[○〇]\s*（/, "○（")
      .replace(/^〇（/, "○（")
      .replace(/\s*高圧\s*室\s*内\s+\d+\/\d+\s*/g, "")
      .trim();
    if (!normalized) continue;
    if (!isNewBlock(normalized) && body.length > 0 && !/^〔/.test(body[body.length - 1])) {
      body[body.length - 1] += normalized;
      continue;
    }
    body.push(normalized);
  }

  const out = [];
  for (const line of body) {
    const qMatch = line.match(/^問\s*([０-９0-9]+)\s+(.*)$/);
    if (qMatch) {
      const n = Number(
        qMatch[1].replace(/[０-９]/g, (ch) => String("０１２３４５６７８９".indexOf(ch))),
      );
      out.push("");
      out.push(`問${n} ${qMatch[2]}`);
      continue;
    }
    if (/^〔.+〕$/.test(line)) {
      out.push("");
      out.push(line);
      out.push("");
      continue;
    }
    const choice = line.match(/^([○〇])?（([１-５])）(.*)$/);
    if (choice) {
      const mark = choice[1] ? "○" : "";
      const text = choice[3].trim().replace(/\s+/g, " ");
      out.push(`${mark}（${choice[2]}）${text}`);
      continue;
    }
    if (out.length > 0) {
      out[out.length - 1] += line;
      continue;
    }
    out.push(line);
  }
  return out;
}

const jobs = [
  {
    input: "/tmp/pc-pdfs/2025-10/text.txt",
    output: "data/past-exams/pressure_chamber_2025-10.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 高圧室内作業主任者免許試験 令和7年10月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2025/10/LC20252116.pdf",
    ],
  },
  {
    input: "/tmp/pc-pdfs/2026-04/text.txt",
    output: "data/past-exams/pressure_chamber_2026-04.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 高圧室内作業主任者免許試験 令和8年4月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260416-1.pdf",
    ],
  },
];

for (const job of jobs) {
  const body = convert(readFileSync(job.input, "utf8"));
  const converted = `${[...job.header, "", ...body].join("\n").replace(/\n{3,}/g, "\n\n").trim()}\n`;
  writeFileSync(job.output, converted, "utf8");
  const questions = converted.match(/^問\d+/gm) ?? [];
  const corrects = converted.match(/^○（/gm) ?? [];
  console.log(`${job.output} questions=${questions.length} corrects=${corrects.length}`);
}
