export const VISIBLE_QUESTION_SOURCE_TYPE = "original" as const;
export const VISIBLE_ORIGINAL_SOURCE_NOTE = "%オリジナル問題%";

const LIVE_EXAM_IDS = new Set(["boiler2", "hygiene", "crane_all"]);

export function isLiveExam(examId: string | undefined): boolean {
  return examId !== undefined && LIVE_EXAM_IDS.has(examId);
}

export function examTypeIdsForMock(input: {
  mockExamTypeId: string;
  examTypes: { id: string; code: string }[];
  sharedCategoryCode?: string | null;
}): string[] {
  const ids = new Set([input.mockExamTypeId]);
  if (!input.sharedCategoryCode) {
    return [...ids];
  }
  const shared = input.examTypes.find((row) => row.code === input.sharedCategoryCode);
  if (shared) {
    ids.add(shared.id);
  }
  return [...ids];
}
