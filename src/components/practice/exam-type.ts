import type { ExamType, ExamTypeCode } from "@/types/database";

export type PracticeExamType = "type1" | "type2" | "all";

export function parsePracticeExamType(value: string | undefined): PracticeExamType {
  if (value === "type1" || value === "type2" || value === "all") {
    return value;
  }
  return "all";
}

export function examTypeCodesForFilter(filter: PracticeExamType): ExamTypeCode[] {
  switch (filter) {
    case "type1":
      return ["type1", "common"];
    case "type2":
      return ["type2", "common"];
    case "all":
      return ["type1", "type2", "common"];
    default: {
      const _never: never = filter;
      return _never;
    }
  }
}

export function examTypeIdsForFilter(
  examTypes: Pick<ExamType, "id" | "code">[],
  filter: PracticeExamType
): string[] {
  const codes = new Set(examTypeCodesForFilter(filter));
  return examTypes.filter((examType) => codes.has(examType.code)).map((examType) => examType.id);
}
