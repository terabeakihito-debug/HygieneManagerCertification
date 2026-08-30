type CrossMarkProps = {
  size?: number;
  className?: string;
};

export function CrossMark({ size = 28, className }: CrossMarkProps) {
  return (
    <span
      className={className ? `cross-badge ${className}` : "cross-badge"}
      style={{ width: size, height: size }}
      aria-hidden
    />
  );
}
