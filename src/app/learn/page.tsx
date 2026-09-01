import type { Metadata } from "next";
import Link from "next/link";
import { TopicCard } from "@/components/learn/TopicCard";
import { currentExam } from "@/config/exams";
import {
  LEARN_SECTION_LABEL,
  getLearnSections,
  getLearnTopicsBySection,
} from "@/lib/data/learn-content";

function learnIndexDescription(): string {
  switch (currentExam.id) {
    case "boiler2":
      return "ボイラーの構造・取扱い・燃料及び燃焼・関係法令の図解と表で、試験に出やすいポイントを効率よく学習できます。";
    case "hygiene":
      return "労働生理・労働衛生・関係法令の図解と表で、試験に出やすいポイントを効率よく学習できます。";
    default: {
      const _never: never = currentExam;
      return _never;
    }
  }
}

function learnIndexLead(): string {
  switch (currentExam.id) {
    case "boiler2":
      return "問題演習の前に、構造・取扱い・燃料及び燃焼の図解と、関係法令の一覧表で基本を確認できます。";
    case "hygiene":
      return "問題演習の前に、労働生理・労働衛生の図解と、関係法令の一覧表で基本を確認できます。";
    default: {
      const _never: never = currentExam;
      return _never;
    }
  }
}

export const metadata: Metadata = {
  title: "学習コンテンツ一覧",
  description: learnIndexDescription(),
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

      <p className="text-sm text-graphite">{learnIndexLead()}</p>

      {getLearnSections().map((section) => (
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
