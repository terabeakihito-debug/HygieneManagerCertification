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
    return "border-red-400 bg-red-50 text-red-900";
  }
  if (day.questionsAnswered >= 10) {
    return "border-green-700 bg-green-500 text-white";
  }
  if (day.questionsAnswered >= 5) {
    return "border-green-600 bg-green-300 text-green-950";
  }
  if (day.questionsAnswered >= 1) {
    return "border-green-300 bg-green-100 text-green-900";
  }
  if (day.isToday) {
    return "border-gray-900 bg-white";
  }
  return "border-gray-200 bg-white text-gray-700";
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
          className="rounded border border-gray-300 px-3 py-1 text-sm"
        >
          前月
        </Link>
        <h2 className="text-lg font-semibold">
          {year}年{month}月
        </h2>
        <Link
          href={monthHref(next.year, next.month)}
          className="rounded border border-gray-300 px-3 py-1 text-sm"
        >
          翌月
        </Link>
      </div>

      <div className="grid grid-cols-7 gap-1 text-center text-xs text-gray-500">
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
