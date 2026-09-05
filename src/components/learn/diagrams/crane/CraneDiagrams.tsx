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
    <text x={x} y={y} fill={fill} fontSize={size} textAnchor={anchor} fontFamily="ui-sans-serif, sans-serif">
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

export function CraneTypesStructureDiagram() {
  return (
    <SvgBoard alt="天井クレーン、橋形クレーン、ジブクレーンの骨格比較">
      <rect x="36" y="36" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M56 86 H216" fill="none" stroke={graphite} strokeWidth={strokeGuide} />
      <path d="M68 86 V200" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M204 86 V200" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M68 104 H204" fill="none" stroke={ink} strokeWidth="10" />
      <rect x="118" y="92" width="36" height="22" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <path d="M136 114 V168" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M128 168 H144" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="136" y="60">
        天井クレーン
      </Label>
      <Label x="136" y="236" size={11} fill={graphite}>
        走行＋横行
      </Label>
      <rect x="260" y="36" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M288 188 H432" fill="none" stroke={graphite} strokeWidth={strokeGuide} />
      <path d="M304 188 V92" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M416 188 V92" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M304 92 H416" fill="none" stroke={ink} strokeWidth="10" />
      <rect x="344" y="80" width="32" height="20" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <path d="M360 100 V150" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="360" y="60">
        橋形クレーン
      </Label>
      <Label x="360" y="236" size={11} fill={graphite}>
        脚で地上レール
      </Label>
      <rect x="484" y="36" width="200" height="220" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="548" y="168" width="72" height="28" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <path d="M584 168 V120" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M584 124 L640 88" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M640 88 V132" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M520 196 H640" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="584" y="60">
        ジブクレーン
      </Label>
      <Label x="584" y="236" size={11} fill={graphite}>
        旋回＋起伏
      </Label>
      <Label x="360" y="300" fill={graphite}>
        スパンは走行レール中心間、作業半径は旋回中心からフック
      </Label>
      <Highlight x1={56} x2={216} y={44} />
      <rect x="80" y="340" width="560" height="160" rx="8" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="360" y="372">
        つり上げ荷重はつり具を含む最大荷重
      </Label>
      <Label x="360" y="404" fill={graphite} size={12}>
        定格荷重＝つり上げ荷重からつり具質量を除いた値
      </Label>
      <Label x="360" y="436" fill={graphite} size={12}>
        キャンバはガーダの上向きのそり、揚程はつり具の有効上下距離
      </Label>
      <Label x="360" y="472" fill={graphite} size={12}>
        ジブ傾斜角はジブ中心線と水平面のなす角
      </Label>
    </SvgBoard>
  );
}

export function DerrickTypesStructureDiagram() {
  return (
    <SvgBoard alt="ガイデリックとスチフレッグデリックの支え方">
      <rect x="40" y="40" width="300" height="420" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M190 90 V360" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M190 110 L300 280" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M190 90 L70 200" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M190 90 L80 260" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M190 90 L310 200" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M190 90 L300 150" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M70 200 L80 260" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <path d="M300 150 L310 200" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <path d="M300 280 V330" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="70" y="360" width="240" height="16" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="70">
        ガイデリック
      </Label>
      <Label x="120" y="176" size={12} fill={graphite} anchor="end">
        ガイロープ
      </Label>
      <Label x="248" y="210" size={12} fill={graphite}>
        ブーム
      </Label>
      <Label x="190" y="404" size={12} fill={graphite}>
        マスト1本を6本以上で支える
      </Label>
      <rect x="380" y="40" width="300" height="420" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M530 90 V360" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M530 110 L640 270" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M530 90 L410 340" fill="none" stroke={amber} strokeWidth="6" />
      <path d="M530 90 L650 340" fill="none" stroke={amber} strokeWidth="6" />
      <path d="M640 270 V320" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="410" y="360" width="240" height="16" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <Label x="530" y="70">
        スチフレッグ
      </Label>
      <Label x="450" y="250" size={12} fill={graphite} anchor="end">
        ステー
      </Label>
      <Label x="590" y="200" size={12} fill={graphite}>
        ブーム
      </Label>
      <Label x="530" y="404" size={12} fill={graphite}>
        ステー2本、旋回は約240度
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        鳥居形は2本マストと横ばり、ジンポールはマスト1本
      </Label>
    </SvgBoard>
  );
}

