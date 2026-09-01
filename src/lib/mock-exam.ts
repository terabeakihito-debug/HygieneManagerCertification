export const OVERALL_PASS_PERCENT = 60;
export const CATEGORY_PASS_PERCENT = 40;

const KNOWLEDGE = "クレーン及びデリックに関する知識";
const LAW = "関係法令";
const MOTOR = "原動機及び電気に関する知識";
const MECHANICS = "クレーンの運転のために必要な力学に関する知識";

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
  if (input.examId !== "crane_all") {
    return null;
  }
  const scope = input.categoryScope;
  if (!scope || scope.length === 0) {
    return "免除なしの方向け。4科目40問です。";
  }
  const names = new Set(scope);
  const hasKnowledge = names.has(KNOWLEDGE);
  const hasLaw = names.has(LAW);
  const hasMotor = names.has(MOTOR);
  const hasMechanics = names.has(MECHANICS);
  if (hasKnowledge && hasLaw && hasMotor && !hasMechanics) {
    return "実務経験により力学が免除される方向け。知識・法令・原動機及び電気の30問です。";
  }
  if (hasKnowledge && hasLaw && !hasMotor && !hasMechanics) {
    return "実務経験により原動機及び電気と力学が免除される方向け。知識・法令の20問です。";
  }
  return "出題科目を絞り込んだ模試です。";
}
