import { examConfig as boiler2 } from "./boiler2";
import { examConfig as hygiene } from "./hygiene";

const configs = {
  hygiene,
  boiler2,
} as const;

type ExamId = keyof typeof configs;

function isExamId(value: string): value is ExamId {
  return value in configs;
}

const examId = process.env.NEXT_PUBLIC_EXAM_ID ?? "hygiene";

if (!isExamId(examId)) {
  throw new Error(`Unknown NEXT_PUBLIC_EXAM_ID: ${examId}`);
}

export const currentExam = configs[examId];

export function licenseCategoryCodes(): string[] {
  return currentExam.categories.map((category) => category.code);
}
