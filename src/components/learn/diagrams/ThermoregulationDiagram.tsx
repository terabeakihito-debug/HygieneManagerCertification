import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function ThermoregulationDiagram() {
  return (
    <DiagramScene src="/diagrams/thermoregulation.webp" alt="視床下部を中心にした暑いときと寒いときの反応">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="thermo-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#4B4F49" />
          </marker>
        </defs>
        <path d="M360 84 V110" fill="none" stroke="#4B4F49" strokeWidth="2" />
        <path d="M160 110 H560" fill="none" stroke="#4B4F49" strokeWidth="2" />
        <path d="M160 110 V132" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#thermo-arrow)" />
        <path d="M560 110 V132" fill="none" stroke="#4B4F49" strokeWidth="2" markerEnd="url(#thermo-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={10} tone="safety-dark">
        視床下部（間脳）
      </DiagramLabel>
      <DiagramLabel x={50} y={16} size="sm" tone="safety">
        体温調節中枢
      </DiagramLabel>

      <DiagramLabel x={22} y={36}>暑いとき</DiagramLabel>
      <DiagramLabel x={22} y={46} size="sm" tone="graphite">
        皮膚の血管が拡張
      </DiagramLabel>
      <DiagramLabel x={22} y={52} size="sm" tone="graphite">
        血流量が増え、熱を逃がす
      </DiagramLabel>
      <DiagramLabel x={22} y={62} size="sm" tone="graphite">
        発汗
      </DiagramLabel>
      <DiagramLabel x={22} y={68} size="sm" tone="graphite">
        蒸発の気化熱で体温が下がる
      </DiagramLabel>

      <DiagramLabel x={78} y={36}>寒いとき</DiagramLabel>
      <DiagramLabel x={78} y={46} size="sm" tone="graphite">
        皮膚の血管が収縮
      </DiagramLabel>
      <DiagramLabel x={78} y={52} size="sm" tone="graphite">
        血流量が減り、熱を保つ
      </DiagramLabel>
      <DiagramLabel x={78} y={62} size="sm" tone="graphite">
        ふるえ
      </DiagramLabel>
      <DiagramLabel x={78} y={68} size="sm" tone="graphite">
        骨格筋の収縮で産熱が増える
      </DiagramLabel>

      <DiagramLabel x={50} y={88} size="sm" tone="graphite" width={88}>
        恒常性（ホメオスタシス）：産熱と放熱のバランスで体温を保つ
      </DiagramLabel>
      <DiagramLabel x={50} y={95} size="sm" tone="graphite" width={88}>
        発汗は汗腺から。不感蒸泄は皮膚と呼気からの、気づきにくい水分喪失
      </DiagramLabel>
    </DiagramScene>
  );
}
