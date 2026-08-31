import {
  formatAccuracy,
  type ExamTypeSummary,
} from "@/lib/data/progress";

type OverallSummaryProps = {
  totalAnswered: number;
  totalCorrect: number;
  overallAccuracy: number | null;
  examTypeSummaries: ExamTypeSummary[];
};

export function OverallSummary({
  totalAnswered,
  totalCorrect,
  overallAccuracy,
  examTypeSummaries,
}: OverallSummaryProps) {
  return (
    <section className="flex flex-col gap-8">
      <h2 className="text-lg font-semibold">全体サマリー</h2>

      <div className="flex flex-col gap-6 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <p className="text-sm text-graphite">全体正答率</p>
          <p className="mt-2 font-mono text-[48px] font-medium leading-none tabular-nums sm:text-[64px]">
            {formatAccuracy(overallAccuracy)}
          </p>
        </div>
        <dl className="flex flex-col gap-4">
          <div>
            <dt className="text-sm text-graphite">累計回答数</dt>
            <dd className="mt-1 font-mono text-xl tabular-nums">{totalAnswered}</dd>
          </div>
          <div>
            <dt className="text-sm text-graphite">累計正答数</dt>
            <dd className="mt-1 font-mono text-xl tabular-nums">{totalCorrect}</dd>
          </div>
        </dl>
      </div>

      {examTypeSummaries.length > 0 ? (
        <div>
          {examTypeSummaries.map((summary) => (
            <div
              key={summary.code}
              className="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-1 border-t border-hairline py-3 first:border-t-0"
            >
              <p className="text-sm">{summary.name}</p>
              <p className="font-mono text-sm tabular-nums text-graphite">
                {formatAccuracy(summary.accuracy)}
                <span className="mx-2 text-hairline">/</span>
                {summary.totalCorrect} / {summary.totalAnswered} 問
              </p>
            </div>
          ))}
        </div>
      ) : null}
    </section>
  );
}
