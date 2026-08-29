import Link from "next/link";
import type { LearnTopic } from "@/lib/data/learn-content";

type TopicCardProps = {
  topic: LearnTopic;
};

export function TopicCard({ topic }: TopicCardProps) {
  return (
    <Link
      href={`/learn/${topic.id}`}
      className="block rounded-lg border border-gray-200 bg-white p-4 transition-colors hover:border-gray-400"
    >
      <h3 className="font-semibold">{topic.title}</h3>
      <p className="mt-2 text-sm text-gray-600">{topic.summary}</p>
    </Link>
  );
}
