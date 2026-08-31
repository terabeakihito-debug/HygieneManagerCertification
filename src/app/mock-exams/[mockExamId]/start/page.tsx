import { redirect } from "next/navigation";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { currentExam } from "@/config/exams";
import { createClient } from "@/lib/supabase/server";

type StartPageProps = {
  params: Promise<{ mockExamId: string }>;
};

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
    .select("id, exam_type_id, question_count")
    .eq("id", mockExamId)
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const { data: questionRows } = await supabase
    .from("questions")
    .select("id")
    .eq("exam_id", currentExam.id)
    .eq("exam_type_id", mockExam.exam_type_id);

  const selected = shuffle(questionRows ?? []).slice(0, mockExam.question_count);
  const ids = selected.map((row) => row.id).join(",");

  redirect(`/mock-exams/${mockExamId}/take?ids=${ids}`);
}
