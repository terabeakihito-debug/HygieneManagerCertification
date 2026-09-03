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
    <text
      x={x}
      y={y}
      fill={fill}
      fontSize={size}
      textAnchor={anchor}
      fontFamily="ui-sans-serif, 'IPAGothic', 'Noto Sans CJK JP', 'Hiragino Sans', sans-serif"
    >
      {children}
    </text>
  );
}

function ArrowMarker({ id, fill = safety }: { id: string; fill?: string }) {
  return (
    <marker id={id} viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto">
      <path d="M0 1 L10 5 L0 9 Z" fill={fill} />
    </marker>
  );
}

export function XrayTubeStructureDiagram() {
  return (
    <SvgBoard alt="エックス線管の陰極、陽極、ターゲットの断面">
      <defs>
        <ArrowMarker id="xray-tube-flow" />
      </defs>
      <ellipse cx="360" cy="250" rx="250" ry="120" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="150" y="210" width="70" height="80" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M185 250 H220" stroke={amber} strokeWidth={strokeMain} />
      <circle cx="228" cy="250" r="8" fill={amber} />
      <rect x="470" y="175" width="90" height="150" rx="6" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M470 250 L430 220 L430 280 Z" fill={safety} fillOpacity={0.18} stroke={safety} strokeWidth={strokePart} />
      <path d="M236 250 L428 236" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#xray-tube-flow)" />
      <path d="M448 268 L560 360" fill="none" stroke={stamp} strokeWidth="2.6" markerEnd="url(#xray-tube-flow)" />
      <ellipse cx="360" cy="390" rx="90" ry="16" fill={ink} fillOpacity={shadeOpacity} />
      <Label x="185" y="198">陰極</Label>
      <Label x="185" y="318" size={12} fill={graphite}>
        フィラメント
      </Label>
      <Label x="515" y="162">陽極</Label>
      <Label x="412" y="198" size={12} fill={safety}>
        ターゲット
      </Label>
      <Label x="300" y="228" size={12} fill={safety}>
        電子
      </Label>
      <Label x="560" y="390" size={12} fill={stamp}>
        エックス線
      </Label>
    </SvgBoard>
  );
}

export function XrayCharacteristicKSeriesDiagram() {
  return (
    <SvgBoard alt="K殻とL殻、M殻のエネルギー準位と特性エックス線">
      <defs>
        <ArrowMarker id="xray-k-trans" />
      </defs>
      <path d="M160 140 H560" stroke={ink} strokeWidth={strokePart} />
      <path d="M160 260 H560" stroke={ink} strokeWidth={strokePart} />
      <path d="M160 360 H560" stroke={ink} strokeWidth={strokePart} />
      <circle cx="240" cy="140" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="240" cy="260" r="10" fill={amber} />
      <circle cx="240" cy="360" r="10" fill={safety} />
      <path d="M250 260 L250 150" fill="none" stroke={stamp} strokeWidth="2.6" markerEnd="url(#xray-k-trans)" />
      <path d="M430 360 L430 150" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#xray-k-trans)" />
      <Label x="120" y="146" anchor="end">K</Label>
      <Label x="120" y="266" anchor="end">L</Label>
      <Label x="120" y="366" anchor="end">M</Label>
      <Label x="280" y="210" fill={stamp}>Kα</Label>
      <Label x="460" y="250" fill={safety}>Kβ</Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        空孔を外殻電子が埋める
      </Label>
      <Label x="360" y="90" size={12} fill={graphite}>
        エネルギー準位（上ほど高い）
      </Label>
    </SvgBoard>
  );
}

