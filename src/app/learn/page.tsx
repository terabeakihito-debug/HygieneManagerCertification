import Link from "next/link";
import { TopicCard } from "@/components/learn/TopicCard";
import {
  LEARN_SECTION_LABEL,
  LEARN_SECTIONS,
  getLearnTopicsBySection,
} from "@/lib/data/learn-content";

export default function LearnIndexPage() {
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

      <p className="text-sm text-gray-600">
        問題演習の前に、労働生理・労働衛生の図解と、関係法令の一覧表で基本を確認できます。
      </p>

      {LEARN_SECTIONS.map((section) => (
        <section key={section} className="flex flex-col gap-3">
          <h2 className="text-lg font-semibold">{LEARN_SECTION_LABEL[section]}</h2>
          <div className="grid gap-3 sm:grid-cols-2">
            {getLearnTopicsBySection(section).map((topic) => (
              <TopicCard key={topic.id} topic={topic} />
            ))}
          </div>
        </section>
      ))}
    </main>
  );
}
