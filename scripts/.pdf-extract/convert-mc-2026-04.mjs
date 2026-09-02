import { readFileSync, writeFileSync } from "node:fs";

const FIGURES = {
  10: "/exam-figures/mobile_crane/2026-04/q10.jpg",
  15: "/exam-figures/mobile_crane/2026-04/q15.jpg",
  32: "/exam-figures/mobile_crane/2026-04/q32.jpg",
  40: "/exam-figures/mobile_crane/2026-04/q40.jpg",
};

function isSkip(line) {
  return (
    !line ||
    line.startsWith("----- page") ||
    /^移\s*ク/.test(line) ||
    line.startsWith("次の科目の免除者") ||
    line.startsWith("（終") ||
    line === "受験番号" ||
    line.includes("指示があるまで") ||
    line.startsWith("〔注意事項〕") ||
    line === "あい" ||
    line === "油" ||
    line === "境界線" ||
    line === "ラフテレーンクレーン定格総荷重表" ||
    line.startsWith("アウトリガー最大張出") ||
    line === "スプール" ||
    line === "（入口）" ||
    line === "一次側" ||
    line === "（出口）" ||
    line === "二次側" ||
    line === "調整ねじ" ||
    line === "外部ドレン" ||
    line === "Ａ Ｂ" ||
    line === "元の位置" ||
    line === "水平面" ||
    line === "支点" ||
    line === "Ｗ" ||
    line === "Ｇ" ||
    /^[0-9.]+m$/.test(line) ||
    /^[0-9.]+$/.test(line)
  );
}

function isNewBlock(line) {
  return (
    /^問\s*[０-９0-9]+/.test(line) ||
    /^〔.+〕$/.test(line) ||
    /^[○〇]?\s*（[１-５]）/.test(line)
  );
}

const raw = readFileSync("mc-2026-04/out/text.txt", "utf8").split("\n");
const firstSection = raw.findIndex((line) => line.trim() === "〔移動式クレーンに関する知識〕");
const body = [];

for (const rawLine of raw.slice(firstSection)) {
  const line = rawLine.trim();
  if (isSkip(line)) continue;
  if (line === "２" && body.length > 0) {
    body[body.length - 1] += "２";
    continue;
  }
  if (line === "３" && body.length > 0) {
    body[body.length - 1] += "３";
    continue;
  }
  if (!isNewBlock(line) && body.length > 0 && !/^〔/.test(body[body.length - 1])) {
    const prev = body[body.length - 1];
    const glue = /[。）」]$/.test(prev) || /^[「『]/.test(line) ? "" : "";
    body[body.length - 1] = `${prev}${glue}${line}`;
    continue;
  }
  body.push(line.replace(/^[○〇]（/, "○（").replace(/^〇（/, "○（"));
}

const header = [
  "出典: 公益財団法人 安全衛生技術試験協会 移動式クレーン運転士免許試験 令和8年4月公表",
  "元URL: https://www.exam.or.jp/wp-content/uploads/2026/04/LC20260409-1.pdf",
];

const out = [...header, ""];
let currentQ = null;
for (const line of body) {
  const qMatch = line.match(/^問\s*([０-９0-9]+)\s+(.*)$/);
  if (qMatch) {
    const n = Number(qMatch[1].replace(/[０-９]/g, (ch) => "０１２３４５６７８９".indexOf(ch)));
    currentQ = n;
    out.push("");
    out.push(`問${n} ${qMatch[2]}`);
    if (FIGURES[n]) out.push(`図: ${FIGURES[n]}`);
    continue;
  }
  const choice = line.match(/^([○〇])?（([１-５])）(.*)$/);
  if (choice) {
    const mark = choice[1] ? "○" : "";
    out.push(`${mark}（${choice[2]}）${choice[3].trim()}`);
    continue;
  }
  out.push(line);
}

writeFileSync(
  "/home/cursorworker/dev/HygieneManagerCertification/data/past-exams/mobile_crane_2026-04.txt",
  `${out.join("\n").replace(/\n{3,}/g, "\n\n").trim()}\n`,
  "utf8",
);
console.log("wrote", out.length);
