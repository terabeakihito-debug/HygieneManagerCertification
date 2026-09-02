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
  strokePart,
  strokeMain,
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

function Highlight({ x1, x2, y }: { x1: number; x2: number; y: number }) {
  return (
    <>
      <path d={`M${x1} ${y} H${x2}`} fill="none" stroke={paper} strokeWidth={strokeGuide} />
      <path d={`M${x1 + 10} ${y + 9} H${x2 - 10}`} fill="none" stroke={hairline} strokeWidth={strokeGuide} />
    </>
  );
}

function Flow({ d, marker }: { d: string; marker: string }) {
  return <path d={d} fill="none" stroke={safety} strokeWidth="2.6" markerEnd={`url(#${marker})`} />;
}

function HatchFloor({ x, y, width }: { x: number; y: number; width: number }) {
  const ticks = Array.from({ length: 14 }, (_, i) => x + 8 + i * (width / 14));
  return (
    <g>
      <path d={`M${x} ${y} H${x + width}`} fill="none" stroke={ink} strokeWidth={strokePart} />
      {ticks.map((tick) => (
        <path key={tick} d={`M${tick} ${y} L${tick - 8} ${y + 12}`} fill="none" stroke={graphite} strokeWidth={strokeGuide} />
      ))}
    </g>
  );
}

export function MobileTypesModelsDiagram() {
  return (
    <SvgBoard alt="ラフテレーン、クローラ、トラック、オールテレーンの型式比較">
      <rect x="28" y="36" width="160" height="210" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="58" y="150" width="100" height="36" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <circle cx="78" cy="196" r="12" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="138" cy="196" r="12" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M108 150 V108" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M108 112 L168 78" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M168 78 V118" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="108" y="60">
        ラフテレーン
      </Label>
      <Label x="108" y="230" size={11} fill={graphite}>
        4種の操向
      </Label>
      <rect x="196" y="36" width="160" height="210" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="226" y="156" width="100" height="28" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <path d="M226 184 H326" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M276 156 V112" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M276 116 L336 82" fill="none" stroke={ink} strokeWidth="7" />
      <Label x="276" y="60">
        クローラ
      </Label>
      <Label x="276" y="230" size={11} fill={graphite}>
        履帯で接地
      </Label>
      <rect x="364" y="36" width="160" height="210" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="394" y="148" width="100" height="40" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <circle cx="412" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="438" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="486" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M444 148 V108" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M444 112 L504 78" fill="none" stroke={ink} strokeWidth="7" />
      <Label x="444" y="60">
        トラック
      </Label>
      <Label x="444" y="230" size={11} fill={graphite}>
        キャリア＋アウトリガ
      </Label>
      <rect x="532" y="36" width="160" height="210" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="562" y="148" width="100" height="40" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <circle cx="580" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="608" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="648" cy="198" r="10" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M612 148 V108" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M612 112 L672 78" fill="none" stroke={ink} strokeWidth="7" />
      <Label x="612" y="60">
        オールテレーン
      </Label>
      <Label x="612" y="230" size={11} fill={graphite}>
        油空圧サス
      </Label>
      <Highlight x1={40} x2={172} y={44} />
      <rect x="80" y="270" width="560" height="230" rx="8" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="360" y="306">
        ホイール系はＨ形またはＸ形の油圧アウトリガ
      </Label>
      <Label x="360" y="342" fill={graphite} size={12}>
        ラフテレーンは前二輪・後二輪・四輪・かに操向
      </Label>
      <Label x="360" y="378" fill={graphite} size={12}>
        積載形のＰＴＯは走行用原動機から取る。専用エンジンではない
      </Label>
      <Label x="360" y="414" fill={graphite} size={12}>
        オールテレーンは特殊操向とハイドロニューマチック
      </Label>
      <Label x="360" y="454" fill={graphite} size={12}>
        トラック用キャリアの軸数は上部旋回体の質量で変わる
      </Label>
    </SvgBoard>
  );
}

