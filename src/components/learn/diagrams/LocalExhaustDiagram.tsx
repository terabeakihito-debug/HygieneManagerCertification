import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function LocalExhaustDiagram() {
  return (
    <DiagramScene src="/diagrams/local-exhaust.webp" alt="局所排気装置の構成とフードの種類">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="exhaust-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M118 86 H168" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
        <path d="M236 86 H286" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
        <path d="M380 86 H430" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
        <path d="M520 86 H570" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>発生源から排気口までの流れ</DiagramLabel>
      <DiagramLabel x={12} y={28} size="sm">
        発生源
      </DiagramLabel>
      <DiagramLabel x={28} y={18} size="sm">
        フード
      </DiagramLabel>
      <DiagramLabel x={48} y={14} size="sm">
        ダクト
      </DiagramLabel>
      <DiagramLabel x={68} y={36} size="sm">
        排風機
      </DiagramLabel>
      <DiagramLabel x={88} y={22} size="sm">
        排気口
      </DiagramLabel>
      <DiagramLabel x={50} y={48} size="sm" tone="graphite">
        必要に応じてダクトと排風機の間に除じん・排ガス処理装置を置く
      </DiagramLabel>

      <DiagramLabel x={24} y={58}>囲い式フード</DiagramLabel>
      <DiagramLabel x={24} y={66} size="sm">
        発生源
      </DiagramLabel>
      <DiagramLabel x={24} y={74} size="sm" tone="graphite">
        発生源を覆い、少ない風量でも捕集しやすい
      </DiagramLabel>

      <DiagramLabel x={76} y={58}>外付け式フード</DiagramLabel>
      <DiagramLabel x={68} y={66} size="sm">
        発生源
      </DiagramLabel>
      <DiagramLabel x={84} y={66} size="sm">
        フード
      </DiagramLabel>
      <DiagramLabel x={76} y={74} size="sm" tone="graphite">
        発生源の外から吸い込む。近づけることが大切
      </DiagramLabel>

      <DiagramLabel x={38} y={90} size="sm" tone="safety">
        捕集する気流
      </DiagramLabel>
      <DiagramLabel x={62} y={90} size="sm" tone="stamp">
        ● 重要部
      </DiagramLabel>
    </DiagramScene>
  );
}
