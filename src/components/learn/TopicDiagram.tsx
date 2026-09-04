import * as Boiler2Diagrams from "@/components/learn/diagrams/boiler2/Boiler2Diagrams";
import * as CraneDiagrams from "@/components/learn/diagrams/crane/CraneDiagrams";
import * as MobileCraneDiagrams from "@/components/learn/diagrams/mobile_crane/MobileCraneDiagrams";
import * as DiverDiagrams from "@/components/learn/diagrams/diver/DiverDiagrams";
import * as CargoGearDiagrams from "@/components/learn/diagrams/cargo_gear/CargoGearDiagrams";
import * as PressureChamberDiagrams from "@/components/learn/diagrams/pressure_chamber/PressureChamberDiagrams";
import * as XrayDiagrams from "@/components/learn/diagrams/xray/XrayDiagrams";
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
import { PlateFrame } from "@/components/learn/PlateFrame";
import { BOILER2_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/boiler2-topics";
import { CRANE_ALL_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/crane-all-topics";
import { MOBILE_CRANE_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/mobile-crane-topics";
import { DIVER_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/diver-topics";
import { CARGO_GEAR_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/cargo-gear-topics";
import { PRESSURE_CHAMBER_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/pressure-chamber-topics";
import { XRAY_DIAGRAM_TOPIC_IDS } from "@/lib/data/learn/xray-topics";
import {
  DIAGRAM_TOPIC_IDS,
  getDiagramFigureNumber,
  getLearnTopic,
  type DiagramLearnTopicId,
} from "@/lib/data/learn-content";

const BOILER2_DIAGRAMS = {
  WaterCirculationDiagram: Boiler2Diagrams.WaterCirculationDiagram,
  HeatingSurfaceDiagram: Boiler2Diagrams.HeatingSurfaceDiagram,
  FireTubeBoilerDiagram: Boiler2Diagrams.FireTubeBoilerDiagram,
  WaterTubeOnceThroughDiagram: Boiler2Diagrams.WaterTubeOnceThroughDiagram,
  CastIronHartfordDiagram: Boiler2Diagrams.CastIronHartfordDiagram,
  ManholeFittingsDiagram: Boiler2Diagrams.ManholeFittingsDiagram,
  SteamTrapDiagram: Boiler2Diagrams.SteamTrapDiagram,
  TemperatureControllerDiagram: Boiler2Diagrams.TemperatureControllerDiagram,
  StartupValvesDiagram: Boiler2Diagrams.StartupValvesDiagram,
  GaugeGlassDiagram: Boiler2Diagrams.GaugeGlassDiagram,
  SafetyValveLeakDiagram: Boiler2Diagrams.SafetyValveLeakDiagram,
  SimpleSofteningDiagram: Boiler2Diagrams.SimpleSofteningDiagram,
  LiquidFuelSupplyDiagram: Boiler2Diagrams.LiquidFuelSupplyDiagram,
  OilBurnerDiagram: Boiler2Diagrams.OilBurnerDiagram,
  GasCombustionDiagram: Boiler2Diagrams.GasCombustionDiagram,
  PrimarySecondaryAirDiagram: Boiler2Diagrams.PrimarySecondaryAirDiagram,
  DraftFanDiagram: Boiler2Diagrams.DraftFanDiagram,
  BoilerRoomClearanceDiagram: Boiler2Diagrams.BoilerRoomClearanceDiagram,
} as const;

const CRANE_DIAGRAMS = {
  CraneTypesStructureDiagram: CraneDiagrams.CraneTypesStructureDiagram,
  DerrickTypesStructureDiagram: CraneDiagrams.DerrickTypesStructureDiagram,
  WireRopeStructureDiagram: CraneDiagrams.WireRopeStructureDiagram,
  LiftingGearFastenersDiagram: CraneDiagrams.LiftingGearFastenersDiagram,
  HoistAndBrakeDiagram: CraneDiagrams.HoistAndBrakeDiagram,
  CraneStabilityDiagram: CraneDiagrams.CraneStabilityDiagram,
  TravelSlewLuffDiagram: CraneDiagrams.TravelSlewLuffDiagram,
  AcDcWaveformDiagram: CraneDiagrams.AcDcWaveformDiagram,
  MotorTypesDiagram: CraneDiagrams.MotorTypesDiagram,
  OhmLawCircuitDiagram: CraneDiagrams.OhmLawCircuitDiagram,
  GroundingDiagram: CraneDiagrams.GroundingDiagram,
  PowerTransmissionDiagram: CraneDiagrams.PowerTransmissionDiagram,
  ForceCompositionDiagram: CraneDiagrams.ForceCompositionDiagram,
  MomentOfForceDiagram: CraneDiagrams.MomentOfForceDiagram,
  CenterOfGravityDiagram: CraneDiagrams.CenterOfGravityDiagram,
  FrictionDiagram: CraneDiagrams.FrictionDiagram,
  PulleyPrincipleDiagram: CraneDiagrams.PulleyPrincipleDiagram,
  LeverPrincipleDiagram: CraneDiagrams.LeverPrincipleDiagram,
  StressStrainDiagram: CraneDiagrams.StressStrainDiagram,
} as const;

const MOBILE_CRANE_DIAGRAMS = {
  MobileTypesModelsDiagram: MobileCraneDiagrams.MobileTypesModelsDiagram,
  MobileTermsDimensionsDiagram: MobileCraneDiagrams.MobileTermsDimensionsDiagram,
  MobileCrawlerUndercarriageDiagram: MobileCraneDiagrams.MobileCrawlerUndercarriageDiagram,
  MobileUpperSlewDiagram: MobileCraneDiagrams.MobileUpperSlewDiagram,
  MobileHoistClutchBrakeDiagram: MobileCraneDiagrams.MobileHoistClutchBrakeDiagram,
  MobileWireRopeLayDiagram: MobileCraneDiagrams.MobileWireRopeLayDiagram,
  MobileRatedLoadTableDiagram: MobileCraneDiagrams.MobileRatedLoadTableDiagram,
  MobileWorkAreaStabilityDiagram: MobileCraneDiagrams.MobileWorkAreaStabilityDiagram,
  MobilePascalPrincipleDiagram: MobileCraneDiagrams.MobilePascalPrincipleDiagram,
  MobileHydraulicActuatorsDiagram: MobileCraneDiagrams.MobileHydraulicActuatorsDiagram,
  MobileHydraulicValvesDiagram: MobileCraneDiagrams.MobileHydraulicValvesDiagram,
  MobileForceCompositionMomentDiagram: MobileCraneDiagrams.MobileForceCompositionMomentDiagram,
  MobileBalanceBeamDiagram: MobileCraneDiagrams.MobileBalanceBeamDiagram,
  MobileCenterOfGravityStabilityDiagram: MobileCraneDiagrams.MobileCenterOfGravityStabilityDiagram,
  MobileSlingAngleTensionDiagram: MobileCraneDiagrams.MobileSlingAngleTensionDiagram,
  MobilePulleyPrincipleDiagram: MobileCraneDiagrams.MobilePulleyPrincipleDiagram,
} as const;

const XRAY_DIAGRAMS = {
  XrayTubeStructureDiagram: XrayDiagrams.XrayTubeStructureDiagram,
  XrayCharacteristicKSeriesDiagram: XrayDiagrams.XrayCharacteristicKSeriesDiagram,
  XrayInteractionsDiagram: XrayDiagrams.XrayInteractionsDiagram,
  XrayScatterAnglesDiagram: XrayDiagrams.XrayScatterAnglesDiagram,
  XrayShieldThicknessDiagram: XrayDiagrams.XrayShieldThicknessDiagram,
  XrayControlledAreaDistanceDiagram: XrayDiagrams.XrayControlledAreaDistanceDiagram,
  XrayGasDetectorCurveDiagram: XrayDiagrams.XrayGasDetectorCurveDiagram,
  XrayGmPlateauDiagram: XrayDiagrams.XrayGmPlateauDiagram,
  XrayScintillationDiagram: XrayDiagrams.XrayScintillationDiagram,
  XrayEffectiveDosePlacementDiagram: XrayDiagrams.XrayEffectiveDosePlacementDiagram,
  XrayCalibrationInterpolationDiagram: XrayDiagrams.XrayCalibrationInterpolationDiagram,
  XrayTissueSensitivityDiagram: XrayDiagrams.XrayTissueSensitivityDiagram,
  XrayArsDoseDiagram: XrayDiagrams.XrayArsDoseDiagram,
  XrayRbeLetDiagram: XrayDiagrams.XrayRbeLetDiagram,
  XrayBloodCellChangeDiagram: XrayDiagrams.XrayBloodCellChangeDiagram,
} as const;

const DIVER_DIAGRAMS = {
  DiverBoyleBalloonDiagram: DiverDiagrams.DiverBoyleBalloonDiagram,
  DiverDiveMethodsDiagram: DiverDiagrams.DiverDiveMethodsDiagram,
  DiverBlowUpFallDiagram: DiverDiagrams.DiverBlowUpFallDiagram,
  DiverBottomTimeDiagram: DiverDiagrams.DiverBottomTimeDiagram,
  DiverMValueDiagram: DiverDiagrams.DiverMValueDiagram,
  DiverHelmetPartsDiagram: DiverDiagrams.DiverHelmetPartsDiagram,
  DiverLungPleuraDiagram: DiverDiagrams.DiverLungPleuraDiagram,
  DiverHeartCirculationDiagram: DiverDiagrams.DiverHeartCirculationDiagram,
  DiverBarotraumaDiagram: DiverDiagrams.DiverBarotraumaDiagram,
  DiverEarSinusDiagram: DiverDiagrams.DiverEarSinusDiagram,
  DiverAirSupplyDepthDiagram: DiverDiagrams.DiverAirSupplyDepthDiagram,
} as const;

const CARGO_GEAR_DIAGRAMS = {
  CgTypesStructureDiagram: CargoGearDiagrams.CgTypesStructureDiagram,
  CgKenkaMakiDiagram: CargoGearDiagrams.CgKenkaMakiDiagram,
  CgWireEndFittingsDiagram: CargoGearDiagrams.CgWireEndFittingsDiagram,
  CgGearRatioDiagram: CargoGearDiagrams.CgGearRatioDiagram,
  CgDerrickGooseNeckDiagram: CargoGearDiagrams.CgDerrickGooseNeckDiagram,
  CgForceCompositionDiagram: CargoGearDiagrams.CgForceCompositionDiagram,
  CgBalanceBeamDiagram: CargoGearDiagrams.CgBalanceBeamDiagram,
  CgVelocityCompositionDiagram: CargoGearDiagrams.CgVelocityCompositionDiagram,
  CgSlingAngleTensionDiagram: CargoGearDiagrams.CgSlingAngleTensionDiagram,
  CgPulleyPrincipleDiagram: CargoGearDiagrams.CgPulleyPrincipleDiagram,
} as const;

const PRESSURE_CHAMBER_DIAGRAMS = {
  PcCaissonSectionDiagram: PressureChamberDiagrams.PcCaissonSectionDiagram,
  PcCentreDiagram: PressureChamberDiagrams.PcCentreDiagram,
  PcTunnelShieldDiagram: PressureChamberDiagrams.PcTunnelShieldDiagram,
  PcForceBalanceDiagram: PressureChamberDiagrams.PcForceBalanceDiagram,
  PcAirExhaustLayoutDiagram: PressureChamberDiagrams.PcAirExhaustLayoutDiagram,
  PcRecompressionDiagram: PressureChamberDiagrams.PcRecompressionDiagram,
  PcAirlockStandardsDiagram: PressureChamberDiagrams.PcAirlockStandardsDiagram,
} as const;

function isHygieneDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof DIAGRAM_TOPIC_IDS)[number] {
  return (DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isBoiler2DiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof BOILER2_DIAGRAM_TOPIC_IDS)[number] {
  return (BOILER2_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isCraneDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof CRANE_ALL_DIAGRAM_TOPIC_IDS)[number] {
  return (CRANE_ALL_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isMobileCraneDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof MOBILE_CRANE_DIAGRAM_TOPIC_IDS)[number] {
  return (MOBILE_CRANE_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isDiverDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof DIVER_DIAGRAM_TOPIC_IDS)[number] {
  return (DIVER_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isXrayDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof XRAY_DIAGRAM_TOPIC_IDS)[number] {
  return (XRAY_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isPressureChamberDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof PRESSURE_CHAMBER_DIAGRAM_TOPIC_IDS)[number] {
  return (PRESSURE_CHAMBER_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

function isCargoGearDiagramId(
  topicId: DiagramLearnTopicId
): topicId is (typeof CARGO_GEAR_DIAGRAM_TOPIC_IDS)[number] {
  return (CARGO_GEAR_DIAGRAM_TOPIC_IDS as readonly string[]).includes(topicId);
}

type TopicDiagramProps = {
  topicId: DiagramLearnTopicId;
};

function DiagramBody({ topicId }: { topicId: DiagramLearnTopicId }) {
  if (isCargoGearDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = CARGO_GEAR_DIAGRAMS[topic.diagram as keyof typeof CARGO_GEAR_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isPressureChamberDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram =
      PRESSURE_CHAMBER_DIAGRAMS[topic.diagram as keyof typeof PRESSURE_CHAMBER_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isDiverDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = DIVER_DIAGRAMS[topic.diagram as keyof typeof DIVER_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isXrayDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = XRAY_DIAGRAMS[topic.diagram as keyof typeof XRAY_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isMobileCraneDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = MOBILE_CRANE_DIAGRAMS[topic.diagram as keyof typeof MOBILE_CRANE_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isCraneDiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = CRANE_DIAGRAMS[topic.diagram as keyof typeof CRANE_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (isBoiler2DiagramId(topicId)) {
    const topic = getLearnTopic(topicId);
    if (!topic || topic.contentType !== "diagram") {
      return null;
    }
    const Diagram = BOILER2_DIAGRAMS[topic.diagram as keyof typeof BOILER2_DIAGRAMS];
    return Diagram ? <Diagram /> : null;
  }

  if (!isHygieneDiagramId(topicId)) {
    return null;
  }

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

export function TopicDiagram({ topicId }: TopicDiagramProps) {
  const topic = getLearnTopic(topicId);

  return (
    <PlateFrame
      kind="FIG"
      number={getDiagramFigureNumber(topicId)}
      caption={topic?.title ?? ""}
      footnote="試験対策用の模式図です。縮尺や細部は簡略化しています。"
      isFrequent={false}
    >
      <DiagramBody topicId={topicId} />
    </PlateFrame>
  );
}
