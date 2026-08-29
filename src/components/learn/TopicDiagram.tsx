import { HeartCirculationDiagram } from "@/components/learn/diagrams/HeartCirculationDiagram";
import { LocalExhaustDiagram } from "@/components/learn/diagrams/LocalExhaustDiagram";
import { NephronDiagram } from "@/components/learn/diagrams/NephronDiagram";
import { NervousSystemDiagram } from "@/components/learn/diagrams/NervousSystemDiagram";
import { RespiratorFlowchart } from "@/components/learn/diagrams/RespiratorFlowchart";
import { SolventClassificationDiagram } from "@/components/learn/diagrams/SolventClassificationDiagram";
import type { LearnTopicId } from "@/lib/data/learn-content";

type TopicDiagramProps = {
  topicId: LearnTopicId;
};

export function TopicDiagram({ topicId }: TopicDiagramProps) {
  switch (topicId) {
    case "heart-circulation":
      return <HeartCirculationDiagram />;
    case "nervous-system":
      return <NervousSystemDiagram />;
    case "kidney-urine":
      return <NephronDiagram />;
    case "local-exhaust":
      return <LocalExhaustDiagram />;
    case "organic-solvents":
      return <SolventClassificationDiagram />;
    case "respirators":
      return <RespiratorFlowchart />;
    default: {
      const _never: never = topicId;
      return _never;
    }
  }
}
