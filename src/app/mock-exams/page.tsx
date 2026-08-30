import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { createClient } from "@/lib/supabase/server";

type MockExamRow = {
  id: string;
  name: string;
  time_limit_minutes: number;
  question_count: number;
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
    .select("id, name, time_limit_minutes, question_count, exam_types(name)")
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
        <p className="rounded-lg border border-gray-200 bg-white p-6 text-gray-600">
          模試がまだ登録されていません。
        </p>
      ) : (
        <ul className="flex flex-col gap-3">
          {exams.map((exam) => (
            <li
              key={exam.id}
              className="rounded-lg border border-gray-200 bg-white p-4"
            >
              <h2 className="font-semibold">{exam.name}</h2>
              <p className="mt-1 text-sm text-gray-600">{examTypeName(exam.exam_types)}</p>
              <p className="mt-2 text-sm text-gray-600">
                制限時間 {exam.time_limit_minutes}分 / {exam.question_count}問
              </p>
              <Link
                href={`/mock-exams/${exam.id}/start`}
                className="mt-4 inline-block rounded bg-gray-900 px-4 py-2 text-sm text-white"
              >
                この模試を受ける
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  );
}
