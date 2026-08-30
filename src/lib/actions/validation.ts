export type AuthState = {
  error: string | null;
};

export function toAuthErrorMessage(message: string): string {
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
  if (lower.includes("captcha")) {
    return "ロボット確認に失敗しました。もう一度お試しください";
  }

  return "処理に失敗しました。時間をおいて再度お試しください";
}

export function readCaptchaToken(formData: FormData): string | AuthState {
  const captchaToken = String(formData.get("captchaToken") ?? "").trim();

  if (!captchaToken) {
    return { error: "ロボットでないことを確認してください" };
  }

  return captchaToken;
}

export function validateCredentials(
  formData: FormData
): { email: string; password: string } | AuthState {
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
