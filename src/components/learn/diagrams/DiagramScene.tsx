import { Children, isValidElement, type ReactElement, type ReactNode } from "react";

export type DiagramLabelTone =
  | "ink"
  | "graphite"
  | "safety"
  | "safety-dark"
  | "stamp"
  | "amber";

export type DiagramLabelAlign = "left" | "center" | "right";

type DiagramSceneProps = {
  src: string;
  alt: string;
  children: ReactNode;
};

type DiagramLabelProps = {
  x: number;
  y: number;
  tone?: DiagramLabelTone;
  align?: DiagramLabelAlign;
  size?: "sm" | "md";
  width?: number;
  children: ReactNode;
};

type DiagramArrowsProps = {
  viewBox: string;
  children: ReactNode;
};

const NOTE_WIDTH_MIN = 70;
const NOTE_Y_MIN = 70;
const NOTE_TEXT_MIN = 22;

function labelText(children: ReactNode): string {
  if (typeof children === "string") {
    return children.trim();
  }
  if (typeof children === "number") {
    return String(children);
  }
  return "";
}

function isFooterNote(props: DiagramLabelProps): boolean {
  if (props.width !== undefined && props.width >= NOTE_WIDTH_MIN) {
    return true;
  }
  const text = labelText(props.children);
  return props.y >= NOTE_Y_MIN && text.length >= NOTE_TEXT_MIN;
}

function isDiagramLabel(child: ReactNode): child is ReactElement<DiagramLabelProps> {
  return isValidElement(child) && child.type === DiagramLabel;
}

function overlayMaxWidth(x: number, align: DiagramLabelAlign): number {
  const pad = 2;
  switch (align) {
    case "left":
      return Math.max(10, 100 - x - pad);
    case "right":
      return Math.max(10, x - pad);
    case "center":
      return Math.max(10, 2 * Math.min(x, 100 - x) - pad);
    default: {
      const _never: never = align;
      return _never;
    }
  }
}

export function DiagramScene({ src, alt, children }: DiagramSceneProps) {
  const nodes = Children.toArray(children);
  const overlay = nodes.filter((child) => !(isDiagramLabel(child) && isFooterNote(child.props)));
  const notes = nodes.filter((child): child is ReactElement<DiagramLabelProps> => {
    return isDiagramLabel(child) && isFooterNote(child.props);
  });

  return (
    <div className="diagram-scene">
      <div className="diagram-scene-canvas">
        <img src={src} alt="" className="diagram-scene-image" />
        <div className="diagram-scene-veil" aria-hidden />
        <div className="diagram-scene-overlay" role="img" aria-label={alt}>
          {overlay}
        </div>
      </div>
      {notes.length > 0 ? (
        <div className="diagram-notes">
          {notes.map((note, index) => (
            <p
              key={note.key ?? index}
              className={`diagram-note-line diagram-label-${note.props.tone ?? "graphite"}`}
            >
              {note.props.children}
            </p>
          ))}
        </div>
      ) : null}
    </div>
  );
}

export function DiagramLabel({
  x,
  y,
  tone = "ink",
  align = "center",
  size = "md",
  width,
  children,
}: DiagramLabelProps) {
  const bound = overlayMaxWidth(x, align);
  const maxWidth = width !== undefined ? Math.min(width, bound) : bound;

  return (
    <span
      className={`diagram-label diagram-label-${tone} diagram-label-${align} diagram-label-${size}`}
      style={{
        left: `${x}%`,
        top: `${y}%`,
        maxWidth: `${maxWidth}%`,
      }}
    >
      {children}
    </span>
  );
}

export function DiagramArrows({ viewBox, children }: DiagramArrowsProps) {
  return (
    <svg className="diagram-arrows" viewBox={viewBox} aria-hidden>
      {children}
    </svg>
  );
}
