import Link from "next/link";
import { redirect } from "next/navigation";
import {
  MockExamTaker,
  type MockExamQuestion,
} from "@/components/mock-exam/MockExamTaker";
import { createClient } from "@/lib/supabase/server";

type TakePageProps = {
  params: Promise<{ mockExamId: string }>;
  searchParams: Promise<{ ids?: string }>;
};

type QuestionRow = {
  id: string;
  question_text: string;
  choices: {
    id: string;
    choice_text: string;
    sort_order: number;
  }[] | null;
};

export default async function MockExamTakePage({
  params,
  searchParams,
}: TakePageProps) {
  const { mockExamId } = await params;
  const { ids } = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  if (ids === undefined) {
    redirect(`/mock-exams/${mockExamId}/start`);
  }

  const questionIds = ids.split(",").filter(Boolean);

  const { data: mockExam } = await supabase
    .from("mock_exams")
    .select("id, name, time_limit_minutes")
    .eq("id", mockExamId)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const { data: questionRows } = await supabase
    .from("questions")
    .select("id, question_text, choices(id, choice_text, sort_order)")
    .in("id", questionIds);

  const byId = new Map(((questionRows ?? []) as QuestionRow[]).map((row) => [row.id, row]));
  const questions: MockExamQuestion[] = questionIds
    .map((id) => {
      const row = byId.get(id);
      if (!row) {
        return null;
      }
      return {
        id: row.id,
        question_text: row.question_text,
        choices: row.choices ?? [],
      };
    })
    .filter((row): row is MockExamQuestion => row !== null);

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">{mockExam.name}</h1>
        <Link href="/mock-exams" className="text-sm underline">
          模試一覧
        </Link>
      </div>
      <MockExamTaker
        mockExamId={mockExam.id}
        timeLimitMinutes={mockExam.time_limit_minutes}
        questions={questions}
      />
    </main>
  );
}
