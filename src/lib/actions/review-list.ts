import { currentExam } from "@/config/exams";
import { createClient } from "@/lib/supabase/server";

export async function syncReviewList(input: {
  userId: string;
  questionId: string;
  isCorrect: boolean;
}): Promise<string | null> {
  const supabase = await createClient();
  const { data: existing, error: selectError } = await supabase
    .from("review_list")
    .select("id, resolved, review_count")
    .eq("user_id", input.userId)
    .eq("exam_id", currentExam.id)
    .eq("question_id", input.questionId)
    .maybeSingle();

  if (selectError) {
    return "復習リストの更新に失敗しました";
  }

  if (input.isCorrect) {
    if (!existing || existing.resolved) {
      return null;
    }

    const { error: resolveError } = await supabase
      .from("review_list")
      .update({
        resolved: true,
        review_count: existing.review_count + 1,
      })
      .eq("id", existing.id)
      .eq("user_id", input.userId);

    return resolveError ? "復習リストの更新に失敗しました" : null;
  }

  if (existing) {
    const { error: reopenError } = await supabase
      .from("review_list")
      .update({
        resolved: false,
        added_at: new Date().toISOString(),
      })
      .eq("id", existing.id)
      .eq("user_id", input.userId);

    return reopenError ? "復習リストの更新に失敗しました" : null;
  }

  const { error: insertError } = await supabase.from("review_list").insert({
    user_id: input.userId,
    exam_id: currentExam.id,
    question_id: input.questionId,
    resolved: false,
    review_count: 0,
  });

  return insertError ? "復習リストの更新に失敗しました" : null;
}
