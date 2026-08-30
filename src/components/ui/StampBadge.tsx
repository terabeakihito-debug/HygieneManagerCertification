type StampTone = "safety" | "stamp";

type StampBadgeProps = {
  label: string;
  tone?: StampTone;
};

export function StampBadge({ label, tone = "safety" }: StampBadgeProps) {
  return (
    <span className={tone === "stamp" ? "id-card-seal id-card-seal-stamp" : "id-card-seal"}>
      {label}
    </span>
  );
}
