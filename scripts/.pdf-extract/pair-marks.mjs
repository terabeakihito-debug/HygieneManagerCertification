import { readFileSync } from "node:fs";
import { getDocument } from "pdfjs-dist/legacy/build/pdf.mjs";

const pdfPath = process.argv[2];
const data = new Uint8Array(readFileSync(pdfPath));
const doc = await getDocument({ data, verbosity: 0 }).promise;
const choiceRe = /[○]?\s*（([１-５1-5])）/;

for (let i = 1; i <= doc.numPages; i += 1) {
  const page = await doc.getPage(i);
  const content = await page.getTextContent();
  const items = content.items
    .filter((item) => "str" in item && item.str)
    .map((item) => ({
      str: item.str,
      x: item.transform[4],
      y: item.transform[5],
    }));
  const marks = items.filter((item) => item.str.includes("○"));
  const choices = items.filter((item) => /（[１-５1-5]）/.test(item.str));
  for (const mark of marks) {
    let best = null;
    let bestDist = Infinity;
    for (const choice of choices) {
      const dx = choice.x - mark.x;
      const dy = choice.y - mark.y;
      const dist = dx * dx + dy * dy;
      if (dist < bestDist) {
        bestDist = dist;
        best = choice;
      }
    }
    const m = best?.str.match(choiceRe);
    console.log(
      `p${i} mark(${Math.round(mark.x)},${Math.round(mark.y)}) ${JSON.stringify(mark.str)} -> ${best ? JSON.stringify(best.str) : "NONE"} d=${Math.round(Math.sqrt(bestDist))}`,
    );
  }
}