export function XrayInteractionsDiagram() {
  return (
    <SvgBoard alt="光電効果、コンプトン効果、レイリー散乱の模式">
      <defs>
        <ArrowMarker id="xray-int-a" />
        <ArrowMarker id="xray-int-b" fill={stamp} />
      </defs>
      {[
        { x: 130, title: "光電効果" },
        { x: 360, title: "コンプトン効果" },
        { x: 590, title: "レイリー散乱" },
      ].map((col) => (
        <Label key={col.title} x={col.x} y="70">
          {col.title}
        </Label>
      ))}
      <circle cx="130" cy="260" r="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="130" cy="260" r="8" fill={amber} />
      <path d="M60 200 L108 244" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-int-a)" />
      <path d="M138 248 L190 190" fill="none" stroke={stamp} strokeWidth="2.4" markerEnd="url(#xray-int-b)" />
      <Label x="70" y="186" size={12} fill={safety}>光子</Label>
      <Label x="198" y="180" size={12} fill={stamp}>光電子</Label>
      <circle cx="360" cy="260" r="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="360" cy="260" r="8" fill={amber} />
      <path d="M290 200 L338 244" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-int-a)" />
      <path d="M378 240 L450 190" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-int-a)" />
      <path d="M368 272 L420 330" fill="none" stroke={stamp} strokeWidth="2.4" markerEnd="url(#xray-int-b)" />
      <Label x="458" y="180" size={12} fill={safety}>散乱光子</Label>
      <Label x="430" y="352" size={12} fill={stamp}>反跳電子</Label>
      <circle cx="590" cy="260" r="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M520 200 L568 244" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-int-a)" />
      <path d="M612 240 L670 190" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-int-a)" />
      <Label x="590" y="330" size={12} fill={graphite}>エネルギーほぼ不変</Label>
      <Label x="360" y="430" size={12} fill={graphite}>低エネルギー・高Zほど光電とレイリーが目立つ</Label>
    </SvgBoard>
  );
}

export function XrayScatterAnglesDiagram() {
  return (
    <SvgBoard alt="散乱角30度60度120度135度の配置">
      <defs>
        <ArrowMarker id="xray-sc-in" />
        <ArrowMarker id="xray-sc-out" fill={stamp} />
      </defs>
      <rect x="300" y="200" width="120" height="28" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="190" size={12}>鋼板またはAl</Label>
      <path d="M120 214 H300" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#xray-sc-in)" />
      <Label x="160" y="200" size={12} fill={safety}>入射</Label>
      <circle cx="360" cy="214" r="4" fill={ink} />
      <path d="M360 214 L520 130" fill="none" stroke={stamp} strokeWidth="2.2" markerEnd="url(#xray-sc-out)" />
      <path d="M360 214 L530 180" fill="none" stroke={stamp} strokeWidth="2.2" markerEnd="url(#xray-sc-out)" />
      <path d="M360 214 L160 300" fill="none" stroke={amber} strokeWidth="2.2" markerEnd="url(#xray-sc-out)" />
      <path d="M360 214 L200 360" fill="none" stroke={amber} strokeWidth="2.2" markerEnd="url(#xray-sc-out)" />
      <Label x="540" y="122" size={12} fill={stamp}>D 30°</Label>
      <Label x="555" y="176" size={12} fill={stamp}>C 60°</Label>
      <Label x="132" y="298" size={12} fill={amber}>B 120°</Label>
      <Label x="168" y="384" size={12} fill={amber}>A 135°</Label>
      <Label x="360" y="450" size={12} fill={graphite}>
        前方は小角、後方は大角。後方散乱は低Zが大きい
      </Label>
    </SvgBoard>
  );
}

