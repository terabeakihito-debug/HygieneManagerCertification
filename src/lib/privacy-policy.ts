import { readFile } from "node:fs/promises";
import path from "node:path";
import { remark } from "remark";
import remarkHtml from "remark-html";

export async function getPrivacyPolicyHtml(): Promise<string> {
  const filePath = path.join(
    process.cwd(),
    "docs",
    "プライバシーポリシー.md"
  );
  const markdown = await readFile(filePath, "utf8");
  const result = await remark().use(remarkHtml).process(markdown);
  return String(result);
}
