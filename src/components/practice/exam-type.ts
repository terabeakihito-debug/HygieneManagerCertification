import { currentExam } from "@/config/exams";
import type { ExamType } from "@/types/database";

export type PracticeExamType = (typeof currentExam.practiceFilters)[number]["value"];

export function parsePracticeExamType(value: string | undefined): PracticeExamType {
  const match = currentExam.practiceFilters.find((filter) => filter.value === value);
  if (match) {
    return match.value;
  }
  const fallback = currentExam.practiceFilters[currentExam.practiceFilters.length - 1];
  if (!fallback) {
    throw new Error("currentExam.practiceFilters is empty");
  }
  return fallback.value;
}

export function defaultPracticeFilter(): PracticeExamType {
  return parsePracticeExamType(undefined);
}

export function examTypeCodesForFilter(filter: PracticeExamType): string[] {
  const found = currentExam.practiceFilters.find((item) => item.value === filter);
  return found ? [...found.codes] : [];
}

export function examTypeIdsForFilter(
  examTypes: Pick<ExamType, "id" | "code">[],
  filter: PracticeExamType
): string[] {
  const codes = new Set(examTypeCodesForFilter(filter));
  return examTypes.filter((examType) => codes.has(examType.code)).map((examType) => examType.id);
}
