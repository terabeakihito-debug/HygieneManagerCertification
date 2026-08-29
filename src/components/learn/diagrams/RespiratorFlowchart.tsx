function Node({
  x,
  y,
  width,
  height,
  label,
  sublabel,
  accent = false,
}: {
  x: number;
  y: number;
  width: number;
  height: number;
  label: string;
  sublabel?: string;
  accent?: boolean;
}) {
  return (
    <g>
      <rect
        x={x}
        y={y}
        width={width}
        height={height}
        rx="8"
        fill={accent ? "#ccfbf1" : "#fff"}
        stroke={accent ? "#0f766e" : "#374151"}
      />
      <text
        x={x + width / 2}
        y={sublabel ? y + height / 2 - 4 : y + height / 2 + 5}
        textAnchor="middle"
        fill={accent ? "#134e4a" : "#111827"}
        fontSize="13"
        fontFamily="system-ui, sans-serif"
      >
        {label}
      </text>
      {sublabel ? (
        <text
          x={x + width / 2}
          y={y + height / 2 + 14}
          textAnchor="middle"
          fill="#6b7280"
          fontSize="11"
          fontFamily="system-ui, sans-serif"
        >
          {sublabel}
        </text>
      ) : null}
    </g>
  );
}

export function RespiratorFlowchart() {
  return (
    <svg
      viewBox="0 0 720 420"
      role="img"
      aria-label="呼吸用保護具の使い分けフローチャート"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="420" fill="#f9fafb" />

      <Node
        x={210}
        y={16}
        width={300}
        height={48}
        label="酸素濃度はおよそ18％以上か"
        sublabel="不明・高濃度のときも下へ"
      />

      <path d="M360 64 V92" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 92 H560" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 92 V118" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />
      <path d="M560 92 V118" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />
      <text x="132" y="88" textAnchor="end" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        いいえ
      </text>
      <text x="588" y="88" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        はい
      </text>

      <Node x={48} y={120} width={224} height={52} label="送気マスクなど" sublabel="給気式（ろ過式は使わない）" accent />
      <Node x={448} y={120} width={224} height={52} label="有害物質の種類は？" />

      <path d="M560 172 V196" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 196 H560" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 196 V220" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />
      <path d="M360 196 V220" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />
      <path d="M560 196 V220" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />

      <Node x={48} y={222} width={224} height={44} label="粉じん → 防じんマスク" accent />
      <Node x={288} y={222} width={144} height={44} label="ガス・蒸気" />
      <Node x={448} y={222} width={224} height={44} label="混在 → 防じん機能付き" accent />

      <path d="M360 266 V290" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#resp-arrow)" />
      <Node x={248} y={292} width={224} height={44} label="防毒マスク" accent />

      <text x="360" y="362" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        吸収缶の色の目安
      </text>
      <text x="360" y="386" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        有機ガス：黒　アンモニア：緑　一酸化炭素：赤
      </text>
      <text x="360" y="406" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        直結式は隔離式より高濃度の雰囲気には向かない
      </text>

      <defs>
        <marker id="resp-arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#9ca3af" />
        </marker>
      </defs>
    </svg>
  );
}
