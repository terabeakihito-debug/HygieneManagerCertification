import { TopicDiagram } from "@/components/learn/TopicDiagram";
import { InfoTable } from "@/components/learn/tables/InfoTable";
import { getTablePlateNumber, type LearnTopic } from "@/lib/data/learn-content";

type TopicMediaProps = {
  topic: LearnTopic;
};

export function TopicMedia({ topic }: TopicMediaProps) {
  switch (topic.contentType) {
    case "diagram":
      return <TopicDiagram topicId={topic.id} />;
    case "table":
      return (
        <div className="flex flex-col gap-4">
          {topic.tables.map((table, index) => (
            <InfoTable
              key={table.caption}
              plateNumber={getTablePlateNumber(topic.id, index)}
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
