import {
  SvgBoard,
  amber,
  graphite,
  hairline,
  ink,
  paper,
  safety,
  shadeOpacity,
  stamp,
  strokeGuide,
  strokeMain,
  strokePart,
} from "@/components/learn/diagrams/SvgBoard";

function Label({
  x,
  y,
  children,
  fill = ink,
  anchor = "middle",
  size = 13,
}: {
  x: number | string;
  y: number | string;
  children: string;
  fill?: string;
  anchor?: "start" | "middle" | "end";
  size?: number;
}) {
  return (
    <text x={x} y={y} fill={fill} fontSize={size} textAnchor={anchor} fontFamily="ui-sans-serif, sans-serif">
      {children}
    </text>
  );
}

function WaterPattern({ id }: { id: string }) {
  return (
    <pattern id={id} width="20" height="18" patternUnits="userSpaceOnUse">
      <path d="M-2 4 L6 -4 M1 19 L22 -2" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M-3 13 L10 0 M8 20 L22 6" stroke={hairline} strokeWidth="1" />
      <path d="M0 17 L14 3" stroke={hairline} strokeWidth="0.9" />
    </pattern>
  );
}

function ArrowMarker({ id }: { id: string }) {
  return (
    <marker id={id} viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto">
      <path d="M0 1 L10 5 L0 9 Z" fill={safety} />
    </marker>
  );
}

function Shade({ cx, cy, rx, ry }: { cx: number; cy: number; rx: number; ry: number }) {
  return <ellipse cx={cx} cy={cy} rx={rx} ry={ry} fill={ink} fillOpacity={shadeOpacity} />;
}

function Rim({
  x,
  y,
  width,
  height,
  rx = 0,
}: {
  x: number;
  y: number;
  width: number;
  height: number;
  rx?: number;
}) {
  return (
    <rect
      x={x}
      y={y}
      width={width}
      height={height}
      rx={rx}
      fill="none"
      stroke={graphite}
      strokeWidth="14"
      opacity="0.2"
    />
  );
}

function Highlight({ x1, x2, y }: { x1: number; x2: number; y: number }) {
  return (
    <>
      <path d={`M${x1} ${y} H${x2}`} fill="none" stroke={paper} strokeWidth={strokeGuide} />
      <path d={`M${x1 + 10} ${y + 9} H${x2 - 10}`} fill="none" stroke={hairline} strokeWidth={strokeGuide} />
    </>
  );
}

function Flame({ x, y, s = 1 }: { x: number; y: number; s?: number }) {
  return (
    <g transform={`translate(${x} ${y}) scale(${s})`}>
      <path d="M-8 0 C-6 -14 -2 -24 0 -32 C4 -22 10 -12 8 0 Z" fill={amber} fillOpacity="0.34" />
      <path d="M-4 2 C-3 -10 0 -18 1 -24 C4 -14 7 -6 5 4 Z" fill={amber} fillOpacity="0.55" />
      <path d="M-1 3 C0 -6 2 -12 2.5 -16 C3.5 -8 4.5 -2 3 5 Z" fill={amber} fillOpacity="0.72" />
    </g>
  );
}

function Flow({ d, marker }: { d: string; marker: string }) {
  return <path d={d} fill="none" stroke={safety} strokeWidth="2.6" markerEnd={`url(#${marker})`} />;
}

export function WaterCirculationDiagram() {
  return (
    <SvgBoard alt="下降管と上昇管による自然循環">
      <defs>
        <WaterPattern id="b2-wc-water" />
        <ArrowMarker id="b2-wc-up" />
        <clipPath id="b2-wc-steam">
          <rect x="220" y="70" width="280" height="70" rx="10" />
        </clipPath>
        <clipPath id="b2-wc-water-drum">
          <rect x="250" y="360" width="220" height="60" rx="10" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-wc-steam)">
        <rect x="220" y="70" width="280" height="70" fill={graphite} fillOpacity="0.14" />
        <rect x="220" y="70" width="280" height="70" fill="url(#b2-wc-water)" />
        <Rim x={220} y={70} width={280} height={70} rx={10} />
        <Shade cx={250} cy={128} rx={90} ry={24} />
        <Highlight x1={240} x2={480} y={82} />
      </g>
      <rect x="220" y="70" width="280" height="70" rx="10" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="112">
        蒸気ドラム
      </Label>
      <g clipPath="url(#b2-wc-water-drum)">
        <rect x="250" y="360" width="220" height="60" fill={graphite} fillOpacity="0.16" />
        <rect x="250" y="360" width="220" height="60" fill="url(#b2-wc-water)" />
        <Rim x={250} y={360} width={220} height={60} rx={10} />
        <Shade cx={278} cy={408} rx={80} ry={20} />
      </g>
      <rect x="250" y="360" width="220" height="60" rx="10" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="396">
        水ドラム
      </Label>
      <path d="M300 140 V360" fill="none" stroke={graphite} strokeWidth="10" />
      <path d="M420 140 V360" fill="none" stroke={amber} strokeWidth="10" />
      <rect
        x="390"
        y="190"
        width="60"
        height="90"
        fill={amber}
        fillOpacity="0.18"
        stroke={stamp}
        strokeWidth={strokePart}
        strokeDasharray="5 4"
      />
      <Flow d="M420 250 V188" marker="b2-wc-up" />
      <path d="M300 300 l10 16 M300 300 l-10 16" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <Label x="150" y="250" fill={graphite} anchor="start">
        下降管（密度大）
      </Label>
      <Label x="560" y="230" fill={safety} anchor="start">
        上昇管（加熱）
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        密度差で循環する。貫流ボイラーにはこの回路がない
      </Label>
    </SvgBoard>
  );
}

