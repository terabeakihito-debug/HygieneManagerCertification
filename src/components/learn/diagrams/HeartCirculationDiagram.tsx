import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function HeartCirculationDiagram() {
  return (
    <DiagramScene src="/diagrams/heart-circulation.webp" alt="心臓の四つの部屋と体循環・肺循環">
      <DiagramArrows viewBox="0 0 720 460">
        <defs>
          <marker id="heart-arrow-graphite" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#4B4F49" />
          </marker>
          <marker id="heart-arrow-safety" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path
          d="M248 248 H208 V50 H300"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
          markerEnd="url(#heart-arrow-graphite)"
        />
        <path
          d="M420 50 H512 V156 H472"
          fill="none"
          stroke="#1F6E45"
          strokeWidth="2"
          markerEnd="url(#heart-arrow-safety)"
        />
        <path
          d="M472 248 H512 V370 H420"
          fill="none"
          stroke="#1F6E45"
          strokeWidth="2"
          markerEnd="url(#heart-arrow-safety)"
        />
        <path
          d="M300 370 H208 V184 H248"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
          markerEnd="url(#heart-arrow-graphite)"
        />
      </DiagramArrows>

      <DiagramLabel x={50} y={8}>肺</DiagramLabel>
      <DiagramLabel x={36} y={42}>右心房</DiagramLabel>
      <DiagramLabel x={36} y={56} size="sm" tone="graphite">
        右心室
      </DiagramLabel>
      <DiagramLabel x={64} y={42} tone="safety-dark">
        左心房
      </DiagramLabel>
      <DiagramLabel x={64} y={56} size="sm" tone="safety-dark">
        左心室
      </DiagramLabel>
      <DiagramLabel x={16} y={26} align="left" size="sm" tone="graphite">
        肺循環（静脈血）
      </DiagramLabel>
      <DiagramLabel x={84} y={26} align="right" size="sm" tone="safety">
        肺循環（動脈血）
      </DiagramLabel>
      <DiagramLabel x={84} y={72} align="right" size="sm" tone="safety">
        体循環（動脈血）
      </DiagramLabel>
      <DiagramLabel x={16} y={72} align="left" size="sm" tone="graphite">
        体循環（静脈血）
      </DiagramLabel>
      <DiagramLabel x={50} y={84}>全身</DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={72}>
        ● 洞房結節：右心房壁にあり拍動の起点
      </DiagramLabel>
    </DiagramScene>
  );
}
