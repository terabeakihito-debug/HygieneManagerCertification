export function NoiseHealthDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="騒音対策の優先順位と等価騒音レベルの見方"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        騒音対策の優先順位
      </text>

      <rect x="24" y="48" width="216" height="72" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="132" y="78" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        1. 発生源対策
      </text>
      <text x="132" y="100" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        静音化・囲い込み
      </text>

      <rect x="252" y="48" width="216" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="360" y="78" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        2. 伝ぱ経路対策
      </text>
      <text x="360" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        壁・距離・遮音
      </text>

      <rect x="480" y="48" width="216" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="78" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        3. 受音者対策
      </text>
      <text x="588" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        聴覚保護具・時間制限
      </text>

      <path d="M240 84 H248" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#noise-arrow)" />
      <path d="M468 84 H476" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#noise-arrow)" />

      <text x="360" y="152" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        耳栓・イヤーマフは最後の手段。最初から保護具に頼らない
      </text>

      <text x="360" y="188" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        等価騒音レベルと聴力の目安
      </text>

      <rect x="48" y="208" width="624" height="36" rx="8" fill="#f3f4f6" stroke="#d1d5db" />
      <rect x="48" y="208" width="210" height="36" rx="8" fill="#e5e7eb" stroke="#9ca3af" />
      <rect x="258" y="208" width="210" height="36" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="153" y="231" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        会話の音
      </text>
      <text x="363" y="231" textAnchor="middle" fill="#134e4a" fontSize="12" fontFamily="system-ui, sans-serif">
        作業場の騒音
      </text>
      <text x="573" y="231" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        より大きい音
      </text>

      <text x="360" y="276" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        騒音性難聴：およそ4000Hz付近（c5 dip）から落ちやすい
      </text>
      <text x="360" y="304" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        定点測定が原則。発生源が動くときは個人ばく露測定も使える
      </text>
      <text x="360" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        事後措置では加齢性難聴の影響も考慮する
      </text>
      <text x="360" y="364" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        基準値の適用は関係法令・指針を確認
      </text>

      <defs>
        <marker id="noise-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
