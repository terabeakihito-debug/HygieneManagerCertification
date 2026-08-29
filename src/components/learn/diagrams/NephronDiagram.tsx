export function NephronDiagram() {
  return (
    <svg
      viewBox="0 0 720 420"
      role="img"
      aria-label="ネフロンの模式図と原尿が尿になる流れ"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="420" fill="#f9fafb" />

      <text x="160" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        ネフロン（模式）
      </text>

      <circle cx="118" cy="92" r="28" fill="#ccfbf1" stroke="#0f766e" />
      <text x="118" y="96" textAnchor="middle" fill="#134e4a" fontSize="11" fontFamily="system-ui, sans-serif">
        糸球体
      </text>
      <path
        d="M92 64 A40 40 0 0 1 160 108"
        fill="none"
        stroke="#374151"
        strokeWidth="3"
      />
      <text x="196" y="72" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        ボウマン嚢
      </text>

      <path
        d="M160 108 C190 120 200 150 168 168 C140 186 210 210 168 236 C140 256 200 280 230 270"
        fill="none"
        stroke="#0f766e"
        strokeWidth="4"
        strokeLinecap="round"
      />
      <text x="214" y="148" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        尿細管
      </text>
      <text x="48" y="250" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        （再吸収が行われる）
      </text>

      <rect x="248" y="258" width="22" height="72" rx="6" fill="#fff" stroke="#374151" />
      <text x="318" y="300" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        集合管 → 尿
      </text>

      <text x="520" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        原尿が尿になるまで
      </text>

      <rect x="430" y="48" width="180" height="40" rx="8" fill="#fff" stroke="#374151" />
      <text x="520" y="73" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        血液
      </text>
      <path d="M520 88 V108" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#nephron-arrow)" />

      <rect x="430" y="110" width="180" height="40" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="520" y="135" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        糸球体でろ過
      </text>
      <path d="M520 150 V170" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#nephron-arrow)" />

      <rect x="430" y="172" width="180" height="40" rx="8" fill="#fff" stroke="#374151" />
      <text x="520" y="197" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        原尿（ボウマン嚢）
      </text>
      <path d="M520 212 V232" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#nephron-arrow)" />

      <rect x="430" y="234" width="180" height="40" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="520" y="259" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        尿細管で再吸収
      </text>
      <path d="M520 274 V294" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#nephron-arrow)" />

      <rect x="430" y="296" width="180" height="40" rx="8" fill="#e5e7eb" stroke="#6b7280" />
      <text x="520" y="321" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        尿として排出
      </text>

      <text x="360" y="400" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        蛋白質は通常ほとんどろ過されない。水分や電解質の多くは再吸収される
      </text>

      <defs>
        <marker id="nephron-arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#9ca3af" />
        </marker>
      </defs>
    </svg>
  );
}
