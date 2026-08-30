"use server";

import { redirect } from "next/navigation";
import {
  readCaptchaToken,
  toAuthErrorMessage,
  validateCredentials,
  type AuthState,
} from "@/lib/actions/validation";
import { isAnonymousUser } from "@/lib/auth/anonymous";
import { createClient } from "@/lib/supabase/server";

export async function upgradeAccountAction(
  _prevState: AuthState,
  formData: FormData
): Promise<AuthState> {
  const credentials = validateCredentials(formData);
  if ("error" in credentials) {
    return credentials;
  }

  const captchaToken = readCaptchaToken(formData);
  if (typeof captchaToken !== "string") {
    return captchaToken;
  }

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return { error: "セッションがありません。ページを再読み込みしてください" };
  }
  if (!isAnonymousUser(user)) {
    return { error: "すでにメールアドレスが登録されています" };
  }

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL;
  const { error } = await supabase.auth.updateUser(
    {
      email: credentials.email,
      password: credentials.password,
    },
    {
      emailRedirectTo: siteUrl ? `${siteUrl}/auth/confirm` : undefined,
    }
  );

  if (error) {
    return { error: toAuthErrorMessage(error.message) };
  }

  redirect("/signup/check-email");
}
