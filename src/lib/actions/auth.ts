"use server";

import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export type AuthState = {
  error: string | null;
};

function toAuthErrorMessage(message: string): string {
  const lower = message.toLowerCase();

  if (lower.includes("invalid login credentials")) {
    return "メールアドレスまたはパスワードが正しくありません";
  }
  if (lower.includes("email not confirmed")) {
    return "メールアドレスの確認が完了していません。確認メールをご確認ください";
  }
  if (
    lower.includes("user already registered") ||
    lower.includes("already been registered")
  ) {
    return "このメールアドレスは既に登録されています";
  }
  if (lower.includes("unable to validate email") || lower.includes("invalid email")) {
    return "メールアドレスの形式が正しくありません";
  }
  if (lower.includes("password")) {
    return "パスワードが要件を満たしていません";
  }
  if (lower.includes("rate limit") || lower.includes("security purposes")) {
    return "リクエストが多すぎます。しばらく待ってから再度お試しください";
  }

  return "処理に失敗しました。時間をおいて再度お試しください";
}

function validateCredentials(formData: FormData): { email: string; password: string } | AuthState {
  const email = String(formData.get("email") ?? "").trim();
  const password = String(formData.get("password") ?? "");

  if (!email) {
    return { error: "メールアドレスを入力してください" };
  }
  if (!password) {
    return { error: "パスワードを入力してください" };
  }
  if (password.length < 8) {
    return { error: "パスワードは8文字以上で入力してください" };
  }

  return { email, password };
}

export async function signUpAction(
  _prevState: AuthState,
  formData: FormData
): Promise<AuthState> {
  const credentials = validateCredentials(formData);
  if ("error" in credentials) {
    return credentials;
  }

  const supabase = await createClient();
  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL;
  const { error } = await supabase.auth.signUp({
    email: credentials.email,
    password: credentials.password,
    options: siteUrl
      ? { emailRedirectTo: `${siteUrl}/auth/confirm` }
      : undefined,
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

  const supabase = await createClient();
  const { error } = await supabase.auth.signInWithPassword({
    email: credentials.email,
    password: credentials.password,
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
