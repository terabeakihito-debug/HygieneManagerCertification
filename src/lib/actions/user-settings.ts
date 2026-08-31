"use server";

import { redirect } from "next/navigation";
import { currentExam, licenseCategoryCodes } from "@/config/exams";
import { createClient } from "@/lib/supabase/server";

export type UserSettingsState = {
  error: string | null;
};

export async function saveUserSettingsAction(
  _prevState: UserSettingsState,
  formData: FormData
): Promise<UserSettingsState> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { error: "ログインしてください" };
  }

  const examTypeId = String(formData.get("target_exam_type_id") ?? "").trim();
  const examDate = String(formData.get("exam_date") ?? "").trim();

  if (examTypeId) {
    const { data: examType } = await supabase
      .from("exam_types")
      .select("id, code")
      .eq("id", examTypeId)
      .eq("exam_id", currentExam.id)
      .maybeSingle();

    if (!examType || !licenseCategoryCodes().includes(examType.code)) {
      return { error: "試験区分を選び直してください" };
    }
  }

  if (examDate && !/^\d{4}-\d{2}-\d{2}$/.test(examDate)) {
    return { error: "試験日の形式が正しくありません" };
  }

  const { error } = await supabase.from("user_settings").upsert(
    {
      user_id: user.id,
      exam_id: currentExam.id,
      target_exam_type_id: examTypeId || null,
      exam_date: examDate || null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: "user_id,exam_id" }
  );

  if (error) {
    return { error: "設定の保存に失敗しました" };
  }

  redirect("/calendar");
}
