export const TURNSTILE_SCRIPT_SRC =
  "https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit";

export const TURNSTILE_SCRIPT_ID = "cloudflare-turnstile";

export type TurnstileRenderOptions = {
  sitekey: string;
  callback: (token: string) => void;
  "expired-callback": () => void;
  "error-callback": () => void;
  appearance?: "always" | "execute" | "interaction-only";
  execution?: "render" | "execute";
  size?: "normal" | "compact" | "flexible" | "invisible";
};

export type TurnstileApi = {
  ready: (callback: () => void) => void;
  render: (container: HTMLElement, options: TurnstileRenderOptions) => string;
  remove: (widgetId: string) => void;
  reset: (widgetId?: string) => void;
  execute?: (container: HTMLElement | string) => void;
};

declare global {
  interface Window {
    turnstile?: TurnstileApi;
  }
}

type PendingLoad = {
  promise: Promise<TurnstileApi>;
  resolve: (api: TurnstileApi) => void;
  reject: (error: Error) => void;
};

let pendingLoad: PendingLoad | null = null;

export function getTurnstileApi(): TurnstileApi | undefined {
  const candidate = window.turnstile;
  if (
    candidate &&
    typeof candidate.render === "function" &&
    typeof candidate.remove === "function"
  ) {
    return candidate;
  }
  return undefined;
}

function getPendingLoad(): PendingLoad {
  if (pendingLoad) {
    return pendingLoad;
  }

  const box: {
    promise?: Promise<TurnstileApi>;
    resolve?: (api: TurnstileApi) => void;
    reject?: (error: Error) => void;
  } = {};

  box.promise = new Promise<TurnstileApi>((resolve, reject) => {
    box.resolve = resolve;
    box.reject = reject;
  });

  if (!box.promise || !box.resolve || !box.reject) {
    throw new Error("Failed to create Turnstile load promise");
  }

  pendingLoad = {
    promise: box.promise,
    resolve: box.resolve,
    reject: box.reject,
  };
  return pendingLoad;
}

export function markTurnstileScriptLoaded(): void {
  const api = getTurnstileApi();
  if (api) {
    getPendingLoad().resolve(api);
    return;
  }

  window.setTimeout(() => {
    const retryApi = getTurnstileApi();
    if (retryApi) {
      getPendingLoad().resolve(retryApi);
    }
  }, 0);
}

export function markTurnstileScriptFailed(): void {
  const pending = pendingLoad;
  pendingLoad = null;
  pending?.reject(new Error("Turnstile script failed"));
}

export function whenTurnstileReady(): Promise<TurnstileApi> {
  const api = getTurnstileApi();
  if (api) {
    return Promise.resolve(api);
  }
  return getPendingLoad().promise;
}
