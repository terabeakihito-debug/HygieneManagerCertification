import fs from "node:fs";
import path from "node:path";
import sharp from "sharp";

const MIN_BYTES = 1000;
const destDir = path.join(process.cwd(), "public", "diagrams");

const jobs = process.argv.slice(2);
if (jobs.length === 0) {
  console.error("usage: node scripts/convert-diagrams.mjs <src.png>:<slug> [...]");
  process.exit(1);
}

fs.mkdirSync(destDir, { recursive: true });

for (const job of jobs) {
  const [src, slug] = job.split(":");
  if (!src || !slug) {
    throw new Error(`invalid job: ${job}`);
  }
  const srcSize = fs.statSync(src).size;
  if (srcSize < MIN_BYTES) {
    throw new Error(`${src} is ${srcSize} bytes; reject under ${MIN_BYTES}`);
  }
  const dest = path.join(destDir, `${slug}.webp`);
  await sharp(src).resize(1200, 900, { fit: "cover" }).webp({ quality: 78, effort: 6 }).toFile(dest);
  const destSize = fs.statSync(dest).size;
  if (destSize < MIN_BYTES) {
    throw new Error(`${dest} is ${destSize} bytes; reject under ${MIN_BYTES}`);
  }
  console.log(`${path.basename(src)} ${srcSize} -> ${path.basename(dest)} ${destSize}`);
}
