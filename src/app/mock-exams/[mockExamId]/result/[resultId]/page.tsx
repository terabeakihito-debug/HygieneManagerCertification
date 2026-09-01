import Link from "next/link";
import { redirect } from "next/navigation";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { ProductRecommendation } from "@/components/recommendations/ProductRecommendation";
import { StampBadge } from "@/components/ui/StampBadge";
import { WEAK_ACCURACY_THRESHOLD } from "@/lib/data/progress";
import { getRecommendedProductsForUser } from "@/lib/data/recommendations";
import { currentExam } from "@/config/exams";
import { createClient } from "@/lib/supabase/server";

type ResultPageProps = {
  params: Promise<{ mockExamId: string; resultId: string }>;
};

type CategoryRow = {
  id: string;
  name: string;
};

const PASS_LINE_PERCENT = 60;
const ACHIEVED_PERCENT = 80;

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

function deltaClassName(delta: number): string {
  if (delta > 0) {
    return "text-safety";
  }
  if (delta < 0) {
    return "text-stamp";
  }
  return "text-graphite";
}

function formatDelta(delta: number): string {
  if (delta > 0) {
    return `+${delta}`;
  }
  return String(delta);
}

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
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (!result || result.user_id !== user.id || result.mock_exam_id !== mockExamId) {
    redirect("/mock-exams/history");
  }

  const { data: mockExam } = await supabase
    .from("mock_exams")
    .select("id, name, question_count")
    .eq("id", mockExamId)
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (!mockExam) {
    redirect("/mock-exams");
  }

  const questionTotal = mockExam.question_count;
  const breakdown = (result.category_breakdown ?? {}) as Record<string, number>;
  const categoryIds = Object.keys(breakdown);

  const { data: categoryRows } = categoryIds.length
    ? await supabase
        .from("categories")
        .select("id, name")
        .eq("exam_id", currentExam.id)
        .in("id", categoryIds)
    : { data: [] };

  const categoryNames = new Map(
    ((categoryRows ?? []) as CategoryRow[]).map((row) => [row.id, row.name])
  );
  const weakPercent = Math.round(WEAK_ACCURACY_THRESHOLD * 100);
  const recommendedProducts = await getRecommendedProductsForUser(user.id);
  const overallRate = questionTotal > 0 ? result.score / questionTotal : 0;
  const passed = overallRate >= 0.6;
  const thisPercent = Math.round(overallRate * 100);
  const delta = thisPercent - PASS_LINE_PERCENT;

  return (
    <main className="mx-auto flex min-h-[100dvh] max-w-2xl flex-col gap-10 px-4 py-8">
      <h1 className="font-display text-2xl font-bold">模試結果</h1>

      <section className="plate-frame">
        <span className="plate-frame-inner" aria-hidden="true" />
        <span className="plate-frame-corner plate-frame-corner-tl" aria-hidden="true" />
        <span className="plate-frame-corner plate-frame-corner-tr" aria-hidden="true" />
        <span className="plate-frame-corner plate-frame-corner-bl" aria-hidden="true" />
        <span className="plate-frame-corner plate-frame-corner-br" aria-hidden="true" />

        <div className="plate-frame-seal-slot">
          {passed ? (
            <StampBadge label="合格圏" enter />
          ) : (
            <StampBadge label="要再挑戦" tone="stamp" enter />
          )}
        </div>

        <p className="id-card-no pr-16">NO. {mockExam.name}</p>

        <div className="result-score-in flex flex-col items-center gap-3 py-8 text-center">
          <p className="font-mono text-[48px] font-medium leading-none tabular-nums sm:text-[64px]">
            {result.score}
            <span className="mx-2 text-[0.45em] text-graphite">/</span>
            {questionTotal}
          </p>
          <p className="font-mono text-2xl tabular-nums">{thisPercent}%</p>
          <p className="font-mono text-sm tabular-nums text-graphite">
            合格ライン {PASS_LINE_PERCENT}% / 今回 {thisPercent}%
          </p>
          <p className={`font-mono text-sm tabular-nums ${deltaClassName(delta)}`}>
            {formatDelta(delta)}
          </p>
        </div>

        <p className="font-mono text-xs tabular-nums text-graphite">
          {formatTakenAt(result.taken_at)}
        </p>
      </section>

      <section className="flex flex-col gap-3">
        <h2 className="text-lg font-semibold">分野別正答率</h2>
        {categoryIds.length === 0 ? (
          <p className="text-sm text-graphite">分野別のデータがありません。</p>
        ) : (
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left text-xs text-graphite">
                <th className="py-2 pl-3 font-medium">名前</th>
                <th className="py-2 text-right font-medium">正答率</th>
              </tr>
            </thead>
            <tbody>
              {categoryIds.map((categoryId) => {
                const rate = breakdown[categoryId] ?? 0;
                const weak = rate < weakPercent;
                const achieved = rate >= ACHIEVED_PERCENT;

                return (
                  <tr
                    key={categoryId}
                    className={`progress-row ${weak ? "text-stamp" : "text-ink"}`}
                  >
                    <td className="relative py-3 pl-3 pr-16">
                      {weak ? (
                        <span
                          aria-hidden
                          className="absolute bottom-0 left-0 top-0 w-1 bg-stamp"
                        />
                      ) : null}
                      {achieved ? (
                        <div className="absolute right-0 top-1">
                          <StampBadge label="達成" />
                        </div>
                      ) : null}
                      <p className="font-medium">
                        {categoryNames.get(categoryId) ?? "不明な分野"}
                      </p>
                      {weak ? (
                        <>
                          <p className="mt-1 text-xs text-stamp">苦手分野</p>
                          <Link
                            href={`/practice?category_id=${categoryId}`}
                            className="mt-2 inline-block text-xs underline"
                          >
                            この分野を演習する
                          </Link>
                        </>
                      ) : null}
                    </td>
                    <td className="py-3 text-right font-mono tabular-nums">
                      {rate}%
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        )}
      </section>

      <ProductRecommendation
        products={recommendedProducts}
        heading="苦手分野の学習に役立つかもしれません"
      />

      <div className="flex flex-col gap-3">
        <Link href={`/mock-exams/${mockExamId}/start`} className="btn-primary">
          もう一度この模試を受ける
        </Link>
        <Link href="/mock-exams/history" className="btn-secondary text-center">
          模試結果の履歴を見る
        </Link>
      </div>
    </main>
  );
}