export function MobileTermsDimensionsDiagram() {
  return (
    <SvgBoard alt="つり上げ荷重、作業半径、総揚程の寸法関係">
      <defs>
        <ArrowMarker id="mc-term-arrow" />
      </defs>
      <HatchFloor x={80} y={400} width={560} />
      <rect x="200" y="300" width="150" height="70" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokeMain} />
      <rect x="150" y="370" width="44" height="30" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="356" y="370" width="44" height="30" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M275 300 V200" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M275 210 L520 120" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M520 120 V280" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="498" y="280" width="44" height="28" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="520" y="268" size={12}>
        フック
      </Label>
      <circle cx="275" cy="268" r="5" fill={stamp} />
      <Label x="258" y="258" size={12} anchor="end">
        旋回中心
      </Label>
      <Flow d="M275 430 H520" marker="mc-term-arrow" />
      <Label x="400" y="456">
        作業半径
      </Label>
      <path d="M560 120 V280" fill="none" stroke={amber} strokeWidth={strokeGuide} markerEnd="url(#mc-term-arrow)" />
      <Label x="600" y="200" anchor="start" size={12}>
        揚程
      </Label>
      <Label x="360" y="56">
        作業半径は旋回中心からフック中心までの水平距離
      </Label>
      <Label x="360" y="88" fill={graphite} size={12}>
        ジブフートピンからジブポイントまでの長さではない
      </Label>
      <Label x="360" y="500" size={12} fill={graphite}>
        つり上げ荷重はアウトリガ最大張出し・最短ジブ・最小半径で、つり具を含む
      </Label>
    </SvgBoard>
  );
}

export function MobileCrawlerUndercarriageDiagram() {
  return (
    <SvgBoard alt="クローラ下部走行体の前方遊動輪と後方起動輪">
      <rect x="90" y="150" width="540" height="70" fill={graphite} fillOpacity="0.14" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="192">
        走行フレーム
      </Label>
      <circle cx="170" cy="260" r="42" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="170" cy="260" r="14" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <Label x="170" y="264">
        遊動輪
      </Label>
      <circle cx="550" cy="260" r="42" fill={amber} fillOpacity="0.22" stroke={ink} strokeWidth={strokeMain} />
      <circle cx="550" cy="260" r="14" fill={ink} />
      <Label x="550" y="264" fill={paper} size={12}>
        起動輪
      </Label>
      <path d="M170 302 H550" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M128 260 H80 V320 H640 V260 H592" fill="none" stroke={ink} strokeWidth="8" />
      <Label x="170" y="120">
        前方
      </Label>
      <Label x="550" y="120">
        後方
      </Label>
      <path d="M212 248 H508" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="360" y="236" size={12} fill={safety}>
        クローラ中心距離
      </Label>
      <Label x="360" y="380">
        起動輪は後方。動力で回して履帯を送る
      </Label>
      <Label x="360" y="416" fill={graphite} size={12}>
        中心距離が長いほど前後の安定が良い。左右の安定ではない
      </Label>
      <Label x="360" y="452" fill={graphite} size={12}>
        平均接地圧＝全装備質量(t)×9.8 / 履帯の接地総面積(m²)
      </Label>
      <Label x="360" y="488" fill={graphite} size={12}>
        シュー幅を替えると接地圧が変わる。旋回速度は変わらない
      </Label>
    </SvgBoard>
  );
}

