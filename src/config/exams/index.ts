import { examConfig as boiler2 } from "./boiler2";
import { examConfig as crane_all } from "./crane_all";
import { examConfig as diver } from "./diver";
import { examConfig as hygiene } from "./hygiene";
import { examConfig as mobile_crane } from "./mobile_crane";
import { examConfig as xray } from "./xray";

const configs = {
  hygiene,
  boiler2,
  crane_all,
  mobile_crane,
  xray,
  diver,
} as const;

type ExamId = keyof typeof configs;

function isExamId(value: string): value is ExamId {
  return value in configs;
}

const examIdRaw: string = process.env.NEXT_PUBLIC_EXAM_ID ?? "hygiene";

if (!isExamId(examIdRaw)) {
  throw new Error(`Unknown NEXT_PUBLIC_EXAM_ID: ${examIdRaw}`);
}

export const currentExam = configs[examIdRaw];

export function licenseCategoryCodes(): string[] {
  return currentExam.categories.map((category) => category.code);
}
