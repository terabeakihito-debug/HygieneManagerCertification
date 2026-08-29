"use server";

import { recordAnswer } from "@/lib/actions/record-answer";
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

  const error = await recordAnswer({
    userId: user.id,
    questionId: input.questionId,
    selectedChoiceId: input.selectedChoiceId,
  });

  return { error };
}
