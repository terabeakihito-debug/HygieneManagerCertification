import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { CategoryProgressCard } from "@/components/progress/CategoryProgressCard";
import { OverallSummary } from "@/components/progress/OverallSummary";
import { ProductRecommendation } from "@/components/recommendations/ProductRecommendation";
import {
  MIN_ANSWERS_FOR_WEAK_JUDGMENT,
  WEAK_ACCURACY_THRESHOLD,
  getProgressDashboard,
  parseProgressSort,
  sortCategoryRows,
  type ProgressSort,
} from "@/lib/data/progress";
import { getRecommendedProductsForUser } from "@/lib/data/recommendations";
import { createClient } from "@/lib/supabase/server";

type ProgressPageProps = {
  searchParams: Promise<{ sort?: string }>;
};

function sortHref(sort: ProgressSort): string {
  switch (sort) {
    case "default":
      return "/progress";
    case "rate_desc":
      return "/progress?sort=rate_desc";
    case "rate_asc":
      return "/progress?sort=rate_asc";
    default: {
      const _never: never = sort;
      return _never;
    }
  }
}

const SORT_OPTIONS: { value: ProgressSort; label: string }[] = [
  { value: "default", label: "標準" },
  { value: "rate_desc", label: "正答率が高い順" },
  { value: "rate_asc", label: "正答率が低い順" },
];

export default async function ProgressPage({ searchParams }: ProgressPageProps) {
  const params = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const sort = parseProgressSort(params.sort);
  const [dashboard, recommendedProducts] = await Promise.all([
    getProgressDashboard(user.id),
    getRecommendedProductsForUser(user.id),
  ]);
  const categories = sortCategoryRows(dashboard.categories, sort);
  const weakPercent = Math.round(WEAK_ACCURACY_THRESHOLD * 100);

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">進捗管理</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/practice" className="underline">
            問題演習
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

      {dashboard.weakCount > 0 ? (
        <p className="card-surface border-stamp px-4 py-3 text-sm text-stamp">
          苦手分野が{dashboard.weakCount}件あります（正答率{weakPercent}%未満）
        </p>
      ) : null}

      <OverallSummary
        totalAnswered={dashboard.totalAnswered}
        totalCorrect={dashboard.totalCorrect}
        overallAccuracy={dashboard.overallAccuracy}
        examTypeSummaries={dashboard.examTypeSummaries}
      />

      <section className="flex flex-col gap-3">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
          <h2 className="text-lg font-semibold">分野別の進捗</h2>
          <div className="flex flex-wrap gap-2 text-sm">
            {SORT_OPTIONS.map((option) => {
              const active = option.value === sort;
              return (
                <Link
                  key={option.value}
                  href={sortHref(option.value)}
                  className={`rounded-sm px-3 py-1 ${
                    active
                      ? "bg-safety text-paper"
                      : "btn-secondary px-3 py-1"
                  }`}
                >
                  {option.label}
                </Link>
              );
            })}
          </div>
        </div>

        <p className="text-sm text-graphite">
          回答数が{MIN_ANSWERS_FOR_WEAK_JUDGMENT}問未満の分野は、正答率が安定しないため苦手分野の判定から除外しています。
        </p>

        {categories.length === 0 ? (
          <p className="card-surface p-6 text-graphite">
            分野データがありません。
          </p>
        ) : (
          <div className="flex flex-col gap-3">
            {categories.map((row) => (
              <CategoryProgressCard key={row.categoryId} row={row} />
            ))}
          </div>
        )}
      </section>

      <ProductRecommendation
        products={recommendedProducts}
        heading="苦手分野の学習に役立つかもしれません"
      />
    </main>
  );
}
