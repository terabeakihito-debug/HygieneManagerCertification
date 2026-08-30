import Link from "next/link";
import { redirect } from "next/navigation";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { ProductRecommendation } from "@/components/recommendations/ProductRecommendation";
import { WEAK_ACCURACY_THRESHOLD } from "@/lib/data/progress";
import { getRecommendedProductsForUser } from "@/lib/data/recommendations";
import { createClient } from "@/lib/supabase/server";

type ResultPageProps = {
  params: Promise<{ mockExamId: string; resultId: string }>;
};

type CategoryRow = {
  id: string;
  name: string;
};

export default async function MockExamResultPage({ params }: ResultPageProps) {
  const { mockExamId, resultId } = await params;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const { data: result } = await supabase
    .from("mock_exam_results")
    .select("id, user_id, mock_exam_id, score, category_breakdown, taken_at")
    .eq("id", resultId)
    .maybeSingle();

  if (!result || result.user_id !== user.id || result.mock_exam_id !== mockExamId) {
    redirect("/mock-exams/history");
  }

  const { data: mockExam } = await supabase
    .from("mock_exams")
    .select("id, name, question_count, exam_type_id")
    .eq("id", mockExamId)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const { count: availableCount } = await supabase
    .from("questions")
    .select("id", { count: "exact", head: true })
    .eq("exam_type_id", mockExam.exam_type_id);

  const questionTotal = Math.min(mockExam.question_count, availableCount ?? mockExam.question_count);
  const breakdown = (result.category_breakdown ?? {}) as Record<string, number>;
  const categoryIds = Object.keys(breakdown);

  const { data: categoryRows } = categoryIds.length
    ? await supabase.from("categories").select("id, name").in("id", categoryIds)
    : { data: [] };

  const categoryNames = new Map(
    ((categoryRows ?? []) as CategoryRow[]).map((row) => [row.id, row.name])
  );
  const weakPercent = Math.round(WEAK_ACCURACY_THRESHOLD * 100);
  const recommendedProducts = await getRecommendedProductsForUser(user.id);

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">模試結果</h1>
        <Link href="/mypage" className="text-sm underline">
          マイページ
        </Link>
      </div>

      <section className="rounded-lg border border-gray-200 bg-white p-6 text-center">
        <p className="text-sm text-gray-500">{mockExam.name}</p>
        <p className="mt-2 text-4xl font-bold">
          {result.score} / {questionTotal}
        </p>
        <p className="mt-1 text-sm text-gray-600">正答数 / 出題数</p>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-lg font-semibold">分野別正答率</h2>
        {categoryIds.length === 0 ? (
          <p className="text-sm text-gray-600">分野別のデータがありません。</p>
        ) : (
          <ul className="flex flex-col gap-2">
            {categoryIds.map((categoryId) => {
              const rate = breakdown[categoryId] ?? 0;
              const weak = rate < weakPercent;
              return (
                <li
                  key={categoryId}
                  className={`rounded-lg border p-4 ${
                    weak
                      ? "border-red-300 bg-red-50"
                      : "border-gray-200 bg-white"
                  }`}
                >
                  <div className="flex items-center justify-between gap-3">
                    <p className="font-medium">
                      {categoryNames.get(categoryId) ?? "不明な分野"}
                    </p>
                    <p className={`font-semibold ${weak ? "text-red-800" : ""}`}>
                      {rate}%
                    </p>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </section>

      <ProductRecommendation
        products={recommendedProducts}
        heading="苦手分野の学習に役立つかもしれません"
      />

      <div className="flex flex-col gap-3">
        <Link
          href={`/mock-exams/${mockExamId}/start`}
          className="rounded bg-gray-900 px-4 py-2 text-center text-white"
        >
          もう一度この模試を受ける
        </Link>
        <Link href="/mock-exams/history" className="text-center text-sm underline">
          模試結果の履歴を見る
        </Link>
      </div>
    </main>
  );
}