export function XrayShieldThicknessDiagram() {
  return (
    <SvgBoard alt="焦点から5mと10m、鋼板遮蔽の幾何配置">
      <defs>
        <ArrowMarker id="xray-sh-beam" />
      </defs>
      <circle cx="90" cy="220" r="12" fill={ink} />
      <Label x="90" y="190" size={12}>焦点</Label>
      <path d="M102 220 H620" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-sh-beam)" />
      <rect x="250" y="188" width="18" height="64" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="259" y="176" size={12}>鋼</Label>
      <path d="M90 250 V270 M360 250 V270 M620 250 V270" stroke={graphite} strokeWidth={strokeGuide} />
      <path d="M90 270 H360" stroke={graphite} strokeWidth={strokeGuide} />
      <path d="M360 270 H620" stroke={graphite} strokeWidth={strokeGuide} />
      <Label x="225" y="300" size={12} fill={graphite}>5 m</Label>
      <Label x="490" y="300" size={12} fill={graphite}>10 m</Label>
      <Label x="360" y="160" size={12}>図Ⅰ 64 mSv/h</Label>
      <Label x="620" y="160" size={12}>図Ⅱ 2→0.5 mSv/h</Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        16 mSv/h × 1/8（10 mm）＝2 mSv/h。1/32 にする厚は 17 mm
      </Label>
    </SvgBoard>
  );
}

export function XrayControlledAreaDistanceDiagram() {
  return (
    <SvgBoard alt="焦点、P点、管理区域境界Q点の一直線">
      <defs>
        <ArrowMarker id="xray-ca-beam" />
      </defs>
      <circle cx="80" cy="230" r="12" fill={ink} />
      <Label x="80" y="200" size={12}>焦点</Label>
      <path d="M92 230 H640" fill="none" stroke={safety} strokeWidth="2.4" markerEnd="url(#xray-ca-beam)" />
      <circle cx="260" cy="230" r="7" fill={stamp} />
      <circle cx="560" cy="230" r="7" fill={safety} />
      <Label x="260" y="200">P</Label>
      <Label x="560" y="200">Q</Label>
      <path d="M80 270 H260" stroke={graphite} strokeWidth={strokeGuide} />
      <path d="M80 310 H560" stroke={graphite} strokeWidth={strokeGuide} />
      <Label x="170" y="292" size={12} fill={graphite}>4 m</Label>
      <Label x="320" y="332" size={12} fill={graphite}>r ≧ 26 m</Label>
      <rect x="480" y="150" width="150" height="44" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="555" y="178" size={12} fill={safety}>管理区域の外</Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        4 m で 52 mSv／3月 → 1.3 mSv まで逆二乗
      </Label>
    </SvgBoard>
  );
}

export function XrayGasDetectorCurveDiagram() {
  const points = "80,360 150,300 260,270 390,210 520,150 620,80";
  return (
    <SvgBoard alt="印加電圧と電離電流の特性曲線">
      <path d="M80 400 V80 M80 400 H660" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d={points} fill="none" stroke={safety} strokeWidth="3" />
      <path d="M150 400 V300 M260 400 V270 M390 400 V210 M520 400 V150" stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="370" y="430">印加電圧</Label>
      <Label x="46" y="90" size={12} anchor="start">電流</Label>
      <Label x="205" y="455" size={12} fill={graphite}>電離箱</Label>
      <Label x="325" y="455" size={12} fill={graphite}>比例</Label>
      <Label x="455" y="455" size={12} fill={graphite}>GM</Label>
      <Label x="590" y="70" size={12} fill={stamp}>連続放電</Label>
    </SvgBoard>
  );
}

export function XrayGmPlateauDiagram() {
  return (
    <SvgBoard alt="GM計数管のプラトー特性曲線">
      <path d="M80 400 V80 M80 400 H660" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M80 380 C160 370, 200 220, 260 180 S400 160, 520 150 S620 130, 660 70" fill="none" stroke={safety} strokeWidth="3" />
      <path d="M260 400 V180 M520 400 V150" stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="390" y="140" fill={safety}>プラトー</Label>
      <Label x="370" y="430">印加電圧</Label>
      <Label x="40" y="90" size={12} anchor="start">計数率</Label>
      <Label x="390" y="455" size={12} fill={graphite}>使用電圧は中央付近</Label>
    </SvgBoard>
  );
}

