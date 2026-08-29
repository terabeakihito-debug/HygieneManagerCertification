import type { RecommendedProduct } from "@/lib/data/recommendations";
import type { AspType } from "@/types/database";

type ProductRecommendationProps = {
  products: RecommendedProduct[];
  heading?: string;
};

function aspLabel(asp: AspType): string {
  switch (asp) {
    case "amazon":
      return "Amazon";
    case "rakuten":
      return "楽天";
    default: {
      const _never: never = asp;
      return _never;
    }
  }
}

export function ProductRecommendation({
  products,
  heading,
}: ProductRecommendationProps) {
  if (products.length === 0) {
    return null;
  }

  return (
    <section className="rounded-lg border border-gray-200 bg-gray-50 p-4">
      <p className="inline-block rounded border border-gray-400 bg-white px-2 py-0.5 text-xs font-semibold tracking-wide text-gray-800">
        広告
      </p>
      {heading ? (
        <h2 className="mt-2 text-sm font-medium text-gray-700">{heading}</h2>
      ) : null}
      <p className="mt-1 text-sm text-gray-600">学習の参考にどうぞ</p>
      <ul className="mt-3 flex flex-col gap-2">
        {products.map((product) => (
          <li
            key={product.id}
            className="flex flex-col gap-2 rounded border border-gray-200 bg-white px-3 py-3 sm:flex-row sm:items-center sm:justify-between"
          >
            <div className="flex flex-col gap-1">
              <span className="w-fit rounded bg-gray-100 px-1.5 py-0.5 text-xs text-gray-600">
                {aspLabel(product.asp)}
              </span>
              <p className="text-sm text-gray-800">{product.name}</p>
            </div>
            <a
              href={product.affiliate_url}
              target="_blank"
              rel="noopener noreferrer nofollow sponsored"
              className="shrink-0 rounded border border-gray-400 px-3 py-1.5 text-center text-sm text-gray-700"
            >
              商品を見る
            </a>
          </li>
        ))}
      </ul>
    </section>
  );
}
