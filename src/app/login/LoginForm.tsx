"use client";

import { useActionState } from "react";
import { loginAction, type AuthState } from "@/lib/actions/auth";

const initialState: AuthState = { error: null };

type LoginFormProps = {
  confirmFailed: boolean;
};

export function LoginForm({ confirmFailed }: LoginFormProps) {
  const [state, formAction, pending] = useActionState(loginAction, initialState);
  const error =
    state.error ??
    (confirmFailed
      ? "メール確認に失敗しました。リンクの有効期限が切れている可能性があります。"
      : null);

  return (
    <form action={formAction} className="flex flex-col gap-4">
      {error ? (
        <p className="rounded bg-red-50 px-3 py-2 text-sm text-red-700" role="alert">
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
          className="rounded border border-gray-300 px-3 py-2 font-normal"
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
          className="rounded border border-gray-300 px-3 py-2 font-normal"
        />
      </label>

      <button
        type="submit"
        disabled={pending}
        className="rounded bg-gray-900 px-4 py-2 text-white disabled:opacity-60"
      >
        {pending ? "ログイン中..." : "ログイン"}
      </button>
    </form>
  );
}
