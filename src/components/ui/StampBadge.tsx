type StampTone = "safety" | "stamp";

type StampBadgeProps = {
  label: string;
  tone?: StampTone;
  enter?: boolean;
};

export function StampBadge({ label, tone = "safety", enter = false }: StampBadgeProps) {
  const toneClass =
    tone === "stamp" ? "id-card-seal id-card-seal-stamp" : "id-card-seal";

  return (
    <span className={enter ? `${toneClass} result-seal-in` : toneClass}>
      {label}
    </span>
  );
}
