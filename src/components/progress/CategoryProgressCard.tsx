import Link from "next/link";
import {
  formatAccuracy,
  type CategoryProgressRow,
  type CategoryProgressStatus,
} from "@/lib/data/progress";

type CategoryProgressCardProps = {
  row: CategoryProgressRow;
};

function statusBadge(status: CategoryProgressStatus) {
  switch (status) {
    case "untouched":
      return (
        <span className="rounded bg-gray-200 px-2 py-0.5 text-xs font-medium text-gray-800">
          未着手
        </span>
      );
    case "insufficient":
      return (
        <span className="rounded bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-900">
          データ不足
        </span>
      );
    case "weak":
      return (
        <span className="rounded bg-red-200 px-2 py-0.5 text-xs font-medium text-red-900">
          苦手分野
        </span>
      );
    case "ok":
      return null;
    default: {
      const _never: never = status;
      return _never;
    }
  }
}

function cardClassName(status: CategoryProgressStatus) {
  switch (status) {
    case "weak":
      return "rounded-lg border border-red-300 bg-red-50 p-4";
    case "untouched":
      return "rounded-lg border border-gray-200 bg-gray-50 p-4";
    case "insufficient":
    case "ok":
      return "rounded-lg border border-gray-200 bg-white p-4";
    default: {
      const _never: never = status;
      return _never;
    }
  }
}

export function CategoryProgressCard({ row }: CategoryProgressCardProps) {
  const badge = statusBadge(row.status);

  return (
    <article className={cardClassName(row.status)}>
      <div className="flex flex-wrap items-start justify-between gap-2">
        <div>
          <h3 className="font-semibold">{row.categoryName}</h3>
          <p className="mt-0.5 text-sm text-gray-600">{row.examTypeName}</p>
        </div>
        {badge}
      </div>
      <dl className="mt-3 grid grid-cols-3 gap-2 text-sm">
        <div>
          <dt className="text-gray-500">回答数</dt>
          <dd className="font-medium">{row.totalAnswered}</dd>
        </div>
        <div>
          <dt className="text-gray-500">正答数</dt>
          <dd className="font-medium">{row.totalCorrect}</dd>
        </div>
        <div>
          <dt className="text-gray-500">正答率</dt>
          <dd className="font-medium">{formatAccuracy(row.accuracy)}</dd>
        </div>
      </dl>
      {row.status === "weak" ? (
        <Link
          href={`/practice?category_id=${row.categoryId}`}
          className="mt-4 inline-block rounded bg-gray-900 px-3 py-2 text-sm text-white"
        >
          この分野を演習する
        </Link>
      ) : null}
    </article>
  );
}
