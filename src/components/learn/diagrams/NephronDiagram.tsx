import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function NephronDiagram() {
  return (
    <DiagramScene src="/diagrams/kidney-urine.webp" alt="ネフロンの模式図と原尿が尿になる流れ">
      <DiagramArrows viewBox="0 0 720 420">
        <defs>
          <marker id="nephron-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#4B4F49" />
          </marker>
        </defs>
        <path d="M548 72 V102" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#nephron-arrow)" />
        <path d="M548 138 V168" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#nephron-arrow)" />
        <path d="M548 204 V234" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#nephron-arrow)" />
        <path d="M548 270 V300" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#nephron-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={22} y={6}>ネフロン（模式）</DiagramLabel>
      <DiagramLabel x={28} y={28}>糸球体</DiagramLabel>
      <DiagramLabel x={42} y={22} align="left" size="sm" tone="graphite">
        ボウマン嚢
      </DiagramLabel>
      <DiagramLabel x={48} y={40} align="left" tone="safety">
        尿細管
      </DiagramLabel>
      <DiagramLabel x={18} y={62} size="sm" tone="graphite">
        点線部で再吸収
      </DiagramLabel>
      <DiagramLabel x={48} y={78} align="left">
        集合管 → 尿
      </DiagramLabel>

      <DiagramLabel x={76} y={6}>原尿が尿になるまで</DiagramLabel>
      <DiagramLabel x={76} y={16}>血液</DiagramLabel>
      <DiagramLabel x={76} y={30} tone="safety-dark">
        糸球体でろ過
      </DiagramLabel>
      <DiagramLabel x={76} y={46}>原尿（ボウマン嚢）</DiagramLabel>
      <DiagramLabel x={76} y={62} tone="safety-dark">
        尿細管で再吸収
      </DiagramLabel>
      <DiagramLabel x={76} y={76}>尿として排出</DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite">
        蛋白質は通常ほとんどろ過されず、水分や電解質の多くは再吸収される
      </DiagramLabel>
    </DiagramScene>
  );
}
