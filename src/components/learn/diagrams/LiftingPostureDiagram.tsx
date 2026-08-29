export function LiftingPostureDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="重量物のよい持ち上げ方とよくない持ち上げ方"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="192" y="26" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        よい持ち方
      </text>
      <rect x="24" y="36" width="336" height="218" rx="10" fill="#fff" stroke="#0f766e" />
      <line x1="48" y1="204" x2="336" y2="204" stroke="#e5e7eb" strokeWidth="3" />

      <ellipse cx="146" cy="204" rx="16" ry="6" fill="#134e4a" />
      <ellipse cx="230" cy="200" rx="16" ry="6" fill="#134e4a" />
      <path
        d="M176 138 L146 168 L142 200"
        fill="none"
        stroke="#0f766e"
        strokeWidth="13"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <path
        d="M208 138 L234 164 L234 198"
        fill="none"
        stroke="#0f766e"
        strokeWidth="13"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <rect x="168" y="98" width="48" height="48" rx="16" fill="#0f766e" />
      <path d="M180 108 H204" fill="none" stroke="#99f6e4" strokeWidth="2" strokeLinecap="round" />
      <path
        d="M174 112 C150 128 148 156 166 176"
        fill="none"
        stroke="#5eead4"
        strokeWidth="10"
        strokeLinecap="round"
      />
      <path
        d="M210 112 C234 128 236 156 218 176"
        fill="none"
        stroke="#5eead4"
        strokeWidth="10"
        strokeLinecap="round"
      />
      <path d="M214 158 L226 150 L226 176 L214 186 Z" fill="#9ca3af" />
      <rect x="170" y="158" width="44" height="32" rx="5" fill="#e5e7eb" stroke="#6b7280" />
      <rect x="170" y="158" width="44" height="8" rx="5" fill="#9ca3af" />
      <circle cx="166" cy="178" r="6" fill="#99f6e4" />
      <circle cx="218" cy="178" r="6" fill="#99f6e4" />
      <circle cx="192" cy="70" r="17" fill="#ccfbf1" stroke="#0f766e" strokeWidth="2" />
      <path d="M175 68 A17 17 0 0 1 209 68 Q192 48 175 68 Z" fill="#0f766e" />
      <path d="M192 87 V98" fill="none" stroke="#0f766e" strokeWidth="6" strokeLinecap="round" />
      <circle cx="186" cy="70" r="1.7" fill="#134e4a" />
      <circle cx="198" cy="70" r="1.7" fill="#134e4a" />
      <path d="M187 77 Q192 81 197 77" fill="none" stroke="#134e4a" strokeWidth="1.5" strokeLinecap="round" />
      <text x="192" y="236" textAnchor="middle" fill="#134e4a" fontSize="12" fontFamily="system-ui, sans-serif">
        膝を曲げ、腰を落とす
      </text>

      <text x="528" y="26" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        よくない持ち方
      </text>
      <rect x="384" y="36" width="312" height="218" rx="10" fill="#fff" stroke="#9ca3af" />
      <line x1="404" y1="204" x2="676" y2="204" stroke="#e5e7eb" strokeWidth="3" />

      <ellipse cx="552" cy="202" rx="15" ry="6" fill="#4b5563" />
      <ellipse cx="584" cy="202" rx="15" ry="6" fill="#4b5563" />
      <path
        d="M568 142 L552 200"
        fill="none"
        stroke="#6b7280"
        strokeWidth="13"
        strokeLinecap="round"
      />
      <path
        d="M568 142 L584 200"
        fill="none"
        stroke="#6b7280"
        strokeWidth="13"
        strokeLinecap="round"
      />
      <g transform="rotate(-42 556 124)">
        <rect x="532" y="100" width="48" height="50" rx="16" fill="#9ca3af" />
      </g>
      <path
        d="M536 116 C508 138 478 160 450 176"
        fill="none"
        stroke="#d1d5db"
        strokeWidth="10"
        strokeLinecap="round"
      />
      <path
        d="M548 122 C518 144 488 164 458 178"
        fill="none"
        stroke="#d1d5db"
        strokeWidth="10"
        strokeLinecap="round"
      />
      <path d="M468 166 L480 158 L480 184 L468 194 Z" fill="#9ca3af" />
      <rect x="424" y="166" width="44" height="32" rx="5" fill="#e5e7eb" stroke="#6b7280" />
      <rect x="424" y="166" width="44" height="8" rx="5" fill="#9ca3af" />
      <circle cx="448" cy="178" r="6" fill="#e5e7eb" />
      <circle cx="456" cy="180" r="6" fill="#e5e7eb" />
      <circle cx="508" cy="78" r="17" fill="#f3f4f6" stroke="#6b7280" strokeWidth="2" />
      <path d="M492 76 A17 17 0 0 1 525 78 Q508 56 492 76 Z" fill="#6b7280" />
      <path d="M520 90 L538 106" fill="none" stroke="#6b7280" strokeWidth="6" strokeLinecap="round" />
      <circle cx="503" cy="78" r="1.7" fill="#4b5563" />
      <circle cx="514" cy="78" r="1.7" fill="#4b5563" />
      <path d="M504 85 Q508 82 514 86" fill="none" stroke="#4b5563" strokeWidth="1.5" strokeLinecap="round" />
      <text x="528" y="236" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        膝を伸ばし、腰だけ曲げる
      </text>

      <text x="360" y="276" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        片足を少し前に出し、荷物をかかえて膝で立ち上がる
      </text>
      <text x="360" y="304" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        男性の人力取扱いの目安は、体重のおおむね40％以下
      </text>
      <text x="360" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        腰部保護ベルトの全員使用は、指針の主眼ではない
      </text>
      <text x="360" y="364" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        配置時とその後およそ6か月ごとの健診も健康管理の一つ
      </text>
    </svg>
  );
}
