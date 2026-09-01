import type { ReactNode } from "react";

type SvgBoardProps = {
  alt: string;
  children: ReactNode;
};

export function SvgBoard({ alt, children }: SvgBoardProps) {
  return (
    <div className="diagram-scene">
      <div className="diagram-scene-canvas" role="img" aria-label={alt}>
        <svg viewBox="0 0 720 540" className="h-full w-full" aria-hidden>
          <rect width="720" height="540" fill="#f1f1ec" />
          {children}
        </svg>
      </div>
    </div>
  );
}

export const ink = "#14211A";
export const safety = "#1F6E45";
export const graphite = "#4B4F49";
export const amber = "#C9932B";
export const hairline = "#D8D6CB";
export const paper = "#F1F1EC";