export function MobileUpperSlewDiagram() {
  return (
    <SvgBoard alt="ボールベアリング式旋回装置と上部旋回体">
      <defs>
        <ArrowMarker id="mc-slew-arrow" />
      </defs>
      <rect x="80" y="300" width="280" height="70" fill={graphite} fillOpacity="0.14" stroke={ink} strokeWidth={strokeMain} />
      <Label x="220" y="342">
        下部走行体
      </Label>
      <circle cx="220" cy="270" r="70" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="220" cy="270" r="48" fill="none" stroke={safety} strokeWidth="6" />
      <circle cx="268" cy="270" r="10" fill={amber} stroke={ink} strokeWidth={strokePart} />
      <Label x="220" y="186">
        旋回ベアリング
      </Label>
      <Label x="292" y="274" anchor="start" size={12}>
        ピニオン
      </Label>
      <rect x="160" y="80" width="240" height="120" rx="8" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="280" y="124">
        上部旋回体
      </Label>
      <Label x="280" y="150" size={12} fill={graphite}>
        巻上装置・運転室
      </Label>
      <rect x="430" y="100" width="90" height="70" fill={amber} fillOpacity="0.28" stroke={ink} strokeWidth={strokePart} />
      <Label x="475" y="142" size={12}>
        カウンタ
      </Label>
      <rect x="190" y="200" width="70" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="225" y="224" size={11}>
        モータ
      </Label>
      <Flow d="M225 236 V248" marker="mc-slew-arrow" />
      <Label x="360" y="420">
        モータ→減速機→ピニオンが旋回ギヤとかみ合う
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        カウンタウエイトは旋回フレーム後部。下部走行体ではない
      </Label>
      <Label x="360" y="492" fill={graphite} size={12}>
        ラフテレーンの運転室には走行用とクレーン用の両方がある
      </Label>
    </SvgBoard>
  );
}

export function MobileHoistClutchBrakeDiagram() {
  return (
    <SvgBoard alt="油圧モータから減速機、クラッチ、ドラムへ至る巻上装置">
      <defs>
        <ArrowMarker id="mc-hoist-arrow" />
      </defs>
      <rect x="50" y="150" width="120" height="90" rx="8" fill={graphite} fillOpacity="0.14" stroke={ink} strokeWidth={strokeMain} />
      <Label x="110" y="202">
        油圧モータ
      </Label>
      <rect x="200" y="160" width="110" height="70" rx="6" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="255" y="202">
        減速機
      </Label>
      <rect x="340" y="150" width="90" height="90" rx="6" fill={amber} fillOpacity="0.22" stroke={ink} strokeWidth={strokeMain} />
      <Label x="385" y="188" size={12}>
        クラッチ
      </Label>
      <Label x="385" y="210" size={11} fill={graphite}>
        油圧シリンダ
      </Label>
      <circle cx="540" cy="195" r="58" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="540" cy="195" r="18" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <path d="M540 253 V340" fill="none" stroke={safety} strokeWidth="4" />
      <path d="M528 340 H552" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="540" y="122">
        ドラム
      </Label>
      <Flow d="M170 195 H200" marker="mc-hoist-arrow" />
      <Flow d="M310 195 H340" marker="mc-hoist-arrow" />
      <Flow d="M430 195 H482" marker="mc-hoist-arrow" />
      <path d="M500 160 A70 40 0 0 1 580 160" fill="none" stroke={stamp} strokeWidth={strokePart} />
      <Label x="620" y="150" size={12} fill={stamp}>
        バンドブレーキ
      </Label>
      <rect x="80" y="390" width="560" height="110" rx="8" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="360" y="426">
        駆動の順はモータ→減速機→クラッチ→ドラム
      </Label>
      <Label x="360" y="462" size={12} fill={graphite}>
        クラッチに圧油を送らないと、軸が回ってもドラムは回らない
      </Label>
      <Shade cx={110} cy={238} rx={70} ry={18} />
    </SvgBoard>
  );
}

