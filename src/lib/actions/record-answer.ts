import { syncReviewList } from "@/lib/actions/review-list";
import { currentExam } from "@/config/exams";
import { incrementTodayStudyLog } from "@/lib/data/calendar";
import { createClient } from "@/lib/supabase/server";

export async function recordAnswer(input: {
  userId: string;
  questionId: string;
  selectedChoiceId: string;
}): Promise<string | null> {
  const supabase = await createClient();

  const [choiceResult, questionResult] = await Promise.all([
    supabase
      .from("choices")
      .select("id, is_correct, question_id")
      .eq("id", input.selectedChoiceId)
      .maybeSingle(),
    supabase
      .from("questions")
      .select("id, category_id, exam_id")
      .eq("id", input.questionId)
      .eq("exam_id", currentExam.id)
      .maybeSingle(),
  ]);

  const choice = choiceResult.data;
  const question = questionResult.data;

  if (
    choiceResult.error ||
    questionResult.error ||
    !choice ||
    !question ||
    choice.question_id !== question.id
  ) {
    return "回答の保存に失敗しました";
  }

  const { error: insertError } = await supabase.from("user_answers").insert({
    user_id: input.userId,
    exam_id: currentExam.id,
    question_id: question.id,
    selected_choice_id: choice.id,
    is_correct: choice.is_correct,
  });

  if (insertError) {
    return "回答の保存に失敗しました";
  }

  const { data: progress, error: progressError } = await supabase
    .from("user_progress")
    .select("id, total_answered, total_correct")
    .eq("user_id", input.userId)
    .eq("exam_id", currentExam.id)
    .eq("category_id", question.category_id)
    .maybeSingle();

  if (progressError) {
    return "進捗の更新に失敗しました";
  }

  if (progress) {
    const { error: updateError } = await supabase
      .from("user_progress")
      .update({
        total_answered: progress.total_answered + 1,
        total_correct: progress.total_correct + (choice.is_correct ? 1 : 0),
        updated_at: new Date().toISOString(),
      })
      .eq("id", progress.id)
      .eq("user_id", input.userId)
      .eq("exam_id", currentExam.id);

    if (updateError) {
      return "進捗の更新に失敗しました";
    }
  } else {
    const { error: createError } = await supabase.from("user_progress").insert({
      user_id: input.userId,
      exam_id: currentExam.id,
      category_id: question.category_id,
      total_answered: 1,
      total_correct: choice.is_correct ? 1 : 0,
    });

    if (createError) {
      return "進捗の更新に失敗しました";
    }
  }

  const studyError = await incrementTodayStudyLog(input.userId);
  if (studyError) {
    return studyError;
  }

  return syncReviewList({
    userId: input.userId,
    questionId: question.id,
    isCorrect: choice.is_correct,
  });
}
