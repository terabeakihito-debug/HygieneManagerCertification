"use client";

import { useEffect, useRef } from "react";
import { TurnstileScript } from "@/components/auth/TurnstileScript";
import {
  debugAnonymousTurnstileSiteKey,
  getTurnstileApi,
  whenTurnstileReady,
} from "@/components/auth/turnstile";

type TurnstileWidgetProps = {
  onVerify: (token: string) => void;
  onExpire?: () => void;
  onError?: () => void;
};

export function TurnstileWidget({
  onVerify,
  onExpire,
  onError,
}: TurnstileWidgetProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const onVerifyRef = useRef(onVerify);
  const onExpireRef = useRef(onExpire);
  const onErrorRef = useRef(onError);
  const siteKey = process.env.NEXT_PUBLIC_TURNSTILE_SITE_KEY ?? "";

  onVerifyRef.current = onVerify;
  onExpireRef.current = onExpire;
  onErrorRef.current = onError;

  useEffect(() => {
    if (!siteKey) {
      debugAnonymousTurnstileSiteKey();
      return;
    }

    let cancelled = false;
    let widgetId: string | null = null;

    void whenTurnstileReady()
      .then((turnstile) => {
        if (cancelled || !containerRef.current || widgetId) {
          return;
        }

        widgetId = turnstile.render(containerRef.current, {
          sitekey: siteKey,
          callback: (token) => {
            onVerifyRef.current(token);
          },
          "expired-callback": () => {
            onExpireRef.current?.();
          },
          "error-callback": () => {
            onErrorRef.current?.();
          },
        });
      })
      .catch(() => {
        if (!cancelled) {
          onErrorRef.current?.();
        }
      });

    return () => {
      cancelled = true;
      const turnstile = getTurnstileApi();
      if (widgetId && turnstile) {
        turnstile.remove(widgetId);
      }
    };
  }, [siteKey]);

  if (!siteKey) {
    return (
      <p className="text-sm text-stamp" role="alert">
        CAPTCHAの設定がありません。管理者にお問い合わせください。
      </p>
    );
  }

  return (
    <>
      <TurnstileScript />
      <div ref={containerRef} className="flex justify-center" />
    </>
  );
}
