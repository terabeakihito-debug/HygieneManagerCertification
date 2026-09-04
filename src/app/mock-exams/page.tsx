import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { currentExam } from "@/config/exams";
import { mockExamAudienceNote } from "@/lib/mock-exam";
import { createClient } from "@/lib/supabase/server";

type MockExamRow = {
  id: string;
  name: string;
  time_limit_minutes: number;
  question_count: number;
  category_scope: string[] | null;
  exam_types: { name: string } | { name: string }[] | null;
};

function examTypeName(joined: MockExamRow["exam_types"]): string {
  if (!joined) {
    return "区分未設定";
  }
  return Array.isArray(joined) ? (joined[0]?.name ?? "区分未設定") : joined.name;
}

export default async function MockExamsPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const { data } = await supabase
    .from("mock_exams")
    .select("id, name, time_limit_minutes, question_count, category_scope, exam_types(name)")
    .eq("exam_id", currentExam.id)
    .not("source_filter", "ilike", "%公表%")
    .order("name");

  const exams = (data ?? []) as MockExamRow[];

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">模試</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/mock-exams/history" className="underline">
            履歴
          </Link>
          <Link href="/calendar" className="underline">
            カレンダー
          </Link>
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      {exams.length === 0 ? (
        <p className="card-surface p-6 text-graphite">
          模試がまだ登録されていません。
        </p>
      ) : (
        <ul className="flex flex-col gap-3">
          {exams.map((exam) => {
            const audienceNote = mockExamAudienceNote({
              examId: currentExam.id,
              categoryScope: exam.category_scope,
            });
            return (
            <li
              key={exam.id}
              className="card-surface p-4"
            >
              <h2 className="font-semibold">{exam.name}</h2>
              <p className="mt-1 text-sm text-graphite">{examTypeName(exam.exam_types)}</p>
              <p className="mt-2 text-sm text-graphite">
                制限時間 {exam.time_limit_minutes}分 / {exam.question_count}問
              </p>
              {audienceNote ? (
                <p className="mt-2 text-sm text-graphite">{audienceNote}</p>
              ) : null}
              <Link
                href={`/mock-exams/${exam.id}/start`}
                className="btn-primary mt-4 text-sm"
              >
                この模試を受ける
              </Link>
            </li>
            );
          })}
        </ul>
      )}
    </main>
  );
}
