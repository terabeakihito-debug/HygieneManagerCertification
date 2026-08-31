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
  type CategoryProgressRow,
  type ExamTypeSummary,
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

function groupCategoriesByExamType(
  rows: CategoryProgressRow[],
  summaries: ExamTypeSummary[]
) {
  if (summaries.length === 0) {
    const groups: { code: CategoryProgressRow["examTypeCode"]; name: string; rows: CategoryProgressRow[] }[] =
      [];
    for (const row of rows) {
      const existing = groups.find((group) => group.code === row.examTypeCode);
      if (existing) {
        existing.rows.push(row);
      } else {
        groups.push({
          code: row.examTypeCode,
          name: row.examTypeName,
          rows: [row],
        });
      }
    }
    return groups;
  }

  return summaries
    .map((summary) => ({
      code: summary.code,
      name: summary.name,
      rows: rows.filter((row) => row.examTypeCode === summary.code),
    }))
    .filter((group) => group.rows.length > 0);
}

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
  const groups = groupCategoriesByExamType(categories, dashboard.examTypeSummaries);
  const weakPercent = Math.round(WEAK_ACCURACY_THRESHOLD * 100);

  return (
    <main className="mx-auto flex min-h-[100dvh] max-w-2xl flex-col gap-10 px-4 py-8">
      <div className="flex flex-col gap-3">
        <h1 className="font-display text-2xl font-bold">進捗管理</h1>
        <nav
          className="flex flex-wrap items-center font-mono text-[11px] tracking-wide text-graphite"
          aria-label="関連ページ"
        >
          <Link href="/practice">問題演習</Link>
          <span className="mx-2 text-hairline" aria-hidden>
            /
          </span>
          <Link href="/review">復習</Link>
          <span className="mx-2 text-hairline" aria-hidden>
            /
          </span>
          <Link href="/mock-exams">模試</Link>
          <span className="mx-2 text-hairline" aria-hidden>
            /
          </span>
          <Link href="/calendar">カレンダー</Link>
        </nav>
      </div>

      {dashboard.weakCount > 0 ? (
        <p className="weak-banner border-l-4 border-stamp px-4 py-3 text-sm text-stamp">
          苦手分野が{dashboard.weakCount}件あります（正答率{weakPercent}%未満）
        </p>
      ) : null}

      <OverallSummary
        totalAnswered={dashboard.totalAnswered}
        totalCorrect={dashboard.totalCorrect}
        overallAccuracy={dashboard.overallAccuracy}
        examTypeSummaries={dashboard.examTypeSummaries}
      />

      <section className="flex flex-col gap-4">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
          <h2 className="text-lg font-semibold">分野別の進捗</h2>
          {categories.length > 0 ? (
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
          ) : null}
        </div>

        {categories.length === 0 ? (
          <Link href="/practice" className="btn-primary w-fit">
            問題演習をはじめる
          </Link>
        ) : (
          <>
            <p className="text-sm text-graphite">
              回答数が{MIN_ANSWERS_FOR_WEAK_JUDGMENT}問未満の分野は、正答率が安定しないため苦手分野の判定から除外しています。
            </p>
            {groups.map((group, index) => (
              <div
                key={group.code}
                className={index > 0 ? "border-t border-hairline pt-6" : undefined}
              >
                <h3 className="mb-2 font-mono text-[11px] tracking-wide text-graphite">
                  {group.name}
                </h3>
                <table className="w-full text-sm">
                  <thead>
                    <tr className="text-left text-xs text-graphite">
                      <th className="py-2 pl-3 font-medium">名前</th>
                      <th className="py-2 text-right font-medium">回答数</th>
                      <th className="py-2 text-right font-medium">正答率</th>
                    </tr>
                  </thead>
                  <tbody>
                    {group.rows.map((row) => (
                      <CategoryProgressCard key={row.categoryId} row={row} />
                    ))}
                  </tbody>
                </table>
              </div>
            ))}
          </>
        )}
      </section>

      <ProductRecommendation
        products={recommendedProducts}
        heading="苦手分野の学習に役立つかもしれません"
      />
    </main>
  );
}
