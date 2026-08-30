"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useEffect } from "react";
import { useAnonymousAuth } from "@/components/auth/AnonymousAuthProvider";

export function AnonymousSessionGate() {
  const { status, retry } = useAnonymousAuth();
  const router = useRouter();

  useEffect(() => {
    if (status.kind === "ready") {
      router.refresh();
    }
  }, [status, router]);

  switch (status.kind) {
    case "ready":
      return (
        <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
          <p className="text-sm text-graphite">ゲスト利用を開始しています…</p>
        </main>
      );
    case "checking":
    case "needs-fallback":
      return (
        <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
          <p className="text-sm text-graphite">ゲスト利用の準備をしています…</p>
        </main>
      );
    case "error":
      return (
        <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center gap-4 px-4 py-16">
          <p className="text-sm text-stamp" role="alert">
            {status.message}
          </p>
          <button
            type="button"
            onClick={retry}
            className="btn-primary"
          >
            再試行する
          </button>
          <Link href="/login" className="text-center text-sm underline">
            ログインする
          </Link>
        </main>
      );
    case "skipped":
      return (
        <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center gap-4 px-4 py-16">
          <p className="text-sm text-graphite">
            このページを利用するには、ゲスト利用の開始またはログインが必要です。
          </p>
          <Link href="/login" className="text-center text-sm underline">
            ログインする
          </Link>
        </main>
      );
    default: {
      const _never: never = status;
      return _never;
    }
  }
}
