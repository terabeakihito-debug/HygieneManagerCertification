import { AgingChangesDiagram } from "@/components/learn/diagrams/AgingChangesDiagram";
import { BloodCompositionDiagram } from "@/components/learn/diagrams/BloodCompositionDiagram";
import { DigestiveSystemDiagram } from "@/components/learn/diagrams/DigestiveSystemDiagram";
import { DustLungDiagram } from "@/components/learn/diagrams/DustLungDiagram";
import { FoodPoisoningDiagram } from "@/components/learn/diagrams/FoodPoisoningDiagram";
import { HeartCirculationDiagram } from "@/components/learn/diagrams/HeartCirculationDiagram";
import { HormoneEndocrineDiagram } from "@/components/learn/diagrams/HormoneEndocrineDiagram";
import { ImmuneSystemDiagram } from "@/components/learn/diagrams/ImmuneSystemDiagram";
import { LiftingPostureDiagram } from "@/components/learn/diagrams/LiftingPostureDiagram";
import { LocalExhaustDiagram } from "@/components/learn/diagrams/LocalExhaustDiagram";
import { MuscleTypesDiagram } from "@/components/learn/diagrams/MuscleTypesDiagram";
import { NephronDiagram } from "@/components/learn/diagrams/NephronDiagram";
import { NervousSystemDiagram } from "@/components/learn/diagrams/NervousSystemDiagram";
import { NoiseHealthDiagram } from "@/components/learn/diagrams/NoiseHealthDiagram";
import { RespiratorFlowchart } from "@/components/learn/diagrams/RespiratorFlowchart";
import { SensoryOrganDiagram } from "@/components/learn/diagrams/SensoryOrganDiagram";
import { SolventClassificationDiagram } from "@/components/learn/diagrams/SolventClassificationDiagram";
import { SpecialCheckupDiagram } from "@/components/learn/diagrams/SpecialCheckupDiagram";
import { ThermoregulationDiagram } from "@/components/learn/diagrams/ThermoregulationDiagram";
import { WBGTDiagram } from "@/components/learn/diagrams/WBGTDiagram";
import { WorkEnvironmentMeasurementDiagram } from "@/components/learn/diagrams/WorkEnvironmentMeasurementDiagram";
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
    case "digestive-system":
      return <DigestiveSystemDiagram />;
    case "blood-composition":
      return <BloodCompositionDiagram />;
    case "muscle-movement":
      return <MuscleTypesDiagram />;
    case "thermoregulation":
      return <ThermoregulationDiagram />;
    case "sensory-organs":
      return <SensoryOrganDiagram />;
    case "hormone-endocrine":
      return <HormoneEndocrineDiagram />;
    case "immune-system":
      return <ImmuneSystemDiagram />;
    case "aging-changes":
      return <AgingChangesDiagram />;
    case "local-exhaust":
      return <LocalExhaustDiagram />;
    case "organic-solvents":
      return <SolventClassificationDiagram />;
    case "respirators":
      return <RespiratorFlowchart />;
    case "noise-health":
      return <NoiseHealthDiagram />;
    case "dust-pneumoconiosis":
      return <DustLungDiagram />;
    case "special-checkup":
      return <SpecialCheckupDiagram />;
    case "work-environment-measurement":
      return <WorkEnvironmentMeasurementDiagram />;
    case "wbgt":
      return <WBGTDiagram />;
    case "lifting-posture":
      return <LiftingPostureDiagram />;
    case "food-poisoning":
      return <FoodPoisoningDiagram />;
    default: {
      const _never: never = topicId;
      return _never;
    }
  }
}
