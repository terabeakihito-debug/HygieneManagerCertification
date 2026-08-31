import { currentExam } from "@/config/exams";
import { WEAK_ACCURACY_THRESHOLD } from "@/lib/data/progress";
import {
  addCalendarDays,
  calendarDate,
  daysInCalendarMonth,
  diffCalendarDays,
  jstDateString,
  weekdaySunday0,
} from "@/lib/jst-date";
import { createClient } from "@/lib/supabase/server";
import type { UserSettings } from "@/types/database";

export type CalendarDay = {
  date: string;
  day: number;
  questionsAnswered: number;
  isToday: boolean;
  isExamDate: boolean;
};

export type StreakInfo = {
  days: number;
  studiedToday: boolean;
};

export type PaceInfo =
  | { kind: "unset" }
  | { kind: "past" }
  | { kind: "today" }
  | {
      kind: "upcoming";
      daysLeft: number;
      remainingQuestions: number;
      questionsPerDay: number;
    };

export type CalendarDashboard = {
  days: CalendarDay[];
  leadingBlanks: number;
  streak: StreakInfo;
  settings: UserSettings | null;
  pace: PaceInfo;
};

type StudyLogRow = {
  study_date: string;
  questions_answered: number;
};

export async function incrementTodayStudyLog(userId: string): Promise<string | null> {
  const supabase = await createClient();
  const studyDate = jstDateString();

  const { data: existing, error: selectError } = await supabase
    .from("study_logs")
    .select("id, questions_answered")
    .eq("user_id", userId)
    .eq("exam_id", currentExam.id)
    .eq("study_date", studyDate)
    .maybeSingle();

  if (selectError) {
    return "学習記録の更新に失敗しました";
  }

  if (existing) {
    const { error: updateError } = await supabase
      .from("study_logs")
      .update({ questions_answered: existing.questions_answered + 1 })
      .eq("id", existing.id)
      .eq("user_id", userId)
      .eq("exam_id", currentExam.id);

    return updateError ? "学習記録の更新に失敗しました" : null;
  }

  const { error: insertError } = await supabase.from("study_logs").insert({
    user_id: userId,
    exam_id: currentExam.id,
    study_date: studyDate,
    questions_answered: 1,
  });

  return insertError ? "学習記録の更新に失敗しました" : null;
}

export function buildStreak(studyDates: Set<string>, today: string): StreakInfo {
  const studiedToday = studyDates.has(today);
  let cursor = studiedToday ? today : addCalendarDays(today, -1);
  let days = 0;

  while (studyDates.has(cursor)) {
    days += 1;
    cursor = addCalendarDays(cursor, -1);
  }

  return { days, studiedToday };
}

export async function getCalendarDashboard(
  userId: string,
  year: number,
  month: number
): Promise<CalendarDashboard> {
  const supabase = await createClient();
  const today = jstDateString();

  const [logsResult, settingsResult, examTypesResult] = await Promise.all([
    supabase
      .from("study_logs")
      .select("study_date, questions_answered")
      .eq("user_id", userId)
      .eq("exam_id", currentExam.id)
      .order("study_date", { ascending: false }),
    supabase
      .from("user_settings")
      .select("user_id, exam_id, target_exam_type_id, exam_date, created_at, updated_at")
      .eq("user_id", userId)
      .eq("exam_id", currentExam.id)
      .maybeSingle(),
    supabase.from("exam_types").select("id, code").eq("exam_id", currentExam.id),
  ]);

  const logs = (logsResult.data ?? []) as StudyLogRow[];
  const byDate = new Map(
    logs.map((row) => [row.study_date.slice(0, 10), row.questions_answered])
  );
  const studyDates = new Set(logs.map((row) => row.study_date.slice(0, 10)));
  const rawSettings = (settingsResult.data ?? null) as UserSettings | null;
  const settings = rawSettings
    ? {
        ...rawSettings,
        exam_date: rawSettings.exam_date ? rawSettings.exam_date.slice(0, 10) : null,
      }
    : null;

  const lastDay = daysInCalendarMonth(year, month);
  const days: CalendarDay[] = [];
  for (let day = 1; day <= lastDay; day += 1) {
    const date = calendarDate(year, month, day);
    days.push({
      date,
      day,
      questionsAnswered: byDate.get(date) ?? 0,
      isToday: date === today,
      isExamDate: settings?.exam_date === date,
    });
  }

  const pace = await buildPaceInfo({
    userId,
    settings,
    today,
    examTypes: (examTypesResult.data ?? []) as { id: string; code: string }[],
  });

  return {
    days,
    leadingBlanks: weekdaySunday0(year, month, 1),
    streak: buildStreak(studyDates, today),
    settings,
    pace,
  };
}

async function buildPaceInfo(input: {
  userId: string;
  settings: UserSettings | null;
  today: string;
  examTypes: { id: string; code: string }[];
}): Promise<PaceInfo> {
  if (!input.settings?.exam_date) {
    return { kind: "unset" };
  }

  const daysLeft = diffCalendarDays(input.today, input.settings.exam_date);
  if (daysLeft < 0) {
    return { kind: "past" };
  }
  if (daysLeft === 0) {
    return { kind: "today" };
  }

  const remainingQuestions = await estimateRemainingQuestions(
    input.userId,
    input.settings.target_exam_type_id,
    input.examTypes
  );

  return {
    kind: "upcoming",
    daysLeft,
    remainingQuestions,
    questionsPerDay: Math.max(1, Math.ceil(remainingQuestions / daysLeft)),
  };
}

async function estimateRemainingQuestions(
  userId: string,
  targetExamTypeId: string | null,
  examTypes: { id: string; code: string }[]
): Promise<number> {
  const supabase = await createClient();
  const sharedCode = currentExam.sharedCategoryCode;
  const commonId = sharedCode
    ? examTypes.find((row) => row.code === sharedCode)?.id
    : undefined;
  const examTypeIds = targetExamTypeId
    ? [targetExamTypeId, ...(commonId && commonId !== targetExamTypeId ? [commonId] : [])]
    : examTypes.map((row) => row.id);

  let questionsQuery = supabase
    .from("questions")
    .select("id, category_id")
    .eq("exam_id", currentExam.id);
  if (examTypeIds.length > 0) {
    questionsQuery = questionsQuery.in("exam_type_id", examTypeIds);
  }

  const [questionsResult, answersResult, progressResult] = await Promise.all([
    questionsQuery,
    supabase
      .from("user_answers")
      .select("question_id")
      .eq("user_id", userId)
      .eq("exam_id", currentExam.id),
    supabase
      .from("user_progress")
      .select("category_id, total_answered, total_correct")
      .eq("user_id", userId)
      .eq("exam_id", currentExam.id),
  ]);

  const questions = (questionsResult.data ?? []) as { id: string; category_id: string }[];
  const answeredIds = new Set(
    ((answersResult.data ?? []) as { question_id: string }[]).map((row) => row.question_id)
  );
  const weakCategories = new Set(
    ((progressResult.data ?? []) as {
      category_id: string;
      total_answered: number;
      total_correct: number;
    }[])
      .filter((row) => {
        if (row.total_answered === 0) {
          return false;
        }
        return row.total_correct / row.total_answered < WEAK_ACCURACY_THRESHOLD;
      })
      .map((row) => row.category_id)
  );

  return questions.filter((question) => {
    if (!answeredIds.has(question.id)) {
      return true;
    }
    return weakCategories.has(question.category_id);
  }).length;
}
