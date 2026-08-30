import { DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function MuscleTypesDiagram() {
  return (
    <DiagramScene src="/diagrams/muscle-movement.webp" alt="筋肉の種類と等尺性・等張性収縮">
      <DiagramLabel x={50} y={5}>筋肉の種類</DiagramLabel>
      <DiagramLabel x={18} y={16} tone="safety-dark">
        骨格筋
      </DiagramLabel>
      <DiagramLabel x={18} y={24} size="sm" tone="graphite">
        意志で動かせる
      </DiagramLabel>
      <DiagramLabel x={18} y={30} size="sm" tone="graphite">
        手足の運動、ふるえ
      </DiagramLabel>
      <DiagramLabel x={18} y={36} size="sm" tone="graphite">
        膝蓋腱反射など
      </DiagramLabel>
      <DiagramLabel x={50} y={16}>平滑筋</DiagramLabel>
      <DiagramLabel x={50} y={24} size="sm" tone="graphite">
        意志では動かしにくい
      </DiagramLabel>
      <DiagramLabel x={50} y={30} size="sm" tone="graphite">
        内臓や血管の壁
      </DiagramLabel>
      <DiagramLabel x={50} y={36} size="sm" tone="graphite">
        自律神経の影響
      </DiagramLabel>
      <DiagramLabel x={82} y={16}>心筋</DiagramLabel>
      <DiagramLabel x={82} y={24} size="sm" tone="graphite">
        心臓だけにある
      </DiagramLabel>
      <DiagramLabel x={82} y={30} size="sm" tone="graphite">
        規則正しく収縮
      </DiagramLabel>
      <DiagramLabel x={82} y={36} size="sm" tone="graphite">
        洞房結節が起点
      </DiagramLabel>

      <DiagramLabel x={50} y={58}>骨格筋の収縮のしかた</DiagramLabel>
      <DiagramLabel x={26} y={68}>等張性収縮</DiagramLabel>
      <DiagramLabel x={26} y={74} size="sm" tone="graphite">
        関節が動き、長さが変わる
      </DiagramLabel>
      <DiagramLabel x={26} y={80} size="sm" tone="graphite">
        持ち上げる、屈伸する
      </DiagramLabel>
      <DiagramLabel x={74} y={68} tone="safety-dark">
        等尺性収縮
      </DiagramLabel>
      <DiagramLabel x={74} y={74} size="sm" tone="safety">
        角度は変わらず、力だけ入る
      </DiagramLabel>
      <DiagramLabel x={74} y={80} size="sm" tone="safety">
        同じ姿勢で支え続ける
      </DiagramLabel>

      <DiagramLabel x={50} y={90} size="sm" tone="graphite" width={88}>
        酸素が十分ならグリコーゲンは二酸化炭素と水まで分解される
      </DiagramLabel>
      <DiagramLabel x={50} y={96} size="sm" tone="graphite" width={88}>
        酸素不足で乳酸が増えやすい。活動性肥大は使って筋が太くなること
      </DiagramLabel>
    </DiagramScene>
  );
}