export function WireRopeStructureDiagram() {
  return (
    <SvgBoard alt="フィラー形ワイヤロープの心綱、素線、ストランド、フィラー線">
      <path d="M80 160 C160 80 240 240 320 160 C400 80 480 240 560 160 C600 130 640 150 680 140" fill="none" stroke={ink} strokeWidth="28" />
      <path d="M80 160 C160 80 240 240 320 160 C400 80 480 240 560 160" fill="none" stroke={graphite} strokeWidth="18" />
      <path d="M200 108 C230 70 260 70 290 108" fill="none" stroke={amber} strokeWidth="10" />
      <path d="M292 92 C340 40 390 40 430 110" fill="none" stroke={safety} strokeWidth="4" />
      <circle cx="188" cy="156" r="7" fill={stamp} />
      <circle cx="292" cy="92" r="7" fill={stamp} />
      <circle cx="430" cy="110" r="7" fill={stamp} />
      <Label x="188" y="200">
        A 心綱
      </Label>
      <Label x="292" y="56">
        B 素線
      </Label>
      <Label x="470" y="80">
        C ストランド
      </Label>
      <circle cx="360" cy="360" r="92" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="360" cy="360" r="22" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <circle cx="360" cy="300" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="412" cy="336" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="392" cy="400" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="328" cy="400" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="308" cy="336" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="386" cy="318" r="5" fill={amber} />
      <circle cx="386" cy="318" r="5" fill="none" stroke={stamp} strokeWidth={strokePart} />
      <Label x="360" y="256">
        Cの断面
      </Label>
      <Label x="500" y="320" anchor="start">
        D フィラー線
      </Label>
      <path d="M430 318 H488" fill="none" stroke={stamp} strokeWidth={strokeGuide} />
      <Label x="360" y="500" fill={graphite} size={12}>
        1よりで素線の10パーセント切断、径減7パーセント超は使用禁止
      </Label>
    </SvgBoard>
  );
}

export function LiftingGearFastenersDiagram() {
  return (
    <SvgBoard alt="フック、シャックル、ばね座金、ダブルナット、溝付きナット">
      <path d="M110 70 V150" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M110 150 C70 150 70 230 110 230 C150 230 150 180 120 180" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M120 180 H148" fill="none" stroke={amber} strokeWidth={strokePart} />
      <Label x="110" y="54">
        フック
      </Label>
      <rect x="210" y="110" width="70" height="90" rx="28" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M220 118 H270" fill="none" stroke={ink} strokeWidth="8" />
      <Label x="245" y="94">
        シャックル
      </Label>
      <path d="M360 80 V210" fill="none" stroke={ink} strokeWidth="7" />
      <path d="M338 150 Q360 168 382 150 Q360 132 338 150" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <path d="M348 148 L372 156" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="64">
        ばね座金
      </Label>
      <path d="M470 80 V210" fill="none" stroke={ink} strokeWidth="7" />
      <rect x="448" y="120" width="44" height="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="448" y="144" width="44" height="22" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <Label x="470" y="64">
        ダブルナット
      </Label>
      <path d="M590 80 V210" fill="none" stroke={ink} strokeWidth="7" />
      <rect x="568" y="128" width="44" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M572 136 H608 M572 144 H608 M572 152 H608" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <path d="M590 164 V188" fill="none" stroke={amber} strokeWidth={strokePart} />
      <Label x="590" y="64">
        溝付きナット
      </Label>
      <Label x="590" y="230" size={11} fill={graphite}>
        割りピン
      </Label>
      <rect x="80" y="280" width="560" height="200" rx="8" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="360" y="320">
        緩み止めは図と名前を一致させる
      </Label>
      <Label x="360" y="360" size={12} fill={graphite}>
        シャックルの安全係数は5、ワイヤロープは6
      </Label>
      <Label x="360" y="396" size={12} fill={graphite}>
        つりチェーンは伸び5パーセント超、リンク径減10パーセント超が禁止
      </Label>
      <Label x="360" y="440" size={12} fill={graphite}>
        舌付き座金は座金の耳を折り曲げる
      </Label>
    </SvgBoard>
  );
}

