import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function AgingChangesDiagram() {
  return (
    <DiagramScene src="/diagrams/aging-changes.webp" alt="加齢に伴って変化しやすい機能の一覧">
      <DiagramLabel x={50} y={5}>加齢で変化しやすい機能</DiagramLabel>
      <DiagramLabel x={16} y={16}>視力</DiagramLabel>
      <DiagramLabel x={16} y={22} size="sm" tone="graphite">
        動体視力の低下
      </DiagramLabel>
      <DiagramLabel x={16} y={28} size="sm" tone="graphite">
        暗順応の遅れ
      </DiagramLabel>
      <DiagramLabel x={50} y={16} tone="safety-dark">
        聴力
      </DiagramLabel>
      <DiagramLabel x={50} y={22} size="sm" tone="safety">
        老人性難聴
      </DiagramLabel>
      <DiagramLabel x={50} y={28} size="sm" tone="safety">
        高い音から聞こえにくい
      </DiagramLabel>
      <DiagramLabel x={84} y={16}>平衡感覚</DiagramLabel>
      <DiagramLabel x={84} y={22} size="sm" tone="graphite">
        つまずき・転倒
      </DiagramLabel>
      <DiagramLabel x={84} y={28} size="sm" tone="graphite">
        につながりやすい
      </DiagramLabel>
      <DiagramLabel x={16} y={44} tone="safety-dark">
        体温調節
      </DiagramLabel>
      <DiagramLabel x={16} y={50} size="sm" tone="safety">
        暑さ寒さへの遅れ
      </DiagramLabel>
      <DiagramLabel x={16} y={56} size="sm" tone="safety">
        熱中症リスク
      </DiagramLabel>
      <DiagramLabel x={50} y={44}>骨密度</DiagramLabel>
      <DiagramLabel x={50} y={50} size="sm" tone="graphite">
        低下すると
      </DiagramLabel>
      <DiagramLabel x={50} y={56} size="sm" tone="graphite">
        骨折しやすくなる
      </DiagramLabel>
      <DiagramLabel x={84} y={44}>筋力</DiagramLabel>
      <DiagramLabel x={84} y={50} size="sm" tone="graphite">
        重量物や段差で
      </DiagramLabel>
      <DiagramLabel x={84} y={56} size="sm" tone="graphite">
        負担が増えやすい
      </DiagramLabel>

      <DiagramLabel x={50} y={74} size="sm" tone="graphite" width={88}>
        進み方には個人差がある。年齢だけで能力を決めつけない
      </DiagramLabel>
      <DiagramLabel x={50} y={81} size="sm" tone="graphite" width={88}>
        低い音から先に聞こえなくなる、というのは逆
      </DiagramLabel>
      <DiagramLabel x={50} y={88} size="sm" tone="graphite" width={88}>
        照明、音量、休憩、転倒防止など、環境と作業の見直しが中心
      </DiagramLabel>
      <DiagramLabel x={50} y={95} size="sm" tone="graphite" width={88}>
        高齢者は一般に高い照度を必要とするが、まぶしさも感じやすい
      </DiagramLabel>
    </DiagramScene>
  );
}
