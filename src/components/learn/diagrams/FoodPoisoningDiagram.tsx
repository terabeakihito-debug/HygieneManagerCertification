import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function FoodPoisoningDiagram() {
  return (
    <DiagramScene src="/diagrams/food-poisoning.webp" alt="食中毒の感染型と毒素型の分類">
      <DiagramLabel x={26} y={6}>感染型</DiagramLabel>
      <DiagramLabel x={26} y={14} size="sm" tone="graphite">
        菌そのものが体内で増える
      </DiagramLabel>
      <DiagramLabel x={26} y={26} tone="safety-dark">
        サルモネラ菌
      </DiagramLabel>
      <DiagramLabel x={26} y={36} tone="safety-dark">
        腸炎ビブリオ菌
      </DiagramLabel>
      <DiagramLabel x={26} y={46} tone="safety-dark">
        カンピロバクター
      </DiagramLabel>

      <DiagramLabel x={74} y={6}>毒素型</DiagramLabel>
      <DiagramLabel x={74} y={14} size="sm" tone="graphite">
        食物中の毒素を摂取する
      </DiagramLabel>
      <DiagramLabel x={74} y={26} tone="amber">
        黄色ブドウ球菌
      </DiagramLabel>
      <DiagramLabel x={74} y={36} tone="stamp">
        ボツリヌス菌
      </DiagramLabel>
      <DiagramLabel x={74} y={50} size="sm" tone="graphite">
        ブドウ球菌毒素は熱に強い
      </DiagramLabel>

      <DiagramLabel x={50} y={70} size="sm" tone="graphite" width={88}>
        カンピロバクターを毒素型に入れるのは誤り
      </DiagramLabel>
      <DiagramLabel x={50} y={78} size="sm" tone="graphite" width={88}>
        ヒスタミンは加熱しても分解されにくい
      </DiagramLabel>
      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        ノロウイルス：十分な加熱、または塩素系消毒
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        手洗い、温度管理、二次汚染の防止が共通の予防
      </DiagramLabel>
    </DiagramScene>
  );
}