export function HoistAndBrakeDiagram() {
  return (
    <SvgBoard alt="巻上げドラム、ワイヤロープ、無電圧作動のブレーキ">
      <defs>
        <ArrowMarker id="cr-hoist-arrow" />
      </defs>
      <rect x="70" y="160" width="120" height="90" rx="8" fill={graphite} fillOpacity="0.14" stroke={ink} strokeWidth={strokeMain} />
      <Label x="130" y="212">
        電動機
      </Label>
      <rect x="220" y="170" width="110" height="70" rx="6" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="275" y="212">
        減速機
      </Label>
      <rect x="360" y="150" width="70" height="110" rx="6" fill={amber} fillOpacity="0.2" stroke={ink} strokeWidth={strokeMain} />
      <Label x="395" y="198" size={12}>
        ブレーキ
      </Label>
      <Label x="395" y="218" size={11} fill={graphite}>
        無電圧制動
      </Label>
      <circle cx="520" cy="210" r="58" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="520" cy="210" r="18" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <path d="M520 268 V360" fill="none" stroke={safety} strokeWidth="4" />
      <path d="M508 360 H532" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="520" y="140">
        ドラム
      </Label>
      <Flow d="M190 205 H220" marker="cr-hoist-arrow" />
      <Flow d="M330 205 H360" marker="cr-hoist-arrow" />
      <Flow d="M430 205 H462" marker="cr-hoist-arrow" />
      <rect x="80" y="400" width="560" height="90" rx="8" fill={paper} stroke={graphite} strokeWidth={strokePart} />
      <Label x="360" y="436">
        つり上げブレーキの制動トルクは定格荷重時の150パーセント以上
      </Label>
      <Label x="360" y="468" size={12} fill={graphite}>
        巻上げの巻過防止にはねじ形リミットスイッチ
      </Label>
      <Shade cx={130} cy={248} rx={70} ry={18} />
    </SvgBoard>
  );
}

export function CraneStabilityDiagram() {
  return (
    <SvgBoard alt="ジブクレーンの重心、転倒支点、作業半径">
      <defs>
        <ArrowMarker id="cr-stab-arrow" />
      </defs>
      <HatchFloor x={80} y={400} width={560} />
      <rect x="220" y="300" width="160" height="70" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokeMain} />
      <rect x="160" y="370" width="50" height="30" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="390" y="370" width="50" height="30" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M300 300 V210" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M300 220 L500 140" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M500 140 V250" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="478" y="250" width="44" height="28" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="500" y="238" size={12}>
        荷
      </Label>
      <circle cx="300" cy="268" r="6" fill={stamp} />
      <Label x="246" y="262" size={12} anchor="end">
        機体重心
      </Label>
      <path d="M440 400 V360" fill="none" stroke={stamp} strokeWidth={strokePart} />
      <Label x="456" y="350" size={12} anchor="start">
        転倒支点
      </Label>
      <Flow d="M300 430 H500" marker="cr-stab-arrow" />
      <Label x="400" y="456">
        作業半径
      </Label>
      <Label x="360" y="80">
        荷が支点の外側へ出ると転倒モーメントが増える
      </Label>
      <Label x="360" y="510" size={12} fill={graphite}>
        性能検査には安定度試験は含まれない
      </Label>
    </SvgBoard>
  );
}

