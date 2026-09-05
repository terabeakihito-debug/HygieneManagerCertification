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

export function DiverBoyleBalloonDiagram() {
  return (
    <SvgBoard alt="水深20ｍの測量用フロート。水の密度1.0kg/L、殻と空気の質量は無視し、錘体積は不変">
      <rect x="40" y="70" width="300" height="400" rx="8" fill="#d7e4ea" stroke={ink} strokeWidth={strokePart} />
      <rect x="380" y="70" width="300" height="400" rx="8" fill="#e7eef1" stroke={ink} strokeWidth={strokePart} />
      <path d="M40 118 H340" stroke={safety} strokeWidth={strokeGuide} />
      <path d="M380 118 H680" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="190" y="58">水深 20ｍ（3気圧）</Label>
      <Label x="530" y="58">水面（1気圧）</Label>
      <Label x="70" y="108" size={12} fill={graphite} anchor="start">
        水面
      </Label>
      <ellipse cx="190" cy="250" rx="42" ry="48" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="168" y="300" width="44" height="52" rx="4" fill={graphite} />
      <path d="M190 298 V300" stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="248" size={12}>
        2.4 L
      </Label>
      <Label x="190" y="372" size={12} fill={graphite}>
        錘 2.7 kg / 0.3 L
      </Label>
      <Label x="190" y="394" size={12} fill={safety}>
        排除 2.7kg÷1.0kg/L＝2.7 L
      </Label>
      <ellipse cx="530" cy="220" rx="70" ry="82" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="508" y="304" width="44" height="52" rx="4" fill={graphite} />
      <path d="M530 302 V304" stroke={ink} strokeWidth={strokePart} />
      <Label x="530" y="216">7.2 L</Label>
      <Label x="530" y="380" size={12} fill={graphite}>
        P₁V₁＝P₂V₂
      </Label>
      <Label x="530" y="402" size={12} fill={safety}>
        2.4 L × 3 ＝ 7.2 L
      </Label>
      <Label x="360" y="500" size={12} fill={graphite}>
        密度1.0kg/L。殻・空気・索の質量は無視。錘体積は不変
      </Label>
    </SvgBoard>
  );
}

export function DiverDiveMethodsDiagram() {
  return (
    <SvgBoard alt="スクーバ式、全面マスク式、ヘルメット式の比較">
      <rect x="30" y="70" width="210" height="400" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="255" y="70" width="210" height="400" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="480" y="70" width="210" height="400" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="135" y="50">スクーバ式</Label>
      <Label x="360" y="50">全面マスク式</Label>
      <Label x="585" y="50">ヘルメット式</Label>
      <circle cx="135" cy="150" r="28" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="108" y="178" width="54" height="70" rx="8" fill={safety} fillOpacity={shadeOpacity} stroke={safety} strokeWidth={strokePart} />
      <rect x="122" y="248" width="26" height="46" rx="4" fill={amber} />
      <Label x="135" y="320" size={12} fill={graphite}>
        ボンベを携行
      </Label>
      <Label x="135" y="344" size={12} fill={graphite}>
        応需（デマンド）
      </Label>
      <Label x="135" y="368" size={12} fill={graphite}>
        軟式・水圧を受ける
      </Label>
      <Label x="135" y="400" size={12} fill={safety}>
        行動の自由度が高い
      </Label>
      <Label x="135" y="424" size={12} fill={stamp}>
        潜水時間はボンベ次第
      </Label>
      <ellipse cx="360" cy="150" rx="40" ry="32" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M330 162 Q360 200 390 162" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M400 150 H430" stroke={amber} strokeWidth={strokeMain} />
      <Label x="360" y="320" size={12} fill={graphite}>
        船上などから送気
      </Label>
      <Label x="360" y="344" size={12} fill={graphite}>
        応需送気（レギュレータ）
      </Label>
      <Label x="360" y="368" size={12} fill={graphite}>
        口鼻マスクで給気
      </Label>
      <Label x="360" y="400" size={12} fill={safety}>
        長時間作業向き
      </Label>
      <Label x="360" y="424" size={12} fill={stamp}>
        予備ボンベを携行し得る
      </Label>
      <path
        d="M555 118 H615 Q640 118 640 150 V190 Q640 210 585 210 Q530 210 530 190 V150 Q530 118 555 118 Z"
        fill={paper}
        stroke={ink}
        strokeWidth={strokePart}
      />
      <rect x="540" y="210" width="90" height="28" fill={graphite} fillOpacity={0.18} stroke={ink} strokeWidth={strokeGuide} />
      <Label x="585" y="320" size={12} fill={graphite}>
        船上から連続送気
      </Label>
      <Label x="585" y="344" size={12} fill={graphite}>
        定量送気式
      </Label>
      <Label x="585" y="368" size={12} fill={graphite}>
        重い装備・潜水靴
      </Label>
      <Label x="585" y="400" size={12} fill={safety}>
        長時間・重量作業
      </Label>
      <Label x="585" y="424" size={12} fill={stamp}>
        吹き上げに注意
      </Label>
    </SvgBoard>
  );
}

