import type { Metadata } from "next";
import Link from "next/link";
import { TopicCard } from "@/components/learn/TopicCard";
import { currentExam } from "@/config/exams";
import {
  LEARN_SECTION_LABEL,
  LEARN_SECTIONS,
  getLearnTopicsBySection,
} from "@/lib/data/learn-content";

export const metadata: Metadata = {
  title: "学習コンテンツ一覧",
  description:
    "労働生理・労働衛生・関係法令の図解と表で、試験に出やすいポイントを効率よく学習できます。",
  alternates: {
    canonical: "/learn",
  },
};

export default function LearnIndexPage() {
  if (!currentExam.hasLearnContent) {
    return (
      <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
        <h1 className="text-2xl font-bold">学習コンテンツ</h1>
        <p className="text-sm text-graphite">
          この試験の学習コンテンツは、まだ公開していません。問題演習から始めてください。
        </p>
        <Link href="/practice" className="underline">
          問題演習へ
        </Link>
      </main>
    );
  }

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-8 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">学習コンテンツ</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/practice" className="underline">
            問題演習
          </Link>
          <Link href="/" className="underline">
            トップ
          </Link>
        </div>
      </div>

      <p className="text-sm text-graphite">
        問題演習の前に、労働生理・労働衛生の図解と、関係法令の一覧表で基本を確認できます。
      </p>

      {LEARN_SECTIONS.map((section) => (
        <section key={section} className="flex flex-col gap-3">
          <h2 className="text-lg font-semibold">{LEARN_SECTION_LABEL[section]}</h2>
          <div className="grid gap-4 sm:grid-cols-2">
            {getLearnTopicsBySection(section).map((topic) => (
              <TopicCard key={topic.id} topic={topic} />
            ))}
          </div>
        </section>
      ))}
    </main>
  );
}
