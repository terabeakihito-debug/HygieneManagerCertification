function Organ({
  x,
  y,
  width,
  height,
  label,
  accent = false,
}: {
  x: number;
  y: number;
  width: number;
  height: number;
  label: string;
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
        y={y + height / 2 + 5}
        textAnchor="middle"
        fill={accent ? "#134e4a" : "#111827"}
        fontSize="13"
        fontFamily="system-ui, sans-serif"
      >
        {label}
      </text>
    </g>
  );
}

export function DigestiveSystemDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="消化管の流れと消化酵素が働く場所"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        消化管の流れ
      </text>

      <Organ x={24} y={48} width={88} height={40} label="口" accent />
      <Organ x={140} y={48} width={88} height={40} label="食道" />
      <Organ x={256} y={48} width={88} height={40} label="胃" accent />
      <Organ x={372} y={48} width={100} height={40} label="十二指腸" accent />
      <Organ x={500} y={48} width={88} height={40} label="小腸" accent />
      <Organ x={616} y={48} width={80} height={40} label="大腸" />

      <path d="M112 68 H136" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
      <path d="M228 68 H252" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
      <path d="M344 68 H368" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
      <path d="M472 68 H496" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#digestive-arrow)" />
      <path d="M588 68 H612" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#digestive-arrow)" />

      <text x="68" y="112" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        唾液アミラーゼ
      </text>
      <text x="68" y="128" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        デンプンを分解
      </text>
      <text x="300" y="112" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        ペプシン
      </text>
      <text x="300" y="128" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        蛋白質を分解
      </text>
      <text x="422" y="112" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        膵液・胆汁
      </text>
      <text x="544" y="112" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        吸収の主座
      </text>
      <text x="656" y="112" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        水分を吸収
      </text>

      <text x="360" y="168" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        消化を助ける器官
      </text>

      <rect x="24" y="184" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="132" y="212" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        膵臓
      </text>
      <text x="132" y="234" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        膵アミラーゼ・トリプシン
      </text>
      <text x="132" y="254" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        膵リパーゼ、血糖の調節
      </text>

      <rect x="252" y="184" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="360" y="212" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        肝臓
      </text>
      <text x="360" y="234" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        胆汁の材料、血漿蛋白質
      </text>
      <text x="360" y="254" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        糖新生、有害物の処理
      </text>

      <rect x="480" y="184" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="212" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        胆嚢
      </text>
      <text x="588" y="234" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        胆汁をためて十二指腸へ
      </text>
      <text x="588" y="254" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        消化酵素は含まない
      </text>

      <text x="360" y="308" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        三大栄養素の行き先
      </text>
      <text x="360" y="336" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        糖質 → 小さい糖　蛋白質 → アミノ酸　脂質 → 脂肪酸など
      </text>
      <text x="360" y="360" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        胆汁は脂肪を乳化して分解を助ける。無機塩・ビタミンは分解せず吸収
      </text>

      <defs>
        <marker id="digestive-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
