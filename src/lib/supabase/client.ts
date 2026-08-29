import { createBrowserClient } from "@supabase/ssr";

/**
 * クライアントコンポーネント(ブラウザ)から呼び出すSupabaseクライアント。
 * "use client" を付けたコンポーネント内でのみ使用する。
 */
export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}
