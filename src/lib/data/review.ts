import { currentExam } from "@/config/exams";
import { VISIBLE_QUESTION_SOURCE_TYPE } from "@/lib/question-visibility";
import { createClient } from "@/lib/supabase/server";
import type { PracticeQuestion } from "@/components/practice/QuestionCard";

export type UnresolvedReviewItem = {
  id: string;
  questionId: string;
  questionPreview: string;
  categoryId: string | null;
  categoryName: string;
  addedAt: string;
  reviewCount: number;
};

type QuestionJoin<T> = T | T[] | null;

type ReviewListQueryRow = {
  id: string;
  added_at: string;
  review_count: number;
  question_id: string;
  questions: QuestionJoin<{
    question_text: string;
    categories: { id: string; name: string } | { id: string; name: string }[] | null;
  }>;
};

type ReviewQuestionQueryRow = {
  question_id: string;
    questions: QuestionJoin<{
      question_text: string;
      figure_url: string | null;
      explanation: string | null;
      choices: {
        id: string;
        choice_text: string;
        is_correct: boolean;
        sort_order: number;
      }[];
    }>;
};

function previewText(text: string): string {
  return text.length > 60 ? `${text.slice(0, 60)}…` : text;
}

function categoryFromJoin(
  joined: { id: string; name: string } | { id: string; name: string }[] | null | undefined
): { id: string | null; name: string } {
  if (!joined) {
    return { id: null, name: "分野未設定" };
  }
  const row = Array.isArray(joined) ? joined[0] : joined;
  if (!row) {
    return { id: null, name: "分野未設定" };
  }
  return { id: row.id, name: row.name };
}

function questionFromJoin<T>(joined: QuestionJoin<T>): T | null {
  if (!joined) {
    return null;
  }
  return Array.isArray(joined) ? joined[0] : joined;
}

function shuffle<T>(items: T[]): T[] {
  const next = [...items];
  for (let i = next.length - 1; i > 0; i -= 1) {
    const j = Math.floor(Math.random() * (i + 1));
    const current = next[i];
    next[i] = next[j] as T;
    next[j] = current as T;
  }
  return next;
}

export async function getUnresolvedReviewCount(userId: string): Promise<number> {
  const supabase = await createClient();
  const { count, error } = await supabase
    .from("review_list")
    .select("id, questions!inner(source_type)", { count: "exact", head: true })
    .eq("user_id", userId)
    .eq("exam_id", currentExam.id)
    .eq("resolved", false)
    .eq("questions.source_type", VISIBLE_QUESTION_SOURCE_TYPE);

  if (error) {
    return 0;
  }
  return count ?? 0;
}

export async function getUnresolvedReviewItems(
  userId: string
): Promise<UnresolvedReviewItem[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("review_list")
    .select(
      "id, added_at, review_count, question_id, questions!inner(question_text, categories(id, name))"
    )
    .eq("user_id", userId)
    .eq("exam_id", currentExam.id)
    .eq("resolved", false)
    .eq("questions.source_type", VISIBLE_QUESTION_SOURCE_TYPE)
    .order("added_at", { ascending: false });

  if (error) {
    return [];
  }

  return ((data ?? []) as ReviewListQueryRow[])
    .map((row) => {
      const question = questionFromJoin(row.questions);
      if (!question) {
        return null;
      }
      const category = categoryFromJoin(question.categories);
      return {
        id: row.id,
        questionId: row.question_id,
        questionPreview: previewText(question.question_text),
        categoryId: category.id,
        categoryName: category.name,
        addedAt: row.added_at,
        reviewCount: row.review_count,
      };
    })
    .filter((row): row is UnresolvedReviewItem => row !== null);
}

export async function getUnresolvedReviewQuestions(
  userId: string
): Promise<PracticeQuestion[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("review_list")
    .select(
      "question_id, questions!inner(id, question_text, figure_url, explanation, choices(id, choice_text, is_correct, sort_order))"
    )
    .eq("user_id", userId)
    .eq("exam_id", currentExam.id)
    .eq("resolved", false)
    .eq("questions.source_type", VISIBLE_QUESTION_SOURCE_TYPE);

  if (error) {
    return [];
  }

  const questions = ((data ?? []) as ReviewQuestionQueryRow[])
    .map((row) => {
      const question = questionFromJoin(row.questions);
      if (!question) {
        return null;
      }
      const choices = Array.isArray(question.choices) ? question.choices : [];
      if (choices.length === 0) {
        return null;
      }
      return {
        id: row.question_id,
        question_text: question.question_text,
        figure_url: question.figure_url ?? null,
        explanation: question.explanation ?? "",
        choices,
      };
    })
    .filter((row): row is PracticeQuestion => row !== null);

  return shuffle(questions);
}
