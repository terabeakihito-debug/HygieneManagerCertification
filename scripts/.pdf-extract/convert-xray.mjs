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
  "－": "⁻",
  "-": "⁻",
  "−": "⁻",
};

function toSuper(value) {
  return [...value].map((ch) => SUPER[ch] ?? ch).join("");
}

function isFurigana(line) {
  return /^[ぁ-んァ-ンゝゞー 　]+$/.test(line) && line.replace(/\s/g, "").length <= 4;
}

function isSkip(line) {
  return (
    !line ||
    line.startsWith("----- page") ||
    /^エックス線\s+\d+\/\d+$/.test(line) ||
    line.startsWith("次の科目が免除") ||
    line.includes("は解答しないでください") ||
    line.startsWith("（終") ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕") ||
    line === "検査鋼板" ||
    line === "測定点" ||
    line === "遮蔽鋼板" ||
    line === "鋼板" ||
    line === "図Ⅰ 図Ⅱ" ||
    line === "Ｐ Ｑ" ||
    line === "Ａ" ||
    line === "Ｂ Ｃ" ||
    line === "Ｄ" ||
    line === "エックス線管" ||
    line === "の焦点" ||
    line === "測定点エックス線管" ||
    line === "エックス線管の焦点 鋼板" ||
    line === "２mSv/h64 mSv/h" ||
    line === "２mSv/h64mSv/h" ||
    /^[０-９0-9.]+ ?m$/.test(line) ||
    /^[０-９0-9.]+ ?mm$/.test(line) ||
    /^[０-９0-9.]+°$/.test(line) ||
    line === "2m 2m" ||
    line === "10 m" ||
    line === "10 mm"
  );
}

function isNewBlock(line) {
  return (
    /^問\s*[０-９0-9]+/.test(line) ||
    /^〔.+〕$/.test(line) ||
    /^[○〇]?\s*（[１-５]）/.test(line) ||
    /^[Ａ-Ｄ] /.test(line)
  );
}

function isSuperLine(line) {
  return /^[－−-]?[０-９]+$/.test(line);
}

function convert(text, extras) {
  const raw = text.split("\n").map((line) => line.trimEnd());
  const firstSection = raw.findIndex(
    (line) => line.trim() === "〔エックス線の管理に関する知識〕",
  );
  const body = [];
  for (const rawLine of raw.slice(firstSection)) {
    const line = rawLine.trim();
    if (isSkip(line)) continue;
    if (isFurigana(line)) continue;
    if (line === "２Ｔ" || line === "ｎ" || line === "σ＝") {
      if (body.length > 0 && !body[body.length - 1].includes("σ＝√")) {
        body[body.length - 1] += "σ＝√(ｎ／２Ｔ)";
      }
      continue;
    }
    if (isSuperLine(line) && body.length > 0) {
      body[body.length - 1] += toSuper(line);
      continue;
    }
    const normalized = line
      .replace(/^[○〇]（/, "○（")
      .replace(/^〇（/, "○（")
      .replace(/\s+/g, (match, offset, source) => {
        if (offset > 0 && /[Ａ-Ｄ]$/.test(source[offset - 1]) && /^[，,]/.test(source.slice(offset + match.length))) {
          return "";
        }
        return match;
      });
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
      out.push(`${mark}（${choice[2]}）${choice[3].trim()}`);
      continue;
    }
    if (currentQ) {
      const glue = /^[Ａ-Ｄ] /.test(line) ? "\n" : "";
      out[out.length - 1] += `${glue}${line}`;
      continue;
    }
    out.push(line);
  }
  return out;
}

const jobs = [
  {
    input: "/tmp/xray-pdfs/2025-10/text.txt",
    output: "data/past-exams/xray_2025-10.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 エックス線作業主任者免許試験 令和7年10月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2025/10/LC20252117.pdf",
    ],
    extras: {},
  },
  {
    input: "/tmp/xray-pdfs/2026-04/text.txt",
    output: "data/past-exams/xray_2026-04.txt",
    header: [
      "出典: 公益財団法人 安全衛生技術試験協会 エックス線作業主任者免許試験 令和8年4月公表",
      "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260417-1.pdf",
    ],
    extras: {
      7: "なお、Ａ点は散乱角150°、Ｂ点は120°、Ｃ点は60°、Ｄ点は30°の位置にある。",
      28: "表の値は、胸部の１cm線量当量0.3mSv・70μm線量当量0.3mSv、頭・頸部の１cm線量当量1.2mSv・70μm線量当量1.1mSvである。",
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
