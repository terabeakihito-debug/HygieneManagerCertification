import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { LogoutButton } from "@/components/LogoutButton";
import { isAnonymousUser } from "@/lib/auth/anonymous";
import { getUnresolvedReviewCount } from "@/lib/data/review";
import { createClient } from "@/lib/supabase/server";

export default async function MyPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const reviewCount = await getUnresolvedReviewCount(user.id);
  const guest = isAnonymousUser(user);

  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center gap-6 px-4 py-16">
      <h1 className="text-2xl font-bold">マイページ</h1>
      {guest ? (
        <div className="card-surface border-safety p-6">
          <p className="text-sm text-safety-dark">
            ゲストとして利用中です。メールアドレスを登録すると、他の端末からもこのデータにアクセスできるようになります
          </p>
          <Link
            href="/upgrade-account"
            className="mt-4 inline-block btn-primary"
          >
            メールアドレスを登録する
          </Link>
        </div>
      ) : (
        <div className="card-surface p-6">
          <p className="text-sm text-graphite">ログイン中のメールアドレス</p>
          <p className="mt-1 font-medium">{user.email}</p>
        </div>
      )}
      <Link
        href="/learn"
        className="btn-secondary"
      >
        学習コンテンツを読む
      </Link>
      <Link
        href="/practice"
        className="btn-primary"
      >
        問題演習をはじめる
      </Link>
      <Link href="/progress" className="text-center text-sm underline">
        進捗を見る
      </Link>
      <Link href="/review" className="text-center text-sm underline">
        復習リストを見る{reviewCount > 0 ? ` (${reviewCount})` : ""}
      </Link>
      <Link href="/mock-exams" className="text-center text-sm underline">
        模試に挑戦する
      </Link>
      <Link href="/mock-exams/history" className="text-center text-sm underline">
        模試結果の履歴
      </Link>
      <Link href="/calendar" className="text-center text-sm underline">
        学習カレンダーを見る
      </Link>
      <LogoutButton />
    </main>
  );
}