export function XrayScintillationDiagram() {
  return (
    <SvgBoard alt="シンチレータと光電子増倍管の構造">
      <defs>
        <ArrowMarker id="xray-sci-flow" />
      </defs>
      <rect x="70" y="190" width="90" height="120" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="200" y="170" width="70" height="160" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="270" y="190" width="280" height="120" fill={paper} stroke={safety} strokeWidth={strokePart} />
      {[0, 1, 2, 3, 4].map((i) => (
        <path
          key={i}
          d={`M${320 + i * 40} 220 L${340 + i * 40} 250 L${320 + i * 40} 280`}
          fill="none"
          stroke={ink}
          strokeWidth={strokeGuide}
        />
      ))}
      <rect x="550" y="210" width="50" height="80" fill={amber} fillOpacity={0.2} stroke={amber} strokeWidth={strokePart} />
      <path d="M40 250 H70" fill="none" stroke={stamp} strokeWidth="2.6" markerEnd="url(#xray-sci-flow)" />
      <path d="M160 250 H200" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#xray-sci-flow)" />
      <Label x="115" y="176" size={12}>シンチレータ</Label>
      <Label x="235" y="156" size={12}>光電面</Label>
      <Label x="410" y="176" size={12}>ダイノード</Label>
      <Label x="575" y="196" size={12}>陽極</Label>
      <Label x="40" y="230" size={12} fill={stamp} anchor="start">X / γ</Label>
      <Label x="360" y="430" size={12} fill={graphite}>光 → 電子 → 増倍 → パルス</Label>
    </SvgBoard>
  );
}

export function XrayEffectiveDosePlacementDiagram() {
  return (
    <SvgBoard alt="頭頸部、胸部、腹部の線量計位置とHEEの係数">
      <ellipse cx="220" cy="130" rx="36" ry="44" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="186" y="174" width="68" height="90" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="186" y="264" width="68" height="80" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="220" cy="130" r="7" fill={stamp} />
      <circle cx="220" cy="214" r="7" fill={safety} />
      <circle cx="220" cy="300" r="7" fill={amber} />
      <Label x="220" y="88" size={12}>Ha 頭・頸部</Label>
      <Label x="330" y="220" size={12} anchor="start">Hb 胸・上腕</Label>
      <Label x="330" y="306" size={12} anchor="start">Hc 腹・大腿</Label>
      <Label x="500" y="150" size={13} anchor="start">0.08 Ha</Label>
      <Label x="500" y="190" size={13} anchor="start">0.44 Hb</Label>
      <Label x="500" y="230" size={13} anchor="start">0.45 Hc</Label>
      <Label x="500" y="270" size={13} anchor="start">0.03 Hm</Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        HEE＝合計。防護衣下の胸を Hb と Hc に使う
      </Label>
    </SvgBoard>
  );
}

export function XrayCalibrationInterpolationDiagram() {
  return (
    <SvgBoard alt="校正定数の線形補間グラフ">
      <path d="M90 400 V80 M90 400 H640" fill="none" stroke={ink} strokeWidth={strokePart} />
      <circle cx="180" cy="300" r="6" fill={safety} />
      <circle cx="360" cy="246" r="6" fill={stamp} />
      <circle cx="540" cy="180" r="6" fill={safety} />
      <path d="M180 300 L540 180" fill="none" stroke={safety} strokeWidth="2.6" />
      <path d="M360 246 V400 M360 246 H90" stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="180" y="430" size={12}>120 keV</Label>
      <Label x="360" y="430" size={12}>180</Label>
      <Label x="540" y="430" size={12}>250 keV</Label>
      <Label x="160" y="292" size={12} anchor="end">0.85</Label>
      <Label x="78" y="246" size={12} anchor="end">0.91</Label>
      <Label x="530" y="166" size={12}>0.98</Label>
      <Label x="370" y="70">校正定数 k</Label>
      <Label x="360" y="470" size={12} fill={graphite}>指示 0.36 mSv/h × 0.91 ≒ 0.33 mSv/h</Label>
    </SvgBoard>
  );
}

