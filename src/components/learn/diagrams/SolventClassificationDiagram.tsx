import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function SolventClassificationDiagram() {
  return (
    <DiagramScene src="/diagrams/organic-solvents.webp" alt="有機溶剤等の分類と体内への影響経路">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="solvent-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M496 70 H536" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#solvent-arrow)" />
        <path d="M616 92 V124" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#solvent-arrow)" />
        <path d="M616 172 V200 H432 V220" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#solvent-arrow)" />
        <path d="M616 172 V220" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#solvent-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={24} y={6}>有機溶剤等の区分</DiagramLabel>
      <DiagramLabel x={24} y={18}>第一種</DiagramLabel>
      <DiagramLabel x={24} y={24} size="sm" tone="graphite">
        より有害性が高いグループ
      </DiagramLabel>
      <DiagramLabel x={24} y={40} tone="safety-dark">
        第二種
      </DiagramLabel>
      <DiagramLabel x={24} y={46} size="sm" tone="safety">
        トルエン、キシレンなど（例）
      </DiagramLabel>
      <DiagramLabel x={24} y={62}>第三種</DiagramLabel>
      <DiagramLabel x={24} y={68} size="sm" tone="graphite">
        ガソリンなど、相対的に有害性が低い
      </DiagramLabel>

      <DiagramLabel x={72} y={6}>体内への主な経路</DiagramLabel>
      <DiagramLabel x={60} y={18}>蒸気を吸入</DiagramLabel>
      <DiagramLabel x={86} y={18}>肺（呼吸器）</DiagramLabel>
      <DiagramLabel x={86} y={38} tone="safety-dark">
        血液
      </DiagramLabel>
      <DiagramLabel x={60} y={60}>脳・脂肪組織</DiagramLabel>
      <DiagramLabel x={60} y={66} size="sm" tone="graphite">
        脂溶性が高い
      </DiagramLabel>
      <DiagramLabel x={86} y={60}>肝臓など</DiagramLabel>
      <DiagramLabel x={86} y={66} size="sm" tone="graphite">
        代謝の場
      </DiagramLabel>

      <DiagramLabel x={50} y={88} size="sm" tone="graphite" width={88}>
        皮膚からの吸収もある。区分が重いほど、換気や健康診断などの措置も厚くなる
      </DiagramLabel>
      <DiagramLabel x={50} y={95} size="sm" tone="graphite" width={88}>
        代表的な影響：麻酔作用、肝・腎障害、末梢神経障害、視覚障害など
      </DiagramLabel>
    </DiagramScene>
  );
}
