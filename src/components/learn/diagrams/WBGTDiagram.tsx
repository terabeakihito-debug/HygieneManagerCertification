export function WBGTDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="WBGTの三要素と熱中症に至る流れ"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        WBGTの材料
      </text>

      <rect x="24" y="44" width="216" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="132" y="78" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        自然湿球温度
      </text>
      <rect x="252" y="44" width="216" height="56" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="78" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        黒球温度
      </text>
      <rect x="480" y="44" width="216" height="56" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="78" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        気温（乾球）
      </text>

      <path d="M132 100 V124 H360 V136" fill="none" stroke="#9ca3af" strokeWidth="2" />
      <path d="M360 100 V136" fill="none" stroke="#9ca3af" strokeWidth="2" />
      <path d="M588 100 V124 H360 V136" fill="none" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />

      <rect x="260" y="140" width="200" height="40" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="165" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        WBGT
      </text>

      <text x="360" y="204" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        実効温度は気温・湿度・気流。WBGTは放射熱（黒球）も見る
      </text>

      <text x="360" y="232" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        熱中症に至る流れ
      </text>

      <rect x="24" y="248" width="152" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="100" y="276" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        暑熱ばく露
      </text>
      <rect x="200" y="248" width="152" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="276" y="276" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        発汗・脱水
      </text>
      <rect x="376" y="248" width="152" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="452" y="276" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        体温上昇
      </text>
      <rect x="552" y="248" width="144" height="44" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="624" y="276" textAnchor="middle" fill="#134e4a" fontSize="12" fontFamily="system-ui, sans-serif">
        熱中症
      </text>

      <path d="M176 270 H196" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
      <path d="M352 270 H372" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />
      <path d="M528 270 H548" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#wbgt-arrow)" />

      <text x="360" y="324" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        基準値以上でリスクは高まる。未満でも油断しない
      </text>
      <text x="360" y="352" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        休憩、水分・塩分、作業強度の調整が基本
      </text>

      <defs>
        <marker id="wbgt-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
