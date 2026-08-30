import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function WBGTDiagram() {
  return (
    <DiagramScene src="/diagrams/wbgt.webp" alt="WBGTの三要素と熱中症に至る流れ">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="wbgt-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M132 100 V124 H360 V136" fill="none" stroke="#4B4F49" strokeWidth="2" />
        <path d="M360 100 V136" fill="none" stroke="#4B4F49" strokeWidth="2" />
        <path d="M588 100 V124 H360 V136" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
        <path d="M176 270 H196" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
        <path d="M352 270 H372" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
        <path d="M528 270 H548" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>WBGTの材料</DiagramLabel>
      <DiagramLabel x={18} y={16}>自然湿球温度</DiagramLabel>
      <DiagramLabel x={50} y={16} tone="safety-dark">
        黒球温度
      </DiagramLabel>
      <DiagramLabel x={82} y={16}>気温（乾球）</DiagramLabel>
      <DiagramLabel x={50} y={36} tone="safety-dark">
        WBGT
      </DiagramLabel>
      <DiagramLabel x={50} y={46} size="sm" tone="graphite" width={80}>
        実効温度は気温・湿度・気流。WBGTは放射熱（黒球）も見る
      </DiagramLabel>

      <DiagramLabel x={50} y={56}>熱中症に至る流れ</DiagramLabel>
      <DiagramLabel x={14} y={68} size="sm">
        暑熱ばく露
      </DiagramLabel>
      <DiagramLabel x={38} y={68} size="sm">
        発汗・脱水
      </DiagramLabel>
      <DiagramLabel x={62} y={68} size="sm">
        体温上昇
      </DiagramLabel>
      <DiagramLabel x={86} y={68} size="sm" tone="stamp">
        熱中症
      </DiagramLabel>

      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        基準値以上でリスクは高まる。未満でも油断しない
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        休憩、水分・塩分、作業強度の調整が基本
      </DiagramLabel>
    </DiagramScene>
  );
}