export function DiverBlowUpFallDiagram() {
  return (
    <SvgBoard alt="潜水服内圧と水圧の平衡、吹き上げと潜水墜落">
      <defs>
        <ArrowMarker id="diver-blow-up" fill={stamp} />
        <ArrowMarker id="diver-fall" fill={graphite} />
      </defs>
      <rect x="40" y="80" width="300" height="380" rx="8" fill="#d7e4ea" stroke={ink} strokeWidth={strokePart} />
      <rect x="380" y="80" width="300" height="380" rx="8" fill="#d7e4ea" stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="58" fill={stamp}>
        吹き上げ
      </Label>
      <Label x="530" y="58" fill={graphite}>
        潜水墜落
      </Label>
      <ellipse cx="190" cy="230" rx="46" ry="70" fill={paper} stroke={stamp} strokeWidth={strokeMain} />
      <circle cx="190" cy="168" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M190 300 V250" stroke={stamp} strokeWidth="3" markerEnd="url(#diver-blow-up)" />
      <Label x="190" y="330" size={12} fill={stamp}>
        服内圧 ＞ 水圧
      </Label>
      <Label x="190" y="354" size={12} fill={graphite}>
        浮力が増え急浮上
      </Label>
      <Label x="190" y="386" size={12} fill={graphite}>
        排気不足・送気過多
      </Label>
      <ellipse cx="530" cy="250" rx="40" ry="58" fill={paper} stroke={graphite} strokeWidth={strokeMain} />
      <circle cx="530" cy="198" r="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M530 250 V300" stroke={graphite} strokeWidth="3" markerEnd="url(#diver-fall)" />
      <Label x="530" y="330" size={12} fill={graphite}>
        服内圧 ＜ 水圧
      </Label>
      <Label x="530" y="354" size={12} fill={graphite}>
        浮力が減り急沈降
      </Label>
      <Label x="530" y="386" size={12} fill={graphite}>
        空気漏れ・ウエイト過多
      </Label>
      <Label x="360" y="500" size={12} fill={safety}>
        平衡が崩れると、深さの変化がさらに差を広げる
      </Label>
    </SvgBoard>
  );
}

export function DiverBottomTimeDiagram() {
  return (
    <SvgBoard alt="ゲージ圧の初圧と残圧、水深20ｍを3気圧として扱う潜水可能時間の計算">
      <defs>
        <ArrowMarker id="diver-time-flow" />
      </defs>
      <rect x="50" y="70" width="620" height="70" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="100">使用空気量 ＝ 10 L ×（16 − 4）MPa（ゲージ）＝ 120 L・MPa</Label>
      <Label x="360" y="124" size={12} fill={graphite}>
        大気圧 0.1 MPa 換算で 1200 L
      </Label>
      <path d="M360 140 V170" stroke={safety} strokeWidth={strokePart} markerEnd="url(#diver-time-flow)" />
      <rect x="50" y="175" width="620" height="70" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="205">水深 20ｍは絶対 3 気圧として扱う（ゲージ2＋大気1）</Label>
      <Label x="360" y="229" size={12} fill={graphite}>
        肺換気 16 L/min に絶対気圧を掛け、大気換算 48 L/min
      </Label>
      <path d="M360 245 V275" stroke={safety} strokeWidth={strokePart} markerEnd="url(#diver-time-flow)" />
      <rect x="50" y="280" width="620" height="90" rx="8" fill={paper} stroke={safety} strokeWidth={strokeMain} />
      <Label x="360" y="316">潜水可能時間 ＝ 1200 L ÷ 48 L/min ＝ 25 分</Label>
      <Label x="360" y="348" size={12} fill={graphite}>
        残圧 4 MPa で浮上する約束を忘れない
      </Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        ゲージ圧をそのまま掛けない。使うのは（初圧 − 残圧）
      </Label>
      <Label x="360" y="454" size={12} fill={graphite}>
        水深の絶対気圧を呼吸量に掛けてから割る
      </Label>
    </SvgBoard>
  );
}

export function DiverMValueDiagram() {
  return (
    <SvgBoard alt="M値と深度、半飽和時間の関係">
      <path d="M80 280 H340 V80" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M100 250 L310 110" stroke={safety} strokeWidth={strokeMain} />
      <Label x="210" y="58">深度が深いほど M値は大きい</Label>
      <Label x="210" y="310" size={12} fill={graphite}>
        環境圧力（深度）
      </Label>
      <Label x="64" y="170" size={12} fill={graphite} anchor="end">
        M値
      </Label>
      <path d="M400 280 H660 V80" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M420 120 Q520 140 640 250" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <Label x="530" y="58">半飽和時間が長いほど M値は小さい</Label>
      <Label x="530" y="310" size={12} fill={graphite}>
        半飽和時間
      </Label>
      <Label x="384" y="170" size={12} fill={graphite} anchor="end">
        M値
      </Label>
      <Label x="360" y="370" size={12} fill={graphite}>
        M値：その環境圧力で組織が許容できる最大の不活性ガス分圧
      </Label>
      <Label x="360" y="402" size={12} fill={safety}>
        速い組織（半飽和時間が短い）ほど過飽和を多く許す
      </Label>
      <Label x="360" y="434" size={12} fill={graphite}>
        全ての半飽和組織の体内分圧が対応する M値を超えないよう停止時間を置く
      </Label>
      <Label x="360" y="474" size={12} fill={stamp}>
        「長い組織ほど M値が大きい」「深いほど小さい」は逆
      </Label>
    </SvgBoard>
  );
}

export function DiverHelmetPartsDiagram() {
  return (
    <SvgBoard alt="ヘルメット式潜水器のシコロ、排気弁、送気ホース取付部、ドレーンコック、側面窓">
      <Label x="210" y="48">斜め前</Label>
      <Label x="530" y="48">後ろ</Label>
      <ellipse cx="210" cy="150" rx="70" ry="62" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="210" cy="155" r="32" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <ellipse cx="148" cy="155" rx="14" ry="20" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <ellipse cx="272" cy="155" rx="14" ry="20" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M148 155 L136 155" stroke={hairline} strokeWidth={strokeGuide} />
      <rect x="140" y="210" width="140" height="36" rx="6" fill={graphite} fillOpacity={0.16} stroke={ink} strokeWidth={strokePart} />
      <path d="M282 168 L312 176" stroke={ink} strokeWidth={strokePart} />
      <circle cx="318" cy="178" r="8" fill={paper} stroke={stamp} strokeWidth={strokePart} />
      <rect x="232" y="198" width="22" height="12" rx="2" fill={paper} stroke={amber} strokeWidth={strokePart} />
      <ellipse cx="530" cy="150" rx="66" ry="60" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <ellipse cx="478" cy="150" rx="12" ry="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <ellipse cx="582" cy="150" rx="12" ry="18" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="460" y="208" width="140" height="36" rx="6" fill={graphite} fillOpacity={0.16} stroke={ink} strokeWidth={strokePart} />
      <rect x="518" y="118" width="24" height="40" rx="4" fill={paper} stroke={safety} strokeWidth={strokePart} />
      <Label x="80" y="230" size={12} fill={ink} anchor="start">
        A シコロ
      </Label>
      <path d="M140 226 H175" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="330" y="120" size={12} fill={stamp} anchor="start">
        B 排気弁
      </Label>
      <Label x="250" y="280" size={12} fill={amber} anchor="start">
        D ドレーンコック（唾液）
      </Label>
      <path d="M243 210 V268" stroke={amber} strokeWidth={strokeGuide} />
      <Label x="80" y="160" size={12} fill={ink} anchor="start">
        E 側面窓
      </Label>
      <path d="M120 155 H134" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="560" y="100" size={12} fill={safety}>
        C 送気ホース取付部
      </Label>
      <Label x="560" y="118" size={11} fill={graphite}>
        （逆止弁）
      </Label>
      <Label x="360" y="340" size={12} fill={graphite}>
        シコロは潜水服の襟ゴムに合わせ、押え金と蝶ねじで固定する
      </Label>
      <Label x="360" y="368" size={12} fill={graphite}>
        排気弁は頭部で操作し、余剰空気と呼気を出す
      </Label>
      <Label x="360" y="396" size={12} fill={stamp}>
        ドレーンコックは送気中の水分・油分用ではない
      </Label>
      <Label x="360" y="424" size={12} fill={graphite}>
        側面窓には金属格子などでガラスを保護することが多い
      </Label>
      <Label x="360" y="460" size={12} fill={safety}>
        送気取付部の逆止弁が、ホース異常時の逆流を止める
      </Label>
    </SvgBoard>
  );
}

export function DiverLungPleuraDiagram() {
  return (
    <SvgBoard alt="肺、胸郭、胸膜腔の構造">
      <ellipse cx="360" cy="250" rx="210" ry="150" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <path d="M360 110 V390" stroke={hairline} strokeWidth={strokeGuide} />
      <ellipse cx="280" cy="250" rx="70" ry="110" fill={safety} fillOpacity={shadeOpacity} stroke={safety} strokeWidth={strokePart} />
      <ellipse cx="440" cy="250" rx="70" ry="110" fill={safety} fillOpacity={shadeOpacity} stroke={safety} strokeWidth={strokePart} />
      <ellipse cx="280" cy="250" rx="78" ry="118" fill="none" stroke={amber} strokeWidth={strokePart} strokeDasharray="6 4" />
      <ellipse cx="440" cy="250" rx="78" ry="118" fill="none" stroke={amber} strokeWidth={strokePart} strokeDasharray="6 4" />
      <path d="M360 110 V150" stroke={ink} strokeWidth={strokePart} />
      <path d="M360 150 Q300 170 280 210" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M360 150 Q420 170 440 210" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="280" y="250">肺</Label>
      <Label x="440" y="250">肺</Label>
      <Label x="360" y="96">気管</Label>
      <Label x="150" y="180" size={12} fill={amber} anchor="start">
        胸膜腔
      </Label>
      <Label x="150" y="204" size={12} fill={graphite} anchor="start">
        （胸膜と胸膜のすき間）
      </Label>
      <Label x="360" y="430" size={12} fill={graphite}>
        肺は胸郭が広がるのに引かれて膨らむ。自ら大きく広がる筋肉ではない
      </Label>
      <Label x="360" y="458" size={12} fill={stamp}>
        胸膜腔に空気が入って肺が広がらないのは気胸。肺気腫ではない
      </Label>
      <Label x="360" y="486" size={12} fill={safety}>
        ガス交換の主座は肺胞（と呼吸細気管支）
      </Label>
    </SvgBoard>
  );
}

export function DiverHeartCirculationDiagram() {
  return (
    <SvgBoard alt="心臓の四つの部屋と肺循環・体循環。矢印A〜Eと流れa・bの対応">
      <defs>
        <ArrowMarker id="diver-heart-a" fill={graphite} />
        <ArrowMarker id="diver-heart-b" fill={safety} />
      </defs>
      <ellipse cx="360" cy="90" rx="90" ry="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="96">肺</Label>
      <rect x="250" y="170" width="220" height="180" rx="16" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <path d="M360 170 V350" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M250 260 H470" stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="305" y="220" size={12}>
        B 右心房
      </Label>
      <Label x="305" y="310" size={12} fill={graphite}>
        右心室
      </Label>
      <Label x="415" y="220" size={12} fill={safety}>
        左心房
      </Label>
      <Label x="415" y="310" size={12} fill={safety}>
        D 左心室
      </Label>
      <Label x="360" y="164" size={12} fill={graphite}>
        心臓
      </Label>
      <path d="M290 300 Q220 220 220 126" fill="none" stroke={graphite} strokeWidth="2.6" markerEnd="url(#diver-heart-a)" />
      <Label x="160" y="150" size={12} fill={graphite} anchor="start">
        A 肺動脈
      </Label>
      <path d="M415 128 V170" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#diver-heart-b)" />
      <Label x="500" y="150" size={12} fill={safety} anchor="start">
        肺静脈
      </Label>
      <ellipse cx="360" cy="470" rx="110" ry="32" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="476">体の各組織</Label>
      <path d="M290 438 V350" fill="none" stroke={graphite} strokeWidth="2.6" markerEnd="url(#diver-heart-a)" />
      <Label x="160" y="400" size={12} fill={graphite} anchor="start">
        C 大静脈  a↑
      </Label>
      <path d="M430 350 V438" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#diver-heart-b)" />
      <Label x="500" y="400" size={12} fill={safety} anchor="start">
        E 大動脈  b↓
      </Label>
      <Label x="360" y="520" size={12} fill={stamp}>
        Aは肺動脈（静脈血）。肺静脈と取り違えない
      </Label>
    </SvgBoard>
  );
}

export function DiverBarotraumaDiagram() {
  return (
    <SvgBoard alt="潜降時のスクィーズと浮上時のブロック">
      <rect x="40" y="80" width="300" height="360" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <rect x="380" y="80" width="300" height="360" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="190" y="58">潜降 → スクィーズ</Label>
      <Label x="530" y="58">浮上 → ブロック</Label>
      <circle cx="190" cy="200" r="54" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="190" cy="200" r="28" fill={safety} fillOpacity={0.2} stroke={safety} strokeWidth={strokePart} />
      <Label x="190" y="204" size={12}>
        体積↓
      </Label>
      <Label x="190" y="290" size={12} fill={graphite}>
        体外の圧力 ＞ 体腔内
      </Label>
      <Label x="190" y="318" size={12} fill={graphite}>
        中耳・副鼻腔・マスク
      </Label>
      <Label x="190" y="346" size={12} fill={graphite}>
        スーツと皮膚の間
      </Label>
      <circle cx="530" cy="200" r="54" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <circle cx="530" cy="200" r="40" fill={stamp} fillOpacity={0.18} stroke={stamp} strokeWidth={strokePart} />
      <Label x="530" y="204" size={12}>
        体積↑
      </Label>
      <Label x="530" y="290" size={12} fill={graphite}>
        体腔内 ＞ 体外の圧力
      </Label>
      <Label x="530" y="318" size={12} fill={graphite}>
        肺・副鼻腔など
      </Label>
      <Label x="530" y="346" size={12} fill={stamp}>
        息止め浮上は肺の過膨張
      </Label>
      <Label x="360" y="470" size={12} fill={safety}>
        名前の対応：潜降がスクィーズ、浮上がブロック
      </Label>
      <Label x="360" y="498" size={12} fill={graphite}>
        深さ 2ｍ程度の浅い潜水でも起こり得る
      </Label>
    </SvgBoard>
  );
}

export function DiverEarSinusDiagram() {
  return (
    <SvgBoard alt="中耳、耳管、副鼻腔の位置関係">
      <ellipse cx="220" cy="230" rx="120" ry="90" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <rect x="80" y="210" width="70" height="24" rx="4" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="115" y="226" size={12}>
        外耳道
      </Label>
      <path d="M150 222 H190" stroke={ink} strokeWidth={strokePart} />
      <path d="M190 200 V244" stroke={amber} strokeWidth={strokeMain} />
      <Label x="190" y="190" size={12} fill={amber}>
        鼓膜
      </Label>
      <ellipse cx="250" cy="222" rx="28" ry="22" fill={safety} fillOpacity={0.18} stroke={safety} strokeWidth={strokePart} />
      <Label x="250" y="226" size={12} fill={safety}>
        中耳
      </Label>
      <path d="M250 244 Q240 300 210 340" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="200" y="360" size={12}>
        耳管（通常は閉じる）
      </Label>
      <Label x="200" y="382" size={12} fill={graphite}>
        咽頭へ
      </Label>
      <ellipse cx="520" cy="160" rx="50" ry="28" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="520" y="166">前頭洞</Label>
      <ellipse cx="560" cy="230" rx="46" ry="30" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="560" y="236">上顎洞</Label>
      <ellipse cx="480" cy="250" rx="36" ry="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="480" y="256" size={12}>
        鼻腔
      </Label>
      <path d="M520 188 V228" stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M514 250 H530" stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="520" y="320" size={12} fill={graphite}>
        副鼻腔は自然口で鼻腔と通じる
      </Label>
      <Label x="520" y="348" size={12} fill={stamp}>
        耳抜きでこの管を開ける、ではない
      </Label>
      <Label x="360" y="440" size={12} fill={graphite}>
        潜降時の耳痛は、外耳道と中耳の圧力差
      </Label>
      <Label x="360" y="468" size={12} fill={safety}>
        耳抜きは耳管を開いて中耳の圧力を合わせる操作
      </Label>
      <Label x="360" y="496" size={12} fill={graphite}>
        副鼻腔の障害は額・目鼻の根の痛み、鼻出血など
      </Label>
    </SvgBoard>
  );
}

export function DiverAirSupplyDepthDiagram() {
  return (
    <SvgBoard alt="圧力調整器を使わない送気で、大気圧換算300L毎分のときの最高水深">
      <rect x="50" y="70" width="620" height="64" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="110">法令：圧力調整器を使わないときは、その水深の圧力下で毎分 60 L 以上</Label>
      <rect x="50" y="160" width="620" height="90" rx="8" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="196">大気圧下の送気量 300 L/min ＝ 深度での 60 L/min × 絶対気圧</Label>
      <Label x="360" y="228" size={12} fill={graphite}>
        絶対気圧 ＝ 300 ÷ 60 ＝ 5
      </Label>
      <rect x="50" y="276" width="620" height="90" rx="8" fill={paper} stroke={safety} strokeWidth={strokeMain} />
      <Label x="360" y="312">5 気圧 ＝ 水深 40ｍ ＋ 大気 1 気圧</Label>
      <Label x="360" y="344" size={12} fill={safety}>
        潜水できる最高の水深 ≒ 40ｍ
      </Label>
      <Label x="360" y="410" size={12} fill={graphite}>
        圧力調整器あり（全面マスク等）は、水深の圧力下で毎分 40 L 以上の能力
      </Label>
      <Label x="360" y="438" size={12} fill={graphite}>
        その場合の送気圧は、水深の圧力 ＋ 0.7 MPa 以上
      </Label>
      <Label x="360" y="474" size={12} fill={stamp}>
        300 L をそのまま 60 で割らず、気圧換算を落とすと 20ｍや 50ｍになる
      </Label>
    </SvgBoard>
  );
}
