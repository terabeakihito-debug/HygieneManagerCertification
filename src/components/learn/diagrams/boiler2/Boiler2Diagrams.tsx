import {
  SvgBoard,
  amber,
  graphite,
  hairline,
  ink,
  paper,
  safety,
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

export function WaterCirculationDiagram() {
  return (
    <SvgBoard alt="下降管と上昇管による自然循環">
      <rect x="220" y="70" width="280" height="70" rx="8" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="360" y="112">蒸気ドラム</Label>
      <rect x="250" y="360" width="220" height="60" rx="8" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="360" y="396">水ドラム</Label>
      <path d="M300 140 V360" fill="none" stroke={graphite} strokeWidth="10" />
      <path d="M420 140 V360" fill="none" stroke={safety} strokeWidth="10" />
      <path d="M420 200 l12 -18 M420 200 l-12 -18" fill="none" stroke={paper} strokeWidth="2" />
      <path d="M300 300 l12 18 M300 300 l-12 18" fill="none" stroke={paper} strokeWidth="2" />
      <rect x="390" y="190" width="60" height="90" fill="none" stroke={amber} strokeWidth="1.5" strokeDasharray="4 3" />
      <Label x="160" y="250" fill={graphite} anchor="start">
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
      <rect x="80" y="80" width="560" height="320" fill={paper} stroke={ink} strokeWidth="2" />
      <rect x="110" y="120" width="200" height="220" fill="#e7efe8" stroke={safety} strokeWidth="2" />
      <Label x="210" y="230" fill={safety}>火炉（放射）</Label>
      <rect x="330" y="140" width="280" height="80" fill={paper} stroke={ink} strokeWidth="1.5" />
      <Label x="470" y="188">対流伝熱面</Label>
      <rect x="330" y="240" width="130" height="70" fill={paper} stroke={graphite} strokeWidth="1.5" />
      <Label x="395" y="282" size={12} fill={graphite}>
        過熱器
      </Label>
      <rect x="480" y="240" width="130" height="70" fill={paper} stroke={graphite} strokeWidth="1.5" />
      <Label x="545" y="282" size={12} fill={graphite}>
        エコノマイザ
      </Label>
      <circle cx="160" cy="430" r="18" fill={amber} />
      <Label x="210" y="436" anchor="start" size={12}>
        バーナ
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        熱は火炉の放射から対流部、給水予熱へと流れる
      </Label>
    </SvgBoard>
  );
}

export function FireTubeBoilerDiagram() {
  return (
    <SvgBoard alt="炉筒煙管ボイラーの断面">
      <ellipse cx="360" cy="260" rx="250" ry="150" fill={paper} stroke={ink} strokeWidth="3" />
      <ellipse cx="220" cy="270" rx="70" ry="55" fill="#efe6d6" stroke={ink} strokeWidth="2" />
      <Label x="220" y="276" size={12}>炉筒</Label>
      <rect x="300" y="200" width="180" height="18" fill={hairline} stroke={graphite} />
      <rect x="300" y="240" width="180" height="18" fill={hairline} stroke={graphite} />
      <rect x="300" y="280" width="180" height="18" fill={hairline} stroke={graphite} />
      <Label x="520" y="250" fill={graphite} size={12}>
        煙管
      </Label>
      <Label x="360" y="160" fill={safety}>
        水は胴側
      </Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        ガスは管内。炉筒は外圧を受ける
      </Label>
    </SvgBoard>
  );
}

export function WaterTubeOnceThroughDiagram() {
  return (
    <SvgBoard alt="水管ボイラーと貫流ボイラーの流れ比較">
      <rect x="40" y="70" width="300" height="360" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="190" y="100">水管（循環）</Label>
      <rect x="90" y="120" width="200" height="40" stroke={ink} fill={paper} />
      <Label x="190" y="146" size={12}>蒸気ドラム</Label>
      <path d="M130 160 V360 M250 160 V360" stroke={safety} strokeWidth="6" />
      <rect x="100" y="360" width="180" height="36" stroke={ink} fill={paper} />
      <Label x="190" y="384" size={12}>水ドラム</Label>
      <rect x="380" y="70" width="300" height="360" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="530" y="100">貫流（一方通行）</Label>
      <path d="M430 400 H630 V160 H430" fill="none" stroke={safety} strokeWidth="6" />
      <Label x="530" y="430" size={12} fill={graphite}>
        給水
      </Label>
      <Label x="530" y="150" size={12} fill={safety}>
        過熱蒸気
      </Label>
      <Label x="530" y="260" size={12}>ドラムなし</Label>
    </SvgBoard>
  );
}

export function CastIronHartfordDiagram() {
  return (
    <SvgBoard alt="ハートフォード式連結の返り管">
      <rect x="80" y="80" width="200" height="260" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="180" y="130">鋳鉄製</Label>
      <Label x="180" y="154">ボイラー</Label>
      <line x1="80" y1="200" x2="280" y2="200" stroke={safety} strokeWidth="2" strokeDasharray="6 4" />
      <Label x="70" y="196" anchor="end" size={12} fill={safety}>
        水位
      </Label>
      <path d="M280 240 H400 V380 H180 V300 H280" fill="none" stroke={ink} strokeWidth="4" />
      <Label x="430" y="320" anchor="start" size={12}>
        返り管
      </Label>
      <Label x="360" y="400" size={12} fill={graphite}>
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
      <ellipse cx="200" cy="220" rx="110" ry="140" fill={paper} stroke={ink} strokeWidth="2" />
      <ellipse cx="200" cy="220" rx="36" ry="50" fill="#efe6d6" stroke={ink} strokeWidth="2" />
      <Label x="200" y="226" size={12}>蓋は内側</Label>
      <Label x="200" y="80">マンホール</Label>
      <rect x="400" y="100" width="240" height="280" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="520" y="140">温水ボイラー</Label>
      <rect x="430" y="170" width="70" height="90" stroke={graphite} fill={paper} />
      <Label x="465" y="220" size={11}>水高計</Label>
      <path d="M640 160 V80 H560" fill="none" stroke={safety} strokeWidth="3" />
      <Label x="600" y="70" size={12} fill={safety}>
        逃がし管
      </Label>
      <circle cx="620" cy="300" r="22" stroke={amber} fill={paper} strokeWidth="2" />
      <Label x="620" y="348" size={11} fill={amber}>
        逃がし弁
      </Label>
    </SvgBoard>
  );
}

export function SteamTrapDiagram() {
  return (
    <SvgBoard alt="蒸気トラップ4方式">
      {[
        { x: 50, title: "フロート", note: "浮力で開く" },
        { x: 200, title: "バケット", note: "カップの浮沈" },
        { x: 350, title: "温度応答", note: "冷えると開く" },
        { x: 500, title: "ディスク", note: "流速で閉じる" },
      ].map((item) => (
        <g key={item.title}>
          <rect x={item.x} y="120" width="140" height="200" fill={paper} stroke={ink} strokeWidth="2" />
          <Label x={item.x + 70} y="160" size={13}>
            {item.title}
          </Label>
          <circle cx={item.x + 70} cy="230" r="28" fill="none" stroke={safety} strokeWidth="2" />
          <Label x={item.x + 70} y="290" size={12} fill={graphite}>
            {item.note}
          </Label>
        </g>
      ))}
      <Label x="360" y="80">蒸気は残し、復水と空気を抜く</Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        開閉の原理（浮力・温度・流速）で種類を見分ける
      </Label>
    </SvgBoard>
  );
}

export function TemperatureControllerDiagram() {
  return (
    <SvgBoard alt="オンオフ式温度調節器の模式">
      <rect x="80" y="180" width="160" height="80" fill="#efe6d6" stroke={ink} strokeWidth="2" />
      <Label x="160" y="226">感温部</Label>
      <path d="M240 220 H340" stroke={ink} strokeWidth="3" />
      <rect x="340" y="160" width="140" height="120" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="410" y="210">ベローズ</Label>
      <Label x="410" y="232" size={12} fill={graphite}>
        膨張
      </Label>
      <path d="M480 220 H560" stroke={ink} strokeWidth="3" />
      <rect x="560" y="180" width="100" height="80" fill={paper} stroke={safety} strokeWidth="2" />
      <Label x="610" y="226" size={12} fill={safety}>
        接点
      </Label>
      <Label x="360" y="80">設定温度で燃焼を入／切する二位置動作</Label>
      <Label x="360" y="400" fill={graphite} size={12}>
        動作すきま（ディファレンシャル）でハンチングを抑える
      </Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        安全弁の代わりにはならない
      </Label>
    </SvgBoard>
  );
}

export function StartupValvesDiagram() {
  return (
    <SvgBoard alt="たき始めの弁の開閉">
      <rect x="200" y="80" width="320" height="220" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="360" y="130">ボイラー</Label>
      <line x1="200" y1="200" x2="520" y2="200" stroke={safety} strokeDasharray="6 4" />
      <Label x="180" y="196" anchor="end" size={12} fill={safety}>
        水位
      </Label>
      {[
        { x: 140, y: 360, label: "水面計 水・蒸気", state: "開" },
        { x: 310, y: 360, label: "排水コック", state: "閉" },
        { x: 480, y: 360, label: "空気抜き", state: "開→後閉" },
        { x: 620, y: 200, label: "主蒸気止め弁", state: "徐開" },
      ].map((item) => (
        <g key={item.label}>
          <circle cx={item.x} cy={item.y} r="16" fill={paper} stroke={ink} strokeWidth="2" />
          <Label x={item.x} y={item.y + 40} size={11}>
            {item.label}
          </Label>
          <Label x={item.x} y={item.y + 58} size={12} fill={safety}>
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
      <rect x="80" y="80" width="220" height="320" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="190" y="120">ボイラー</Label>
      <line x1="80" y1="220" x2="300" y2="220" stroke={safety} strokeWidth="2" />
      <rect x="400" y="140" width="36" height="200" fill="#dce8e0" stroke={ink} strokeWidth="2" />
      <line x1="400" y1="240" x2="436" y2="240" stroke={safety} strokeWidth="3" />
      <path d="M300 180 H400" stroke={ink} strokeWidth="3" />
      <path d="M300 260 H400" stroke={ink} strokeWidth="3" />
      <circle cx="360" cy="180" r="12" stroke={ink} fill={paper} />
      <circle cx="360" cy="260" r="12" stroke={ink} fill={paper} />
      <circle cx="418" cy="360" r="12" stroke={ink} fill={paper} />
      <Label x="500" y="184" anchor="start" size={12}>
        蒸気側コック（開）
      </Label>
      <Label x="500" y="264" anchor="start" size={12}>
        水側コック（開）
      </Label>
      <Label x="500" y="364" anchor="start" size={12}>
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
      <path d="M300 160 H420 L390 250 H330 Z" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="450" y="180" anchor="start">ばね</Label>
      <path d="M330 250 L300 280 H420 L390 250" fill="#efe6d6" stroke={ink} strokeWidth="2" />
      <Label x="360" y="272" size={12}>弁体</Label>
      <path d="M240 280 H300 M420 280 H480" stroke={ink} strokeWidth="4" />
      <path d="M300 280 L270 340 H450 L420 280" fill="none" stroke={safety} strokeWidth="2" />
      <Label x="360" y="330" size={12} fill={safety}>
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
      <path d="M80 420 H640 M80 420 V80" fill="none" stroke={ink} strokeWidth="2" />
      <Label x="360" y="500">処理水量</Label>
      <Label x="40" y="80" anchor="start" size={12}>
        残留硬度
      </Label>
      <path d="M80 380 H360 C400 378 420 200 520 120 H640" fill="none" stroke={safety} strokeWidth="3" />
      <circle cx="360" cy="378" r="6" fill={amber} />
      <Label x="360" y="360" size={12} fill={amber}>
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
  return (
    <SvgBoard alt="液体燃料の供給系統">
      {[
        { x: 40, t: "貯蔵タンク" },
        { x: 170, t: "サービス" },
        { x: 300, t: "ストレーナ" },
        { x: 430, t: "ポンプ" },
        { x: 560, t: "ヒータ" },
      ].map((item, index) => (
        <g key={item.t}>
          <rect x={item.x} y="200" width="110" height="80" fill={paper} stroke={ink} strokeWidth="2" />
          <Label x={item.x + 55} y="246" size={12}>
            {item.t}
          </Label>
          {index < 4 ? (
            <path
              d={`M${item.x + 110} 240 H${item.x + 130}`}
              stroke={safety}
              strokeWidth="3"
              markerEnd="none"
            />
          ) : null}
        </g>
      ))}
      <circle cx="640" cy="360" r="28" fill={amber} />
      <path d="M615 240 H640 V332" fill="none" stroke={safety} strokeWidth="3" />
      <Label x="640" y="410" size={12}>
        バーナ
      </Label>
      <Label x="360" y="120">貯蔵 → ろ過 → 加圧 → 加熱 → 噴霧</Label>
    </SvgBoard>
  );
}

export function OilBurnerDiagram() {
  return (
    <SvgBoard alt="油バーナの霧化方式">
      {[
        { x: 50, t: "圧力噴霧", n: "油自身の圧力" },
        { x: 260, t: "空気噴霧", n: "空気で吹き飛ばす" },
        { x: 470, t: "蒸気噴霧", n: "蒸気で吹き飛ばす" },
      ].map((item) => (
        <g key={item.t}>
          <rect x={item.x} y="140" width="190" height="200" fill={paper} stroke={ink} strokeWidth="2" />
          <Label x={item.x + 95} y="190">{item.t}</Label>
          <Label x={item.x + 95} y="260" size={12} fill={graphite}>
            {item.n}
          </Label>
        </g>
      ))}
      <Label x="360" y="80">何で霧化するかで種類を見分ける</Label>
      <Label x="360" y="420" fill={graphite} size={12}>
        圧力噴霧は低負荷に弱い。蒸気噴霧は高粘度向き
      </Label>
    </SvgBoard>
  );
}

export function GasCombustionDiagram() {
  return (
    <SvgBoard alt="拡散燃焼と予混合燃焼">
      <rect x="50" y="100" width="280" height="300" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="190" y="140">拡散</Label>
      <path d="M190 200 V320" stroke={amber} strokeWidth="8" />
      <Label x="190" y="360" size={12} fill={graphite}>
        出してから混ざる
      </Label>
      <rect x="390" y="100" width="280" height="300" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="530" y="140">予混合</Label>
      <rect x="460" y="190" width="140" height="50" fill="#e7efe8" stroke={safety} />
      <Label x="530" y="220" size={12} fill={safety}>
        先に混合
      </Label>
      <path d="M530 240 V320" stroke={amber} strokeWidth="6" />
      <Label x="530" y="360" size={12} fill={graphite}>
        逆火に注意
      </Label>
    </SvgBoard>
  );
}

export function PrimarySecondaryAirDiagram() {
  return (
    <SvgBoard alt="一次空気と二次空気の流れ">
      <rect x="260" y="140" width="200" height="220" fill="#efe6d6" stroke={ink} strokeWidth="2" />
      <Label x="360" y="250">火炉</Label>
      <path d="M80 250 H260" stroke={safety} strokeWidth="8" />
      <Label x="160" y="230" size={12} fill={safety}>
        一次空気
      </Label>
      <path d="M80 180 H260 M80 320 H260" stroke={graphite} strokeWidth="5" />
      <Label x="160" y="164" size={12} fill={graphite}>
        二次空気
      </Label>
      <Label x="160" y="348" size={12} fill={graphite}>
        二次空気
      </Label>
      <Label x="360" y="80">一次は根元と霧化、二次は燃え切り</Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        空気比は一次と二次の合計
      </Label>
    </SvgBoard>
  );
}

export function DraftFanDiagram() {
  return (
    <SvgBoard alt="押込通風と誘引通風">
      <rect x="260" y="180" width="200" height="140" fill={paper} stroke={ink} strokeWidth="2" />
      <Label x="360" y="256">火炉</Label>
      <circle cx="140" cy="250" r="40" fill={paper} stroke={safety} strokeWidth="2" />
      <Label x="140" y="256" size={12} fill={safety}>
        押込
      </Label>
      <circle cx="580" cy="250" r="40" fill={paper} stroke={graphite} strokeWidth="2" />
      <Label x="580" y="256" size={12} fill={graphite}>
        誘引
      </Label>
      <path d="M180 250 H260 M460 250 H540" stroke={ink} strokeWidth="3" />
      <Label x="360" y="80">両方使うと平衡通風</Label>
      <Label x="140" y="360" size={12}>空気を押す</Label>
      <Label x="580" y="360" size={12}>ガスを引く</Label>
      <Label x="360" y="480" fill={graphite} size={12}>
        後向き羽根は効率、前向き羽根は圧力向き
      </Label>
    </SvgBoard>
  );
}

export function BoilerRoomClearanceDiagram() {
  return (
    <SvgBoard alt="ボイラー室の離隔距離">
      <rect x="80" y="80" width="560" height="360" fill={paper} stroke={ink} strokeWidth="2" />
      <rect x="200" y="180" width="240" height="160" fill="#e7efe8" stroke={safety} strokeWidth="2" />
      <Label x="320" y="264">ボイラー</Label>
      <path d="M80 260 H200" stroke={amber} strokeWidth="2" />
      <Label x="140" y="248" size={12} fill={amber}>
        45cm以上
      </Label>
      <path d="M320 80 V180" stroke={amber} strokeWidth="2" />
      <Label x="400" y="140" size={12} fill={amber} anchor="start">
        上方 1.2m以上
      </Label>
      <Label x="360" y="500" fill={graphite} size={12}>
        最外側から測る。点検と避難のための間隔
      </Label>
    </SvgBoard>
  );
}