export function TravelSlewLuffDiagram() {
  return (
    <SvgBoard alt="走行、横行、旋回、起伏の動作方向">
      <defs>
        <ArrowMarker id="cr-move-arrow" />
      </defs>
      <path d="M80 220 H300" fill="none" stroke={graphite} strokeWidth="10" />
      <path d="M80 300 H300" fill="none" stroke={graphite} strokeWidth="10" />
      <rect x="120" y="200" width="140" height="120" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="160" y="230" width="60" height="36" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Flow d="M70 180 H250" marker="cr-move-arrow" />
      <Label x="160" y="168">
        走行
      </Label>
      <Flow d="M190 210 H250" marker="cr-move-arrow" />
      <Label x="270" y="226" anchor="start">
        横行
      </Label>
      <circle cx="520" cy="230" r="86" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M520 230 L600 180" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M520 230 L580 140" fill="none" stroke={amber} strokeWidth="8" />
      <Flow d="M600 250 A70 70 0 0 1 470 280" marker="cr-move-arrow" />
      <Label x="520" y="350">
        旋回
      </Label>
      <Label x="620" y="128" anchor="start">
        起伏
      </Label>
      <Label x="360" y="420" fill={graphite} size={12}>
        走行には斜行防止、巻上げにはねじ形リミットスイッチ
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        横行車輪止めは車輪直径の4分の1以上
      </Label>
      <Label x="360" y="492" fill={graphite} size={12}>
        起伏には傾斜角指示装置
      </Label>
    </SvgBoard>
  );
}

export function AcDcWaveformDiagram() {
  return (
    <SvgBoard alt="直流、単相交流、三相交流の波形">
      <rect x="50" y="50" width="200" height="200" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M80 150 H220" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M90 110 H210" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <Label x="150" y="80">
        直流 DC
      </Label>
      <Label x="150" y="190" size={12} fill={graphite}>
        向きが変わらない
      </Label>
      <rect x="260" y="50" width="200" height="200" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M290 150 H440" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M290 150 C310 90 330 90 350 150 C370 210 390 210 410 150 C430 90 440 110 450 150" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="80">
        単相交流 AC
      </Label>
      <Label x="360" y="190" size={12} fill={graphite}>
        計器は実効値
      </Label>
      <rect x="470" y="50" width="200" height="200" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M500 150 H650" fill="none" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M500 150 C520 100 540 100 560 150 C580 200 600 200 620 150" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M520 150 C540 200 560 200 580 150 C600 100 620 100 640 150" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M510 170 C530 120 550 120 570 170 C590 220 610 220 630 170" fill="none" stroke={amber} strokeWidth={strokePart} />
      <Label x="570" y="80">
        三相交流
      </Label>
      <Label x="570" y="190" size={12} fill={graphite}>
        120度ずつずれる
      </Label>
      <Label x="360" y="320">
        交流は変圧できる、直流は変圧器では変えにくい
      </Label>
      <Label x="360" y="360" fill={graphite} size={12}>
        工場動力は200V級または400V級の三相交流
      </Label>
      <Label x="360" y="400" fill={graphite} size={12}>
        整流後に波が残る直流を脈流という
      </Label>
    </SvgBoard>
  );
}

