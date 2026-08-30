import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function ImmuneSystemDiagram() {
  return (
    <DiagramScene src="/diagrams/immune-system.webp" alt="抗原の侵入から白血球が働くまでの流れ">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="immune-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M360 84 V96 H188 V108" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
        <path d="M360 96 H532 V108" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
        <path d="M532 160 V172 H456 V184" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
        <path d="M532 172 H608 V184" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
        <path d="M456 236 V256" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
        <path d="M608 236 V256" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#immune-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>抗原が入ってからの流れ</DiagramLabel>
      <DiagramLabel x={50} y={16} tone="safety-dark">
        抗原の侵入
      </DiagramLabel>
      <DiagramLabel x={26} y={34}>好中球：貪食</DiagramLabel>
      <DiagramLabel x={26} y={48} size="sm" tone="graphite">
        細菌などを取り込む
      </DiagramLabel>
      <DiagramLabel x={74} y={34}>リンパ球</DiagramLabel>
      <DiagramLabel x={64} y={54} tone="safety-dark">
        T細胞
      </DiagramLabel>
      <DiagramLabel x={84} y={54} tone="safety-dark">
        B細胞
      </DiagramLabel>
      <DiagramLabel x={64} y={70}>細胞性免疫</DiagramLabel>
      <DiagramLabel x={84} y={70}>体液性免疫</DiagramLabel>
      <DiagramLabel x={84} y={80} size="sm" tone="graphite">
        抗体を作る
      </DiagramLabel>
      <DiagramLabel x={50} y={90} size="sm" tone="graphite" width={88}>
        抗体は抗原に結合する蛋白質。抗原そのものではない
      </DiagramLabel>
      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={88}>
        アレルギーは、防御反応が過剰になった状態
      </DiagramLabel>
    </DiagramScene>
  );
}
