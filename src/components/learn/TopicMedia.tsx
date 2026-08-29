import { TopicDiagram } from "@/components/learn/TopicDiagram";
import { InfoTable } from "@/components/learn/tables/InfoTable";
import type { LearnTopic } from "@/lib/data/learn-content";

type TopicMediaProps = {
  topic: LearnTopic;
};

export function TopicMedia({ topic }: TopicMediaProps) {
  switch (topic.contentType) {
    case "diagram":
      return (
        <figure className="overflow-visible rounded-lg border border-gray-200 bg-white">
          <TopicDiagram topicId={topic.id} />
          <figcaption className="border-t border-gray-100 px-3 py-2 text-xs text-gray-500">
            試験対策用の模式図です。縮尺や細部は簡略化しています。
          </figcaption>
        </figure>
      );
    case "table":
      return (
        <div className="flex flex-col gap-4">
          {topic.tables.map((table) => (
            <InfoTable
              key={table.caption}
              caption={table.caption}
              headers={table.headers}
              rows={table.rows}
            />
          ))}
        </div>
      );
    default: {
      const _never: never = topic;
      return _never;
    }
  }
}
