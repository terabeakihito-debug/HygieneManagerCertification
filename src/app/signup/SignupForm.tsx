"use client";

import { useActionState } from "react";
import { signUpAction, type AuthState } from "@/lib/actions/auth";

const initialState: AuthState = { error: null };

export function SignupForm() {
  const [state, formAction, pending] = useActionState(signUpAction, initialState);

  return (
    <form action={formAction} className="flex flex-col gap-4">
      {state.error ? (
        <p className="rounded bg-red-50 px-3 py-2 text-sm text-red-700" role="alert">
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
          className="rounded border border-gray-300 px-3 py-2 font-normal"
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
          className="rounded border border-gray-300 px-3 py-2 font-normal"
        />
      </label>

      <button
        type="submit"
        disabled={pending}
        className="rounded bg-gray-900 px-4 py-2 text-white disabled:opacity-60"
      >
        {pending ? "送信中..." : "登録する"}
      </button>
    </form>
  );
}
