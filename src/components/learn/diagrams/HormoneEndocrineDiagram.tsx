import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function HormoneEndocrineDiagram() {
  return (
    <DiagramScene src="/diagrams/hormone-endocrine.webp" alt="主な内分泌器官とホルモン、はたらきの対応">
      <DiagramLabel x={50} y={5}>器官・ホルモン・はたらき</DiagramLabel>
      <DiagramLabel x={16} y={14} size="sm" tone="safety-dark">
        器官
      </DiagramLabel>
      <DiagramLabel x={42} y={14} size="sm" tone="safety-dark">
        ホルモン
      </DiagramLabel>
      <DiagramLabel x={78} y={14} size="sm" tone="safety-dark">
        はたらき
      </DiagramLabel>

      <DiagramLabel x={16} y={26} size="sm">
        副腎皮質
      </DiagramLabel>
      <DiagramLabel x={42} y={26} size="sm">
        コルチゾール
      </DiagramLabel>
      <DiagramLabel x={78} y={26} size="sm">
        血糖を上げる
      </DiagramLabel>

      <DiagramLabel x={16} y={38} size="sm">
        副腎皮質
      </DiagramLabel>
      <DiagramLabel x={42} y={38} size="sm">
        アルドステロン
      </DiagramLabel>
      <DiagramLabel x={78} y={38} size="sm">
        塩類バランス
      </DiagramLabel>

      <DiagramLabel x={16} y={50} size="sm">
        膵臓
      </DiagramLabel>
      <DiagramLabel x={42} y={50} size="sm">
        インスリン
      </DiagramLabel>
      <DiagramLabel x={78} y={50} size="sm">
        血糖を下げる
      </DiagramLabel>

      <DiagramLabel x={16} y={62} size="sm">
        膵臓
      </DiagramLabel>
      <DiagramLabel x={42} y={62} size="sm">
        グルカゴン
      </DiagramLabel>
      <DiagramLabel x={78} y={62} size="sm">
        血糖を上げる
      </DiagramLabel>

      <DiagramLabel x={16} y={74} size="sm">
        甲状腺
      </DiagramLabel>
      <DiagramLabel x={42} y={74} size="sm">
        チロキシン
      </DiagramLabel>
      <DiagramLabel x={78} y={74} size="sm">
        代謝を促進
      </DiagramLabel>

      <DiagramLabel x={16} y={86} size="sm">
        副甲状腺
      </DiagramLabel>
      <DiagramLabel x={42} y={86} size="sm">
        パラソルモン
      </DiagramLabel>
      <DiagramLabel x={78} y={86} size="sm">
        血中カルシウムを上げる
      </DiagramLabel>

      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={88}>
        副腎髄質のアドレナリンも血糖を上げるが、皮質とは別
      </DiagramLabel>
    </DiagramScene>
  );
}
