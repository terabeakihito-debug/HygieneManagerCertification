"use client";

import { useActionState, useEffect, useState } from "react";
import { TurnstileWidget } from "@/components/auth/TurnstileWidget";
import { loginAction, type AuthState } from "@/lib/actions/auth";

const initialState: AuthState = { error: null };

type LoginFormProps = {
  confirmFailed: boolean;
};

export function LoginForm({ confirmFailed }: LoginFormProps) {
  const [state, formAction, pending] = useActionState(loginAction, initialState);
  const [captchaToken, setCaptchaToken] = useState("");
  const [widgetKey, setWidgetKey] = useState(0);
  const error =
    state.error ??
    (confirmFailed
      ? "メール確認に失敗しました。リンクの有効期限が切れている可能性があります。"
      : null);

  useEffect(() => {
    if (!state.error) {
      return;
    }
    setCaptchaToken("");
    setWidgetKey((current) => current + 1);
  }, [state.error]);

  return (
    <form action={formAction} className="flex flex-col gap-4">
      {error ? (
        <p className="rounded-sm border border-stamp px-3 py-2 text-sm text-stamp" role="alert">
          {error}
        </p>
      ) : null}

      <label className="flex flex-col gap-1 text-sm font-medium">
        メールアドレス
        <input
          type="email"
          name="email"
          autoComplete="email"
          required
          className="field-input"
        />
      </label>

      <label className="flex flex-col gap-1 text-sm font-medium">
        パスワード
        <input
          type="password"
          name="password"
          autoComplete="current-password"
          required
          minLength={8}
          className="field-input"
        />
      </label>

      <input type="hidden" name="captchaToken" value={captchaToken} />
      <TurnstileWidget
        key={widgetKey}
        onVerify={setCaptchaToken}
        onExpire={() => setCaptchaToken("")}
        onError={() => setCaptchaToken("")}
      />

      <button
        type="submit"
        disabled={pending || !captchaToken}
        className="btn-primary"
      >
        {pending ? "ログイン中..." : "ログイン"}
      </button>
    </form>
  );
}
