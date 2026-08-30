import Link from "next/link";
import { redirect } from "next/navigation";
import { UpgradeAccountForm } from "@/app/upgrade-account/UpgradeAccountForm";
import { isAnonymousUser } from "@/lib/auth/anonymous";
import { createClient } from "@/lib/supabase/server";

export default async function UpgradeAccountPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/");
  }
  if (!isAnonymousUser(user)) {
    redirect("/mypage");
  }

  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
      <h1 className="mb-2 text-2xl font-bold">メールアドレスを登録する</h1>
      <p className="mb-6 text-sm text-gray-600">
        登録すると、いまの学習データを保ったまま、他の端末からも同じアカウントで利用できます。
      </p>
      <div className="rounded-lg border border-gray-200 bg-white p-6 shadow-sm">
        <UpgradeAccountForm />
      </div>
      <p className="mt-4 text-center text-sm text-gray-600">
        <Link href="/mypage" className="underline">
          マイページに戻る
        </Link>
      </p>
    </main>
  );
}
