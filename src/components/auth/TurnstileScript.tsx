"use client";

import Script from "next/script";
import {
  TURNSTILE_SCRIPT_ID,
  TURNSTILE_SCRIPT_SRC,
  markTurnstileScriptFailed,
  markTurnstileScriptLoaded,
} from "@/components/auth/turnstile";

export function TurnstileScript() {
  return (
    <Script
      id={TURNSTILE_SCRIPT_ID}
      src={TURNSTILE_SCRIPT_SRC}
      strategy="afterInteractive"
      onReady={markTurnstileScriptLoaded}
      onLoad={markTurnstileScriptLoaded}
      onError={markTurnstileScriptFailed}
    />
  );
}
