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

function rowTone(status: CategoryProgressStatus): string {
  switch (status) {
    case "untouched":
      return "text-ink/40";
    case "insufficient":
      return "text-graphite";
    case "weak":
      return "text-stamp";
    case "ok":
      return "text-ink";
    default: {
      const _never: never = status;
      return _never;
    }
  }
}

function statusNote(status: CategoryProgressStatus) {
  switch (status) {
    case "untouched":
      return null;
    case "insufficient":
      return <p className="mt-1 text-xs text-graphite">データ不足</p>;
    case "weak":
      return <p className="mt-1 text-xs text-stamp">苦手分野</p>;
    case "ok":
      return null;
    default: {
      const _never: never = status;
      return _never;
    }
  }
}

export function CategoryProgressCard({ row }: CategoryProgressCardProps) {
  const achieved = row.accuracy !== null && row.accuracy >= ACHIEVED_ACCURACY;

  return (
    <tr className={`progress-row ${rowTone(row.status)}`}>
      <td className="relative py-3 pl-3 pr-16">
        {row.status === "weak" ? (
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
        <p className="font-medium">{row.categoryName}</p>
        {statusNote(row.status)}
        {row.status === "weak" ? (
          <Link
            href={`/practice?category_id=${row.categoryId}`}
            className="mt-2 inline-block text-xs underline"
          >
            この分野を演習する
          </Link>
        ) : null}
      </td>
      <td className="py-3 text-right font-mono tabular-nums">
        {row.totalAnswered}
      </td>
      <td className="py-3 text-right font-mono tabular-nums">
        {formatAccuracy(row.accuracy)}
      </td>
    </tr>
  );
}