export function HeatingSurfaceDiagram() {
  return (
    <SvgBoard alt="火炉・伝熱面・燃焼装置の位置">
      <defs>
        <ArrowMarker id="b2-hs-arrow" />
        <clipPath id="b2-hs-shell">
          <rect x="80" y="80" width="560" height="320" rx="8" />
        </clipPath>
        <clipPath id="b2-hs-furnace">
          <rect x="110" y="120" width="200" height="220" rx="6" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-hs-shell)">
        <rect x="80" y="80" width="560" height="320" fill={paper} />
        <Rim x={80} y={80} width={560} height={320} rx={8} />
        <Shade cx={140} cy={370} rx={160} ry={50} />
        <Highlight x1={100} x2={620} y={94} />
      </g>
      <rect x="80" y="80" width="560" height="320" rx="8" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <g clipPath="url(#b2-hs-furnace)">
        <rect x="110" y="120" width="200" height="220" fill={amber} fillOpacity="0.22" />
        <rect x="110" y="120" width="200" height="220" rx="6" fill="none" stroke={amber} strokeWidth="16" opacity="0.3" />
        <Shade cx={148} cy={310} rx={70} ry={40} />
        <Flame x={160} y={300} s={1.4} />
      </g>
      <rect x="110" y="120" width="200" height="220" rx="6" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <Label x="210" y="176" fill={stamp}>
        火炉（放射）
      </Label>
      <rect x="330" y="140" width="280" height="80" fill={amber} fillOpacity="0.12" stroke={ink} strokeWidth={strokePart} />
      <Label x="470" y="188">
        対流伝熱面
      </Label>
      <rect x="330" y="240" width="130" height="70" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="395" y="282" size={12} fill={graphite}>
        過熱器
      </Label>
      <rect x="480" y="240" width="130" height="70" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="545" y="282" size={12} fill={graphite}>
        エコノマイザ
      </Label>
      <circle cx="160" cy="430" r="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Flame x={160} y={424} s={0.7} />
      <Label x="210" y="436" anchor="start" size={12}>
        バーナ
      </Label>
      <Flow d="M250 230 H360" marker="b2-hs-arrow" />
      <Label x="360" y="500" fill={graphite} size={12}>
        熱は火炉の放射から対流部、給水予熱へと流れる
      </Label>
    </SvgBoard>
  );
}

