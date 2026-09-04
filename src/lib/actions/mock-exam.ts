"use server";

import { redirect } from "next/navigation";
import { recordAnswer } from "@/lib/actions/record-answer";
import { currentExam } from "@/config/exams";
import { VISIBLE_QUESTION_SOURCE_TYPE } from "@/lib/question-visibility";
import { createClient } from "@/lib/supabase/server";

export type MockExamAnswer = {
  questionId: string;
  selectedChoiceId: string | null;
};

export type GradeMockExamResult = {
  error: string | null;
};

type QuestionRow = {
  id: string;
  category_id: string;
  choices: { id: string; is_correct: boolean }[] | null;
};

export async function gradeMockExamAction(input: {
  mockExamId: string;
  answers: MockExamAnswer[];
}): Promise<GradeMockExamResult> {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { error: "ログインしてください" };
  }

  const questionIds = input.answers.map((answer) => answer.questionId);
  if (questionIds.length === 0) {
    return { error: "採点する問題がありません" };
  }

  const { data: mockExam, error: mockExamError } = await supabase
    .from("mock_exams")
    .select("id")
    .eq("id", input.mockExamId)
    .eq("exam_id", currentExam.id)
    .maybeSingle();

  if (mockExamError || !mockExam) {
    return { error: "模試の採点に失敗しました" };
  }

  const { data: questionRows, error: questionsError } = await supabase
    .from("questions")
    .select("id, category_id, choices(id, is_correct)")
    .eq("exam_id", currentExam.id)
    .eq("source_type", VISIBLE_QUESTION_SOURCE_TYPE)
    .in("id", questionIds);

  if (questionsError || !questionRows) {
    return { error: "模試の採点に失敗しました" };
  }

  const questions = new Map(
    (questionRows as QuestionRow[]).map((row) => [
      row.id,
      {
        categoryId: row.category_id,
        correctChoiceId:
          (row.choices ?? []).find((choice) => choice.is_correct)?.id ?? null,
      },
    ])
  );

  const categoryTotals = new Map<string, { correct: number; total: number }>();
  let score = 0;

  for (const answer of input.answers) {
    const question = questions.get(answer.questionId);
    if (!question) {
      return { error: "模試の採点に失敗しました" };
    }

    const isCorrect =
      answer.selectedChoiceId !== null &&
      answer.selectedChoiceId === question.correctChoiceId;
    if (isCorrect) {
      score += 1;
    }

    const current = categoryTotals.get(question.categoryId) ?? {
      correct: 0,
      total: 0,
    };
    current.total += 1;
    if (isCorrect) {
      current.correct += 1;
    }
    categoryTotals.set(question.categoryId, current);
  }

  const categoryBreakdown: Record<string, number> = {};
  for (const [categoryId, totals] of categoryTotals) {
    categoryBreakdown[categoryId] =
      totals.total === 0 ? 0 : Math.round((totals.correct / totals.total) * 100);
  }

  const { data: result, error: insertError } = await supabase
    .from("mock_exam_results")
    .insert({
      user_id: user.id,
      exam_id: currentExam.id,
      mock_exam_id: input.mockExamId,
      score,
      category_breakdown: categoryBreakdown,
    })
    .select("id")
    .single();

  if (insertError || !result) {
    return { error: "模試結果の保存に失敗しました" };
  }

  for (const answer of input.answers) {
    if (!answer.selectedChoiceId) {
      continue;
    }
    const recordError = await recordAnswer({
      userId: user.id,
      questionId: answer.questionId,
      selectedChoiceId: answer.selectedChoiceId,
    });
    if (recordError) {
      return { error: recordError };
    }
  }

  redirect(`/mock-exams/${input.mockExamId}/result/${result.id}`);
}
