import { readFileSync } from "node:fs";
import { getDocument } from "pdfjs-dist/legacy/build/pdf.mjs";

const pdfPath = process.argv[2];
const pageNum = Number(process.argv[3]);
const data = new Uint8Array(readFileSync(pdfPath));
const doc = await getDocument({ data, verbosity: 0 }).promise;
const page = await doc.getPage(pageNum);
const content = await page.getTextContent();
for (const item of content.items) {
  if (!("str" in item) || !item.str) continue;
  const x = Math.round(item.transform[4]);
  const y = Math.round(item.transform[5]);
  if (item.str.includes("○") || /^[（(]?[１-５1-5][）)]?$/.test(item.str.trim()) || item.str.includes("問")) {
    console.log(`${String(y).padStart(4)} ${String(x).padStart(4)} ${JSON.stringify(item.str)}`);
  }
}
