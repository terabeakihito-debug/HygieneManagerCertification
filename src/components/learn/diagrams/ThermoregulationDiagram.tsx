export function ThermoregulationDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="視床下部を中心にした暑いときと寒いときの反応"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <rect x="260" y="20" width="200" height="64" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="46" textAnchor="middle" fill="#134e4a" fontSize="14" fontFamily="system-ui, sans-serif">
        視床下部（間脳）
      </text>
      <text x="360" y="68" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        体温調節中枢
      </text>

      <path d="M360 84 V110" fill="none" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 110 H560" fill="none" stroke="#9ca3af" strokeWidth="2" />
      <path d="M160 110 V132" fill="none" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#thermo-arrow)" />
      <path d="M560 110 V132" fill="none" stroke="#9ca3af" strokeWidth="2" markerEnd="url(#thermo-arrow)" />

      <rect x="24" y="136" width="272" height="168" rx="8" fill="#fff" stroke="#374151" />
      <text x="160" y="164" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        暑いとき
      </text>
      <text x="160" y="196" textAnchor="middle" fill="#374151" fontSize="13" fontFamily="system-ui, sans-serif">
        皮膚の血管が拡張
      </text>
      <text x="160" y="220" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        血流量が増え、熱を逃がす
      </text>
      <text x="160" y="252" textAnchor="middle" fill="#374151" fontSize="13" fontFamily="system-ui, sans-serif">
        発汗
      </text>
      <text x="160" y="276" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        蒸発の気化熱で体温が下がる
      </text>

      <rect x="424" y="136" width="272" height="168" rx="8" fill="#fff" stroke="#374151" />
      <text x="560" y="164" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        寒いとき
      </text>
      <text x="560" y="196" textAnchor="middle" fill="#374151" fontSize="13" fontFamily="system-ui, sans-serif">
        皮膚の血管が収縮
      </text>
      <text x="560" y="220" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        血流量が減り、熱を保つ
      </text>
      <text x="560" y="252" textAnchor="middle" fill="#374151" fontSize="13" fontFamily="system-ui, sans-serif">
        ふるえ
      </text>
      <text x="560" y="276" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        骨格筋の収縮で産熱が増える
      </text>

      <text x="360" y="336" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        恒常性（ホメオスタシス）：産熱と放熱のバランスで体温を保つ
      </text>
      <text x="360" y="360" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        発汗は汗腺から。不感蒸泄は皮膚と呼気からの、気づきにくい水分喪失
      </text>

      <defs>
        <marker id="thermo-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#9ca3af" />
        </marker>
      </defs>
    </svg>
  );
}