export function FireTubeBoilerDiagram() {
  const smokeTubes = [
    { y: 132, gas: 0.5 },
    { y: 154, gas: 0.46 },
    { y: 176, gas: 0.42 },
    { y: 198, gas: 0.38 },
    { y: 220, gas: 0.34 },
    { y: 242, gas: 0.3 },
    { y: 264, gas: 0.26 },
    { y: 286, gas: 0.22 },
  ];

  return (
    <SvgBoard alt="炉筒煙管ボイラーの縦断面。水は胴側、燃焼ガスは炉筒から煙管へ流れる">
      <defs>
        <pattern id="b2-ftb-water" width="20" height="18" patternUnits="userSpaceOnUse">
          <path d="M-2 4 L6 -4 M1 19 L22 -2" stroke={hairline} strokeWidth={strokeGuide} />
          <path d="M-3 13 L10 0 M8 20 L22 6" stroke={hairline} strokeWidth="1" />
          <path d="M0 17 L14 3" stroke={hairline} strokeWidth="0.9" />
        </pattern>
        <clipPath id="b2-ftb-shell">
          <rect x="70" y="96" width="560" height="300" rx="40" />
        </clipPath>
        <clipPath id="b2-ftb-furnace">
          <rect x="104" y="316" width="286" height="64" rx="32" />
        </clipPath>
        <marker
          id="b2-ftb-arrow"
          viewBox="0 0 10 10"
          refX="9"
          refY="5"
          markerWidth="8"
          markerHeight="8"
          orient="auto"
        >
          <path d="M0 1 L10 5 L0 9 Z" fill={safety} />
        </marker>
      </defs>

      <g clipPath="url(#b2-ftb-shell)">
        <rect x="70" y="96" width="560" height="300" fill={graphite} fillOpacity="0.14" />
        <rect x="70" y="96" width="560" height="300" fill="url(#b2-ftb-water)" />
        <rect
          x="70"
          y="96"
          width="560"
          height="300"
          rx="40"
          fill="none"
          stroke={graphite}
          strokeWidth="20"
          opacity="0.22"
        />
        <ellipse cx="168" cy="372" rx="210" ry="78" fill={ink} fillOpacity={shadeOpacity} />
        <path d="M118 118 H572" fill="none" stroke={paper} strokeWidth={strokeGuide} />
        <path d="M132 128 H548" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      </g>
      <rect
        x="70"
        y="96"
        width="560"
        height="300"
        rx="40"
        fill="none"
        stroke={ink}
        strokeWidth={strokeMain}
      />

      <rect x="82" y="116" width="10" height="260" fill={graphite} stroke={ink} strokeWidth={strokePart} />
      <rect x="608" y="116" width="10" height="260" fill={graphite} stroke={ink} strokeWidth={strokePart} />

      {smokeTubes.map((tube) => (
        <g key={tube.y}>
          <rect x="250" y={tube.y} width="350" height="14" rx="7" fill={paper} />
          <rect x="250" y={tube.y} width="350" height="14" rx="7" fill={amber} fillOpacity={tube.gas} />
          <rect
            x="250"
            y={tube.y + 8}
            width="350"
            height="6"
            rx="3"
            fill={ink}
            fillOpacity="0.1"
          />
          <rect
            x="250"
            y={tube.y}
            width="350"
            height="14"
            rx="7"
            fill="none"
            stroke={graphite}
            strokeWidth={strokePart}
          />
        </g>
      ))}

      <rect x="104" y="316" width="286" height="64" rx="32" fill={paper} />
      <g clipPath="url(#b2-ftb-furnace)">
        <rect x="104" y="316" width="286" height="64" fill={amber} fillOpacity="0.28" />
        <rect
          x="104"
          y="316"
          width="286"
          height="64"
          rx="32"
          fill="none"
          stroke={amber}
          strokeWidth="14"
          opacity="0.35"
        />
        <ellipse cx="148" cy="368" rx="92" ry="28" fill={ink} fillOpacity={shadeOpacity} />
        <path d="M132 328 H362" fill="none" stroke={paper} strokeWidth={strokeGuide} />
      </g>
      <rect
        x="104"
        y="316"
        width="286"
        height="64"
        rx="32"
        fill="none"
        stroke={stamp}
        strokeWidth={strokeMain}
      />

      <circle cx="72" cy="348" r="13" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M64 338 C66 326 70 318 72 312 C76 320 82 328 80 340 Z" fill={amber} fillOpacity="0.34" />
      <path d="M68 340 C69 330 72 322 73 316 C76 324 79 332 77 342 Z" fill={amber} fillOpacity="0.55" />
      <path d="M70 342 C71 334 73 328 74 324 C76 330 77 336 76 344 Z" fill={amber} fillOpacity="0.72" />

      <rect x="572" y="58" width="34" height="38" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="572" y="58" width="34" height="38" fill={amber} fillOpacity="0.28" />
      <rect x="572" y="80" width="18" height="16" fill={ink} fillOpacity={shadeOpacity} />

      <path
        d="M72 348 H378 C412 348 424 205 458 205 H590 V88"
        fill="none"
        stroke={safety}
        strokeWidth="2.6"
        markerEnd="url(#b2-ftb-arrow)"
      />

      <Label x="168" y="186" fill={graphite} size={13}>
        水
      </Label>
      <Label x="168" y="206" fill={graphite} size={11}>
        胴側
      </Label>
      <Label x="247" y="354" fill={ink} size={12}>
        炉筒
      </Label>
      <Label x="420" y="124" fill={ink} size={12}>
        煙管
      </Label>
      <Label x="87" y="84" fill={graphite} size={11}>
        鏡板
      </Label>
      <Label x="36" y="352" fill={graphite} size={11} anchor="start">
        バーナ
      </Label>
      <Label x="589" y="50" fill={graphite} size={11}>
        排気
      </Label>
      <Label x="500" y="366" fill={safety} size={12}>
        ガス（炉筒→煙管）
      </Label>
      <Label x="360" y="436" fill={stamp} size={12}>
        炉筒は外圧を受ける
      </Label>
      <Label x="360" y="502" fill={graphite} size={12}>
        水は胴側、燃焼ガスは管内を炉筒から煙管へ流れる
      </Label>
    </SvgBoard>
  );
}

