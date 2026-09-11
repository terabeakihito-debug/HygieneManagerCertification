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
    <section className="border-t border-hairline pt-6">
      <p className="inline-block border border-ink px-2 py-0.5 text-xs font-semibold tracking-wide">
        広告・PR
      </p>
      {heading ? (
        <h2 className="mt-2 text-sm font-medium text-ink">{heading}</h2>
      ) : null}
      <p className="mt-1 text-sm leading-6 text-graphite">
        本欄にはアフィリエイトリンクが含まれます。リンク経由の購入等により、
        運営者が報酬を受け取る場合があります。
      </p>
      <ul className="mt-3 flex flex-col gap-2">
        {products.map((product) => (
          <li
            key={product.id}
            className="flex flex-col gap-2 rounded-sm border border-hairline px-3 py-3 sm:flex-row sm:items-center sm:justify-between"
          >
            <div className="flex flex-col gap-1">
              <span className="w-fit rounded-sm border border-hairline px-1.5 py-0.5 font-mono text-xs text-graphite">
                {aspLabel(product.asp)}
              </span>
              <p className="text-sm text-ink">{product.name}</p>
            </div>
            <a
              href={product.affiliate_url}
              target="_blank"
              rel="noopener noreferrer nofollow sponsored"
              className="btn-secondary shrink-0 px-3 py-1.5 text-sm"
            >
              商品を見る
            </a>
          </li>
        ))}
      </ul>
    </section>
  );
}
