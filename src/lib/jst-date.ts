const JST = "Asia/Tokyo";

function pad(value: number): string {
  return String(value).padStart(2, "0");
}

/** JSTのカレンダー日付を YYYY-MM-DD で返す */
export function jstDateString(date: Date = new Date()): string {
  return new Intl.DateTimeFormat("en-CA", {
    timeZone: JST,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(date);
}

export function jstYearMonth(date: Date = new Date()): { year: number; month: number } {
  const [year, month] = jstDateString(date).split("-").map(Number);
  return { year: year ?? 2026, month: month ?? 1 };
}

export function parseCalendarMonth(
  yearParam: string | undefined,
  monthParam: string | undefined
): { year: number; month: number } {
  const fallback = jstYearMonth();
  const year = Number(yearParam);
  const month = Number(monthParam);
  if (!Number.isInteger(year) || year < 2000 || year > 2100) {
    return fallback;
  }
  if (!Number.isInteger(month) || month < 1 || month > 12) {
    return fallback;
  }
  return { year, month };
}

export function addCalendarMonths(
  year: number,
  month: number,
  delta: number
): { year: number; month: number } {
  const index = year * 12 + (month - 1) + delta;
  return {
    year: Math.floor(index / 12),
    month: (index % 12) + 1,
  };
}

export function daysInCalendarMonth(year: number, month: number): number {
  return new Date(Date.UTC(year, month, 0)).getUTCDate();
}

/** 日曜=0。JSTの年月日そのものの曜日 */
export function weekdaySunday0(year: number, month: number, day: number): number {
  return new Date(Date.UTC(year, month - 1, day)).getUTCDay();
}

export function calendarDate(year: number, month: number, day: number): string {
  return `${year}-${pad(month)}-${pad(day)}`;
}

export function addCalendarDays(date: string, days: number): string {
  const [year, month, day] = date.split("-").map(Number);
  const next = new Date(Date.UTC(year ?? 0, (month ?? 1) - 1, (day ?? 1) + days));
  return calendarDate(next.getUTCFullYear(), next.getUTCMonth() + 1, next.getUTCDate());
}

export function diffCalendarDays(from: string, to: string): number {
  const [fromYear, fromMonth, fromDay] = from.split("-").map(Number);
  const [toYear, toMonth, toDay] = to.split("-").map(Number);
  const fromUtc = Date.UTC(fromYear ?? 0, (fromMonth ?? 1) - 1, fromDay ?? 1);
  const toUtc = Date.UTC(toYear ?? 0, (toMonth ?? 1) - 1, toDay ?? 1);
  return Math.round((toUtc - fromUtc) / 86_400_000);
}

export function monthRange(year: number, month: number): { start: string; end: string } {
  return {
    start: calendarDate(year, month, 1),
    end: calendarDate(year, month, daysInCalendarMonth(year, month)),
  };
}