export function MotorTypesDiagram() {
  return (
    <SvgBoard alt="かご形と巻線形の三相誘導電動機、直流電動機">
      <circle cx="150" cy="200" r="90" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="150" cy="200" r="48" fill={graphite} fillOpacity="0.12" stroke={ink} strokeWidth={strokePart} />
      <path d="M118 168 H182 M118 232 H182 M118 168 V232 M182 168 V232" fill="none" stroke={amber} strokeWidth={strokePart} />
      <Label x="150" y="80">
        かご形
      </Label>
      <Label x="150" y="310" size={12} fill={graphite}>
        スリップリングなし
      </Label>
      <circle cx="360" cy="200" r="90" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="360" cy="200" r="48" fill={graphite} fillOpacity="0.12" stroke={ink} strokeWidth={strokePart} />
      <circle cx="428" cy="200" r="16" fill={paper} stroke={safety} strokeWidth={strokePart} />
      <circle cx="428" cy="200" r="8" fill={safety} fillOpacity="0.35" />
      <Label x="360" y="80">
        巻線形
      </Label>
      <Label x="360" y="310" size={12} fill={graphite}>
        二次抵抗で緩始動
      </Label>
      <circle cx="570" cy="200" r="90" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <path d="M530 200 H610" fill="none" stroke={ink} strokeWidth="8" />
      <path d="M570 150 V250" fill="none" stroke={amber} strokeWidth="6" />
      <Label x="570" y="80">
        直流電動機
      </Label>
      <Label x="570" y="310" size={12} fill={graphite}>
        界磁と整流子
      </Label>
      <Label x="360" y="380">
        すべりは同期速度より2から5パーセント遅い
      </Label>
      <Label x="360" y="416" fill={graphite} size={12}>
        極数が少ないほど同期速度は速い
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        巻線形の回転子巻線はスリップリングで外部抵抗へ
      </Label>
    </SvgBoard>
  );
}

export function OhmLawCircuitDiagram() {
  return (
    <SvgBoard alt="直列12オームと並列4オーム、12オームの回路">
      <path d="M80 160 H200" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <rect x="200" y="140" width="90" height="40" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="245" y="166">
        12Ω
      </Label>
      <path d="M290 160 H360" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M360 160 V90 H470" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <rect x="470" y="70" width="80" height="40" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="510" y="96">
        4Ω
      </Label>
      <path d="M550 90 H620 V230 H550" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M360 160 V230 H470" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <rect x="470" y="210" width="80" height="40" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="510" y="236">
        12Ω
      </Label>
      <circle cx="80" cy="160" r="5" fill={ink} />
      <circle cx="360" cy="160" r="5" fill={ink} />
      <circle cx="360" cy="90" r="5" fill={ink} />
      <circle cx="360" cy="230" r="5" fill={ink} />
      <circle cx="620" cy="160" r="5" fill={ink} />
      <Label x="80" y="140">
        P
      </Label>
      <Label x="360" y="140">
        Q
      </Label>
      <Label x="360" y="74">
        S
      </Label>
      <Label x="360" y="260">
        T
      </Label>
      <Label x="636" y="164" anchor="start">
        R
      </Label>
      <path d="M80 300 H620" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="350" y="324">
        PR＝45V
      </Label>
      <Label x="360" y="380">
        並列3Ω、全体15Ω、電流3A
      </Label>
      <Label x="360" y="416" fill={graphite} size={12}>
        PQ＝36V、QR＝9V、T側0.75A、S側2.25A
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        I＝E／R、P＝E×I、直径2倍で抵抗は4分の1
      </Label>
    </SvgBoard>
  );
}

export function GroundingDiagram() {
  return (
    <SvgBoard alt="電気機器のフレームから接地極への接地">
      <rect x="160" y="80" width="200" height="140" rx="8" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="260" y="130">
        電動機
      </Label>
      <Label x="260" y="158" size={12} fill={graphite}>
        フレーム
      </Label>
      <path d="M260 220 V320" fill="none" stroke={safety} strokeWidth="4" />
      <path d="M230 320 H290" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M240 332 H280 M248 344 H272 M256 356 H264" fill="none" stroke={ink} strokeWidth={strokePart} />
      <HatchFloor x={80} y={400} width={300} />
      <Label x="320" y="300" anchor="start">
        接地線
      </Label>
      <Label x="260" y="384">
        接地極
      </Label>
      <path d="M460 160 H520 V280" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <circle cx="520" cy="140" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M520 162 V250" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M500 250 H540" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M500 250 V300 M540 250 V300" fill="none" stroke={ink} strokeWidth="6" />
      <Label x="520" y="110">
        人
      </Label>
      <Label x="360" y="460" fill={graphite} size={12}>
        接地抵抗は小さいほどよい。接地線は十分な太さにする
      </Label>
      <Label x="360" y="496" fill={graphite} size={12}>
        導体の例はアルミニウム、絶縁体の例は磁器
      </Label>
    </SvgBoard>
  );
}

