function Box({
  x,
  y,
  width,
  height,
  label,
  accent = false,
}: {
  x: number;
  y: number;
  width: number;
  height: number;
  label: string;
  accent?: boolean;
}) {
  return (
    <g>
      <rect
        x={x}
        y={y}
        width={width}
        height={height}
        rx="8"
        fill={accent ? "#ccfbf1" : "#fff"}
        stroke={accent ? "#0f766e" : "#374151"}
      />
      <text
        x={x + width / 2}
        y={y + height / 2 + 5}
        textAnchor="middle"
        fill={accent ? "#134e4a" : "#111827"}
        fontSize="13"
        fontFamily="system-ui, sans-serif"
      >
        {label}
      </text>
    </g>
  );
}

function Branch({
  fromX,
  fromY,
  midX,
  topY,
  bottomY,
  toX,
}: {
  fromX: number;
  fromY: number;
  midX: number;
  topY: number;
  bottomY: number;
  toX: number;
}) {
  return (
    <path
      d={`M${fromX} ${fromY} H${midX} V${topY} H${toX} M${midX} ${fromY} V${bottomY} H${toX}`}
      fill="none"
      stroke="#9ca3af"
      strokeWidth="2"
      strokeLinejoin="miter"
    />
  );
}

export function NervousSystemDiagram() {
  return (
    <svg
      viewBox="0 0 720 440"
      role="img"
      aria-labelledby="nerve-diagram-title"
      className="h-auto w-full overflow-visible"
    >
      <title id="nerve-diagram-title">中枢神経系と末梢神経系のツリー構造</title>
      <rect width="720" height="440" fill="#f9fafb" />

      <Box x={24} y={188} width={100} height={44} label="神経系" accent />
      <Branch fromX={124} fromY={210} midX={172} topY={80} bottomY={320} toX={216} />
      <Box x={216} y={58} width={120} height={44} label="中枢神経系" />
      <Box x={216} y={298} width={120} height={44} label="末梢神経系" />

      <Branch fromX={336} fromY={80} midX={378} topY={40} bottomY={124} toX={416} />
      <Box x={416} y={20} width={88} height={40} label="脳" accent />
      <Box x={416} y={104} width={88} height={40} label="脊髄" accent />

      <Branch fromX={336} fromY={320} midX={378} topY={236} bottomY={368} toX={416} />
      <Box x={416} y={216} width={100} height={40} label="体性神経" />
      <Box x={416} y={348} width={100} height={40} label="自律神経" />

      <Branch fromX={516} fromY={236} midX={552} topY={204} bottomY={272} toX={584} />
      <Box x={584} y={186} width={112} height={36} label="感覚神経" />
      <Box x={584} y={254} width={112} height={36} label="運動神経" />

      <Branch fromX={516} fromY={368} midX={552} topY={336} bottomY={400} toX={584} />
      <Box x={584} y={318} width={112} height={36} label="交感神経" accent />
      <Box x={584} y={382} width={112} height={36} label="副交感神経" accent />
    </svg>
  );
}
