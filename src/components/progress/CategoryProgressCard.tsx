import Link from "next/link";
import { StampBadge } from "@/components/ui/StampBadge";
import {
  formatAccuracy,
  type CategoryProgressRow,
  type CategoryProgressStatus,
} from "@/lib/data/progress";

type CategoryProgressCardProps = {
  row: CategoryProgressRow;
};

const ACHIEVED_ACCURACY = 0.8;

function statusBadge(status: CategoryProgressStatus) {
  switch (status) {
    case "untouched":
      return (
        <span className="rounded-sm border border-hairline px-2 py-0.5 text-xs font-medium text-graphite">
          未着手
        </span>
      );
    case "insufficient":
      return (
        <span className="rounded-sm border border-hairline px-2 py-0.5 text-xs font-medium text-graphite">
          データ不足
        </span>
      );
    case "weak":
      return (
        <span className="rounded-sm border border-stamp px-2 py-0.5 text-xs font-medium text-stamp">
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
      return "card-surface relative border-stamp p-4";
    case "untouched":
    case "insufficient":
    case "ok":
      return "card-surface relative p-4";
    default: {
      const _never: never = status;
      return _never;
    }
  }
}

export function CategoryProgressCard({ row }: CategoryProgressCardProps) {
  const badge = statusBadge(row.status);
  const achieved = row.accuracy !== null && row.accuracy >= ACHIEVED_ACCURACY;

  return (
    <article className={cardClassName(row.status)}>
      {achieved ? (
        <div className="absolute right-3 top-3">
          <StampBadge label="達成" />
        </div>
      ) : null}
      <div className="flex flex-wrap items-start justify-between gap-2 pr-16">
        <div>
          <h3 className="font-semibold">{row.categoryName}</h3>
          <p className="mt-0.5 text-sm text-graphite">{row.examTypeName}</p>
        </div>
        {badge}
      </div>
      <dl className="mt-3 grid grid-cols-3 gap-2 text-sm">
        <div>
          <dt className="text-graphite">回答数</dt>
          <dd className="font-mono font-medium">{row.totalAnswered}</dd>
        </div>
        <div>
          <dt className="text-graphite">正答数</dt>
          <dd className="font-mono font-medium">{row.totalCorrect}</dd>
        </div>
        <div>
          <dt className="text-graphite">正答率</dt>
          <dd className="font-mono font-medium">{formatAccuracy(row.accuracy)}</dd>
        </div>
      </dl>
      {row.status === "weak" ? (
        <Link href={`/practice?category_id=${row.categoryId}`} className="btn-primary mt-4 text-sm">
          この分野を演習する
        </Link>
      ) : null}
    </article>
  );
}
