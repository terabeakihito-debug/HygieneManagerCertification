import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { QuestionCard } from "@/components/practice/QuestionCard";
import { getUnresolvedReviewQuestions } from "@/lib/data/review";
import { createClient } from "@/lib/supabase/server";

export default async function ReviewPracticePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const questions = await getUnresolvedReviewQuestions(user.id);

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">復習演習</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/review" className="underline">
            復習リスト
          </Link>
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      <QuestionCard
        questions={questions}
        completeMode="review"
        emptyMessage="復習が必要な問題はありません"
      />
    </main>
  );
}
