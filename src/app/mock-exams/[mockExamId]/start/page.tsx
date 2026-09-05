import { redirect } from "next/navigation";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { currentExam } from "@/config/exams";
import {
  examTypeIdsForMock,
  VISIBLE_ORIGINAL_SOURCE_NOTE,
  VISIBLE_QUESTION_SOURCE_TYPE,
} from "@/lib/question-visibility";
import { createClient } from "@/lib/supabase/server";

type StartPageProps = {
  params: Promise<{ mockExamId: string }>;
};

function questionNumber(sourceNote: string | null): number {
  const match = sourceNote?.match(/問(\d+)\s*$/);
  if (!match) {
    return Number.MAX_SAFE_INTEGER;
  }
  return Number(match[1]);
}

export default async function MockExamStartPage({ params }: StartPageProps) {
  const { mockExamId } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const { data: mockExam } = await supabase
    .from("mock_exams")
    .select("id, question_count, source_filter, category_scope, exam_type_id")
    .eq("id", mockExamId)
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const { data: examTypes } = await supabase
    .from("exam_types")
    .select("id, code")
    .eq("exam_id", currentExam.id);

  const examTypeIds = examTypeIdsForMock({
    mockExamTypeId: mockExam.exam_type_id,
    examTypes: examTypes ?? [],
    sharedCategoryCode: currentExam.sharedCategoryCode,
  });

  let questionQuery = supabase
    .from("questions")
    .select("id, source_note")
    .eq("exam_id", currentExam.id)
    .eq("source_type", VISIBLE_QUESTION_SOURCE_TYPE)
    .ilike("source_note", VISIBLE_ORIGINAL_SOURCE_NOTE)
    .ilike("source_note", `%${mockExam.source_filter}%`)
    .in("exam_type_id", examTypeIds);

  const categoryScope = mockExam.category_scope;
  if (categoryScope && categoryScope.length > 0) {
    const { data: categories } = await supabase
      .from("categories")
      .select("id")
      .eq("exam_id", currentExam.id)
      .in("name", categoryScope);

    const categoryIds = (categories ?? []).map((row) => row.id);
    if (categoryIds.length !== categoryScope.length) {
      redirect("/mock-exams");
    }
    questionQuery = questionQuery.in("category_id", categoryIds);
  }

  const { data: questionRows } = await questionQuery;

  const selected = [...(questionRows ?? [])].sort(
    (left, right) => questionNumber(left.source_note) - questionNumber(right.source_note)
  );

  if (selected.length !== mockExam.question_count) {
    redirect("/mock-exams");
  }

  const ids = selected.map((row) => row.id).join(",");

  redirect(`/mock-exams/${mockExamId}/take?ids=${ids}`);
}
