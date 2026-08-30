import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { CategoryFilter } from "@/components/practice/CategoryFilter";
import {
  examTypeIdsForFilter,
  parsePracticeExamType,
  type PracticeExamType,
} from "@/components/practice/exam-type";
import {
  QuestionCard,
  type PracticeQuestion,
} from "@/components/practice/QuestionCard";
import { createClient } from "@/lib/supabase/server";
import type { Category, ExamType } from "@/types/database";

type PracticePageProps = {
  searchParams: Promise<{ exam_type?: string; category_id?: string }>;
};

const EXAM_TYPE_OPTIONS: { value: PracticeExamType; label: string }[] = [
  { value: "type1", label: "第一種" },
  { value: "type2", label: "第二種" },
  { value: "all", label: "両方(共通含む)" },
];

function shuffle<T>(items: T[]): T[] {
  const next = [...items];
  for (let i = next.length - 1; i > 0; i -= 1) {
    const j = Math.floor(Math.random() * (i + 1));
    const current = next[i];
    next[i] = next[j] as T;
    next[j] = current as T;
  }
  return next;
}

function examTypeHref(examType: PracticeExamType): string {
  return examType === "all" ? "/practice" : `/practice?exam_type=${examType}`;
}

export default async function PracticePage({ searchParams }: PracticePageProps) {
  const params = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const examType = parsePracticeExamType(params.exam_type);

  const [examTypesResult, categoriesResult] = await Promise.all([
    supabase.from("exam_types").select("id, code, name"),
    supabase.from("categories").select("id, exam_type_id, name, sort_order").order("sort_order"),
  ]);

  const examTypes = (examTypesResult.data ?? []) as Pick<ExamType, "id" | "code" | "name">[];
  const categories = (categoriesResult.data ?? []) as Category[];
  const allowedExamTypeIds = examTypeIdsForFilter(examTypes, examType);
  const visibleCategories = categories.filter((category) =>
    allowedExamTypeIds.includes(category.exam_type_id)
  );
  const selectedCategoryId =
    params.category_id && visibleCategories.some((category) => category.id === params.category_id)
      ? params.category_id
      : null;

  let questionsQuery = supabase
    .from("questions")
    .select(
      "id, exam_type_id, category_id, question_text, explanation, choices(id, choice_text, is_correct, sort_order)"
    );

  if (examType !== "all") {
    questionsQuery = questionsQuery.in("exam_type_id", allowedExamTypeIds);
  }
  if (selectedCategoryId) {
    questionsQuery = questionsQuery.eq("category_id", selectedCategoryId);
  }

  const { data: questionRows } = await questionsQuery;

  const questions: PracticeQuestion[] = shuffle(
    (questionRows ?? [])
      .map((row) => ({
        id: row.id as string,
        question_text: row.question_text as string,
        explanation: row.explanation as string,
        choices: Array.isArray(row.choices) ? row.choices : [],
      }))
      .filter((question) => question.choices.length > 0)
  );

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">問題演習</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/progress" className="underline">
            進捗
          </Link>
          <Link href="/review" className="underline">
            復習
          </Link>
          <Link href="/mock-exams" className="underline">
            模試
          </Link>
          <Link href="/calendar" className="underline">
            カレンダー
          </Link>
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      <p className="text-sm text-gray-500">
        先に学習コンテンツを読みたい方は
        <Link href="/learn" className="ml-1 underline">
          こちら
        </Link>
      </p>

      <fieldset>
        <legend className="mb-2 text-sm font-medium">資格区分</legend>
        <div className="flex flex-wrap gap-2">
          {EXAM_TYPE_OPTIONS.map((option) => {
            const active = option.value === examType;
            return (
              <Link
                key={option.value}
                href={examTypeHref(option.value)}
                className={`rounded px-3 py-2 text-sm ${
                  active
                    ? "bg-gray-900 text-white"
                    : "border border-gray-300 bg-white text-gray-800"
                }`}
              >
                {option.label}
              </Link>
            );
          })}
        </div>
      </fieldset>

      <CategoryFilter
        examType={examType}
        categories={visibleCategories}
        selectedCategoryId={selectedCategoryId}
      />

      <QuestionCard
        key={`${examType}-${selectedCategoryId ?? "all"}`}
        questions={questions}
      />
    </main>
  );
}