export function MobileWireRopeLayDiagram() {
  return (
    <SvgBoard alt="ラングよりと普通より、ＳよりとＺより">
      <rect x="40" y="40" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M80 80 C110 110 110 150 80 180 C50 210 50 240 90 230" fill="none" stroke={ink} strokeWidth="16" />
      <path d="M80 80 C110 110 110 150 80 180" fill="none" stroke={amber} strokeWidth="6" />
      <Label x="140" y="70">
        ラングＳより
      </Label>
      <Label x="140" y="236" size={11} fill={graphite}>
        ロープとストランドが同方向
      </Label>
      <rect x="260" y="40" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M360 80 C330 110 330 150 360 180 C390 210 390 240 350 230" fill="none" stroke={ink} strokeWidth="16" />
      <path d="M360 80 C330 110 330 150 360 180" fill="none" stroke={amber} strokeWidth="6" />
      <Label x="360" y="70">
        ラングＺより
      </Label>
      <Label x="360" y="236" size={11} fill={graphite}>
        同方向のＺ
      </Label>
      <rect x="480" y="40" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M580 80 C550 110 610 150 580 180 C550 210 610 240 570 230" fill="none" stroke={ink} strokeWidth="16" />
      <path d="M580 80 C610 100 550 140 580 170" fill="none" stroke={safety} strokeWidth="6" />
      <Label x="580" y="70">
        普通Ｚより
      </Label>
      <Label x="580" y="236" size={11} fill={graphite}>
        ロープとストランドが逆方向
      </Label>
      <Label x="360" y="300">
        Ｓよりは縦に見て左上から右下。Ｚよりは右上から左下
      </Label>
      <circle cx="200" cy="400" r="70" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="200" cy="400" r="18" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <circle cx="200" cy="348" r="14" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="244" cy="378" r="14" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="228" cy="430" r="14" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="172" cy="430" r="14" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="156" cy="378" r="14" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="200" y="318" size={12}>
        6よりの径は3方向の平均
      </Label>
      <Label x="430" y="380" anchor="start" size={12} fill={graphite}>
        ラングより＝同方向。普通より＝逆方向
      </Label>
      <Label x="430" y="414" anchor="start" size={12} fill={graphite}>
        1よりで素線の10パーセント切断、径減7パーセント超は禁止
      </Label>
      <Label x="430" y="448" anchor="start" size={12} fill={graphite}>
        クリップの座金とナットは引張側に当てる
      </Label>
    </SvgBoard>
  );
}

export function MobileRatedLoadTableDiagram() {
  return (
    <SvgBoard alt="定格総荷重表の強度側と安定側の境界">
      <Label x="360" y="40">
        アウトリガ最大張出しの定格総荷重（模式）
      </Label>
      <rect x="70" y="60" width="580" height="320" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M70 108 H650 M190 60 V380" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="130" y="92" size={12}>
        ジブ＼半径
      </Label>
      <Label x="250" y="92" size={12}>
        6.5m
      </Label>
      <Label x="360" y="92" size={12}>
        8.0m
      </Label>
      <Label x="470" y="92" size={12}>
        10.0m
      </Label>
      <Label x="580" y="92" size={12}>
        12.0m
      </Label>
      <Label x="130" y="148" size={12}>
        9.35m
      </Label>
      <Label x="250" y="148" size={12}>
        18.0
      </Label>
      <Label x="360" y="148" size={12}>
        12.5
      </Label>
      <Label x="470" y="148" size={12} fill={graphite}>
        —
      </Label>
      <Label x="580" y="148" size={12} fill={graphite}>
        —
      </Label>
      <Label x="130" y="214" size={12}>
        16.4m
      </Label>
      <Label x="250" y="214" size={12}>
        11.0
      </Label>
      <Label x="360" y="214" size={12}>
        8.4
      </Label>
      <Label x="470" y="214" size={12}>
        6.2
      </Label>
      <Label x="580" y="214" size={12}>
        4.8
      </Label>
      <Label x="130" y="280" size={12}>
        23.45m
      </Label>
      <Label x="250" y="280" size={12} fill={graphite}>
        —
      </Label>
      <Label x="360" y="280" size={12}>
        6.0
      </Label>
      <Label x="470" y="280" size={12}>
        4.7
      </Label>
      <Label x="580" y="280" size={12}>
        3.6
      </Label>
      <Label x="130" y="346" size={12}>
        30.5m
      </Label>
      <Label x="250" y="346" size={12} fill={graphite}>
        —
      </Label>
      <Label x="360" y="346" size={12} fill={graphite}>
        —
      </Label>
      <Label x="470" y="346" size={12}>
        3.4
      </Label>
      <Label x="580" y="346" size={12}>
        2.6
      </Label>
      <path d="M190 180 H310 V246 H650" fill="none" stroke={stamp} strokeWidth="5" />
      <Label x="250" y="176" size={11} fill={stamp}>
        強度
      </Label>
      <Label x="500" y="268" size={11} fill={stamp}>
        安定
      </Label>
      <Label x="360" y="420">
        太線の左上（短いジブ・小さい半径）が機体の強度で決まる側
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        例: ジブ9.35m・半径6.5mは強度側。長いジブの外周は安定側
      </Label>
      <Label x="360" y="492" fill={graphite} size={12}>
        数値は試験対策用の簡略値。実機の表そのものではない
      </Label>
    </SvgBoard>
  );
}