export function WaterTubeOnceThroughDiagram() {
  return (
    <SvgBoard alt="水管ボイラーと貫流ボイラーの流れ比較">
      <defs>
        <WaterPattern id="b2-wt-water" />
        <ArrowMarker id="b2-wt-arrow" />
      </defs>
      <rect x="40" y="70" width="300" height="360" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={56} x2={324} y={84} />
      <Label x="190" y="100">
        水管（循環）
      </Label>
      <rect x="90" y="120" width="200" height="40" fill={graphite} fillOpacity="0.1" stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="146" size={12}>
        蒸気ドラム
      </Label>
      <path d="M130 160 V360" stroke={graphite} strokeWidth="8" />
      <path d="M250 160 V360" stroke={amber} strokeWidth="8" />
      <rect x="100" y="360" width="180" height="36" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <rect x="100" y="360" width="180" height="36" fill="url(#b2-wt-water)" />
      <Label x="190" y="384" size={12}>
        水ドラム
      </Label>
      <Flow d="M250 300 V188" marker="b2-wt-arrow" />
      <rect x="380" y="70" width="300" height="360" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={396} x2={664} y={84} />
      <Label x="530" y="100">
        貫流（一方通行）
      </Label>
      <path d="M430 400 H630 V160 H470" fill="none" stroke={graphite} strokeWidth="8" />
      <Flow d="M430 400 H620 V170" marker="b2-wt-arrow" />
      <Label x="530" y="430" size={12} fill={graphite}>
        給水
      </Label>
      <Label x="530" y="150" size={12} fill={safety}>
        過熱蒸気
      </Label>
      <Label x="530" y="260" size={12}>
        ドラムなし
      </Label>
    </SvgBoard>
  );
}

export function CastIronHartfordDiagram() {
  return (
    <SvgBoard alt="ハートフォード式連結の返り管">
      <defs>
        <WaterPattern id="b2-hf-water" />
        <ArrowMarker id="b2-hf-arrow" />
        <clipPath id="b2-hf-boiler">
          <rect x="80" y="80" width="200" height="260" rx="6" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-hf-boiler)">
        <rect x="80" y="80" width="200" height="120" fill={paper} />
        <rect x="80" y="200" width="200" height="140" fill={graphite} fillOpacity="0.16" />
        <rect x="80" y="200" width="200" height="140" fill="url(#b2-hf-water)" />
        <Shade cx={118} cy={318} rx={70} ry={30} />
        <Highlight x1={96} x2={260} y={94} />
      </g>
      <rect x="80" y="80" width="200" height="260" rx="6" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="180" y="130">
        鋳鉄製
      </Label>
      <Label x="180" y="154">
        ボイラー
      </Label>
      <line x1="80" y1="200" x2="280" y2="200" stroke={safety} strokeWidth={strokePart} strokeDasharray="6 4" />
      <Label x="70" y="196" anchor="end" size={12} fill={safety}>
        水位
      </Label>
      <path d="M280 240 H400 V380 H180 V300" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Flow d="M400 250 V370 H190" marker="b2-hf-arrow" />
      <path d="M160 300 H200" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <Label x="430" y="320" anchor="start" size={12}>
        返り管
      </Label>
      <Label x="360" y="420" size={12} fill={stamp}>
        ループは水位より下
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        直接接続せず、逆流による空焚きを防ぐ
      </Label>
    </SvgBoard>
  );
}

export function ManholeFittingsDiagram() {
  return (
    <SvgBoard alt="マンホールと温水ボイラー附属品">
      <defs>
        <WaterPattern id="b2-mh-water" />
        <ArrowMarker id="b2-mh-arrow" />
        <clipPath id="b2-mh-shell">
          <ellipse cx="200" cy="220" rx="110" ry="140" />
        </clipPath>
        <clipPath id="b2-mh-hot">
          <rect x="400" y="100" width="240" height="280" rx="8" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-mh-shell)">
        <ellipse cx="200" cy="220" rx="110" ry="140" fill={graphite} fillOpacity="0.14" />
        <ellipse cx="200" cy="220" rx="110" ry="140" fill="url(#b2-mh-water)" />
        <Shade cx={168} cy={300} rx={70} ry={40} />
      </g>
      <ellipse cx="200" cy="220" rx="110" ry="140" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <ellipse cx="200" cy="220" rx="36" ry="50" fill={paper} stroke={stamp} strokeWidth={strokeMain} />
      <Label x="200" y="226" size={12} fill={stamp}>
        蓋は内側
      </Label>
      <Label x="200" y="70">
        マンホール
      </Label>
      <g clipPath="url(#b2-mh-hot)">
        <rect x="400" y="100" width="240" height="280" fill={graphite} fillOpacity="0.12" />
        <rect x="400" y="100" width="240" height="280" fill="url(#b2-mh-water)" />
        <Rim x={400} y={100} width={240} height={280} rx={8} />
        <Shade cx={430} cy={350} rx={80} ry={36} />
        <Highlight x1={416} x2={624} y={114} />
      </g>
      <rect x="400" y="100" width="240" height="280" rx="8" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="520" y="140">
        温水ボイラー
      </Label>
      <rect x="430" y="170" width="70" height="90" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="465" y="220" size={11}>
        水高計
      </Label>
      <Flow d="M640 200 V80 H560" marker="b2-mh-arrow" />
      <Label x="600" y="70" size={12} fill={safety}>
        逃がし管
      </Label>
      <circle cx="620" cy="300" r="22" fill={paper} stroke={stamp} strokeWidth={strokePart} />
      <Label x="620" y="348" size={11} fill={stamp}>
        逃がし弁
      </Label>
    </SvgBoard>
  );
}

