import type { Metadata } from "next";
import { getPrivacyPolicyHtml } from "@/lib/privacy-policy";

export const metadata: Metadata = {
  title: "プライバシーポリシー",
  description: "衛生管理者試験対策サービスのプライバシーポリシーです。",
  alternates: {
    canonical: "/privacy",
  },
};

export default async function PrivacyPage() {
  const html = await getPrivacyPolicyHtml();

  return (
    <main className="mx-auto max-w-2xl px-4 py-10">
      <article
        className="prose max-w-none prose-headings:font-display prose-headings:text-ink prose-a:text-safety prose-p:text-ink"
        dangerouslySetInnerHTML={{ __html: html }}
      />
    </main>
  );
}