export function MobileWorkAreaStabilityDiagram() {
  return (
    <SvgBoard alt="トラッククレーンの前方・側方・後方の作業領域">
      <HatchFloor x={80} y={430} width={560} />
      <rect x="250" y="250" width="220" height="90" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokeMain} />
      <rect x="220" y="340" width="40" height="50" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="460" y="340" width="40" height="50" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="300" y="390" width="36" height="40" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <rect x="384" y="390" width="36" height="40" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <path d="M360 250 V180" fill="none" stroke={ink} strokeWidth="8" />
      <circle cx="360" cy="250" r="110" fill="none" stroke={hairline} strokeWidth={strokeGuide} strokeDasharray="6 6" />
      <path d="M360 180 L470 110" fill="none" stroke={ink} strokeWidth="7" />
      <Label x="360" y="160" size={12}>
        旋回中心
      </Label>
      <Label x="360" y="80">
        後方領域（最も安定）
      </Label>
      <Label x="120" y="240" anchor="start">
        側方
      </Label>
      <Label x="600" y="240" anchor="end">
        側方
      </Label>
      <Label x="360" y="480">
        前方領域
      </Label>
      <Label x="140" y="400" size={12} fill={graphite}>
        フロントジャッキ
      </Label>
      <Label x="360" y="516" size={12} fill={graphite}>
        前方は側方・後方より安定が悪い。全周同一性能にはフロントジャッキ
      </Label>
    </SvgBoard>
  );
}

export function MobilePascalPrincipleDiagram() {
  return (
    <SvgBoard alt="連絡した二つのシリンダに働くパスカルの原理">
      <rect x="110" y="160" width="90" height="200" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="118" y="250" width="74" height="102" fill={safety} fillOpacity="0.18" />
      <rect x="122" y="210" width="66" height="28" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <path d="M155 210 V140" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="155" y="120">
        9N
      </Label>
      <Label x="155" y="316">
        Ａ
      </Label>
      <Label x="155" y="384" size={12} fill={graphite}>
        直径1cm
      </Label>
      <rect x="420" y="80" width="180" height="280" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="432" y="220" width="156" height="132" fill={safety} fillOpacity="0.18" />
      <rect x="444" y="150" width="132" height="40" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <path d="M510 150 V70" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="510" y="56">
        81N
      </Label>
      <Label x="510" y="290">
        Ｂ
      </Label>
      <Label x="510" y="384" size={12} fill={graphite}>
        直径3cm
      </Label>
      <path d="M200 340 H420" fill="none" stroke={ink} strokeWidth="10" />
      <Label x="360" y="430">
        圧力は等しい。面積比は直径比の2乗で9倍
      </Label>
      <Label x="360" y="466" fill={graphite} size={12}>
        Ｐ＝Ｆ／Ａ。9Ｎ×（3／1）²＝81Ｎ
      </Label>
      <Label x="360" y="502" fill={graphite} size={12}>
        直径比3倍をそのまま掛けて27Ｎとする誤りに注意
      </Label>
    </SvgBoard>
  );
}

