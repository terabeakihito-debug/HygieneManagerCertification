"use server";

import { redirect } from "next/navigation";
import {
  readCaptchaToken,
  toAuthErrorMessage,
  validateCredentials,
  type AuthState,
} from "@/lib/actions/validation";
import { createClient } from "@/lib/supabase/server";

export type { AuthState } from "@/lib/actions/validation";

export async function signUpAction(
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
  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL;
  const { error } = await supabase.auth.signUp({
    email: credentials.email,
    password: credentials.password,
    options: {
      captchaToken,
      ...(siteUrl ? { emailRedirectTo: `${siteUrl}/auth/confirm` } : {}),
    },
  });

  if (error) {
    return { error: toAuthErrorMessage(error.message) };
  }

  redirect("/signup/check-email");
}

export async function loginAction(
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
  const { error } = await supabase.auth.signInWithPassword({
    email: credentials.email,
    password: credentials.password,
    options: { captchaToken },
  });

  if (error) {
    return { error: toAuthErrorMessage(error.message) };
  }

  redirect("/mypage");
}

export async function logoutAction(
  _prevState: AuthState,
  _formData: FormData
): Promise<AuthState> {
  const supabase = await createClient();
  const { error } = await supabase.auth.signOut();

  if (error) {
    return { error: "ログアウトに失敗しました。もう一度お試しください" };
  }

  redirect("/login");
}
