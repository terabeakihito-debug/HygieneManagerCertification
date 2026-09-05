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

export function PcCaissonSectionDiagram() {
  return (
    <SvgBoard alt="ニューマチックケーソンの断面。気こう室、シャフト、作業室、刃口、地下水位">
      <defs>
        <ArrowMarker id="pc-caisson-air" fill={amber} />
      </defs>
      <rect x="40" y="220" width="640" height="280" fill="#d9c9a8" />
      <rect x="40" y="300" width="640" height="200" fill="#c4b48f" />
      <path d="M40 300 H680" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="80" y="292" size={12} fill={safety} anchor="start">
        地下水位
      </Label>
      <rect x="250" y="70" width="220" height="70" rx="6" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="100">気こう室</Label>
      <Label x="360" y="122" size={12} fill={graphite}>
        加圧・減圧
      </Label>
      <rect x="300" y="140" width="120" height="200" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="250" size={12} fill={graphite}>
        シャフト
      </Label>
      <rect x="200" y="340" width="320" height="130" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="390">作業室</Label>
      <Label x="360" y="414" size={12} fill={amber}>
        圧縮空気
      </Label>
      <path d="M200 470 L180 500 H540 L520 470 Z" fill={graphite} fillOpacity={0.35} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="494" size={12}>
        刃口
      </Label>
      <path d="M470 105 H560 V200" fill="none" stroke={amber} strokeWidth={strokeMain} markerEnd="url(#pc-caisson-air)" />
      <Label x="600" y="130" size={12} fill={amber} anchor="start">
        送気
      </Label>
      <Label x="80" y="360" size={12} fill={graphite} anchor="start">
        周囲地盤
      </Label>
      <Label x="360" y="530" size={12} fill={safety}>
        作業室の気圧が地下水の浸入とボイリングを抑える
      </Label>
    </SvgBoard>
  );
}

export function PcCentreDiagram() {
  return (
    <SvgBoard alt="作業室天井を支えるセントル。鋼製セントルと土砂セントル">
      <rect x="40" y="80" width="300" height="380" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="380" y="80" width="300" height="380" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="58">鋼製セントル</Label>
      <Label x="530" y="58">土砂セントル</Label>
      <path d="M70 200 H310" stroke={ink} strokeWidth={strokeMain} />
      <path d="M90 200 V360 M270 200 V360" stroke={ink} strokeWidth={strokePart} />
      <path d="M90 360 H270" stroke={ink} strokeWidth={strokePart} />
      <path d="M140 200 V300 M220 200 V300" stroke={graphite} strokeWidth={strokeGuide} />
      <Label x="190" y="190" size={12} fill={graphite}>
        作業室天井の型枠
      </Label>
      <Label x="190" y="390" size={12} fill={graphite}>
        不等沈下で全体がねじれ得る
      </Label>
      <Label x="190" y="420" size={12} fill={stamp}>
        撤去時沈下が大きい予測では使わない
      </Label>
      <rect x="430" y="210" width="200" height="90" fill="#c4b48f" stroke={ink} strokeWidth={strokePart} />
      <path d="M410 210 H650" stroke={ink} strokeWidth={strokeMain} />
      <Label x="530" y="200" size={12} fill={graphite}>
        盛土で天井を支える
      </Label>
      <Label x="530" y="330" size={12} fill={safety}>
        鋼製セントルの撤去沈下が大きいとき
      </Label>
      <Label x="530" y="358" size={12} fill={safety}>
        土砂セントルを採用する
      </Label>
      <Label x="360" y="490" size={12} fill={graphite}>
        材料で二分する。採用の向きを逆にしない
      </Label>
    </SvgBoard>
  );
}

