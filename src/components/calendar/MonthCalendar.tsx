import Link from "next/link";
import type { CalendarDay } from "@/lib/data/calendar";
import { addCalendarMonths } from "@/lib/jst-date";

type MonthCalendarProps = {
  year: number;
  month: number;
  leadingBlanks: number;
  days: CalendarDay[];
};

const WEEKDAYS = ["日", "月", "火", "水", "木", "金", "土"];

function cellClassName(day: CalendarDay): string {
  if (day.isExamDate) {
    return "border-stamp text-stamp";
  }
  if (day.questionsAnswered >= 10) {
    return "border-safety bg-safety text-paper";
  }
  if (day.questionsAnswered >= 5) {
    return "border-safety bg-safety/30 text-safety-dark";
  }
  if (day.questionsAnswered >= 1) {
    return "border-safety/40 bg-safety/10 text-safety-dark";
  }
  if (day.isToday) {
    return "border-ink bg-paper";
  }
  return "border-hairline bg-paper text-ink";
}

function monthHref(year: number, month: number): string {
  return `/calendar?year=${year}&month=${month}`;
}

export function MonthCalendar({
  year,
  month,
  leadingBlanks,
  days,
}: MonthCalendarProps) {
  const previous = addCalendarMonths(year, month, -1);
  const next = addCalendarMonths(year, month, 1);
  const blanks = Array.from({ length: leadingBlanks }, (_, index) => index);

  return (
    <section className="flex flex-col gap-3">
      <div className="flex items-center justify-between">
        <Link
          href={monthHref(previous.year, previous.month)}
          className="btn-secondary px-3 py-1 text-sm"
        >
          前月
        </Link>
        <h2 className="text-lg font-semibold">
          {year}年{month}月
        </h2>
        <Link
          href={monthHref(next.year, next.month)}
          className="btn-secondary px-3 py-1 text-sm"
        >
          翌月
        </Link>
      </div>

      <div className="grid grid-cols-7 gap-1 text-center text-xs text-graphite">
        {WEEKDAYS.map((label) => (
          <div key={label} className="py-1">
            {label}
          </div>
        ))}
      </div>

      <div className="grid grid-cols-7 gap-1">
        {blanks.map((blank) => (
          <div key={`blank-${blank}`} className="min-h-14 rounded border border-transparent" />
        ))}
        {days.map((day) => (
          <div
            key={day.date}
            className={`min-h-14 rounded border p-1 text-left ${cellClassName(day)}`}
          >
            <p className="text-xs font-medium">{day.day}</p>
            {day.questionsAnswered > 0 ? (
              <p className="mt-1 text-[10px] leading-tight sm:text-xs">
                {day.questionsAnswered}問
              </p>
            ) : null}
            {day.isExamDate ? (
              <p className="mt-1 text-[10px] leading-tight">試験日</p>
            ) : null}
          </div>
        ))}
      </div>
    </section>
  );
}
