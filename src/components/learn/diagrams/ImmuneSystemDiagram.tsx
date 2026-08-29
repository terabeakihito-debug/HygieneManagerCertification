export function ImmuneSystemDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="抗原の侵入から白血球が働くまでの流れ"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="26" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        抗原が入ってからの流れ
      </text>

      <rect x="248" y="40" width="224" height="44" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="68" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        抗原の侵入
      </text>

      <path d="M360 84 V96 H188 V108" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />
      <path d="M360 96 H532 V108" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />

      <rect x="48" y="112" width="280" height="48" rx="8" fill="#fff" stroke="#374151" />
      <text x="188" y="142" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        好中球：貪食
      </text>
      <rect x="392" y="112" width="280" height="48" rx="8" fill="#fff" stroke="#374151" />
      <text x="532" y="142" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        リンパ球
      </text>

      <path d="M532 160 V172 H456 V184" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />
      <path d="M532 172 H608 V184" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />

      <rect x="392" y="188" width="128" height="48" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="456" y="218" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        T細胞
      </text>
      <rect x="544" y="188" width="128" height="48" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="608" y="218" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        B細胞
      </text>

      <path d="M456 236 V256" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />
      <path d="M608 236 V256" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#immune-arrow)" />

      <rect x="376" y="264" width="160" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="456" y="292" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        細胞性免疫
      </text>
      <rect x="528" y="264" width="160" height="44" rx="8" fill="#fff" stroke="#374151" />
      <text x="608" y="292" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        体液性免疫
      </text>

      <text x="188" y="196" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        細菌などを取り込む
      </text>
      <text x="608" y="328" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        抗体を作る
      </text>
      <text x="360" y="360" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        抗体は抗原に結合する蛋白質。抗原そのものではない
      </text>
      <text x="360" y="384" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        アレルギーは、防御反応が過剰になった状態
      </text>

      <defs>
        <marker id="immune-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