export function SteamTrapDiagram() {
  const traps = [
    { x: 50, title: "フロート", note: "浮力で開く" },
    { x: 200, title: "バケット", note: "カップの浮沈" },
    { x: 350, title: "温度応答", note: "冷えると開く" },
    { x: 500, title: "ディスク", note: "流速で閉じる" },
  ];

  return (
    <SvgBoard alt="蒸気トラップ4方式">
      <Label x="360" y="80">
        蒸気は残し、復水と空気を抜く
      </Label>
      {traps.map((item, index) => (
        <g key={item.title}>
          <rect x={item.x} y="120" width="140" height="220" fill={paper} stroke={ink} strokeWidth={strokeMain} />
          <Highlight x1={item.x + 12} x2={item.x + 128} y={134} />
          <Label x={item.x + 70} y="160" size={13}>
            {item.title}
          </Label>
          {index === 0 ? <circle cx={item.x + 70} cy="228" r="22" fill={graphite} fillOpacity="0.18" stroke={ink} strokeWidth={strokePart} /> : null}
          {index === 1 ? <path d={`M${item.x + 48} 248 H${item.x + 92} V208 H${item.x + 48} Z`} fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} /> : null}
          {index === 2 ? <path d={`M${item.x + 50} 248 C${item.x + 50} 208 ${item.x + 90} 208 ${item.x + 90} 248`} fill="none" stroke={amber} strokeWidth={strokePart} /> : null}
          {index === 3 ? <ellipse cx={item.x + 70} cy="228" rx="24" ry="8" fill={paper} stroke={ink} strokeWidth={strokePart} /> : null}
          <Shade cx={item.x + 54} cy={248} rx={28} ry={12} />
          <Label x={item.x + 70} y="304" size={12} fill={graphite}>
            {item.note}
          </Label>
        </g>
      ))}
      <Label x="360" y="480" fill={graphite} size={12}>
        開閉の原理（浮力・温度・流速）で種類を見分ける
      </Label>
    </SvgBoard>
  );
}

export function TemperatureControllerDiagram() {
  return (
    <SvgBoard alt="オンオフ式温度調節器の模式">
      <defs>
        <ArrowMarker id="b2-tc-arrow" />
      </defs>
      <Label x="360" y="80">
        設定温度で燃焼を入／切する二位置動作
      </Label>
      <rect x="80" y="180" width="160" height="80" fill={amber} fillOpacity="0.22" stroke={ink} strokeWidth={strokePart} />
      <rect x="80" y="180" width="160" height="80" fill="none" stroke={amber} strokeWidth="10" opacity="0.25" />
      <Label x="160" y="226">
        感温部
      </Label>
      <Flow d="M240 220 H340" marker="b2-tc-arrow" />
      <rect x="340" y="160" width="140" height="120" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={354} x2={466} y={174} />
      <Shade cx={362} cy={260} rx={40} ry={18} />
      <Label x="410" y="210">
        ベローズ
      </Label>
      <Label x="410" y="232" size={12} fill={graphite}>
        膨張
      </Label>
      <Flow d="M480 220 H560" marker="b2-tc-arrow" />
      <rect x="560" y="180" width="100" height="80" fill={paper} stroke={safety} strokeWidth={strokePart} />
      <Label x="610" y="226" size={12} fill={safety}>
        接点
      </Label>
      <Label x="360" y="400" fill={graphite} size={12}>
        動作すきま（ディファレンシャル）でハンチングを抑える
      </Label>
      <Label x="360" y="480" fill={stamp} size={12}>
        安全弁の代わりにはならない
      </Label>
    </SvgBoard>
  );
}

export function StartupValvesDiagram() {
  const valves = [
    { x: 140, y: 360, label: "水面計 水・蒸気", state: "開", closed: false },
    { x: 310, y: 360, label: "排水コック", state: "閉", closed: true },
    { x: 480, y: 360, label: "空気抜き", state: "開→後閉", closed: false },
    { x: 620, y: 200, label: "主蒸気止め弁", state: "徐開", closed: false },
  ];

  return (
    <SvgBoard alt="たき始めの弁の開閉">
      <defs>
        <WaterPattern id="b2-sv-water" />
        <ArrowMarker id="b2-sv-arrow" />
        <clipPath id="b2-sv-boiler">
          <rect x="200" y="80" width="320" height="220" rx="8" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-sv-boiler)">
        <rect x="200" y="80" width="320" height="120" fill={paper} />
        <rect x="200" y="200" width="320" height="100" fill={graphite} fillOpacity="0.16" />
        <rect x="200" y="200" width="320" height="100" fill="url(#b2-sv-water)" />
        <Rim x={200} y={80} width={320} height={220} rx={8} />
        <Shade cx={236} cy={278} rx={90} ry={28} />
        <Highlight x1={216} x2={500} y={94} />
      </g>
      <rect x="200" y="80" width="320" height="220" rx="8" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="130">
        ボイラー
      </Label>
      <line x1="200" y1="200" x2="520" y2="200" stroke={safety} strokeWidth={strokePart} strokeDasharray="6 4" />
      <Label x="180" y="196" anchor="end" size={12} fill={safety}>
        水位
      </Label>
      <Flow d="M520 160 H610" marker="b2-sv-arrow" />
      {valves.map((item) => (
        <g key={item.label}>
          <circle
            cx={item.x}
            cy={item.y}
            r="16"
            fill={paper}
            stroke={item.closed ? stamp : ink}
            strokeWidth={item.closed ? strokeMain : strokePart}
          />
          <Shade cx={item.x - 4} cy={item.y + 6} rx={10} ry={6} />
          <Label x={item.x} y={item.y + 40} size={11}>
            {item.label}
          </Label>
          <Label x={item.x} y={item.y + 58} size={12} fill={item.closed ? stamp : safety}>
            {item.state}
          </Label>
        </g>
      ))}
    </SvgBoard>
  );
}

