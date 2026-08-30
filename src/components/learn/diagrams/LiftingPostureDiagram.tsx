import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function LiftingPostureDiagram() {
  return (
    <DiagramScene src="/diagrams/lifting-posture.webp" alt="重量物のよい持ち上げ方とよくない持ち上げ方">
      <DiagramLabel x={26} y={6} tone="safety-dark">
        よい持ち方
      </DiagramLabel>
      <DiagramLabel x={26} y={58} size="sm" tone="safety-dark">
        膝を曲げ、腰を落とす
      </DiagramLabel>
      <DiagramLabel x={74} y={6}>よくない持ち方</DiagramLabel>
      <DiagramLabel x={74} y={58} size="sm" tone="stamp">
        膝を伸ばし、腰だけ曲げる
      </DiagramLabel>
      <DiagramLabel x={50} y={72} size="sm" tone="graphite" width={88}>
        片足を少し前に出し、荷物をかかえて膝で立ち上がる
      </DiagramLabel>
      <DiagramLabel x={50} y={80} size="sm" tone="graphite" width={88}>
        男性の人力取扱いの目安は、体重のおおむね40％以下
      </DiagramLabel>
      <DiagramLabel x={50} y={88} size="sm" tone="graphite" width={88}>
        腰部保護ベルトの全員使用は、指針の主眼ではない
      </DiagramLabel>
      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={88}>
        配置時とその後およそ6か月ごとの健診も健康管理の一つ
      </DiagramLabel>
    </DiagramScene>
  );
}
