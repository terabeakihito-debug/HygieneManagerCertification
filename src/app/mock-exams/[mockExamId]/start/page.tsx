import { redirect } from "next/navigation";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { currentExam } from "@/config/exams";
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
    .select("id, question_count, source_filter")
    .eq("id", mockExamId)
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const { data: questionRows } = await supabase
    .from("questions")
    .select("id, source_note")
    .eq("exam_id", currentExam.id)
    .eq("source_type", "past_exam")
    .ilike("source_note", `%${mockExam.source_filter}%`);

  const selected = [...(questionRows ?? [])].sort(
    (left, right) => questionNumber(left.source_note) - questionNumber(right.source_note)
  );

  if (selected.length !== mockExam.question_count) {
    redirect("/mock-exams");
  }

  const ids = selected.map((row) => row.id).join(",");

  redirect(`/mock-exams/${mockExamId}/take?ids=${ids}`);
}
