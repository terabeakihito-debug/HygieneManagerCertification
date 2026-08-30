import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function NoiseHealthDiagram() {
  return (
    <DiagramScene src="/diagrams/noise-health.webp" alt="騒音対策の優先順位と等価騒音レベルの見方">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="noise-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M240 84 H248" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#noise-arrow)" />
        <path d="M468 84 H476" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#noise-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>騒音対策の優先順位</DiagramLabel>
      <DiagramLabel x={18} y={16} tone="safety-dark">
        1. 発生源対策
      </DiagramLabel>
      <DiagramLabel x={18} y={22} size="sm" tone="safety">
        静音化・囲い込み
      </DiagramLabel>
      <DiagramLabel x={50} y={16}>2. 伝ぱ経路対策</DiagramLabel>
      <DiagramLabel x={50} y={22} size="sm" tone="graphite">
        壁・距離・遮音
      </DiagramLabel>
      <DiagramLabel x={82} y={16}>3. 受音者対策</DiagramLabel>
      <DiagramLabel x={82} y={22} size="sm" tone="graphite">
        聴覚保護具・時間制限
      </DiagramLabel>
      <DiagramLabel x={50} y={34} size="sm" tone="graphite" width={80}>
        耳栓・イヤーマフは最後の手段。最初から保護具に頼らない
      </DiagramLabel>

      <DiagramLabel x={50} y={46}>等価騒音レベルと聴力の目安</DiagramLabel>
      <DiagramLabel x={22} y={56} size="sm" tone="graphite">
        会話の音
      </DiagramLabel>
      <DiagramLabel x={50} y={56} size="sm" tone="safety-dark">
        作業場の騒音
      </DiagramLabel>
      <DiagramLabel x={78} y={56} size="sm">
        より大きい音
      </DiagramLabel>

      <DiagramLabel x={50} y={70} size="sm" tone="graphite" width={88}>
        騒音性難聴：およそ4000Hz付近（c5 dip）から落ちやすい
      </DiagramLabel>
      <DiagramLabel x={50} y={78} size="sm" tone="graphite" width={88}>
        定点測定が原則。発生源が動くときは個人ばく露測定も使える
      </DiagramLabel>
      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        事後措置では加齢性難聴の影響も考慮する
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        基準値の適用は関係法令・指針を確認
      </DiagramLabel>
    </DiagramScene>
  );
}
