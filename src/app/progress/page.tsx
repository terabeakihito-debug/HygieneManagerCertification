import Link from "next/link";
import { redirect } from "next/navigation";
import { CategoryProgressCard } from "@/components/progress/CategoryProgressCard";
import { OverallSummary } from "@/components/progress/OverallSummary";
import {
  MIN_ANSWERS_FOR_WEAK_JUDGMENT,
  WEAK_ACCURACY_THRESHOLD,
  getProgressDashboard,
  parseProgressSort,
  sortCategoryRows,
  type ProgressSort,
} from "@/lib/data/progress";
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
    redirect("/login");
  }

  const sort = parseProgressSort(params.sort);
  const dashboard = await getProgressDashboard(user.id);
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
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      {dashboard.weakCount > 0 ? (
        <p className="rounded-lg border border-red-300 bg-red-50 px-4 py-3 text-sm text-red-900">
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
                  className={`rounded px-3 py-1 ${
                    active
                      ? "bg-gray-900 text-white"
                      : "border border-gray-300 bg-white text-gray-800"
                  }`}
                >
                  {option.label}
                </Link>
              );
            })}
          </div>
        </div>

        <p className="text-sm text-gray-600">
          回答数が{MIN_ANSWERS_FOR_WEAK_JUDGMENT}問未満の分野は、正答率が安定しないため苦手分野の判定から除外しています。
        </p>

        {categories.length === 0 ? (
          <p className="rounded-lg border border-gray-200 bg-white p-6 text-gray-600">
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
    </main>
  );
}
