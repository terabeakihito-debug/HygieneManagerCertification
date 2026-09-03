export const OVERALL_PASS_PERCENT = 60;
export const CATEGORY_PASS_PERCENT = 40;

const CRANE_KNOWLEDGE = "クレーン及びデリックに関する知識";
const CRANE_LAW = "関係法令";
const CRANE_MOTOR = "原動機及び電気に関する知識";
const CRANE_MECHANICS = "クレーンの運転のために必要な力学に関する知識";

const MOBILE_KNOWLEDGE = "移動式クレーンに関する知識";
const MOBILE_MOTOR = "原動機及び電気に関する知識";
const MOBILE_LAW = "関係法令";
const MOBILE_MECHANICS =
  "移動式クレーンの運転のために必要な力学に関する知識";

const XRAY_MANAGEMENT = "エックス線の管理に関する知識";
const XRAY_LAW = "関係法令";
const XRAY_MEASUREMENT = "エックス線の測定に関する知識";
const XRAY_BIOLOGY = "エックス線の生体に与える影響に関する知識";

export function didPassMockExam(input: {
  score: number;
  questionCount: number;
  categoryPercents: Record<string, number>;
}): boolean {
  if (input.questionCount <= 0) {
    return false;
  }
  if ((input.score / input.questionCount) * 100 < OVERALL_PASS_PERCENT) {
    return false;
  }
  const percents = Object.values(input.categoryPercents);
  if (percents.length === 0) {
    return true;
  }
  return percents.every((percent) => percent >= CATEGORY_PASS_PERCENT);
}

export function mockExamAudienceNote(input: {
  examId: string;
  categoryScope: string[] | null;
}): string | null {
  if (input.examId === "xray") {
    const scope = input.categoryScope;
    if (!scope || scope.length === 0) {
      return "免除なしの方向け。4科目40問です。";
    }
    const names = new Set(scope);
    const hasManagement = names.has(XRAY_MANAGEMENT);
    const hasLaw = names.has(XRAY_LAW);
    const hasMeasurement = names.has(XRAY_MEASUREMENT);
    const hasBiology = names.has(XRAY_BIOLOGY);
    if (hasManagement && hasLaw && hasMeasurement && !hasBiology) {
      return "ガンマ線透過写真撮影作業主任者試験の合格等により生体影響が免除される方向け。管理・法令・測定の30問です。";
    }
    if (hasManagement && hasLaw && !hasMeasurement && !hasBiology) {
      return "第二種放射線取扱主任者免状により測定と生体影響が免除される方向け。管理・法令の20問です。";
    }
    return "出題科目を絞り込んだ模試です。";
  }
  if (input.examId === "mobile_crane") {
    const scope = input.categoryScope;
    if (!scope || scope.length === 0) {
      return "免除なしの方向け。4科目40問です。";
    }
    const names = new Set(scope);
    const hasKnowledge = names.has(MOBILE_KNOWLEDGE);
    const hasMotor = names.has(MOBILE_MOTOR);
    const hasLaw = names.has(MOBILE_LAW);
    const hasMechanics = names.has(MOBILE_MECHANICS);
    if (hasKnowledge && hasMotor && hasLaw && !hasMechanics) {
      return "実務経験により力学が免除される方向け。知識・原動機及び電気・法令の30問です。";
    }
    return "出題科目を絞り込んだ模試です。";
  }
  if (input.examId !== "crane_all") {
    return null;
  }
  const scope = input.categoryScope;
  if (!scope || scope.length === 0) {
    return "免除なしの方向け。4科目40問です。";
  }
  const names = new Set(scope);
  const hasKnowledge = names.has(CRANE_KNOWLEDGE);
  const hasLaw = names.has(CRANE_LAW);
  const hasMotor = names.has(CRANE_MOTOR);
  const hasMechanics = names.has(CRANE_MECHANICS);
  if (hasKnowledge && hasLaw && hasMotor && !hasMechanics) {
    return "実務経験により力学が免除される方向け。知識・法令・原動機及び電気の30問です。";
  }
  if (hasKnowledge && hasLaw && !hasMotor && !hasMechanics) {
    return "実務経験により原動機及び電気と力学が免除される方向け。知識・法令の20問です。";
  }
  return "出題科目を絞り込んだ模試です。";
}
