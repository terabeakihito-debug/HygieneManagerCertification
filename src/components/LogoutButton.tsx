"use client";

import { useActionState } from "react";
import { logoutAction, type AuthState } from "@/lib/actions/auth";

const initialState: AuthState = { error: null };

export function LogoutButton() {
  const [state, formAction, pending] = useActionState(logoutAction, initialState);

  return (
    <form action={formAction} className="flex flex-col items-start gap-2">
      {state.error ? (
        <p className="text-sm text-red-700" role="alert">
          {state.error}
        </p>
      ) : null}
      <button
        type="submit"
        disabled={pending}
        className="rounded border border-gray-300 bg-white px-4 py-2 text-sm disabled:opacity-60"
      >
        {pending ? "ログアウト中..." : "ログアウト"}
      </button>
    </form>
  );
}
