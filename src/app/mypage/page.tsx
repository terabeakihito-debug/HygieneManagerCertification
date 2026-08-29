import Link from "next/link";
import { redirect } from "next/navigation";
import { LogoutButton } from "@/components/LogoutButton";
import { getUnresolvedReviewCount } from "@/lib/data/review";
import { createClient } from "@/lib/supabase/server";

export default async function MyPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  const reviewCount = await getUnresolvedReviewCount(user.id);

  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center gap-6 px-4 py-16">
      <h1 className="text-2xl font-bold">マイページ</h1>
      <div className="rounded-lg border border-gray-200 bg-white p-6 shadow-sm">
        <p className="text-sm text-gray-500">ログイン中のメールアドレス</p>
        <p className="mt-1 font-medium">{user.email}</p>
      </div>
      <Link
        href="/practice"
        className="rounded bg-gray-900 px-4 py-2 text-center text-white"
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
      <LogoutButton />
    </main>
  );
}