export function PowerTransmissionDiagram() {
  return (
    <SvgBoard alt="電動機から歯車列を経てドラムへ至る動力伝達">
      <defs>
        <ArrowMarker id="cr-gear-arrow" />
      </defs>
      <circle cx="150" cy="220" r="36" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="150" y="160">
        A 16
      </Label>
      <circle cx="250" cy="220" r="70" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="250" y="130">
        B 64
      </Label>
      <circle cx="250" cy="220" r="18" fill={graphite} fillOpacity="0.16" stroke={ink} strokeWidth={strokePart} />
      <circle cx="400" cy="220" r="40" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="400" y="160">
        C 25
      </Label>
      <path d="M250 220 H400" fill="none" stroke={graphite} strokeWidth="6" />
      <circle cx="530" cy="220" r="80" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="530" y="120">
        D 100
      </Label>
      <Label x="150" y="340" size={12} fill={graphite}>
        1200 rpm
      </Label>
      <Label x="250" y="340" size={12} fill={graphite}>
        300 rpm
      </Label>
      <Label x="530" y="340" size={12} fill={graphite}>
        75 rpm
      </Label>
      <Flow d="M186 220 H214" marker="cr-gear-arrow" />
      <Flow d="M440 220 H450" marker="cr-gear-arrow" />
      <Label x="360" y="420">
        歯数×回転数はかみ合いで等しい。同軸のBとCは同回転
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        減速するとドラム側のトルクが増える
      </Label>
    </SvgBoard>
  );
}

export function ForceCompositionDiagram() {
  return (
    <SvgBoard alt="一点に働く力の合力と、鉛直線に対し20度で支える2本スリング">
      <defs>
        <ArrowMarker id="cr-force-arrow" />
      </defs>
      <circle cx="160" cy="180" r="6" fill={ink} />
      <Label x="148" y="168" anchor="end">
        O
      </Label>
      <path d="M160 180 L160 60" fill="none" stroke={ink} strokeWidth={strokeMain} markerEnd="url(#cr-force-arrow)" />
      <Label x="176" y="80" anchor="start">
        P1
      </Label>
      <path d="M160 180 L280 230" fill="none" stroke={safety} strokeWidth={strokeMain} markerEnd="url(#cr-force-arrow)" />
      <Label x="294" y="246" anchor="start">
        P2
      </Label>
      <path d="M160 180 L60 250" fill="none" stroke={amber} strokeWidth={strokeMain} markerEnd="url(#cr-force-arrow)" />
      <Label x="48" y="268" anchor="end">
        P3
      </Label>
      <path d="M160 180 L220 140" fill="none" stroke={stamp} strokeWidth="4" markerEnd="url(#cr-force-arrow)" />
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
        14kg
      </Label>
      <path d="M500 160 A40 40 0 0 0 478 124" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <path d="M500 160 A40 40 0 0 1 522 124" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="456" y="150" size={12}>
        20°
      </Label>
      <Label x="544" y="150" size={12}>
        20°
      </Label>
      <Label x="390" y="76" size={12} fill={graphite}>
        T
      </Label>
      <Label x="610" y="76" size={12} fill={graphite}>
        T
      </Label>
      <Label x="360" y="320">
        20°は鉛直線とスリングのなす角。2本の間は40°
      </Label>
      <Label x="360" y="356" fill={graphite} size={12}>
        鉛直成分は T×cos20°。2本で 2T×cos20°＝137.2N、T≒73N
      </Label>
      <Label x="360" y="396" fill={graphite} size={12}>
        力の三要素は大きさ、向き、作用点。つり合うとき合力は0
      </Label>
      <Label x="360" y="436" fill={graphite} size={12}>
        モーメントは M＝F×L。斜めづりは鉛直線からの角が大きいほど張力が増える
      </Label>
    </SvgBoard>
  );
}

