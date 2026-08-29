export function HeartCirculationDiagram() {
  return (
    <svg
      viewBox="0 0 720 460"
      role="img"
      aria-label="心臓の四つの部屋と体循環・肺循環"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="460" fill="#f9fafb" />

      <rect x="300" y="28" width="120" height="44" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="55" textAnchor="middle" fill="#134e4a" fontSize="14" fontFamily="system-ui, sans-serif">
        肺
      </text>

      <rect x="248" y="156" width="100" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="298" y="181" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        右心房
      </text>
      <text x="298" y="200" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        静脈血が戻る
      </text>

      <rect x="372" y="156" width="100" height="56" rx="8" fill="#fff" stroke="#0f766e" />
      <text x="422" y="181" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        左心房
      </text>
      <text x="422" y="200" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        動脈血が戻る
      </text>

      <rect x="248" y="220" width="100" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="298" y="245" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        右心室
      </text>
      <text x="298" y="264" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        肺へ送る
      </text>

      <rect x="372" y="220" width="100" height="56" rx="8" fill="#fff" stroke="#0f766e" />
      <text x="422" y="245" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        左心室
      </text>
      <text x="422" y="264" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        全身へ送る
      </text>

      <rect x="300" y="348" width="120" height="44" rx="8" fill="#e5e7eb" stroke="#6b7280" />
      <text x="360" y="375" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        全身
      </text>

      <path
        d="M248 248 H208 V50 H300"
        fill="none"
        stroke="#374151"
        strokeWidth="2"
        markerEnd="url(#heart-arrow-gray)"
      />
      <path
        d="M420 50 H512 V156 H472"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#heart-arrow-teal)"
      />
      <text x="36" y="100" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        肺循環（静脈血）
      </text>
      <text x="528" y="100" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        肺循環（動脈血）
      </text>

      <path
        d="M472 248 H512 V370 H420"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#heart-arrow-teal)"
      />
      <path
        d="M300 370 H208 V184 H248"
        fill="none"
        stroke="#374151"
        strokeWidth="2"
        markerEnd="url(#heart-arrow-gray)"
      />
      <text x="528" y="318" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        体循環（動脈血）
      </text>
      <text x="36" y="318" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        体循環（静脈血）
      </text>

      <text x="360" y="432" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        洞房結節は右心房壁にあり、拍動の起点になる
      </text>

      <defs>
        <marker id="heart-arrow-gray" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#374151" />
        </marker>
        <marker id="heart-arrow-teal" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
