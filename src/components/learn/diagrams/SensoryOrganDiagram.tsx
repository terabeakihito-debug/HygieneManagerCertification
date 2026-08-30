import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function SensoryOrganDiagram() {
  return (
    <DiagramScene src="/diagrams/sensory-organs.webp" alt="眼球の断面と視覚・聴覚の要点">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="sensory-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path
          d="M286 168 H330"
          fill="none"
          stroke="#1F6E45"
          strokeWidth="2"
          markerEnd="url(#sensory-arrow)"
        />
      </DiagramArrows>

      <DiagramLabel x={24} y={6}>眼球の断面（模式）</DiagramLabel>
      <DiagramLabel x={6} y={42} align="left" size="sm" tone="safety">
        角膜
      </DiagramLabel>
      <DiagramLabel x={18} y={42} size="sm" tone="safety-dark">
        水晶体
      </DiagramLabel>
      <DiagramLabel x={18} y={58} size="sm" tone="graphite">
        毛様体筋で厚みを調節
      </DiagramLabel>
      <DiagramLabel x={32} y={42}>網膜</DiagramLabel>
      <DiagramLabel x={48} y={40} align="left" size="sm" tone="safety">
        視神経
      </DiagramLabel>
      <DiagramLabel x={24} y={72} size="sm" tone="graphite">
        錐状体：色を感じる
      </DiagramLabel>
      <DiagramLabel x={24} y={78} size="sm" tone="graphite">
        杆状体：明暗を感じる
      </DiagramLabel>
      <DiagramLabel x={24} y={84} size="sm" tone="graphite">
        暗い所では暗順応で徐々に見える
      </DiagramLabel>

      <DiagramLabel x={76} y={6}>聴覚・加齢の要点</DiagramLabel>
      <DiagramLabel x={76} y={20}>前庭・半規管は内耳</DiagramLabel>
      <DiagramLabel x={76} y={26} size="sm" tone="graphite">
        体の傾きや回転を感じる
      </DiagramLabel>
      <DiagramLabel x={76} y={40} tone="safety-dark">
        老人性難聴
      </DiagramLabel>
      <DiagramLabel x={76} y={46} size="sm" tone="safety">
        高い音域から聞こえにくくなる
      </DiagramLabel>
      <DiagramLabel x={76} y={60}>加齢による視覚</DiagramLabel>
      <DiagramLabel x={76} y={66} size="sm" tone="graphite">
        動体視力が衰え、高い照度が必要
      </DiagramLabel>

      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        水晶体の厚みを変えるのは毛様体筋。硝子体ではない
      </DiagramLabel>
    </DiagramScene>
  );
}