export function MobileHydraulicActuatorsDiagram() {
  return (
    <SvgBoard alt="複動シリンダとプランジャモータの配列">
      <rect x="60" y="80" width="280" height="200" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="90" y="140" width="220" height="70" fill={graphite} fillOpacity="0.1" stroke={ink} strokeWidth={strokeMain} />
      <rect x="150" y="148" width="70" height="54" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <path d="M220 175 H340" fill="none" stroke={ink} strokeWidth="6" />
      <Label x="200" y="116">
        複動シリンダ
      </Label>
      <Label x="110" y="168" size={11} fill={graphite}>
        油口
      </Label>
      <Label x="280" y="168" size={11} fill={graphite}>
        油口
      </Label>
      <circle cx="200" cy="370" r="86" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="200" cy="370" r="18" fill={ink} />
      <rect x="186" y="292" width="28" height="46" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <rect x="186" y="402" width="28" height="46" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <rect x="122" y="356" width="46" height="28" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <rect x="232" y="356" width="46" height="28" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="200" y="268">
        ラジアル形
      </Label>
      <rect x="400" y="80" width="260" height="200" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="470" y="120" width="40" height="120" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <rect x="530" y="120" width="40" height="120" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <path d="M450 180 H620" fill="none" stroke={ink} strokeWidth="8" />
      <Label x="530" y="116">
        アキシアル形
      </Label>
      <Label x="530" y="320" size={12} fill={graphite}>
        プランジャが軸方向
      </Label>
      <Label x="480" y="380">
        油圧モータは圧油で軸を回す
      </Label>
      <Label x="480" y="416" size={12} fill={graphite}>
        巻上げ・旋回・走行はプランジャモータが多い
      </Label>
      <Label x="480" y="456" size={12} fill={graphite}>
        ラジアル形を軸方向配列と書くのが誤り
      </Label>
    </SvgBoard>
  );
}

export function MobileHydraulicValvesDiagram() {
  return (
    <SvgBoard alt="シーケンス弁のスプール、一次側、二次側、調整ねじ、外部ドレン">
      <rect x="160" y="70" width="400" height="300" rx="10" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="250" y="110" width="70" height="180" rx="6" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <rect x="262" y="150" width="46" height="100" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="285" y="204" size={12}>
        スプール
      </Label>
      <path d="M160 240 H250" fill="none" stroke={safety} strokeWidth="6" />
      <Label x="140" y="236" anchor="end">
        一次側
      </Label>
      <path d="M320 200 H560" fill="none" stroke={safety} strokeWidth="6" />
      <Label x="580" y="196" anchor="start">
        二次側
      </Label>
      <path d="M285 110 V70" fill="none" stroke={ink} strokeWidth={strokePart} />
      <circle cx="285" cy="58" r="12" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="285" y="40" size={12}>
        調整ねじ
      </Label>
      <path d="M400 370 V410 H200" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <Label x="160" y="414" anchor="end" size={12}>
        外部ドレン
      </Label>
      <Label x="360" y="450">
        一次側圧力が設定値に達すると二次側へ流す
      </Label>
      <Label x="360" y="486" fill={graphite} size={12}>
        ジブ伸縮回路で使う代表がシーケンス弁。減圧弁やリリーフ弁と混同しない
      </Label>
    </SvgBoard>
  );
}

