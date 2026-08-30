import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function BloodCompositionDiagram() {
  return (
    <DiagramScene src="/diagrams/blood-composition.webp" alt="血液の成分内訳とそれぞれの働き">
      <DiagramLabel x={22} y={6}>血液のおよその内訳</DiagramLabel>
      <DiagramLabel x={38} y={36} tone="safety-dark">
        赤血球
      </DiagramLabel>
      <DiagramLabel x={38} y={42} size="sm" tone="safety">
        およそ4割台
      </DiagramLabel>
      <DiagramLabel x={16} y={48}>血漿</DiagramLabel>
      <DiagramLabel x={16} y={54} size="sm" tone="graphite">
        半分より多い
      </DiagramLabel>
      <DiagramLabel x={34} y={22} size="sm" tone="graphite">
        白血球
      </DiagramLabel>
      <DiagramLabel x={34} y={28} size="sm" tone="graphite">
        ・血小板
      </DiagramLabel>

      <DiagramLabel x={76} y={6}>主なはたらき</DiagramLabel>
      <DiagramLabel x={76} y={18} tone="safety-dark">
        赤血球：酸素を運ぶ
      </DiagramLabel>
      <DiagramLabel x={76} y={24} size="sm" tone="safety">
        骨髄で産生、寿命はおよそ120日
      </DiagramLabel>
      <DiagramLabel x={76} y={36}>白血球：免疫</DiagramLabel>
      <DiagramLabel x={76} y={42} size="sm" tone="graphite">
        好中球の貪食、リンパ球など
      </DiagramLabel>
      <DiagramLabel x={76} y={54}>血小板：血液凝固</DiagramLabel>
      <DiagramLabel x={76} y={60} size="sm" tone="graphite">
        フィブリノーゲンがフィブリンへ
      </DiagramLabel>
      <DiagramLabel x={76} y={72}>血漿蛋白質</DiagramLabel>
      <DiagramLabel x={76} y={78} size="sm" tone="graphite">
        アルブミン、グロブリンなど
      </DiagramLabel>

      <DiagramLabel x={50} y={90} size="sm" tone="graphite" width={88}>
        ABO式血液型は赤血球の分類。A型の血清は抗B抗体を持つ
      </DiagramLabel>
      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={88}>
        ヘマトクリットは赤血球の容積割合。貧血では低くなる
      </DiagramLabel>
    </DiagramScene>
  );
}
