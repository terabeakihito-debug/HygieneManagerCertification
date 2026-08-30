import type { ReactNode } from "react";

export type PlateKind = "FIG" | "TABLE";

type PlateFrameProps = {
  kind: PlateKind;
  number: number;
  caption: string;
  footnote?: string;
  children: ReactNode;
  isFrequent?: boolean;
};

export function formatPlateLabel(kind: PlateKind, number: number): string {
  return `${kind}. ${String(number).padStart(2, "0")}`;
}

export function PlateFrame({
  kind,
  number,
  caption,
  footnote,
  children,
  isFrequent = false,
}: PlateFrameProps) {
  return (
    <figure className="plate-frame">
      <span className="plate-frame-inner" aria-hidden="true" />
      <span className="plate-frame-corner plate-frame-corner-tl" aria-hidden="true" />
      <span className="plate-frame-corner plate-frame-corner-tr" aria-hidden="true" />
      <span className="plate-frame-corner plate-frame-corner-bl" aria-hidden="true" />
      <span className="plate-frame-corner plate-frame-corner-br" aria-hidden="true" />
      {isFrequent ? <span className="plate-frame-stamp">頻出論点</span> : null}
      <p className="plate-frame-no">{formatPlateLabel(kind, number)}</p>
      <div className="plate-frame-body">{children}</div>
      <figcaption className="plate-frame-caption">{caption}</figcaption>
      {footnote ? <p className="plate-frame-note">{footnote}</p> : null}
    </figure>
  );
}
