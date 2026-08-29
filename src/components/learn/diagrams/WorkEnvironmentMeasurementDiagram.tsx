export function WorkEnvironmentMeasurementDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="A測定とB測定の測定点の違い"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="192" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        A測定：場の分布
      </text>
      <rect x="24" y="44" width="336" height="200" rx="10" fill="#fff" stroke="#d1d5db" />
      <circle cx="80" cy="96" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="160" cy="96" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="240" cy="96" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="320" cy="96" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="80" cy="160" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="160" cy="160" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="240" cy="160" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="320" cy="160" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="80" cy="188" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="160" cy="188" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="240" cy="188" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <circle cx="320" cy="188" r="10" fill="#ccfbf1" stroke="#0f766e" />
      <text x="192" y="226" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        格子状の複数点
      </text>

      <text x="528" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        B測定：発生源の近く
      </text>
      <rect x="384" y="44" width="312" height="200" rx="10" fill="#fff" stroke="#d1d5db" />
      <rect x="500" y="100" width="80" height="48" rx="6" fill="#e5e7eb" stroke="#6b7280" />
      <text x="540" y="129" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        発生源
      </text>
      <circle cx="620" cy="124" r="12" fill="#ccfbf1" stroke="#0f766e" strokeWidth="2" />
      <text x="620" y="176" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        最高濃度の点
      </text>
      <text x="540" y="220" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        ピークを捉える
      </text>

      <text x="360" y="276" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        両方の結果を管理濃度と比べ、第一〜第三管理区分にする
      </text>
      <text x="360" y="304" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        第一：概ね良好　第三：改善が必要、という方向で捉える
      </text>
      <text x="360" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        A測定の第二評価値が管理濃度を超えると第三管理区分になりやすい
      </text>
      <text x="360" y="364" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        細目は作業環境測定基準・評価基準を確認
      </text>
    </svg>
  );
}