export function PcTunnelShieldDiagram() {
  return (
    <SvgBoard alt="圧気シールドの切羽と、上端から2D/3の位置に合わせる圧気圧">
      <defs>
        <ArrowMarker id="pc-tunnel-d" />
      </defs>
      <rect x="80" y="80" width="280" height="380" rx="8" fill="#d7e4ea" stroke={ink} strokeWidth={strokePart} />
      <rect x="360" y="140" width="220" height="260" rx="6" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <path d="M360 140 V400" stroke={amber} strokeWidth={strokeMain} />
      <Label x="220" y="60">地山・地下水</Label>
      <Label x="470" y="122">シールド</Label>
      <Label x="470" y="280" size={12} fill={graphite}>
        作業室
      </Label>
      <path d="M70 140 H360" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="90" y="132" size={12} fill={safety} anchor="start">
        切羽上端
      </Label>
      <path d="M70 314 H360" stroke={stamp} strokeWidth={strokeMain} />
      <Label x="90" y="306" size={12} fill={stamp} anchor="start">
        上端から 2D/3
      </Label>
      <path d="M70 400 H360" stroke={graphite} strokeWidth={strokeGuide} />
      <Label x="90" y="424" size={12} fill={graphite} anchor="start">
        切羽下端
      </Label>
      <path d="M620 140 V400" stroke={ink} strokeWidth={strokePart} markerEnd="url(#pc-tunnel-d)" />
      <Label x="650" y="270" size={12} fill={graphite} anchor="start">
        D
      </Label>
      <Label x="470" y="454" size={12} fill={stamp}>
        圧気圧はこの高さの水圧に合わせる
      </Label>
      <Label x="360" y="500" size={12} fill={graphite}>
        下端から2D/3に合わせると過大になる
      </Label>
      <Label x="360" y="524" size={12} fill={graphite}>
        上部が乾燥して強度が落ちない範囲に抑える
      </Label>
    </SvgBoard>
  );
}

export function PcForceBalanceDiagram() {
  return (
    <SvgBoard alt="ケーソン沈下の力のつり合い。周面摩擦は外周の沈下深さ全長に上向き。刃口反力は無視">
      <defs>
        <ArrowMarker id="pc-force-down" fill={stamp} />
        <ArrowMarker id="pc-force-up" fill={safety} />
      </defs>
      <rect x="220" y="90" width="200" height="70" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="320" y="132">載荷荷重 W2</Label>
      <rect x="200" y="160" width="240" height="220" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="320" y="250">ケーソン自重 W1</Label>
      <rect x="210" y="380" width="220" height="70" fill={amber} fillOpacity={shadeOpacity} stroke={amber} strokeWidth={strokePart} />
      <Label x="320" y="422" size={12} fill={amber}>
        作業室圧力 P
      </Label>
      <path d="M320 58 V88" stroke={stamp} strokeWidth="3" markerEnd="url(#pc-force-down)" />
      <path d="M320 468 V430" stroke={safety} strokeWidth="3" markerEnd="url(#pc-force-up)" />
      <path d="M176 340 V210" stroke={safety} strokeWidth="3" markerEnd="url(#pc-force-up)" />
      <path d="M464 340 V210" stroke={safety} strokeWidth="3" markerEnd="url(#pc-force-up)" />
      <Label x="120" y="280" size={12} fill={safety}>
        周面摩擦（外周・上向き）
      </Label>
      <Label x="560" y="150" size={12} fill={stamp} anchor="start">
        下向き: W1 + W2
      </Label>
      <Label x="560" y="180" size={12} fill={safety} anchor="start">
        上向き: 摩擦 + P×底面積
      </Label>
      <Label x="360" y="498" size={12} fill={graphite}>
        外径9m・深さ16m。W1＝850t、W2＝430t、摩擦力度8kN/m²
      </Label>
      <Label x="360" y="522" size={12} fill={graphite}>
        刃口反力・浮力は無視。P≒0.14MPa（ゲージ）
      </Label>
    </SvgBoard>
  );
}