export function MomentOfForceDiagram() {
  return (
    <SvgBoard alt="点検用スプレッダの支点、左右の荷、支持力F">
      <defs>
        <ArrowMarker id="cr-moment-arrow" />
      </defs>
      <path d="M120 220 H600" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M300 220 L270 270 H330 Z" fill={ink} />
      <path d="M300 220 V160" fill="none" stroke={safety} strokeWidth="4" markerEnd="url(#cr-moment-arrow)" />
      <Label x="318" y="150" anchor="start">
        F
      </Label>
      <path d="M160 220 V300" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="132" y="300" width="56" height="36" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="160" y="324">
        22kg
      </Label>
      <path d="M540 220 V300" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="512" y="300" width="56" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="540" y="324">
        18kg
      </Label>
      <path d="M160 200 H300" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="230" y="188">
        0.9m
      </Label>
      <path d="M300 200 H540" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="420" y="188">
        1.1m
      </Label>
      <Label x="360" y="400">
        左194.04N・m＝右194.04N・m、支持力 F＝392N
      </Label>
      <Label x="360" y="436" fill={graphite} size={12}>
        Fは両方の荷の和。片方のモーメント194Nと混同しない
      </Label>
      <Label x="360" y="472" fill={graphite} size={12}>
        M＝F×L。Lは作用線への垂線
      </Label>
    </SvgBoard>
  );
}

export function CenterOfGravityDiagram() {
  return (
    <SvgBoard alt="傾けた直方体の重心と鉛直線、底面との関係">
      <HatchFloor x={80} y={400} width={280} />
      <g transform="rotate(-18 260 400)">
        <rect x="190" y="220" width="140" height="180" fill={paper} stroke={ink} strokeWidth={strokeMain} />
        <circle cx="260" cy="310" r="6" fill={stamp} />
        <path d="M260 310 V400" fill="none" stroke={safety} strokeWidth={strokePart} />
      </g>
      <Label x="320" y="250" anchor="start">
        重心
      </Label>
      <Label x="320" y="360" anchor="start" size={12} fill={graphite}>
        鉛直線が底面を通る
      </Label>
      <HatchFloor x={420} y={400} width={220} />
      <g transform="rotate(-38 520 400)">
        <rect x="450" y="220" width="140" height="180" fill={paper} stroke={ink} strokeWidth={strokeMain} />
        <circle cx="520" cy="310" r="6" fill={stamp} />
        <path d="M520 310 V430" fill="none" stroke={stamp} strokeWidth={strokePart} />
      </g>
      <Label x="360" y="460">
        鉛直線が底面を外れると倒れる
      </Label>
      <Label x="360" y="496" size={12} fill={graphite}>
        円柱の重心は上下底面の中心を結ぶ線分の中点
      </Label>
    </SvgBoard>
  );
}

export function FrictionDiagram() {
  return (
    <SvgBoard alt="水平面の物体に働く垂直力と最大静止摩擦力">
      <defs>
        <ArrowMarker id="cr-fric-arrow" />
      </defs>
      <HatchFloor x={160} y={320} width={400} />
      <rect x="280" y="200" width="160" height="120" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="360" y="266">
        W
      </Label>
      <path d="M360 200 V120" fill="none" stroke={graphite} strokeWidth={strokePart} markerEnd="url(#cr-fric-arrow)" />
      <Label x="376" y="130" anchor="start">
        N＝Wg
      </Label>
      <path d="M440 260 H560" fill="none" stroke={safety} strokeWidth="4" markerEnd="url(#cr-fric-arrow)" />
      <Label x="576" y="264" anchor="start">
        F＝μN
      </Label>
      <Label x="360" y="380">
        動き始め直前が最大静止摩擦力
      </Label>
      <Label x="360" y="420" fill={graphite} size={12}>
        588N、μ＝0.6、g＝9.8 のとき W＝100kg
      </Label>
      <Label x="360" y="456" fill={graphite} size={12}>
        転がり摩擦は滑り摩擦より小さい
      </Label>
    </SvgBoard>
  );
}

