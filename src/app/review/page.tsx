import Link from "next/link";
import { AnonymousSessionGate } from "@/components/auth/AnonymousSessionGate";
import { ProductRecommendation } from "@/components/recommendations/ProductRecommendation";
import { ReviewListItem } from "@/components/review/ReviewListItem";
import { getRecommendedProductsForCategories } from "@/lib/data/recommendations";
import { getUnresolvedReviewItems } from "@/lib/data/review";
import { createClient } from "@/lib/supabase/server";

export default async function ReviewPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    return <AnonymousSessionGate />;
  }

  const items = await getUnresolvedReviewItems(user.id);
  const reviewCategoryIds = items
    .map((item) => item.categoryId)
    .filter((id): id is string => id !== null);
  const recommendedProducts =
    items.length > 0
      ? await getRecommendedProductsForCategories(reviewCategoryIds, 2)
      : [];

  return (
    <main className="mx-auto flex min-h-screen max-w-2xl flex-col gap-6 px-4 py-8">
      <div className="flex items-center justify-between gap-4">
        <h1 className="text-2xl font-bold">復習リスト</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/practice" className="underline">
            問題演習
          </Link>
          <Link href="/mock-exams" className="underline">
            模試
          </Link>
          <Link href="/calendar" className="underline">
            カレンダー
          </Link>
          <Link href="/mypage" className="underline">
            マイページ
          </Link>
        </div>
      </div>

      {items.length > 0 ? (
        <Link
          href="/review/practice"
          className="rounded bg-gray-900 px-4 py-3 text-center text-white"
        >
          復習を始める
        </Link>
      ) : null}

      {items.length === 0 ? (
        <p className="rounded-lg border border-gray-200 bg-white p-6 text-gray-700">
          復習が必要な問題はありません
        </p>
      ) : (
        <div className="flex flex-col gap-3">
          <p className="text-sm text-gray-600">{items.length}件の復習が必要です</p>
          {items.map((item) => (
            <ReviewListItem
              key={item.id}
              categoryName={item.categoryName}
              questionPreview={item.questionPreview}
              addedAt={item.addedAt}
              reviewCount={item.reviewCount}
            />
          ))}
          <ProductRecommendation
            products={recommendedProducts}
            heading="復習の参考に"
          />
        </div>
      )}
    </main>
  );
}
