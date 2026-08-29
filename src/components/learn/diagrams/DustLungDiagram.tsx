export function DustLungDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="粉じんの種類とじん肺に至る経路"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        粉じんの種類
      </text>

      <rect x="24" y="44" width="336" height="88" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="192" y="76" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        鉱物性粉じん
      </text>
      <text x="192" y="100" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        遊離けい酸など → じん肺（けい肺）
      </text>
      <text x="192" y="120" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        石綿 → 肺がん・中皮腫など
      </text>

      <rect x="372" y="44" width="324" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="534" y="76" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        有機・植物性粉じん
      </text>
      <text x="534" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        木材粉じんなど
      </text>
      <text x="534" y="120" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        アレルギー性の喘息・鼻炎が多い
      </text>

      <text x="360" y="164" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        じん肺に至る流れ
      </text>

      <rect x="24" y="180" width="152" height="52" rx="8" fill="#fff" stroke="#374151" />
      <text x="100" y="211" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        吸入
      </text>
      <rect x="200" y="180" width="152" height="52" rx="8" fill="#fff" stroke="#374151" />
      <text x="276" y="211" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        肺に沈着
      </text>
      <rect x="376" y="180" width="152" height="52" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="452" y="211" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        線維化
      </text>
      <rect x="552" y="180" width="144" height="52" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="624" y="211" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        じん肺
      </text>

      <path d="M176 206 H196" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#dust-arrow)" />
      <path d="M352 206 H372" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#dust-arrow)" />
      <path d="M528 206 H548" fill="none" stroke="#0f766e" strokeWidth="2" markerEnd="url(#dust-arrow)" />

      <text x="360" y="268" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        けい肺はけい酸が原因。金属粉じんだけで起きるとは限らない
      </text>
      <text x="360" y="296" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        続発症：慢性気管支炎、肺結核などの合併に注意
      </text>
      <text x="360" y="324" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        石綿はばく露から長い年月を経て病気が現れることがある
      </text>
      <text x="360" y="356" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        密閉・湿潤化・局所排気・保護具を組み合わせる
      </text>

      <defs>
        <marker id="dust-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
