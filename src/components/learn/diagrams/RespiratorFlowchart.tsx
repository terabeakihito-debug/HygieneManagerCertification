import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function RespiratorFlowchart() {
  return (
    <DiagramScene src="/diagrams/respirators.webp" alt="呼吸用保護具の使い分けフローチャート">
      <DiagramArrows viewBox="0 0 720 420">
        <defs>
          <marker id="resp-arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#4B4F49" />
          </marker>
        </defs>
        <path d="M360 64 V92" stroke="#4B4F49" strokeWidth="2" fill="none" />
        <path d="M160 92 H560" stroke="#4B4F49" strokeWidth="2" fill="none" />
        <path d="M160 92 V118" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
        <path d="M560 92 V118" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
        <path d="M560 172 V196" stroke="#4B4F49" strokeWidth="2" fill="none" />
        <path d="M160 196 H560" stroke="#4B4F49" strokeWidth="2" fill="none" />
        <path d="M160 196 V220" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
        <path d="M360 196 V220" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
        <path d="M560 196 V220" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
        <path d="M360 266 V290" stroke="#4B4F49" strokeWidth="2" fill="none" markerEnd="url(#resp-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={8} width={44}>
        酸素濃度はおよそ18％以上か
      </DiagramLabel>
      <DiagramLabel x={50} y={14} size="sm" tone="graphite">
        不明・高濃度のときも下へ
      </DiagramLabel>
      <DiagramLabel x={18} y={20} size="sm" tone="graphite">
        いいえ
      </DiagramLabel>
      <DiagramLabel x={82} y={20} size="sm" tone="safety">
        はい
      </DiagramLabel>
      <DiagramLabel x={22} y={32} tone="safety-dark">
        送気マスクなど
      </DiagramLabel>
      <DiagramLabel x={22} y={38} size="sm" tone="graphite">
        給気式（ろ過式は使わない）
      </DiagramLabel>
      <DiagramLabel x={78} y={32}>有害物質の種類は？</DiagramLabel>
      <DiagramLabel x={22} y={56} size="sm" tone="safety-dark">
        粉じん → 防じんマスク
      </DiagramLabel>
      <DiagramLabel x={50} y={56} size="sm">
        ガス・蒸気
      </DiagramLabel>
      <DiagramLabel x={78} y={56} size="sm" tone="safety-dark">
        混在 → 防じん機能付き
      </DiagramLabel>
      <DiagramLabel x={50} y={72} tone="safety-dark">
        防毒マスク
      </DiagramLabel>
      <DiagramLabel x={50} y={84}>吸収缶の色の目安</DiagramLabel>
      <DiagramLabel x={50} y={90} size="sm" tone="graphite" width={80}>
        有機ガス：黒　アンモニア：緑　一酸化炭素：赤
      </DiagramLabel>
      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={80}>
        直結式は隔離式より高濃度の雰囲気には向かない
      </DiagramLabel>
    </DiagramScene>
  );
}
