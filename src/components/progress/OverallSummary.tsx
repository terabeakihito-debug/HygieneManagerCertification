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

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="card-surface p-4">
      <p className="text-sm text-graphite">{label}</p>
      <p className="mt-1 font-display text-2xl font-bold">{value}</p>
    </div>
  );
}

export function OverallSummary({
  totalAnswered,
  totalCorrect,
  overallAccuracy,
  examTypeSummaries,
}: OverallSummaryProps) {
  return (
    <section className="flex flex-col gap-4">
      <h2 className="text-lg font-semibold">全体サマリー</h2>
      <div className="grid grid-cols-1 gap-3 sm:grid-cols-3">
        <Stat label="累計回答数" value={String(totalAnswered)} />
        <Stat label="累計正答数" value={String(totalCorrect)} />
        <Stat label="全体正答率" value={formatAccuracy(overallAccuracy)} />
      </div>
      <div className="grid grid-cols-1 gap-3 sm:grid-cols-3">
        {examTypeSummaries.map((summary) => (
          <div key={summary.code} className="card-surface p-4">
            <p className="text-sm text-graphite">{summary.name}</p>
            <p className="mt-1 font-display text-xl font-bold">{formatAccuracy(summary.accuracy)}</p>
            <p className="mt-1 font-mono text-xs text-graphite">
              {summary.totalCorrect} / {summary.totalAnswered} 問
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
