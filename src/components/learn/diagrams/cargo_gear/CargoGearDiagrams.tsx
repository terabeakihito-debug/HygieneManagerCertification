import {
  SvgBoard,
  amber,
  graphite,
  hairline,
  ink,
  paper,
  safety,
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

function ArrowMarker({ id }: { id: string }) {
  return (
    <marker id={id} viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto">
      <path d="M0 1 L10 5 L0 9 Z" fill={safety} />
    </marker>
  );
}

export function CgTypesStructureDiagram() {
  return (
    <SvgBoard alt="デリック型式とクレーン型式の揚貨装置の対比">
      <rect x="40" y="40" width="300" height="280" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="190" y="68">
        デリック型式
      </Label>
      <path d="M100 280 V110" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M100 110 L260 200" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M100 130 L260 200" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <path d="M80 90 H120" fill="none" stroke={ink} strokeWidth={strokePart} />
      <Label x="100" y="300" size={12}>
        デリックポスト
      </Label>
      <Label x="250" y="230" size={12} fill={safety}>
        ブーム
      </Label>
      <Label x="190" y="160" size={12} fill={graphite}>
        ガイ／トッピング
      </Label>
      <rect x="380" y="40" width="300" height="280" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <Label x="530" y="68">
        クレーン型式
      </Label>
      <path d="M420 250 H640" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M430 250 V160 H630 V250" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <rect x="500" y="148" width="50" height="28" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <path d="M525 176 V220" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="530" y="276" size={12}>
        走行レール＋ガーダ
      </Label>
      <Label x="530" y="140" size={12} fill={safety}>
        横行小車
      </Label>
      <Label x="360" y="360">
        ガイ装備は左右ガイで先端位置を決める。ガイレスはトッピングリフトで旋回する
      </Label>
      <Label x="360" y="400" size={12} fill={graphite}>
        走行式橋形クレーンにデリックブームが張り出す、は誤り
      </Label>
      <Label x="360" y="440" size={12} fill={graphite}>
        制限荷重5t以上の運転には揚貨装置運転士免許が要る
      </Label>
      <Label x="360" y="480" size={12} fill={graphite}>
        ダブルジブでも船体傾斜時に揺れない、とは限らない
      </Label>
    </SvgBoard>
  );
}

export function CgKenkaMakiDiagram() {
  return (
    <SvgBoard alt="けんか巻きの2ブームと荷位置、仰角の起こり">
      <defs>
        <ArrowMarker id="cg-kenka-arrow" />
      </defs>
      <path d="M80 360 H640" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M180 360 V160" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M540 360 V160" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M180 170 L360 90" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M540 170 L360 90" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M360 90 V300" fill="none" stroke={graphite} strokeWidth={strokePart} strokeDasharray="6 6" />
      <rect x="336" y="300" width="48" height="36" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="360" y="324" size={12}>
        荷
      </Label>
      <Label x="180" y="390" size={12}>
        ウインチ
      </Label>
      <Label x="540" y="390" size={12}>
        ウインチ
      </Label>
      <Label x="360" y="76">
        2ブームヘッドの連結線
      </Label>
      <path d="M120 220 L180 170" fill="none" stroke={stamp} strokeWidth={strokePart} markerEnd="url(#cg-kenka-arrow)" />
      <Label x="100" y="210" size={12} fill={stamp} anchor="end">
        仰角过大
      </Label>
      <Label x="360" y="440">
        けんか巻きは2台のウインチで巻上・巻下する
      </Label>
      <Label x="360" y="476" size={12} fill={graphite}>
        荷は連結線の真下。外れると斜めづり。仰角を上げすぎるとブームが立ち上がる
      </Label>
      <Label x="360" y="512" size={12} fill={graphite}>
        センターガイは2ブーム先端をつなぐ静索で、旋回用の動索ではない
      </Label>
    </SvgBoard>
  );
}

export function CgWireEndFittingsDiagram() {
  return (
    <SvgBoard alt="ワイヤロープ端末の止め方5種">
      <rect x="24" y="36" width="128" height="200" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M88 60 V150" fill="none" stroke={ink} strokeWidth="6" />
      <rect x="68" y="86" width="40" height="48" fill={amber} fillOpacity="0.35" stroke={ink} strokeWidth={strokePart} />
      <Label x="88" y="210" size={12}>
        圧縮止め
      </Label>
      <rect x="164" y="36" width="128" height="200" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M228 60 V170" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M210 90 L246 130 L210 150" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="228" y="210" size={12}>
        クサビ止め
      </Label>
      <rect x="304" y="36" width="128" height="200" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M368 70 Q400 110 368 150 Q336 110 368 70" fill="none" stroke={ink} strokeWidth="5" />
      <Label x="368" y="210" size={12}>
        アイスプライス
      </Label>
      <rect x="444" y="36" width="128" height="200" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M490 70 V170" fill="none" stroke={ink} strokeWidth="5" />
      <path d="M508 86 V150" fill="none" stroke={graphite} strokeWidth="3" />
      <path d="M478 100 H520" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M478 124 H520" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M478 148 H520" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="508" y="210" size={12}>
        クリップ止め
      </Label>
      <rect x="584" y="36" width="112" height="200" fill={paper} stroke={hairline} strokeWidth={strokeGuide} />
      <path d="M640 60 V100" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M620 100 H660 L650 170 H630 Z" fill={graphite} fillOpacity="0.2" stroke={ink} strokeWidth={strokePart} />
      <Label x="640" y="210" size={12}>
        合金止め
      </Label>
      <Label x="360" y="280">
        クリップのUボルトは余長側。サドルを効いている側に置く
      </Label>
      <Label x="360" y="320" size={12} fill={graphite}>
        ラングよりはロープよりとストランドよりが同方向。普通よりは逆
      </Label>
      <Label x="360" y="356" size={12} fill={graphite}>
        ラングよりは摩耗は少ないがキンクしやすく、玉掛け用には使わない
      </Label>
      <Label x="360" y="400" size={12} fill={graphite}>
        アイスプライスは全ストランドを3回以上編み込む
      </Label>
      <Label x="360" y="440" size={12} fill={stamp}>
        名称と止め方の関係だけを図で押さえる
      </Label>
    </SvgBoard>
  );
}

export function CgGearRatioDiagram() {
  return (
    <SvgBoard alt="歯車Aから同軸のB・Cを経てDへ至る減速">
      <defs>
        <ArrowMarker id="cg-gear-arrow" />
      </defs>
      <circle cx="130" cy="200" r="34" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="130" y="150">
        A
      </Label>
      <circle cx="260" cy="200" r="72" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="260" y="110">
        B
      </Label>
      <circle cx="260" cy="200" r="16" fill={graphite} fillOpacity="0.18" stroke={ink} strokeWidth={strokePart} />
      <circle cx="410" cy="200" r="38" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="410" y="146">
        C
      </Label>
      <path d="M260 200 H410" fill="none" stroke={graphite} strokeWidth="6" />
      <circle cx="560" cy="200" r="78" fill={paper} stroke={ink} strokeWidth={strokeMain} />
      <Label x="560" y="104">
        D
      </Label>
      <path d="M164 200 H188" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#cg-gear-arrow)" />
      <path d="M448 200 H482" fill="none" stroke={safety} strokeWidth="2.6" markerEnd="url(#cg-gear-arrow)" />
      <Label x="360" y="320">
        nD／nA ＝ (NA／NB) × (NC／ND)。同軸のBとCは同じ回転数
      </Label>
      <Label x="360" y="360" size={12} fill={graphite}>
        A18・C20・D90、1350→75rpm なら B＝72枚
      </Label>
      <Label x="360" y="396" size={12} fill={graphite}>
        75／1350＝(18／NB)×(20／90) より 1／18＝4／NB
      </Label>
      <Label x="360" y="440" size={12} fill={stamp}>
        歯数と回転数を入れ替えない。同軸のCはかみ合い側ではない
      </Label>
      <Label x="360" y="480" size={12} fill={graphite}>
        岸壁ウインチの減速列。公式を先に書いてから代入する
      </Label>
    </SvgBoard>
  );
}

export function CgDerrickGooseNeckDiagram() {
  return (
    <SvgBoard alt="デリックポスト、グースネック、ブーム基部の構造">
      <path d="M160 420 V80" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M130 80 H190" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M160 300 C210 300 230 270 250 250" fill="none" stroke={safety} strokeWidth="8" />
      <path d="M250 250 L560 360" fill="none" stroke={ink} strokeWidth="8" />
      <circle cx="250" cy="250" r="10" fill={amber} stroke={ink} strokeWidth={strokePart} />
      <rect x="148" y="286" width="28" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="100" y="250" anchor="end" size={12}>
        グースネック
      </Label>
      <Label x="100" y="310" anchor="end" size={12} fill={safety}>
        ブラケット
      </Label>
      <Label x="160" y="450">
        デリックポスト
      </Label>
      <Label x="480" y="390">
        ブーム
      </Label>
      <Label x="280" y="220" size={12} fill={graphite}>
        ピンテル（旋回・起伏の軸）
      </Label>
      <Label x="360" y="480">
        グースネックブラケットはグースネックをポストへ固定する
      </Label>
      <Label x="360" y="516" size={12} fill={graphite}>
        ピンテルは旋回・起伏の軸。滑車受けとするのは誤り。ブロックブラケットをブーム基部金具としない
      </Label>
    </SvgBoard>
  );
}

export function CgForceCompositionDiagram() {
  return (
    <SvgBoard alt="一点に働く3力の合力と、力の分解">
      <defs>
        <ArrowMarker id="cg-force-arrow" />
      </defs>
      <circle cx="180" cy="190" r="6" fill={ink} />
      <Label x="166" y="176" anchor="end">
        O
      </Label>
      <path d="M180 190 L180 70" fill="none" stroke={ink} strokeWidth={strokeMain} markerEnd="url(#cg-force-arrow)" />
      <Label x="196" y="88" anchor="start">
        P1
      </Label>
      <path d="M180 190 L300 240" fill="none" stroke={safety} strokeWidth={strokeMain} markerEnd="url(#cg-force-arrow)" />
      <Label x="314" y="256" anchor="start">
        P2
      </Label>
      <path d="M180 190 L80 260" fill="none" stroke={amber} strokeWidth={strokeMain} markerEnd="url(#cg-force-arrow)" />
      <Label x="66" y="278" anchor="end">
        P3
      </Label>
      <path d="M180 190 L250 140" fill="none" stroke={stamp} strokeWidth="4" markerEnd="url(#cg-force-arrow)" />
      <Label x="262" y="130" anchor="start">
        合力
      </Label>
      <path d="M500 80 V260" fill="none" stroke={hairline} strokeWidth={strokeGuide} strokeDasharray="6 6" />
      <path d="M500 220 L390 110" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M500 220 L610 110" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <Label x="360" y="340">
        同一平面の合力は平行四辺形法か多角形法で求める
      </Label>
      <Label x="360" y="376" size={12} fill={graphite}>
        分解した分力の矢印が閉じればつり合う。一直線上にない2力は大きい方へは動かない
      </Label>
      <Label x="360" y="412" size={12} fill={graphite}>
        力の三要素は大きさ、向き、作用点。モーメントは M＝F×L
      </Label>
      <Label x="360" y="456" size={12} fill={graphite}>
        3力の合力図と、1力の分力図は別物として矢印を追う
      </Label>
    </SvgBoard>
  );
}

export function CgBalanceBeamDiagram() {
  return (
    <SvgBoard alt="岸壁仮設ビームの支点と左右の荷重">
      <defs>
        <ArrowMarker id="cg-beam-arrow" />
      </defs>
      <path d="M90 200 H630" fill="none" stroke={ink} strokeWidth="10" />
      <path d="M360 200 L330 250 H390 Z" fill={ink} />
      <Label x="360" y="274">
        F
      </Label>
      <path d="M360 200 V140" fill="none" stroke={safety} strokeWidth="4" markerEnd="url(#cg-beam-arrow)" />
      <Label x="376" y="132" anchor="start">
        支点
      </Label>
      <path d="M200 200 V280" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="172" y="280" width="56" height="36" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="200" y="186">
        15kg
      </Label>
      <path d="M520 200 V280" fill="none" stroke={graphite} strokeWidth={strokePart} />
      <rect x="492" y="280" width="56" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="520" y="186">
        21kg
      </Label>
      <path d="M200 176 H360" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="280" y="164">
        1.4m
      </Label>
      <path d="M360 176 H520" fill="none" stroke={safety} strokeWidth={strokeGuide} />
      <Label x="440" y="164">
        1.0m
      </Label>
      <Label x="360" y="360">
        F＝(15＋21)×9.8＝352.8N。左右モーメントはともに205.8N・m
      </Label>
      <Label x="360" y="396" size={12} fill={graphite}>
        Fは端の力ではなく、支点の支反力。ビームとワイヤの質量は無視する
      </Label>
      <Label x="360" y="432" size={12} fill={graphite}>
        15×9.8×1.4＝21×9.8×1.0。腕は支点から各荷まで取る
      </Label>
      <Label x="360" y="476" size={12} fill={stamp}>
        片方のモーメント205.8Nを支持力と読まない
      </Label>
    </SvgBoard>
  );
}

export function CgVelocityCompositionDiagram() {
  return (
    <SvgBoard alt="走行と横行が同時のときの合成移動">
      <defs>
        <ArrowMarker id="cg-vel-arrow" />
      </defs>
      <path d="M120 360 H520" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M120 360 V120" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <rect x="392" y="164" width="64" height="36" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="424" y="188" size={12}>
        小車
      </Label>
      <path d="M160 360 H360" fill="none" stroke={safety} strokeWidth={strokeMain} markerEnd="url(#cg-vel-arrow)" />
      <Label x="260" y="384">
        走行 1m
      </Label>
      <path d="M360 360 V200" fill="none" stroke={amber} strokeWidth={strokeMain} markerEnd="url(#cg-vel-arrow)" />
      <Label x="400" y="280" anchor="start">
        横行 1m
      </Label>
      <path
        d="M160 360 L360 200"
        fill="none"
        stroke={stamp}
        strokeWidth="4"
        markerEnd="url(#cg-vel-arrow)"
      />
      <Label x="236" y="318" size={12} fill={stamp}>
        合成
      </Label>
      <Label x="360" y="430">
        5秒で直交に各1m進むと、合成距離は √(1²＋1²)＝1.4m
      </Label>
      <Label x="360" y="466" size={12} fill={graphite}>
        0.5m（半分）や2.0m（足し算）は誤り。加速度は (35−10)／10＝2.5m/s²
      </Label>
      <Label x="360" y="502" size={12} fill={graphite}>
        25m/s²は桁を一つ間違えた値
      </Label>
    </SvgBoard>
  );
}

export function CgSlingAngleTensionDiagram() {
  return (
    <SvgBoard alt="つり角度が大きいほど1本あたりの張力が増える">
      <path d="M200 70 V130" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M200 130 L130 250" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M200 130 L270 250" fill="none" stroke={safety} strokeWidth={strokeMain} />
      <path d="M168 160 A40 40 0 0 1 232 160" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="200" y="150">
        50°
      </Label>
      <rect x="160" y="250" width="80" height="40" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="200" y="276" size={12}>
        150kg
      </Label>
      <path d="M520 70 V130" fill="none" stroke={ink} strokeWidth="6" />
      <path d="M520 130 L400 250" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <path d="M520 130 L640 250" fill="none" stroke={stamp} strokeWidth={strokeMain} />
      <path d="M460 160 A70 70 0 0 1 580 160" fill="none" stroke={ink} strokeWidth={strokeGuide} />
      <Label x="520" y="150">
        110°
      </Label>
      <rect x="480" y="250" width="80" height="40" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <Label x="520" y="276" size={12}>
        130kg
      </Label>
      <Label x="360" y="340">
        つり角度は2本の索がなす角。T＝mg／(2 cos(θ／2))
      </Label>
      <Label x="360" y="376" size={12} fill={graphite}>
        角度が広がるほど張力は増える。130kg・110°は150kg・50°より張力が大きい
      </Label>
      <Label x="360" y="412" size={12} fill={graphite}>
        150kg・50°≒811N、140kg・80°≒896N、130kg・110°≒1111N
      </Label>
      <Label x="360" y="456" size={12} fill={stamp}>
        質量だけで並べると順が逆になる
      </Label>
    </SvgBoard>
  );
}

export function CgPulleyPrincipleDiagram() {
  return (
    <SvgBoard alt="定滑車・動滑車・組合せ滑車と支えるロープ本数">
      <path d="M50 70 H210" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <circle cx="130" cy="110" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M130 70 V88" fill="none" stroke={ink} strokeWidth={strokePart} />
      <path d="M108 110 V200" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M152 110 V160" fill="none" stroke={safety} strokeWidth={strokePart} />
      <Label x="130" y="54">
        定滑車 n＝1
      </Label>
      <Label x="130" y="230" size={12}>
        F＝Wg
      </Label>
      <path d="M250 70 H410" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <path d="M290 70 V130" fill="none" stroke={safety} strokeWidth={strokePart} />
      <circle cx="330" cy="160" r="22" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M308 160 V130 H290" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M352 160 V90" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="308" y="190" width="44" height="24" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="330" y="54">
        動滑車 n＝2
      </Label>
      <Label x="330" y="240" size={12}>
        F＝Wg／2
      </Label>
      <path d="M450 70 H680" fill="none" stroke={ink} strokeWidth={strokeMain} />
      <circle cx="520" cy="112" r="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="590" cy="112" r="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="520" cy="204" r="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <circle cx="590" cy="204" r="16" fill={paper} stroke={ink} strokeWidth={strokePart} />
      <path d="M504 112 V204" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M536 112 V204" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M574 112 V204" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M606 112 V204" fill="none" stroke={safety} strokeWidth={strokePart} />
      <path d="M606 112 V70" fill="none" stroke={safety} strokeWidth={strokePart} />
      <rect x="538" y="232" width="70" height="28" fill={amber} fillOpacity="0.3" stroke={ink} strokeWidth={strokePart} />
      <Label x="573" y="252" size={12}>
        85kg×2
      </Label>
      <Label x="570" y="54">
        4本支持
      </Label>
      <Label x="360" y="320">
        理想条件では F＝Wg／n。nは荷を支えるロープの本数
      </Label>
      <Label x="360" y="356" size={12} fill={graphite}>
        85×2×9.8＝1666N、4本なら F＝416.5N
      </Label>
      <Label x="360" y="392" size={12} fill={graphite}>
        自由端を本数に入れない。5本に数えると333Nになる
      </Label>
      <Label x="360" y="436" size={12} fill={stamp}>
        式の正誤は、図の支える索の本数と分母を突合する
      </Label>
      <Label x="360" y="476" size={12} fill={graphite}>
        滑車とロープの質量、摩擦は問題文で無視することが多い
      </Label>
    </SvgBoard>
  );
}
