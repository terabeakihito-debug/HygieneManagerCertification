import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function DustLungDiagram() {
  return (
    <DiagramScene src="/diagrams/dust-pneumoconiosis.webp" alt="粉じんの種類とじん肺に至る経路">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="dust-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M176 206 H196" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#dust-arrow)" />
        <path d="M352 206 H372" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#dust-arrow)" />
        <path d="M528 206 H548" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#dust-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>粉じんの種類</DiagramLabel>
      <DiagramLabel x={26} y={16} tone="safety-dark">
        鉱物性粉じん
      </DiagramLabel>
      <DiagramLabel x={26} y={24} size="sm" tone="stamp">
        遊離けい酸など → じん肺（けい肺）
      </DiagramLabel>
      <DiagramLabel x={26} y={30} size="sm" tone="stamp">
        石綿 → 肺がん・中皮腫など
      </DiagramLabel>
      <DiagramLabel x={74} y={16}>有機・植物性粉じん</DiagramLabel>
      <DiagramLabel x={74} y={24} size="sm" tone="graphite">
        木材粉じんなど
      </DiagramLabel>
      <DiagramLabel x={74} y={30} size="sm" tone="graphite">
        アレルギー性の喘息・鼻炎が多い
      </DiagramLabel>

      <DiagramLabel x={50} y={42}>じん肺に至る流れ</DiagramLabel>
      <DiagramLabel x={14} y={54}>吸入</DiagramLabel>
      <DiagramLabel x={38} y={54}>肺に沈着</DiagramLabel>
      <DiagramLabel x={62} y={54} tone="amber">
        線維化
      </DiagramLabel>
      <DiagramLabel x={86} y={54} tone="stamp">
        じん肺
      </DiagramLabel>

      <DiagramLabel x={50} y={70} size="sm" tone="graphite" width={88}>
        けい肺はけい酸が原因。金属粉じんだけで起きるとは限らない
      </DiagramLabel>
      <DiagramLabel x={50} y={78} size="sm" tone="graphite" width={88}>
        続発症：慢性気管支炎、肺結核などの合併に注意
      </DiagramLabel>
      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        石綿はばく露から長い年月を経て病気が現れることがある
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        密閉・湿潤化・局所排気・保護具を組み合わせる
      </DiagramLabel>
    </DiagramScene>
  );
}