export function XrayTissueSensitivityDiagram() {
  const rows = [
    { y: 140, w: 420, label: "リンパ・骨髄・生殖腺・腸上皮" },
    { y: 230, w: 260, label: "皮膚基底細胞・血管内皮" },
    { y: 320, w: 140, label: "筋・神経・成熟骨" },
  ];
  return (
    <SvgBoard alt="組織の放射線感受性の高低">
      {rows.map((row) => (
        <g key={row.label}>
          <rect x="160" y={row.y} width={row.w} height="44" fill={safety} fillOpacity={0.16} stroke={safety} strokeWidth={strokePart} />
          <Label x="170" y={row.y + 28} anchor="start" size={14}>
            {row.label}
          </Label>
        </g>
      ))}
      <Label x="80" y="168" size={12} fill={stamp}>高い</Label>
      <Label x="80" y="348" size={12} fill={graphite}>低い</Label>
      <Label x="360" y="430" size={12} fill={graphite}>ベルゴニー・トリボンドーの法則</Label>
    </SvgBoard>
  );
}

export function XrayArsDoseDiagram() {
  return (
    <SvgBoard alt="急性放射線症候群の線量域と主症状">
      <rect x="80" y="160" width="180" height="160" fill={safety} fillOpacity={0.12} stroke={safety} strokeWidth={strokePart} />
      <rect x="270" y="160" width="180" height="160" fill={amber} fillOpacity={0.16} stroke={amber} strokeWidth={strokePart} />
      <rect x="460" y="160" width="180" height="160" fill={stamp} fillOpacity={0.12} stroke={stamp} strokeWidth={strokePart} />
      <Label x="170" y="200">造血器</Label>
      <Label x="360" y="200">消化管</Label>
      <Label x="550" y="200">中枢神経</Label>
      <Label x="170" y="250" size={12} fill={graphite}>約 1 Gy〜</Label>
      <Label x="360" y="250" size={12} fill={graphite}>約 10 Gy〜</Label>
      <Label x="550" y="250" size={12} fill={graphite}>数十 Gy</Label>
      <Label x="360" y="400" size={12} fill={graphite}>線量増で潜伏期は短く、主座が移る</Label>
    </SvgBoard>
  );
}

export function XrayRbeLetDiagram() {
  return (
    <SvgBoard alt="LETとRBEの山型の関係">
      <path d="M80 400 V80 M80 400 H660" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M90 340 C220 330, 300 120, 430 110 S560 200, 640 300" fill="none" stroke={safety} strokeWidth="3" />
      <Label x="370" y="430">LET</Label>
      <Label x="48" y="90" size={12} anchor="start">RBE</Label>
      <Label x="430" y="96" size={12} fill={safety}>最大付近</Label>
      <Label x="360" y="470" size={12} fill={graphite}>高すぎる LET ではオーバーキルで低下</Label>
    </SvgBoard>
  );
}

export function XrayBloodCellChangeDiagram() {
  return (
    <SvgBoard alt="血球種類ごとの減少の速さ">
      <path d="M80 400 V80 M80 400 H660" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M90 120 C180 200, 220 320, 640 360" fill="none" stroke={stamp} strokeWidth="2.8" />
      <path d="M90 120 C240 140, 320 260, 640 300" fill="none" stroke={amber} strokeWidth="2.8" />
      <path d="M90 120 C300 130, 420 170, 640 210" fill="none" stroke={safety} strokeWidth="2.8" />
      <Label x="370" y="430">時間</Label>
      <Label x="40" y="90" size={12} anchor="start">血球数</Label>
      <Label x="200" y="300" size={12} fill={stamp}>リンパ球</Label>
      <Label x="320" y="250" size={12} fill={amber}>顆粒球・血小板</Label>
      <Label x="480" y="180" size={12} fill={safety}>赤血球</Label>
    </SvgBoard>
  );
}
