import { createClient } from "@/lib/supabase/server";
import type { ExamTypeCode } from "@/types/database";

export const WEAK_ACCURACY_THRESHOLD = 0.6;
export const MIN_ANSWERS_FOR_WEAK_JUDGMENT = 5;

export type CategoryProgressStatus = "untouched" | "insufficient" | "weak" | "ok";

export type CategoryProgressRow = {
  categoryId: string;
  categoryName: string;
  examTypeCode: ExamTypeCode;
  examTypeName: string;
  sortOrder: number;
  totalAnswered: number;
  totalCorrect: number;
  accuracy: number | null;
  status: CategoryProgressStatus;
};

export type ExamTypeSummary = {
  code: ExamTypeCode;
  name: string;
  totalAnswered: number;
  totalCorrect: number;
  accuracy: number | null;
};

export type ProgressDashboard = {
  totalAnswered: number;
  totalCorrect: number;
  overallAccuracy: number | null;
  examTypeSummaries: ExamTypeSummary[];
  categories: CategoryProgressRow[];
  weakCount: number;
};

export type ProgressSort = "default" | "rate_desc" | "rate_asc";

type CategoryQueryRow = {
  id: string;
  name: string;
  sort_order: number;
  exam_types:
    | { code: string; name: string }
    | { code: string; name: string }[]
    | null;
};

type ProgressQueryRow = {
  category_id: string;
  total_answered: number;
  total_correct: number;
};

export function parseProgressSort(value: string | undefined): ProgressSort {
  if (value === "rate_desc" || value === "rate_asc") {
    return value;
  }
  return "default";
}

export function accuracyRate(correct: number, answered: number): number | null {
  if (answered === 0) {
    return null;
  }
  return correct / answered;
}

export function formatAccuracy(rate: number | null): string {
  if (rate === null) {
    return "-";
  }
  return `${Math.round(rate * 100)}%`;
}

export function classifyCategoryProgress(
  answered: number,
  rate: number | null
): CategoryProgressStatus {
  if (answered === 0) {
    return "untouched";
  }
  if (answered < MIN_ANSWERS_FOR_WEAK_JUDGMENT) {
    return "insufficient";
  }
  if (rate !== null && rate < WEAK_ACCURACY_THRESHOLD) {
    return "weak";
  }
  return "ok";
}

function isExamTypeCode(value: string): value is ExamTypeCode {
  switch (value) {
    case "type1":
    case "type2":
    case "common":
      return true;
    default:
      return false;
  }
}

function examTypeFromJoin(
  joined: CategoryQueryRow["exam_types"]
): { code: ExamTypeCode; name: string } | null {
  const row = Array.isArray(joined) ? joined[0] : joined;
  if (!row || !isExamTypeCode(row.code)) {
    return null;
  }
  return { code: row.code, name: row.name };
}

export function sortCategoryRows(
  rows: CategoryProgressRow[],
  sort: ProgressSort
): CategoryProgressRow[] {
  const next = [...rows];

  switch (sort) {
    case "default":
      next.sort((a, b) => a.sortOrder - b.sortOrder || a.categoryName.localeCompare(b.categoryName, "ja"));
      return next;
    case "rate_desc":
    case "rate_asc": {
      const direction = sort === "rate_desc" ? 1 : -1;
      next.sort((a, b) => {
        if (a.accuracy === null && b.accuracy === null) {
          return a.sortOrder - b.sortOrder;
        }
        if (a.accuracy === null) {
          return 1;
        }
        if (b.accuracy === null) {
          return -1;
        }
        if (a.accuracy === b.accuracy) {
          return a.sortOrder - b.sortOrder;
        }
        return a.accuracy > b.accuracy ? -direction : direction;
      });
      return next;
    }
    default: {
      const _never: never = sort;
      return _never;
    }
  }
}

export async function getProgressDashboard(userId: string): Promise<ProgressDashboard> {
  const supabase = await createClient();

  const [categoriesResult, progressResult, examTypesResult] = await Promise.all([
    supabase
      .from("categories")
      .select("id, name, sort_order, exam_types(code, name)")
      .order("sort_order"),
    supabase
      .from("user_progress")
      .select("category_id, total_answered, total_correct")
      .eq("user_id", userId),
    supabase.from("exam_types").select("code, name"),
  ]);

  const progressByCategory = new Map(
    ((progressResult.data ?? []) as ProgressQueryRow[]).map((row) => [
      row.category_id,
      { totalAnswered: row.total_answered, totalCorrect: row.total_correct },
    ])
  );

  const categories: CategoryProgressRow[] = ((categoriesResult.data ?? []) as CategoryQueryRow[])
    .map((row) => {
      const examType = examTypeFromJoin(row.exam_types);
      if (!examType) {
        return null;
      }
      const progress = progressByCategory.get(row.id);
      const totalAnswered = progress?.totalAnswered ?? 0;
      const totalCorrect = progress?.totalCorrect ?? 0;
      const accuracy = accuracyRate(totalCorrect, totalAnswered);
      return {
        categoryId: row.id,
        categoryName: row.name,
        examTypeCode: examType.code,
        examTypeName: examType.name,
        sortOrder: row.sort_order,
        totalAnswered,
        totalCorrect,
        accuracy,
        status: classifyCategoryProgress(totalAnswered, accuracy),
      };
    })
    .filter((row): row is CategoryProgressRow => row !== null);

  const totals = categories.reduce(
    (acc, row) => ({
      totalAnswered: acc.totalAnswered + row.totalAnswered,
      totalCorrect: acc.totalCorrect + row.totalCorrect,
    }),
    { totalAnswered: 0, totalCorrect: 0 }
  );

  const examTypeSummaries: ExamTypeSummary[] = ((examTypesResult.data ?? []) as {
    code: string;
    name: string;
  }[])
    .filter((row): row is { code: ExamTypeCode; name: string } => isExamTypeCode(row.code))
    .map((examType) => {
      const rows = categories.filter((row) => row.examTypeCode === examType.code);
      const totalAnswered = rows.reduce((sum, row) => sum + row.totalAnswered, 0);
      const totalCorrect = rows.reduce((sum, row) => sum + row.totalCorrect, 0);
      return {
        code: examType.code,
        name: examType.name,
        totalAnswered,
        totalCorrect,
        accuracy: accuracyRate(totalCorrect, totalAnswered),
      };
    });

  return {
    totalAnswered: totals.totalAnswered,
    totalCorrect: totals.totalCorrect,
    overallAccuracy: accuracyRate(totals.totalCorrect, totals.totalAnswered),
    examTypeSummaries,
    categories,
    weakCount: categories.filter((row) => row.status === "weak").length,
  };
}