export function GaugeGlassDiagram() {
  return (
    <SvgBoard alt="ガラス水面計の三つのコック">
      <defs>
        <WaterPattern id="b2-gg-water" />
        <clipPath id="b2-gg-boiler">
          <rect x="80" y="80" width="220" height="320" rx="8" />
        </clipPath>
        <clipPath id="b2-gg-glass">
          <rect x="400" y="140" width="36" height="200" rx="4" />
        </clipPath>
      </defs>
      <g clipPath="url(#b2-gg-boiler)">
        <rect x="80" y="80" width="220" height="140" fill={paper} />
        <rect x="80" y="220" width="220" height="180" fill={graphite} fillOpacity="0.16" />
        <rect x="80" y="220" width="220" height="180" fill="url(#b2-gg-water)" />
        <Rim x={80} y={80} width={220} height={320} rx={8} />
        <Shade cx={118} cy={368} rx={80} ry={36} />
        <Highlight x1={96} x2={280} y={94} />
      </g>
      <rect x="80" y="80" width="220" height="320" rx="8" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="190" y="120">
        ボイラー
      </Label>
      <line x1="80" y1="220" x2="300" y2="220" stroke={safety} strokeWidth={strokePart} />
      <g clipPath="url(#b2-gg-glass)">
        <rect x="400" y="140" width="36" height="100" fill={paper} />
        <rect x="400" y="240" width="36" height="100" fill={graphite} fillOpacity="0.18" />
        <rect x="400" y="240" width="36" height="100" fill="url(#b2-gg-water)" />
      </g>
      <rect x="400" y="140" width="36" height="200" rx="4" fill="none" stroke={ink} strokeWidth={strokePart} />
      <line x1="400" y1="240" x2="436" y2="240" stroke={safety} strokeWidth={strokePart} />
      <path d="M300 180 H400" stroke={graphite} strokeWidth={strokePart} />
      <path d="M300 260 H400" stroke={graphite} strokeWidth={strokePart} />
      <circle cx="360" cy="180" r="12" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="360" cy="260" r="12" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="418" cy="360" r="12" fill={paper} stroke={stamp} strokeWidth={strokeMain} />
      <Label x="500" y="184" anchor="start" size={12}>
        蒸気側コック（開）
      </Label>
      <Label x="500" y="264" anchor="start" size={12}>
        水側コック（開）
      </Label>
      <Label x="500" y="364" anchor="start" size={12} fill={stamp}>
        排水コック（閉）
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        機能試験：吹き下ろしのあと、水面が戻るかを見る
      </Label>
    </SvgBoard>
  );
}

export function SafetyValveLeakDiagram() {
  return (
    <SvgBoard alt="安全弁の弁体と弁座">
      <path d="M360 80 V160" stroke={ink} strokeWidth="6" />
      <path d="M300 160 H420 L390 250 H330 Z" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Highlight x1={312} x2={408} y={172} />
      <Shade cx={330} cy={230} rx={36} ry={16} />
      <Label x="450" y="180" anchor="start">
        ばね
      </Label>
      <path d="M330 250 L300 280 H420 L390 250" fill={amber} fillOpacity="0.22" stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="272" size={12}>
        弁体
      </Label>
      <path d="M240 280 H300 M420 280 H480" stroke={ink} strokeWidth={strokeMain} />
      <path d="M300 280 L270 340 H450 L420 280" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <Label x="360" y="330" size={12} fill={stamp}>
        弁座（当たり面）
      </Label>
      <Label x="360" y="400" fill={graphite} size={12}>
        傷・ごみ・浸食で漏れる。増し締めでは止まらない
      </Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        ワイヤドローイングが進むと漏れが拡大する
      </Label>
    </SvgBoard>
  );
}

