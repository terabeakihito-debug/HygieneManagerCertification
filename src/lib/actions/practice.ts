"use server";

import { createClient } from "@/lib/supabase/server";

export type SubmitAnswerResult = {
  error: string | null;
};

export async function submitAnswerAction(input: {
  questionId: string;
  selectedChoiceId: string;
}): Promise<SubmitAnswerResult> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { error: "ログインしてください" };
  }

  const [choiceResult, questionResult] = await Promise.all([
    supabase
      .from("choices")
      .select("id, is_correct, question_id")
      .eq("id", input.selectedChoiceId)
      .maybeSingle(),
    supabase
      .from("questions")
      .select("id, category_id")
      .eq("id", input.questionId)
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
    return { error: "回答の保存に失敗しました" };
  }

  const { error: insertError } = await supabase.from("user_answers").insert({
    user_id: user.id,
    question_id: question.id,
    selected_choice_id: choice.id,
    is_correct: choice.is_correct,
  });

  if (insertError) {
    return { error: "回答の保存に失敗しました" };
  }

  const { data: progress, error: progressError } = await supabase
    .from("user_progress")
    .select("id, total_answered, total_correct")
    .eq("user_id", user.id)
    .eq("category_id", question.category_id)
    .maybeSingle();

  if (progressError) {
    return { error: "進捗の更新に失敗しました" };
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
      .eq("user_id", user.id);

    if (updateError) {
      return { error: "進捗の更新に失敗しました" };
    }
  } else {
    const { error: createError } = await supabase.from("user_progress").insert({
      user_id: user.id,
      category_id: question.category_id,
      total_answered: 1,
      total_correct: choice.is_correct ? 1 : 0,
    });

    if (createError) {
      return { error: "進捗の更新に失敗しました" };
    }
  }

  const reviewError = await syncReviewList({
    userId: user.id,
    questionId: question.id,
    isCorrect: choice.is_correct,
  });

  if (reviewError) {
    return { error: reviewError };
  }

  return { error: null };
}

async function syncReviewList(input: {
  userId: string;
  questionId: string;
  isCorrect: boolean;
}): Promise<string | null> {
  const supabase = await createClient();
  const { data: existing, error: selectError } = await supabase
    .from("review_list")
    .select("id, resolved, review_count")
    .eq("user_id", input.userId)
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
    question_id: input.questionId,
    resolved: false,
    review_count: 0,
  });

  return insertError ? "復習リストの更新に失敗しました" : null;
}
