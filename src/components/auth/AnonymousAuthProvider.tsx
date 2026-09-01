"use client";

import { usePathname, useRouter } from "next/navigation";
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import { InvisibleTurnstile } from "@/components/auth/InvisibleTurnstile";
import { TurnstileScript } from "@/components/auth/TurnstileScript";
import { TurnstileWidget } from "@/components/auth/TurnstileWidget";
import { signInAnonymouslyAction } from "@/lib/actions/anonymous-auth";
import { shouldSkipAnonymousAuth } from "@/lib/auth/anonymous";
import { createClient } from "@/lib/supabase/client";

export type AnonymousAuthStatus =
  | { kind: "checking" }
  | { kind: "ready" }
  | { kind: "needs-fallback" }
  | { kind: "error"; message: string }
  | { kind: "skipped" };

type AnonymousAuthContextValue = {
  status: AnonymousAuthStatus;
  retry: () => void;
};

const AnonymousAuthContext = createContext<AnonymousAuthContextValue | null>(
  null
);

export function useAnonymousAuth(): AnonymousAuthContextValue {
  const value = useContext(AnonymousAuthContext);
  if (!value) {
    return {
      status: { kind: "skipped" },
      retry: () => undefined,
    };
  }
  return value;
}

type ChallengeMode = "idle" | "invisible" | "visible";

const INVISIBLE_CHALLENGE_TIMEOUT_MS = 8000;

export function AnonymousAuthProvider({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  const router = useRouter();
  const [status, setStatus] = useState<AnonymousAuthStatus>({
    kind: "checking",
  });
  const [challengeMode, setChallengeMode] = useState<ChallengeMode>("idle");
  const [widgetKey, setWidgetKey] = useState(0);
  const completingRef = useRef(false);
  const fallbackStartedRef = useRef(false);

  const startChallenge = useCallback((mode: ChallengeMode) => {
    completingRef.current = false;
    if (mode === "visible") {
      fallbackStartedRef.current = true;
    }
    setChallengeMode(mode);
    setWidgetKey((current) => current + 1);
    setStatus(mode === "visible" ? { kind: "needs-fallback" } : { kind: "checking" });
  }, []);

  const retry = useCallback(() => {
    fallbackStartedRef.current = false;
    startChallenge("invisible");
  }, [startChallenge]);

  useEffect(() => {
    if (shouldSkipAnonymousAuth(pathname)) {
      setChallengeMode("idle");
      setStatus({ kind: "skipped" });
      return;
    }

    let cancelled = false;

    async function checkSession() {
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (cancelled) {
        return;
      }
      if (user) {
        fallbackStartedRef.current = false;
        setChallengeMode("idle");
        setStatus({ kind: "ready" });
        return;
      }
      if (fallbackStartedRef.current) {
        return;
      }
      startChallenge("invisible");
    }

    void checkSession();
    return () => {
      cancelled = true;
    };
  }, [pathname, startChallenge]);

  useEffect(() => {
    if (status.kind !== "checking") {
      return;
    }

    const timer = window.setTimeout(() => {
      if (completingRef.current) {
        return;
      }
      startChallenge("visible");
    }, INVISIBLE_CHALLENGE_TIMEOUT_MS);

    return () => {
      window.clearTimeout(timer);
    };
  }, [status.kind, challengeMode, widgetKey, startChallenge]);

  async function completeWithToken(token: string) {
    completingRef.current = true;
    const result = await signInAnonymouslyAction(token);
    if (!result.ok) {
      completingRef.current = false;
      setStatus({ kind: "error", message: result.error });
      setChallengeMode("visible");
      setWidgetKey((current) => current + 1);
      return;
    }
    setChallengeMode("idle");
    setStatus({ kind: "ready" });
    router.refresh();
  }

  const value = useMemo(
    () => ({ status, retry }),
    [status, retry]
  );

  return (
    <AnonymousAuthContext.Provider value={value}>
      <TurnstileScript />
      {children}
      {challengeMode === "invisible" ? (
        <div className="fixed bottom-4 right-4 z-40">
          <InvisibleTurnstile
            key={`invisible-${widgetKey}`}
            onVerify={(token) => {
              void completeWithToken(token);
            }}
            onError={() => {
              startChallenge("visible");
            }}
          />
        </div>
      ) : null}
      {challengeMode === "visible" ? (
        <div className="fixed inset-x-0 bottom-0 z-40 border-t border-hairline bg-paper px-4 py-4">
          <div className="mx-auto flex max-w-md flex-col gap-3">
            <p className="text-sm text-ink">
              自動確認に失敗しました。チェックを完了するとゲスト利用を開始します。
            </p>
            {status.kind === "error" ? (
              <p className="text-sm text-stamp" role="alert">
                {status.message}
              </p>
            ) : null}
            <TurnstileWidget
              key={`visible-${widgetKey}`}
              onVerify={(token) => {
                void completeWithToken(token);
              }}
              onError={() => {
                setStatus({
                  kind: "error",
                  message: "ロボット確認に失敗しました。再試行してください",
                });
              }}
            />
            <button
              type="button"
              onClick={retry}
              className="text-sm underline"
            >
              再試行する
            </button>
          </div>
        </div>
      ) : null}
    </AnonymousAuthContext.Provider>
  );
}