export function SimpleSofteningDiagram() {
  return (
    <SvgBoard alt="残留硬度と処理水量のグラフ">
      <path d="M80 160 H640 M80 240 H640 M80 320 H640 M80 400 H640" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M200 80 V420 M360 80 V420 M520 80 V420" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M80 380 H360 V420 H80 Z" fill={safety} fillOpacity="0.08" />
      <path d="M80 420 H640 M80 420 V80" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="500">
        処理水量
      </Label>
      <Label x="40" y="80" anchor="start" size={12}>
        残留硬度
      </Label>
      <path d="M80 380 H360 C400 378 420 200 520 120 H640" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <circle cx="360" cy="378" r="7" fill={paper} stroke={stamp} strokeWidth={strokeMain} />
      <Label x="360" y="356" size={12} fill={stamp}>
        貫流点 P
      </Label>
      <Label x="200" y="360" size={12} fill={graphite}>
        軟化域
      </Label>
      <Label x="560" y="200" size={12} fill={graphite}>
        硬度が漏れ始める
      </Label>
      <Label x="200" y="450" size={12} fill={graphite}>
        A 処理水量
      </Label>
      <Label x="80" y="300" size={12} fill={graphite} anchor="start">
        B 残留硬度
      </Label>
    </SvgBoard>
  );
}

export function LiquidFuelSupplyDiagram() {
  const units = [
    { x: 40, t: "貯蔵タンク" },
    { x: 170, t: "サービス" },
    { x: 300, t: "ストレーナ" },
    { x: 430, t: "ポンプ" },
    { x: 560, t: "ヒータ" },
  ];

  return (
    <SvgBoard alt="液体燃料の供給系統">
      <defs>
        <ArrowMarker id="b2-lf-arrow" />
      </defs>
      <Label x="360" y="120">
        貯蔵 → ろ過 → 加圧 → 加熱 → 噴霧
      </Label>
      {units.map((item, index) => (
        <g key={item.t}>
          <rect x={item.x} y="200" width="110" height="80" fill={amber} fillOpacity="0.16" stroke={ink} strokeWidth={strokeMain} />
          <Rim x={item.x} y={200} width={110} height={80} />
          <Shade cx={item.x + 24} cy={268} rx={36} ry={16} />
          <Highlight x1={item.x + 10} x2={item.x + 100} y={212} />
          <Label x={item.x + 55} y="246" size={12}>
            {item.t}
          </Label>
          {index < 4 ? <Flow d={`M${item.x + 110} 240 H${item.x + 168}`} marker="b2-lf-arrow" /> : null}
        </g>
      ))}
      <circle cx="640" cy="360" r="28" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Flame x={640} y={354} s={0.85} />
      <Flow d="M615 240 H640 V328" marker="b2-lf-arrow" />
      <Label x="640" y="410" size={12}>
        バーナ
      </Label>
    </SvgBoard>
  );
}

export function OilBurnerDiagram() {
  const kinds = [
    { x: 50, t: "圧力噴霧", n: "油自身の圧力" },
    { x: 260, t: "空気噴霧", n: "空気で吹き飛ばす" },
    { x: 470, t: "蒸気噴霧", n: "蒸気で吹き飛ばす" },
  ];

  return (
    <SvgBoard alt="油バーナの霧化方式">
      <Label x="360" y="80">
        何で霧化するかで種類を見分ける
      </Label>
      {kinds.map((item, index) => (
        <g key={item.t}>
          <rect x={item.x} y="140" width="190" height="220" fill={paper} stroke={ink} strokeWidth={strokeMain} />
          <Highlight x1={item.x + 14} x2={item.x + 176} y={154} />
          <Shade cx={item.x + 40} cy={330} rx={50} ry={20} />
          <Label x={item.x + 95} y="186">
            {item.t}
          </Label>
          <circle cx={item.x + 60} cy="250" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
          <path
            d={`M${item.x + 72} 250 L${item.x + 150} 230 M${item.x + 72} 250 L${item.x + 150} 250 M${item.x + 72} 250 L${item.x + 150} 270`}
            fill="none"
            stroke={amber}
            strokeWidth={strokePart}
          />
          {index > 0 ? (
            <path
              d={`M${item.x + 60} 220 L${item.x + 150} 236`}
              fill="none"
              stroke={graphite}
              strokeWidth={strokeGuide}
            />
          ) : null}
          <Label x={item.x + 95} y="320" size={12} fill={graphite}>
            {item.n}
          </Label>
        </g>
      ))}
      <Label x="360" y="420" fill={graphite} size={12}>
        圧力噴霧は低負荷に弱い。蒸気噴霧は高粘度向き
      </Label>
    </SvgBoard>
  );
}

