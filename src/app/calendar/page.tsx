import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { ExamDateForm } from "@/components/calendar/ExamDateForm";
import { MonthCalendar } from "@/components/calendar/MonthCalendar";
import { getCalendarDashboard, type PaceInfo } from "@/lib/data/calendar";
import { currentExam, licenseCategoryCodes } from "@/config/exams";
import { parseCalendarMonth } from "@/lib/jst-date";
import { createClient } from "@/lib/supabase/server";

type CalendarPageProps = {
  searchParams: Promise<{ year?: string; month?: string }>;
};

function paceMessage(pace: PaceInfo): string | null {
  switch (pace.kind) {
    case "unset":
      return null;
    case "past":
      return "試験日を過ぎています。設定を更新してください";
    case "today":
      return "今日が試験日です。体調を整えて臨んでください";
    case "upcoming":
      return `残り${pace.daysLeft}日、1日あたり${pace.questionsPerDay}問のペースで演習すると全分野を一巡できます（目安 ${pace.remainingQuestions}問）`;
    default: {
      const _never: never = pace;
      return _never;
    }
  }
}

export default async function CalendarPage({ searchParams }: CalendarPageProps) {
  const params = await searchParams;
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const { year, month } = parseCalendarMonth(params.year, params.month);
  const dashboard = await getCalendarDashboard(user.id, year, month);
  const { data: examTypeRows } = await supabase
    .from("exam_types")
    .select("id, code, name")
    .eq("exam_id", currentExam.id)
    .in("code", licenseCategoryCodes());

  const examTypes = (examTypeRows ?? []) as { id: string; name: string }[];
  const message = paceMessage(dashboard.pace);

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">学習カレンダー</h1>
        <Link href="/mypage" className="text-sm underline">
          マイページ
        </Link>
      </div>

      <section className="card-surface p-4">
        <p className="text-sm text-graphite">学習継続日数</p>
        <p className="mt-1 text-3xl font-bold">{dashboard.streak.days}日</p>
        {dashboard.streak.studiedToday ? (
          <p className="mt-2 text-sm text-graphite">今日も学習しています。</p>
        ) : (
          <p className="mt-2 text-sm text-graphite">
            今日学習すればストリークが続きます
          </p>
        )}
      </section>

      {message ? (
        <p
          className={`rounded-sm px-4 py-3 text-sm ${
            dashboard.pace.kind === "past"
              ? "border border-stamp text-stamp"
              : "card-surface"
          }`}
        >
          {message}
        </p>
      ) : (
        <p className="text-sm text-graphite">
          試験区分と試験日を設定すると、逆算した学習ペースの目安を表示します。
        </p>
      )}

      <MonthCalendar
        year={year}
        month={month}
        leadingBlanks={dashboard.leadingBlanks}
        days={dashboard.days}
      />

      <section className="card-surface p-4">
        <h2 className="mb-4 text-lg font-semibold">試験日の設定</h2>
        <ExamDateForm
          examTypes={examTypes}
          targetExamTypeId={dashboard.settings?.target_exam_type_id ?? null}
          examDate={dashboard.settings?.exam_date ?? null}
        />
      </section>
    </main>
  );
}