export function MobileForceCompositionMomentDiagram() {
  return (
    <SvgBoard alt="一点に働く力の合力と、鉛直線に対し30度で支える2本ロープ">
      <defs>
        <ArrowMarker id="mc-force-arrow" />
      </defs>
      <circle cx="160" cy="180" r="6" fill={ink} />
      <Label x="148" y="168" anchor="end">
        O
      </Label>
      <path d="M160 180 L160 60" fill="none" stroke={ink} strokeWidth={strokeMain} markerEnd="url(#mc-force-arrow)" />
      <Label x="176" y="80" anchor="start">
        P1
      </Label>
      <path d="M160 180 L280 230" fill="none" stroke={safety} strokeWidth={strokeMain} markerEnd="url(#mc-force-arrow)" />
      <Label x="294" y="246" anchor="start">
        P2
      </Label>
      <path d="M160 180 L60 250" fill="none" stroke={amber} strokeWidth={strokeMain} markerEnd="url(#mc-force-arrow)" />
      <Label x="48" y="268" anchor="end">
        P3
      </Label>
      <path d="M160 180 L220 140" fill="none" stroke={stamp} strokeWidth="4" markerEnd="url(#mc-force-arrow)" />
      <Label x="232" y="132" anchor="start">
        合力
      </Label>
      <path d="M500 70 V250" fill="none" stroke={hairline} strokeWidth={strokeGuide} strokeDasharray="6 6" />
      <Label x="516" y="88" anchor="start" size={12} fill={graphite}>
        鉛直線
      </Label>
      <path d="M500 220 L390 90" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M500 220 L610 90" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <rect x="476" y="220" width="48" height="32" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="500" y="242" size={12}>
        10kg
      </Label>
      <path d="M500 160 A40 40 0 0 0 478 124" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <path d="M500 160 A40 40 0 0 1 522 124" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="456" y="150" size={12}>
        30°
      </Label>
      <Label x="544" y="150" size={12}>
        30°
      </Label>
      <Label x="390" y="76" size={12} fill={graphite}>
        T
      </Label>
      <Label x="610" y="76" size={12} fill={graphite}>
        T
      </Label>
      <Label x="360" y="320">
        30°は鉛直線とロープのなす角。2本の間は60°
      </Label>
      <Label x="360" y="356" fill={graphite} size={12}>
        2T×cos30°＝98N、T≒57N。一直線上にない2力は大きい方へは動かない
      </Label>
      <Label x="360" y="396" fill={graphite} size={12}>
        力の三要素は大きさ、向き、作用点。つり合うとき合力は0
      </Label>
      <Label x="360" y="436" fill={graphite} size={12}>
        モーメントは M＝F×L。作用線の外へ移すと効果が変わる
      </Label>
    </SvgBoard>
  );
}

export function MobileBalanceBeamDiagram() {
  return (
    <SvgBoard alt="天びん棒の点A、支点O、点B、点Cとつり合う質量P">
      <defs>
        <ArrowMarker id="mc-beam-arrow" />
      </defs>
      <path d="M80 220 H640" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M260 220 L230 270 H290 Z" fill={ink} />
      <Label x="260" y="292">
        O
      </Label>
      <path d="M260 220 V160" fill="none" stroke={safety} strokeWidth="4" markerEnd="url(#mc-beam-arrow)" />
      <Label x="276" y="150" anchor="start">
        支点
      </Label>
      <path d="M140 220 V300" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="112" y="300" width="56" height="36" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="140" y="208">
        A
      </Label>
      <Label x="140" y="324">
        40kg
      </Label>
      <path d="M380 220 V300" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="352" y="300" width="56" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="380" y="208">
        B
      </Label>
      <Label x="380" y="324">
        P
      </Label>
      <path d="M500 220 V300" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="472" y="300" width="56" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="500" y="208">
        C
      </Label>
      <Label x="500" y="324">
        10kg
      </Label>
      <path d="M140 196 H260" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="200" y="184">
        30cm
      </Label>
      <path d="M260 196 H380" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="320" y="184">
        20cm
      </Label>
      <path d="M380 196 H500" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="440" y="184">
        20cm
      </Label>
      <Label x="360" y="400">
        40×30＝P×20＋10×40。よって P＝40kg
      </Label>
      <Label x="360" y="436" fill={graphite} size={12}>
        棒の全長は70cm。棒とロープの質量は無視する
      </Label>
      <Label x="360" y="472" fill={graphite} size={12}>
        Cの腕はOから40cm。B-Cの20cmだけを腕にしない
      </Label>
    </SvgBoard>
  );
}

