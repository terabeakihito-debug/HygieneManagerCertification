"use client";

import { useActionState, useEffect, useState } from "react";
import { TurnstileWidget } from "@/components/auth/TurnstileWidget";
import { type AuthState } from "@/lib/actions/auth";
import { upgradeAccountAction } from "@/lib/actions/upgrade-account";

const initialState: AuthState = { error: null };

export function UpgradeAccountForm() {
  const [state, formAction, pending] = useActionState(
    upgradeAccountAction,
    initialState
  );
  const [captchaToken, setCaptchaToken] = useState("");
  const [widgetKey, setWidgetKey] = useState(0);

  useEffect(() => {
    if (!state.error) {
      return;
    }
    setCaptchaToken("");
    setWidgetKey((current) => current + 1);
  }, [state.error]);

  return (
    <form action={formAction} className="flex flex-col gap-4">
      {state.error ? (
        <p className="rounded-sm border border-stamp px-3 py-2 text-sm text-stamp" role="alert">
          {state.error}
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
        パスワード（8文字以上）
        <input
          type="password"
          name="password"
          autoComplete="new-password"
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
        {pending ? "送信中..." : "メールアドレスを登録する"}
      </button>
    </form>
  );
}