export function PulleyPrincipleDiagram() {
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
        支える本数だけ分母に入れる
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

export function LeverPrincipleDiagram() {
  return (
    <SvgBoard alt="点検架台の脚P・Qと、脚Pから1.2ｍの位置にある2.4ｔの減速機。近い脚が大きい支持力を受ける">
      <defs>
        <ArrowMarker id="cr-lever-up" />
        <ArrowMarker id="cr-lever-down" />
      </defs>
      <path d="M120 220 H600" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M140 220 L110 290 H170 Z" fill={ink} />
      <path d="M580 220 L550 290 H610 Z" fill={ink} />
      <Label x="86" y="276" anchor="end">
        脚P
      </Label>
      <Label x="634" y="276" anchor="start">
        脚Q
      </Label>
      <rect x="258" y="168" width="56" height="40" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <path d="M286 168 V140" fill="none" stroke={stamp} strokeWidth="3" markerEnd="url(#cr-lever-down)" />
      <Label x="286" y="132" size={12} fill={stamp}>
        2.4ｔ
      </Label>
      <Label x="286" y="196" size={12}>
        減速機
      </Label>
      <path d="M140 200 H286" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="213" y="188" size={12} fill={safety}>
        1.2ｍ
      </Label>
      <path d="M286 200 H580" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="433" y="188" size={12} fill={safety}>
        2.4ｍ
      </Label>
      <path d="M140 400 V304" fill="none" stroke={safety} strokeWidth="3" markerEnd="url(#cr-lever-up)" />
      <path d="M580 400 V304" fill="none" stroke={safety} strokeWidth="3" markerEnd="url(#cr-lever-up)" />
      <Label x="140" y="424" size={12} fill={safety}>
        15.68ｋＮ
      </Label>
      <Label x="580" y="424" size={12} fill={safety}>
        7.84ｋＮ
      </Label>
      <Label x="360" y="450">
        23.52×1.2／3.6＝7.84ｋＮ。近い脚Pは15.68ｋＮ
      </Label>
      <Label x="360" y="486" fill={graphite} size={12}>
        F1×L1＝F2×L2。短い腕の側が大きい力を受ける
      </Label>
      <Label x="360" y="518" fill={graphite} size={12}>
        均等の11.76ｋＮや、比を逆にした脚P＝7.84ｋＮは誤り
      </Label>
    </SvgBoard>
  );
}

export function StressStrainDiagram() {
  return (
    <SvgBoard alt="丸棒の引張応力と断面積">
      <path d="M200 70 H360" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M280 70 V360" fill="none" stroke={ink} strokeWidth="16" />
      <path d="M280 360 V420" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="250" y="420" width="60" height="36" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="280" y="444">
        P
      </Label>
      <circle cx="520" cy="220" r="70" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="520" cy="220" r="6" fill={ink} />
      <Label x="520" y="130">
        断面 A
      </Label>
      <Label x="520" y="320" size={12} fill={graphite}>
        A＝π（d／2）²
      </Label>
      <Label x="360" y="40">
        σ＝P／A
      </Label>
      <Label x="140" y="220" anchor="end" size={12} fill={graphite}>
        丸棒
      </Label>
      <Label x="360" y="500" size={12} fill={graphite}>
        d＝20mm、P＝980N なら σ≒3N／mm²。辺が1／2の立方体は質量1／8
      </Label>
    </SvgBoard>
  );
}
