import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function DigestiveSystemDiagram() {
  return (
    <DiagramScene src="/diagrams/digestive-system.webp" alt="消化管の流れと消化酵素が働く場所">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="digestive-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M112 36 H136" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
        <path d="M228 36 H252" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
        <path d="M344 36 H368" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
        <path d="M472 36 H496" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
        <path d="M588 36 H612" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>消化管の流れ</DiagramLabel>
      <DiagramLabel x={10} y={12} size="sm" tone="safety-dark">
        口
      </DiagramLabel>
      <DiagramLabel x={26} y={12} size="sm">
        食道
      </DiagramLabel>
      <DiagramLabel x={42} y={12} size="sm" tone="safety-dark">
        胃
      </DiagramLabel>
      <DiagramLabel x={58} y={12} size="sm" tone="safety-dark">
        十二指腸
      </DiagramLabel>
      <DiagramLabel x={74} y={12} size="sm" tone="safety-dark">
        小腸
      </DiagramLabel>
      <DiagramLabel x={90} y={12} size="sm">
        大腸
      </DiagramLabel>
      <DiagramLabel x={10} y={22} size="sm" tone="safety">
        唾液アミラーゼ
      </DiagramLabel>
      <DiagramLabel x={10} y={28} size="sm" tone="graphite">
        デンプンを分解
      </DiagramLabel>
      <DiagramLabel x={42} y={22} size="sm" tone="safety">
        ペプシン
      </DiagramLabel>
      <DiagramLabel x={42} y={28} size="sm" tone="graphite">
        蛋白質を分解
      </DiagramLabel>
      <DiagramLabel x={58} y={22} size="sm" tone="safety">
        膵液・胆汁
      </DiagramLabel>
      <DiagramLabel x={74} y={22} size="sm" tone="safety">
        吸収の主座
      </DiagramLabel>
      <DiagramLabel x={90} y={22} size="sm" tone="graphite">
        水分を吸収
      </DiagramLabel>

      <DiagramLabel x={50} y={58}>消化を助ける器官</DiagramLabel>
      <DiagramLabel x={18} y={68}>膵臓</DiagramLabel>
      <DiagramLabel x={18} y={74} size="sm" tone="graphite">
        膵アミラーゼ・トリプシン
      </DiagramLabel>
      <DiagramLabel x={18} y={80} size="sm" tone="graphite">
        膵リパーゼ、血糖の調節
      </DiagramLabel>
      <DiagramLabel x={50} y={68}>肝臓</DiagramLabel>
      <DiagramLabel x={50} y={74} size="sm" tone="graphite">
        胆汁の材料、血漿蛋白質
      </DiagramLabel>
      <DiagramLabel x={50} y={80} size="sm" tone="graphite">
        糖新生、有害物の処理
      </DiagramLabel>
      <DiagramLabel x={82} y={68}>胆嚢</DiagramLabel>
      <DiagramLabel x={82} y={74} size="sm" tone="graphite">
        胆汁をためて十二指腸へ
      </DiagramLabel>
      <DiagramLabel x={82} y={80} size="sm" tone="graphite">
        消化酵素は含まない
      </DiagramLabel>

      <DiagramLabel x={50} y={88}>三大栄養素の行き先</DiagramLabel>
      <DiagramLabel x={50} y={93} size="sm" tone="graphite" width={88}>
        糖質 → 小さい糖　蛋白質 → アミノ酸　脂質 → 脂肪酸など
      </DiagramLabel>
      <DiagramLabel x={50} y={98} size="sm" tone="graphite" width={88}>
        胆汁は脂肪を乳化して分解を助ける。無機塩・ビタミンは分解せず吸収
      </DiagramLabel>
    </DiagramScene>
  );
}
