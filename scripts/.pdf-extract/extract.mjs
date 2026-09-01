import { createCanvas, DOMMatrix } from "@napi-rs/canvas";
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { getDocument } from "pdfjs-dist/legacy/build/pdf.mjs";

globalThis.DOMMatrix = DOMMatrix;

const root = join(dirname(fileURLToPath(import.meta.url)), "../..");
const pdfPath = process.argv[2];
const outDir = process.argv[3];
const mode = process.argv[4] ?? "text";

if (!pdfPath || !outDir) {
  throw new Error("usage: node extract.mjs <pdf> <outdir> [text|pages|both]");
}

mkdirSync(outDir, { recursive: true });

const data = new Uint8Array(readFileSync(pdfPath));
const doc = await getDocument({ data, verbosity: 0 }).promise;
const texts = [];

for (let i = 1; i <= doc.numPages; i += 1) {
  const page = await doc.getPage(i);
  if (mode === "text" || mode === "both") {
    const content = await page.getTextContent();
    const lines = [];
    let currentY = null;
    let current = [];
    for (const item of content.items) {
      if (!("str" in item) || !item.str) {
        continue;
      }
      const y = Math.round(item.transform[5]);
      if (currentY !== null && Math.abs(y - currentY) > 2) {
        lines.push(current.join(""));
        current = [];
      }
      currentY = y;
      current.push(item.str);
    }
    if (current.length > 0) {
      lines.push(current.join(""));
    }
    texts.push(`----- page ${i} -----\n${lines.join("\n")}`);
  }
  if (mode === "pages" || mode === "both") {
    const viewport = page.getViewport({ scale: 1.6 });
    const canvas = createCanvas(Math.ceil(viewport.width), Math.ceil(viewport.height));
    const ctx = canvas.getContext("2d");
    await page.render({ canvasContext: ctx, viewport }).promise;
    writeFileSync(join(outDir, `page-${String(i).padStart(2, "0")}.jpg`), canvas.toBuffer("image/jpeg", 80));
  }
}

if (mode === "text" || mode === "both") {
  writeFileSync(join(outDir, "text.txt"), `${texts.join("\n\n")}\n`, "utf8");
}

console.log(`pages ${doc.numPages} wrote ${outDir}`);
