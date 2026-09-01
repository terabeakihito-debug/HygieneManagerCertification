import { readFileSync, writeFileSync } from "node:fs";

const FIGURES = {
  "2025-10": {
    3: "/exam-figures/crane_all/2025-10/q03.jpg",
    5: "/exam-figures/crane_all/2025-10/q05.jpg",
    22: "/exam-figures/crane_all/2025-10/q22.jpg",
    31: "/exam-figures/crane_all/2025-10/q31.jpg",
    33: "/exam-figures/crane_all/2025-10/q33.jpg",
    36: "/exam-figures/crane_all/2025-10/q36.jpg",
    37: "/exam-figures/crane_all/2025-10/q37.jpg",
    38: "/exam-figures/crane_all/2025-10/q38.jpg",
    40: "/exam-figures/crane_all/2025-10/q40.jpg",
  },
  "2026-04": {
    3: "/exam-figures/crane_all/2026-04/q03.jpg",
    4: "/exam-figures/crane_all/2026-04/q04.jpg",
    7: "/exam-figures/crane_all/2026-04/q07.jpg",
    32: "/exam-figures/crane_all/2026-04/q32.jpg",
    39: "/exam-figures/crane_all/2026-04/q39.jpg",
    40: "/exam-figures/crane_all/2026-04/q40.jpg",
  },
};

const FULLWIDTH = { 1: "１", 2: "２", 3: "３", 4: "４", 5: "５" };

function isSkip(line) {
  return (
    !line ||
    line.startsWith("----- page") ||
    line.startsWith("クレ・デリ") ||
    line.startsWith("次の科目の免除者") ||
    line.startsWith("（終") ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕")
  );
}

function isFurigana(line) {
  return /^[ぁ-んァ-ンゝゞー 　]+$/.test(line) && line.replace(/\s/g, "").length <= 4;
}

function isNewBlock(line) {
  return (
    /^問\s*[０-９0-9]+/.test(line) ||
    /^〔.+〕$/.test(line) ||
    /^○?\s*（[１-５]）/.test(line) ||
    /^[Ａ-Ｅ][ 　]/.test(line) ||
    line.startsWith("ただし") ||
    line.startsWith("導体") ||
    line.startsWith("絶縁体") ||
    line.startsWith("止め方") ||
    line.startsWith("歯車Ａ")
  );
}

function convert(text, sitting, header) {
  const raw = text.split("\n").map((line) => line.trimEnd());
  const firstSection = raw.findIndex((line) => /^〔.+〕$/.test(line.trim()) && !line.includes("注意"));
  const body = [];
  for (const rawLine of raw.slice(Math.max(0, firstSection))) {
    const line = rawLine.trim();
    if (isSkip(line)) continue;
    if (/^[１２３４５６]\s/.test(line) && body.length === 0) continue;
    if (isFurigana(line) && body.length > 0) {
      body[body.length - 1] += line.replace(/\s/g, "");
      continue;
    }
    if (line === "２" && body.length > 0) {
      body[body.length - 1] += "²";
      continue;
    }
    if (!isNewBlock(line) && body.length > 0 && !/^〔/.test(body[body.length - 1])) {
      body[body.length - 1] += line;
      continue;
    }
    body.push(line);
  }

  const out = [...header, ""];
  let currentQ = null;
  for (const line of body) {
    const qMatch = line.match(/^問\s*([０-９0-9]+)\s+(.*)$/);
    if (qMatch) {
      const n = Number(qMatch[1].replace(/[０-９]/g, (ch) => "０１２３４５６７８９".indexOf(ch)));
      currentQ = n;
      out.push("");
      out.push(`問${n} ${qMatch[2]}`);
      const figure = FIGURES[sitting][n];
      if (figure) {
        out.push(`図: ${figure}`);
      }
      continue;
    }
    const choice = line.match(/^(○)?\s*（([１-５])）(.*)$/);
    if (choice) {
      const mark = choice[1] ? "○" : "";
      out.push(`${mark}（${choice[2]}）${choice[3].trim()}`);
      continue;
    }
    if (line.includes("○") && /（[１-５]）/.test(line) === false && currentQ) {
      continue;
    }
    out.push(line);
  }

  return `${out.join("\n").replace(/\n{3,}/g, "\n\n").trim()}\n`;
}

const jobs = [
  {
    sitting: "2025-10",
    input: "data/raw-pdfs/2025-10-text.txt",
    output: "data/past-exams/crane_all_2025-10.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 クレーン・デリック運転士（限定なし）免許試験 令和7年10月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2025/10/LC20252107.pdf",
    ],
  },
  {
    sitting: "2026-04",
    input: "data/raw-pdfs/2026-04-text.txt",
    output: "data/past-exams/crane_all_2026-04.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 クレーン・デリック運転士（限定なし）免許試験 令和8年4月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260407-1.pdf",
    ],
  },
];

for (const job of jobs) {
  const converted = convert(readFileSync(job.input, "utf8"), job.sitting, job.header);
  writeFileSync(job.output, converted, "utf8");
  console.log(`WROTE ${job.output} lines=${converted.split("\n").length}`);
}

void FULLWIDTH;
