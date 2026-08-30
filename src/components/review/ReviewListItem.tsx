type ReviewListItemProps = {
  categoryName: string;
  questionPreview: string;
  addedAt: string;
  reviewCount: number;
};

function formatAddedAt(value: string): string {
  return new Date(value).toLocaleString("ja-JP", {
    timeZone: "Asia/Tokyo",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  });
}

export function ReviewListItem({
  categoryName,
  questionPreview,
  addedAt,
  reviewCount,
}: ReviewListItemProps) {
  return (
    <article className="card-surface p-4">
      <p className="text-sm text-graphite">{categoryName}</p>
      <p className="mt-1 font-medium leading-relaxed">{questionPreview}</p>
      <dl className="mt-3 grid grid-cols-1 gap-1 text-sm text-graphite sm:grid-cols-2">
        <div>
          <dt className="inline">最後に間違えた日時：</dt>
          <dd className="inline font-mono">{formatAddedAt(addedAt)}</dd>
        </div>
        <div>
          <dt className="inline">復習回数：</dt>
          <dd className="inline font-mono">{reviewCount}回</dd>
        </div>
      </dl>
    </article>
  );
}
