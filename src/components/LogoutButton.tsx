"use client";

import { useActionState } from "react";
import { logoutAction, type AuthState } from "@/lib/actions/auth";

const initialState: AuthState = { error: null };

export function LogoutButton() {
  const [state, formAction, pending] = useActionState(logoutAction, initialState);

  return (
    <form action={formAction} className="flex flex-col items-start gap-2">
      {state.error ? (
        <p className="text-sm text-stamp" role="alert">
          {state.error}
        </p>
      ) : null}
      <button
        type="submit"
        disabled={pending}
        className="btn-secondary text-sm"
      >
        {pending ? "ログアウト中..." : "ログアウト"}
      </button>
    </form>
  );
}
