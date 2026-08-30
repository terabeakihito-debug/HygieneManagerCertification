"use server";

import { toAuthErrorMessage } from "@/lib/actions/validation";
import { createClient } from "@/lib/supabase/server";

export type AnonymousAuthResult =
  | { ok: true }
  | { ok: false; error: string };

export async function signInAnonymouslyAction(
  captchaToken: string
): Promise<AnonymousAuthResult> {
  const token = captchaToken.trim();
  if (!token) {
    return { ok: false, error: "ロボットでないことを確認してください" };
  }

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (user) {
    return { ok: true };
  }

  const { error } = await supabase.auth.signInAnonymously({
    options: { captchaToken: token },
  });

  if (error) {
    return { ok: false, error: toAuthErrorMessage(error.message) };
  }

  return { ok: true };
}