export function PcAirExhaustLayoutDiagram() {
  return (
    <SvgBoard alt="作業室の送気管吹出し口と排気管吸込み口を反対側に置く配置">
      <defs>
        <ArrowMarker id="pc-supply" fill={amber} />
        <ArrowMarker id="pc-exhaust" fill={graphite} />
      </defs>
      <rect x="80" y="120" width="560" height="280" rx="8" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="90">作業室</Label>
      <circle cx="180" cy="260" r="28" fill={amber} fillOpacity={0.2} stroke={amber} strokeWidth={strokeMain} />
      <Label x="180" y="264" size={12} fill={amber}>
        送気
      </Label>
      <circle cx="540" cy="260" r="28" fill={graphite} fillOpacity={0.15} stroke={graphite} strokeWidth={strokeMain} />
      <Label x="540" y="264" size={12} fill={graphite}>
        排気
      </Label>
      <path d="M220 260 H500" stroke={safety} strokeWidth="3" markerEnd="url(#pc-exhaust)" />
      <Label x="360" y="240" size={12} fill={safety}>
        室内を横断して換気する
      </Label>
      <path d="M180 160 V220" stroke={amber} strokeWidth={strokePart} markerEnd="url(#pc-supply)" />
      <path d="M540 300 V360" stroke={graphite} strokeWidth={strokePart} markerEnd="url(#pc-exhaust)" />
      <Label x="180" y="150" size={12} fill={amber}>
        吹出し口
      </Label>
      <Label x="540" y="390" size={12} fill={graphite}>
        吸込み口
      </Label>
      <Label x="360" y="440" size={12} fill={stamp}>
        同じ側に置くと短絡し、換気が悪い
      </Label>
      <Label x="360" y="470" size={12} fill={graphite}>
        換気中も室内圧の低下を最小にする
      </Label>
      <Label x="360" y="500" size={12} fill={graphite}>
        通常掘削は作業室送気を開き、ロック送気は閉じる
      </Label>
    </SvgBoard>
  );
}

export function PcRecompressionDiagram() {
  return (
    <SvgBoard alt="複室式再圧室。主室と副室を出入り以外は等圧に保つ">
      <rect x="80" y="140" width="280" height="220" rx="16" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="360" y="170" width="200" height="160" rx="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="548" y="210" width="50" height="80" rx="6" fill={hairline} stroke={ink} strokeWidth={strokeGuide} />
      <Label x="220" y="120">主室</Label>
      <Label x="460" y="150">副室</Label>
      <Label x="220" y="260" size={12} fill={graphite}>
        治療・再圧
      </Label>
      <Label x="460" y="260" size={12} fill={graphite}>
        出入り用
      </Label>
      <Label x="573" y="256" size={12}>
        扉
      </Label>
      <Label x="360" y="400" size={12} fill={safety}>
        出入り以外は主室と副室の圧力を等しく保つ
      </Label>
      <Label x="360" y="430" size={12} fill={stamp}>
        副室を低く保つ、は誤り
      </Label>
      <Label x="360" y="468" size={12} fill={graphite}>
        酸素再圧は換気を十分に行う。控えすぎない
      </Label>
      <Label x="360" y="496" size={12} fill={graphite}>
        加圧は0.18MPa(ゲージ)で止め、エアブレイクを挟む
      </Label>
    </SvgBoard>
  );
}

export function PcAirlockStandardsDiagram() {
  return (
    <SvgBoard alt="気こう室の床面積0.3平方メートル以上、気積0.6立方メートル以上の一人あたり基準">
      <rect x="160" y="100" width="400" height="260" rx="8" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <path d="M160 360 H560" stroke={amber} strokeWidth={strokeMain} />
      <Label x="360" y="80">気こう室</Label>
      <Label x="360" y="220" size={16}>
        1人あたり
      </Label>
      <Label x="360" y="252" size={14} fill={safety}>
        床面積 0.3 m² 以上
      </Label>
      <Label x="360" y="284" size={14} fill={safety}>
        気積 0.6 m³ 以上
      </Label>
      <Label x="360" y="400" size={12} fill={graphite}>
        両方を同時に満たす人数が上限
      </Label>
      <Label x="360" y="430" size={12} fill={stamp}>
        作業室の気積は1人あたり 4 m³ 以上。3 m³ ではない
      </Label>
      <Label x="360" y="462" size={12} fill={graphite}>
        例: 床 3.6 m²・気積 6.5 m³ なら最大10人。12人は気積不足
      </Label>
      <Label x="360" y="494" size={12} fill={graphite}>
        潜函の減圧用排気管は内径 53 mm 以下
      </Label>
    </SvgBoard>
  );
}
