function Stage({
  x,
  y,
  label,
}: {
  x: number;
  y: number;
  label: string;
}) {
  return (
    <g>
      <rect x={x} y={y} width="108" height="40" rx="8" fill="#fff" stroke="#374151" />
      <text
        x={x + 54}
        y={y + 25}
        textAnchor="middle"
        fill="#111827"
        fontSize="13"
        fontFamily="system-ui, sans-serif"
      >
        {label}
      </text>
    </g>
  );
}

export function LocalExhaustDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-labelledby="exhaust-diagram-title"
      className="h-auto w-full overflow-visible"
    >
      <title id="exhaust-diagram-title">局所排気装置の構成とフードの種類</title>
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        発生源から排気口までの流れ
      </text>

      <Stage x={16} y={48} label="発生源" />
      <Stage x={156} y={48} label="フード" />
      <Stage x={296} y={48} label="ダクト" />
      <Stage x={436} y={48} label="排風機" />
      <Stage x={576} y={48} label="排気口" />

      <path d="M124 68 H152" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
      <path d="M264 68 H292" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
      <path d="M404 68 H432" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />
      <path d="M544 68 H572" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#exhaust-arrow)" />

      <text x="360" y="118" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        必要に応じてダクトと排風機の間に除じん・排ガス処理装置を置く
      </text>

      <text x="186" y="156" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        囲い式フード
      </text>
      <rect x="48" y="172" width="276" height="180" rx="10" fill="#fff" stroke="#d1d5db" />
      <rect x="88" y="200" width="196" height="110" rx="6" fill="#f3f4f6" stroke="#374151" />
      <rect x="124" y="228" width="48" height="36" fill="#ccfbf1" stroke="#0f766e" />
      <text x="148" y="251" textAnchor="middle" fill="#134e4a" fontSize="11" fontFamily="system-ui, sans-serif">
        発生源
      </text>
      <path d="M196 246 H260" stroke="#0f766e" strokeWidth="3" markerEnd="url(#exhaust-arrow)" />
      <text x="186" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        発生源を覆い、少ない風量でも捕集しやすい
      </text>

      <text x="534" y="156" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        外付け式フード
      </text>
      <rect x="396" y="172" width="276" height="180" rx="10" fill="#fff" stroke="#d1d5db" />
      <rect x="428" y="236" width="48" height="36" fill="#e5e7eb" stroke="#6b7280" />
      <text x="452" y="259" textAnchor="middle" fill="#374151" fontSize="11" fontFamily="system-ui, sans-serif">
        発生源
      </text>
      <rect x="560" y="220" width="72" height="68" rx="6" fill="#f3f4f6" stroke="#374151" />
      <text x="596" y="258" textAnchor="middle" fill="#111827" fontSize="11" fontFamily="system-ui, sans-serif">
        フード
      </text>
      <path d="M476 254 H560" stroke="#0f766e" strokeWidth="3" markerEnd="url(#exhaust-arrow)" />
      <text x="534" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        発生源の外から吸い込む。近づけることが大切
      </text>

      <defs>
        <marker id="exhaust-arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
