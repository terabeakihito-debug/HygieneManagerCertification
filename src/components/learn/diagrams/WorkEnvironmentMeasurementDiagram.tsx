import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function WorkEnvironmentMeasurementDiagram() {
  return (
    <DiagramScene src="/diagrams/work-environment-measurement.webp" alt="A測定とB測定の測定点の違い">
      <DiagramLabel x={26} y={6}>A測定：場の分布</DiagramLabel>
      <DiagramLabel x={26} y={56} size="sm" tone="graphite">
        格子状の複数点
      </DiagramLabel>
      <DiagramLabel x={74} y={6}>B測定：発生源の近く</DiagramLabel>
      <DiagramLabel x={70} y={32} size="sm" tone="graphite">
        発生源
      </DiagramLabel>
      <DiagramLabel x={86} y={44} size="sm" tone="safety">
        最高濃度の点
      </DiagramLabel>
      <DiagramLabel x={74} y={56} size="sm" tone="graphite">
        ピークを捉える
      </DiagramLabel>

      <DiagramLabel x={50} y={70} size="sm" tone="graphite" width={88}>
        両方の結果を管理濃度と比べ、第一〜第三管理区分にする
      </DiagramLabel>
      <DiagramLabel x={50} y={78} size="sm" tone="graphite" width={88}>
        第一：概ね良好　第三：改善が必要、という方向で捉える
      </DiagramLabel>
      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        A測定の第二評価値が管理濃度を超えると第三管理区分になりやすい
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        細目は作業環境測定基準・評価基準を確認
      </DiagramLabel>
    </DiagramScene>
  );
}