export function GasCombustionDiagram() {
  return (
    <SvgBoard alt="拡散燃焼と予混合燃焼">
      <rect x="50" y="100" width="280" height="300" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={66} x2={314} y={114} />
      <Label x="190" y="140">
        拡散
      </Label>
      <path d="M190 188 V300" stroke={amber} strokeWidth="10" opacity="0.35" />
      <Flame x={190} y={300} s={1.6} />
      <Label x="190" y="360" size={12} fill={graphite}>
        出してから混ざる
      </Label>
      <rect x="390" y="100" width="280" height="300" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={406} x2={654} y={114} />
      <Label x="530" y="140">
        予混合
      </Label>
      <rect x="460" y="190" width="140" height="50" fill={safety} fillOpacity="0.1" stroke={safety} strokeWidth={strokePart} />
      <Label x="530" y="220" size={12} fill={safety}>
        先に混合
      </Label>
      <Flame x={530} y={280} s={0.9} />
      <Label x="530" y="360" size={12} fill={stamp}>
        逆火に注意
      </Label>
    </SvgBoard>
  );
}

export function PrimarySecondaryAirDiagram() {
  return (
    <SvgBoard alt="一次空気と二次空気の流れ">
      <defs>
        <ArrowMarker id="b2-ps-arrow" />
        <clipPath id="b2-ps-furnace">
          <rect x="260" y="140" width="200" height="220" rx="8" />
        </clipPath>
      </defs>
      <Label x="360" y="80">
        一次は根元と霧化、二次は燃え切り
      </Label>
      <g clipPath="url(#b2-ps-furnace)">
        <rect x="260" y="140" width="200" height="220" fill={amber} fillOpacity="0.2" />
        <rect x="260" y="140" width="200" height="220" rx="8" fill="none" stroke={amber} strokeWidth="16" opacity="0.28" />
        <Shade cx={292} cy={330} rx={70} ry={36} />
        <Flame x={360} y={300} s={1.5} />
      </g>
      <rect x="260" y="140" width="200" height="220" rx="8" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="176">
        火炉
      </Label>
      <Flow d="M80 250 H250" marker="b2-ps-arrow" />
      <Label x="160" y="230" size={12} fill={safety}>
        一次空気
      </Label>
      <path d="M80 180 H250" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <path d="M80 320 H250" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <Label x="160" y="164" size={12} fill={graphite}>
        二次空気
      </Label>
      <Label x="160" y="348" size={12} fill={graphite}>
        二次空気
      </Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        空気比は一次と二次の合計
      </Label>
    </SvgBoard>
  );
}

export function DraftFanDiagram() {
  return (
    <SvgBoard alt="押込通風と誘引通風">
      <defs>
        <ArrowMarker id="b2-df-arrow" />
      </defs>
      <Label x="360" y="80">
        両方使うと平衡通風
      </Label>
      <rect x="260" y="180" width="200" height="140" fill={amber} fillOpacity="0.12" stroke={ink} strokeWidth={strokeMain} />
      <Rim x={260} y={180} width={200} height={140} />
      <Shade cx={292} cy={300} rx={60} ry={24} />
      <Label x="360" y="256">
        火炉
      </Label>
      <circle cx="140" cy="250" r="40" fill={paper} stroke={safety} strokeWidth={strokePart} />
      <Shade cx={128} cy={268} rx={22} ry={12} />
      <Label x="140" y="256" size={12} fill={safety}>
        押込
      </Label>
      <circle cx="580" cy="250" r="40" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Shade cx={568} cy={268} rx={22} ry={12} />
      <Label x="580" y="256" size={12} fill={graphite}>
        誘引
      </Label>
      <Flow d="M180 250 H255" marker="b2-df-arrow" />
      <Flow d="M460 250 H535" marker="b2-df-arrow" />
      <Label x="140" y="360" size={12}>
        空気を押す
      </Label>
      <Label x="580" y="360" size={12}>
        ガスを引く
      </Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        後向き羽根は効率、前向き羽根は圧力向き
      </Label>
    </SvgBoard>
  );
}

export function BoilerRoomClearanceDiagram() {
  return (
    <SvgBoard alt="ボイラー室の離隔距離">
      <rect x="80" y="80" width="560" height="360" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Highlight x1={96} x2={620} y={94} />
      <rect x="200" y="180" width="240" height="160" fill={graphite} fillOpacity="0.1" stroke={ink} strokeWidth={strokeMain} />
      <Rim x={200} y={180} width={240} height={160} />
      <Shade cx={232} cy={318} rx={70} ry={28} />
      <Highlight x1={216} x2={420} y={194} />
      <Label x="320" y="264">
        ボイラー
      </Label>
      <path d="M80 260 H200" stroke={stamp} strokeWidth={strokeGuide} />
      <path d="M88 254 V266 M192 254 V266" stroke={stamp} strokeWidth={strokeGuide} />
      <Label x="140" y="248" size={12} fill={stamp}>
        45cm以上
      </Label>
      <path d="M320 80 V180" stroke={stamp} strokeWidth={strokeGuide} />
      <path d="M314 88 H326 M314 172 H326" stroke={stamp} strokeWidth={strokeGuide} />
      <Label x="400" y="140" size={12} fill={stamp} anchor="start">
        上方 1.2m以上
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        最外側から測る。点検と避難のための間隔
      </Label>
    </SvgBoard>
  );
}
