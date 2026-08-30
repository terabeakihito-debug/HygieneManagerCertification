import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function NervousSystemDiagram() {
  return (
    <DiagramScene src="/diagrams/nervous-system.webp" alt="中枢神経系と末梢神経系のツリー構造">
      <DiagramArrows viewBox="0 0 720 440">
        <path
          d="M124 210 H172 V80 H216 M172 210 V320 H216"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
        />
        <path
          d="M336 80 H378 V40 H416 M378 80 V124 H416"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
        />
        <path
          d="M336 320 H378 V236 H416 M378 320 V368 H416"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
        />
        <path
          d="M516 236 H552 V204 H584 M552 236 V272 H584"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
        />
        <path
          d="M516 368 H552 V336 H584 M552 368 V400 H584"
          fill="none"
          stroke="#4B4F49"
          strokeWidth="2"
        />
      </DiagramArrows>

      <DiagramLabel x={12} y={48} tone="safety-dark">
        神経系
      </DiagramLabel>
      <DiagramLabel x={32} y={18}>中枢神経系</DiagramLabel>
      <DiagramLabel x={32} y={72}>末梢神経系</DiagramLabel>
      <DiagramLabel x={56} y={10} tone="safety-dark">
        脳
      </DiagramLabel>
      <DiagramLabel x={56} y={28} tone="safety-dark">
        脊髄
      </DiagramLabel>
      <DiagramLabel x={58} y={54}>体性神経</DiagramLabel>
      <DiagramLabel x={58} y={84}>自律神経</DiagramLabel>
      <DiagramLabel x={82} y={46}>感覚神経</DiagramLabel>
      <DiagramLabel x={82} y={62}>運動神経</DiagramLabel>
      <DiagramLabel x={82} y={76} tone="safety-dark">
        交感神経
      </DiagramLabel>
      <DiagramLabel x={82} y={92} tone="safety-dark">
        副交感神経
      </DiagramLabel>
    </DiagramScene>
  );
}
