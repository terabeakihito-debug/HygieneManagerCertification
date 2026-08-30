import Link from "next/link";
import { CrossMark } from "@/components/ui/CrossMark";
import { getSectionTopicNumber, type LearnTopic } from "@/lib/data/learn-content";

type TopicCardProps = {
  topic: LearnTopic;
};

export function TopicCard({ topic }: TopicCardProps) {
  const number = String(getSectionTopicNumber(topic)).padStart(2, "0");

  return (
    <Link href={`/learn/${topic.id}`} className="id-card text-ink no-underline">
      <div className="id-card-no text-graphite" style={{ color: "#4B4F49" }}>
        NO. {number}
      </div>
      <h3 className="id-card-title">{topic.title}</h3>
      <div className="id-card-rule" />
      <p className="id-card-sub">{topic.summary}</p>
      <span className="id-card-mark">
        <CrossMark size={18} />
      </span>
    </Link>
  );
}
