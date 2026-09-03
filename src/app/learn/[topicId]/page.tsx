import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { LearnContentDisclaimer } from "@/components/learn/LearnContentDisclaimer";
import { TopicMedia } from "@/components/learn/TopicMedia";
import { currentExam } from "@/config/exams";
import {
  LEARN_SECTION_LABEL,
  LEARN_TOPICS,
  getLearnTopic,
  getPracticeHrefForCategory,
} from "@/lib/data/learn-content";
import { topicDescription } from "@/lib/seo";

type LearnTopicPageProps = {
  params: Promise<{ topicId: string }>;
};

export function generateStaticParams() {
  if (!currentExam.hasLearnContent) {
    return [];
  }
  return LEARN_TOPICS.map((topic) => ({ topicId: topic.id }));
}

export async function generateMetadata({
  params,
}: LearnTopicPageProps): Promise<Metadata> {
  const { topicId } = await params;
  const topic = getLearnTopic(topicId);

  if (!topic) {
    return { title: "学習コンテンツ" };
  }

  return {
    title: topic.title,
    description: topicDescription(topic.body),
    alternates: {
      canonical: `/learn/${topic.id}`,
    },
  };
}

export default async function LearnTopicPage({ params }: LearnTopicPageProps) {
  if (!currentExam.hasLearnContent) {
    notFound();
  }

  const { topicId } = await params;
  const topic = getLearnTopic(topicId);

  if (!topic) {
    notFound();
  }

  const practiceHref = await getPracticeHrefForCategory(topic.categoryName);
  const paragraphs = topic.body.split("\n\n");
  const hasMedia = topic.contentType !== "article";

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <Link href="/learn" className="text-sm underline">
          学習コンテンツ一覧
        </Link>
        <Link href="/practice" className="text-sm underline">
          問題演習
        </Link>
      </div>

      <header>
        <p className="text-sm text-graphite">{LEARN_SECTION_LABEL[topic.section]}</p>
        <h1 className="mt-1 text-2xl font-bold">{topic.title}</h1>
      </header>

      <TopicMedia topic={topic} />
      {hasMedia ? <LearnContentDisclaimer /> : null}

      <article className="flex flex-col gap-4 text-sm leading-7 text-ink">
        {paragraphs.map((paragraph) => (
          <p key={paragraph.slice(0, 24)}>{paragraph}</p>
        ))}
      </article>

      <div className="border-t border-hairline pt-4">
        <Link
          href={practiceHref}
          className="inline-block btn-primary"
        >
          この分野の問題を演習する
        </Link>
      </div>
      {hasMedia ? null : <LearnContentDisclaimer />}
    </main>
  );
}
