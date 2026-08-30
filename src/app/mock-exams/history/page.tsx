import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { createClient } from "@/lib/supabase/server";

type HistoryRow = {
  id: string;
  score: number;
  taken_at: string;
  mock_exam_id: string;
  mock_exams:
    | { name: string; question_count: number }
    | { name: string; question_count: number }[]
    | null;
};

function mockExamFromJoin(joined: HistoryRow["mock_exams"]) {
  if (!joined) {
    return { name: "不明な模試", question_count: 0 };
  }
  return Array.isArray(joined) ? (joined[0] ?? { name: "不明な模試", question_count: 0 }) : joined;
}

function formatTakenAt(value: string): string {
  return new Date(value).toLocaleString("ja-JP", {
    timeZone: "Asia/Tokyo",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  });
}

export default async function MockExamHistoryPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const { data } = await supabase
    .from("mock_exam_results")
    .select("id, score, taken_at, mock_exam_id, mock_exams(name, question_count)")
    .eq("user_id", user.id)
    .order("taken_at", { ascending: false });

  const rows = (data ?? []) as HistoryRow[];

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">模試結果の履歴</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/mock-exams" className="underline">
            模試一覧
          </Link>
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      {rows.length === 0 ? (
        <p className="rounded-lg border border-gray-200 bg-white p-6 text-gray-600">
          まだ模試の受験履歴がありません。
        </p>
      ) : (
        <ul className="flex flex-col gap-3">
          {rows.map((row) => {
            const exam = mockExamFromJoin(row.mock_exams);
            return (
              <li key={row.id}>
                <Link
                  href={`/mock-exams/${row.mock_exam_id}/result/${row.id}`}
                  className="block rounded-lg border border-gray-200 bg-white p-4 hover:bg-gray-50"
                >
                  <p className="font-semibold">{exam.name}</p>
                  <p className="mt-1 text-sm text-gray-600">{formatTakenAt(row.taken_at)}</p>
                  <p className="mt-2 text-sm">
                    スコア {row.score} / {exam.question_count}
                  </p>
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </main>
  );
}
