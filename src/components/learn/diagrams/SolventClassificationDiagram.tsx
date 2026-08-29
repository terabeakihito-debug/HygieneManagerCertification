export function SolventClassificationDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="有機溶剤等の分類と体内への影響経路"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="168" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        有機溶剤等の区分
      </text>

      <rect x="24" y="48" width="288" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="168" y="78" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        第一種
      </text>
      <text x="168" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        より有害性が高いグループ
      </text>

      <rect x="24" y="136" width="288" height="72" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="168" y="166" textAnchor="middle" fill="#134e4a" fontSize="14" fontFamily="system-ui, sans-serif">
        第二種
      </text>
      <text x="168" y="188" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        トルエン、キシレンなど（例）
      </text>

      <rect x="24" y="224" width="288" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="168" y="254" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        第三種
      </text>
      <text x="168" y="276" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        ガソリンなど、相対的に有害性が低い
      </text>

      <text x="516" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        体内への主な経路
      </text>

      <rect x="368" y="48" width="128" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="432" y="75" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        蒸気を吸入
      </text>
      <path
        d="M496 70 H536"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#solvent-arrow)"
      />

      <rect x="540" y="48" width="152" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="616" y="75" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        肺（呼吸器）
      </text>
      <path
        d="M616 92 V124"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#solvent-arrow)"
      />

      <rect x="540" y="128" width="152" height="44" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="616" y="155" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        血液
      </text>

      <path
        d="M616 172 V200 H432 V220"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#solvent-arrow)"
      />
      <path
        d="M616 172 V220"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#solvent-arrow)"
      />

      <rect x="368" y="224" width="128" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="432" y="248" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        脳・脂肪組織
      </text>
      <text x="432" y="266" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        脂溶性が高い
      </text>

      <rect x="540" y="224" width="152" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="616" y="248" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        肝臓など
      </text>
      <text x="616" y="266" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        代謝の場
      </text>

      <text x="360" y="328" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        皮膚からの吸収もある。区分が重いほど、換気や健康診断などの措置も厚くなる
      </text>
      <text x="360" y="352" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        代表的な影響：麻酔作用、肝・腎障害、末梢神経障害、視覚障害など
      </text>

      <defs>
        <marker id="solvent-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
