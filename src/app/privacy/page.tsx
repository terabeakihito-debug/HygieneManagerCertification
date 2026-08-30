import type { Metadata } from "next";
import { getPrivacyPolicyHtml } from "@/lib/privacy-policy";

export const metadata: Metadata = {
  title: "プライバシーポリシー",
  description: "衛生管理者試験対策サービスのプライバシーポリシーです。",
};

export default async function PrivacyPage() {
  const html = await getPrivacyPolicyHtml();

  return (
    <main className="mx-auto max-w-2xl px-4 py-10">
      <article
        className="prose prose-gray max-w-none prose-headings:scroll-mt-8 prose-a:text-teal-800"
        dangerouslySetInnerHTML={{ __html: html }}
      />
    </main>
  );
}
