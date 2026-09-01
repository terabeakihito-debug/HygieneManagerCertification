import { readFileSync } from "node:fs";
import { getDocument } from "pdfjs-dist/legacy/build/pdf.mjs";

const pdfPath = process.argv[2];
const pageNum = Number(process.argv[3]);
const data = new Uint8Array(readFileSync(pdfPath));
const doc = await getDocument({ data, verbosity: 0 }).promise;
const page = await doc.getPage(pageNum);
const content = await page.getTextContent();
const rows = [];
for (const item of content.items) {
  if (!("str" in item) || !item.str.trim()) continue;
  rows.push({
    y: Math.round(item.transform[5]),
    x: Math.round(item.transform[4]),
    str: item.str,
  });
}
rows.sort((a, b) => b.y - a.y || a.x - b.x);
for (const row of rows) {
  if (row.str.includes("○") || row.str.includes("（") || row.str.includes("問")) {
    console.log(`${String(row.y).padStart(4)} ${String(row.x).padStart(4)} ${JSON.stringify(row.str)}`);
  }
}