export function MobileCenterOfGravityStabilityDiagram() {
  return (
    <SvgBoard alt="傾けた直方体の重心と鉛直線、底面との関係">
      <HatchFloor x={80} y={400} width={280} />
      <g transform="rotate(-18 260 400)">
        <rect x="190" y="220" width="140" height="180" fill={paper} stroke={ink} strokeWidth={strokeMain} />
        <circle cx="260" cy="310" r="6" fill={stamp} />
        <path d="M260 310 V400" fill="none" stroke={safety} strokeWidth={strokePart} />
      </g>
      <Label x="320" y="250" anchor="start">
        重心G
      </Label>
      <Label x="320" y="360" anchor="start" size={12} fill={graphite}>
        鉛直線が底面を通る
      </Label>
      <Label x="200" y="180" size={12} fill={safety}>
        元に戻る
      </Label>
      <HatchFloor x={420} y={400} width={220} />
      <g transform="rotate(-38 520 400)">
        <rect x="450" y="220" width="140" height="180" fill={paper} stroke={ink} strokeWidth={strokeMain} />
        <circle cx="520" cy="310" r="6" fill={stamp} />
        <path d="M520 310 V430" fill="none" stroke={stamp} strokeWidth={strokePart} />
      </g>
      <Label x="560" y="180" size={12} fill={stamp}>
        倒れる
      </Label>
      <Label x="360" y="460">
        重力の合力WがGに鉛直に働く。支点まわりのモーメントで倒れる
      </Label>
      <Label x="360" y="496" size={12} fill={graphite}>
        鉛直線が底面を外れると転倒側。遠心力や復元力に置き換えない
      </Label>
    </SvgBoard>
  );
}

export function MobileSlingAngleTensionDiagram() {
  return (
    <SvgBoard alt="つり角度60度でつる円柱の1本あたり張力">
      <path d="M360 70 V140" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M360 140 L220 280" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M360 140 L500 280" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M300 170 A70 70 0 0 1 420 170" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="360" y="158">
        60°
      </Label>
      <Label x="230" y="220" size={12}>
        T
      </Label>
      <Label x="490" y="220" size={12}>
        T
      </Label>
      <ellipse cx="360" cy="330" rx="90" ry="28" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="270" y="330" width="180" height="80" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <ellipse cx="360" cy="410" rx="90" ry="28" fill={graphite} fillOpacity="0.12" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="376">
        鋳鉄円柱
      </Label>
      <Label x="360" y="40">
        直径1m、高さ0.5m、つり角度60°
      </Label>
      <Label x="360" y="460">
        V＝π×0.5²×0.5。質量＝7.2t/m³×V≒2.83t
      </Label>
      <Label x="360" y="496" size={12} fill={graphite}>
        各ロープは鉛直から30°。2T×cos30°＝Wg、T≒16kN
      </Label>
    </SvgBoard>
  );
}

export function MobilePulleyPrincipleDiagram() {
  return (
    <SvgBoard alt="定滑車、動滑車、組合せ滑車と支えるロープの本数">
      <path d="M60 70 H220" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <circle cx="140" cy="110" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M140 70 V88" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M118 110 V200" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M162 110 V160" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="140" y="54">
        定滑車 n＝1
      </Label>
      <Label x="140" y="230" size={12}>
        F＝Wg
      </Label>
      <path d="M260 70 H420" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M300 70 V130" fill="none" stroke={safety} strokeWidth={strokePart} />
      <circle cx="340" cy="160" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M318 160 V130 H300" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M362 160 V90" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="318" y="190" width="44" height="24" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="340" y="54">
        動滑車 n＝2
      </Label>
      <Label x="340" y="240" size={12}>
        F＝Wg／2
      </Label>
      <path d="M460 70 H680" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <circle cx="520" cy="110" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="580" cy="110" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="550" cy="190" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M502 110 V190 H598 V110" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M598 110 V70" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="528" y="220" width="44" height="24" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="570" y="54">
        組合せ
      </Label>
      <Label x="570" y="268" size={12}>
        支える本数だけ分母
      </Label>
      <Label x="360" y="340">
        上ブロックから下へ出る自由端は、荷を支えていなければ数えない
      </Label>
      <Label x="360" y="380" fill={graphite} size={12}>
        4本支えなのに F＝Wg／5 とするのが典型的な誤り
      </Label>
      <Label x="360" y="420" fill={graphite} size={12}>
        滑車とロープの質量、摩擦は問題文で無視することが多い
      </Label>
    </SvgBoard>
  );
}
