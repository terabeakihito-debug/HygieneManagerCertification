import { DiagramArrows, DiagramLabel, DiagramScene } from "@/components/learn/diagrams/DiagramScene";

export function SpecialCheckupDiagram() {
  return (
    <DiagramScene src="/diagrams/special-checkup.webp" alt="一般健康診断と特殊健康診断の違いと実施の流れ">
      <DiagramArrows viewBox="0 0 720 400">
        <defs>
          <marker id="checkup-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
            <path d="M0 0 L8 4 L0 8 Z" fill="#1F6E45" />
          </marker>
        </defs>
        <path d="M224 208 H264" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#checkup-arrow)" />
        <path d="M452 208 H492" fill="none" stroke="#1F6E45" strokeWidth="2" markerEnd="url(#checkup-arrow)" />
      </DiagramArrows>

      <DiagramLabel x={50} y={5}>二つの健康診断</DiagramLabel>
      <DiagramLabel x={26} y={16}>一般健康診断</DiagramLabel>
      <DiagramLabel x={26} y={22} size="sm" tone="graphite">
        雇入れ時・定期など
      </DiagramLabel>
      <DiagramLabel x={26} y={28} size="sm" tone="graphite">
        幅広い健康状態をみる
      </DiagramLabel>
      <DiagramLabel x={74} y={16} tone="safety-dark">
        特殊健康診断
      </DiagramLabel>
      <DiagramLabel x={74} y={22} size="sm" tone="safety">
        有害業務に就く人
      </DiagramLabel>
      <DiagramLabel x={74} y={28} size="sm" tone="safety">
        その業務特有の影響をみる
      </DiagramLabel>

      <DiagramLabel x={50} y={42}>特殊健康診断の流れ</DiagramLabel>
      <DiagramLabel x={18} y={54}>配置換えのとき</DiagramLabel>
      <DiagramLabel x={50} y={54} tone="safety-dark">
        定期（以降）
      </DiagramLabel>
      <DiagramLabel x={82} y={54}>事後措置</DiagramLabel>

      <DiagramLabel x={50} y={70} size="sm" tone="graphite" width={88}>
        目的：業務適性の判断と、影響の早期発見
      </DiagramLabel>
      <DiagramLabel x={50} y={78} size="sm" tone="graphite" width={88}>
        周期は業務により異なる。6か月以内ごとのものが多い
      </DiagramLabel>
      <DiagramLabel x={50} y={86} size="sm" tone="graphite" width={88}>
        有機溶剤、特定化学物質、鉛、放射線、騒音、じん肺などが代表
      </DiagramLabel>
      <DiagramLabel x={50} y={94} size="sm" tone="graphite" width={88}>
        項目・保存期間の詳細は関係法令を確認
      </DiagramLabel>
    </DiagramScene>
  );
}
