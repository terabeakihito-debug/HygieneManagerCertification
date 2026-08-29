export function SpecialCheckupDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="一般健康診断と特殊健康診断の違いと実施の流れ"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        二つの健康診断
      </text>

      <rect x="24" y="44" width="336" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="192" y="76" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        一般健康診断
      </text>
      <text x="192" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        雇入れ時・定期など
      </text>
      <text x="192" y="120" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        幅広い健康状態をみる
      </text>

      <rect x="372" y="44" width="324" height="88" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="534" y="76" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        特殊健康診断
      </text>
      <text x="534" y="100" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        有害業務に就く人
      </text>
      <text x="534" y="120" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        その業務特有の影響をみる
      </text>

      <text x="360" y="164" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        特殊健康診断の流れ
      </text>

      <rect x="40" y="180" width="184" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="132" y="214" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        配置換えのとき
      </text>
      <rect x="268" y="180" width="184" height="56" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="214" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        定期（以降）
      </text>
      <rect x="496" y="180" width="184" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="214" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        事後措置
      </text>

      <path d="M224 208 H264" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#checkup-arrow)" />
      <path d="M452 208 H492" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#checkup-arrow)" />

      <text x="360" y="268" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        目的：業務適性の判断と、影響の早期発見
      </text>
      <text x="360" y="296" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        周期は業務により異なる。6か月以内ごとのものが多い
      </text>
      <text x="360" y="324" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        有機溶剤、特定化学物質、鉛、放射線、騒音、じん肺などが代表
      </text>
      <text x="360" y="356" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        項目・保存期間の詳細は関係法令を確認
      </text>

      <defs>
        <marker id="checkup-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
