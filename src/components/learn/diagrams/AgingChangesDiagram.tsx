export function AgingChangesDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="加齢に伴って変化しやすい機能の一覧"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="26" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        加齢で変化しやすい機能
      </text>

      <rect x="24" y="44" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="132" y="76" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        視力
      </text>
      <text x="132" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        動体視力の低下
      </text>
      <text x="132" y="118" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        暗順応の遅れ
      </text>

      <rect x="252" y="44" width="216" height="88" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="360" y="76" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        聴力
      </text>
      <text x="360" y="100" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        老人性難聴
      </text>
      <text x="360" y="118" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        高い音から聞こえにくい
      </text>

      <rect x="480" y="44" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="76" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        平衡感覚
      </text>
      <text x="588" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        つまずき・転倒
      </text>
      <text x="588" y="118" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        につながりやすい
      </text>

      <rect x="24" y="148" width="216" height="88" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="132" y="180" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        体温調節
      </text>
      <text x="132" y="204" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        暑さ寒さへの遅れ
      </text>
      <text x="132" y="222" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        熱中症リスク
      </text>

      <rect x="252" y="148" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="360" y="180" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        骨密度
      </text>
      <text x="360" y="204" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        低下すると
      </text>
      <text x="360" y="222" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        骨折しやすくなる
      </text>

      <rect x="480" y="148" width="216" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="180" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        筋力
      </text>
      <text x="588" y="204" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        重量物や段差で
      </text>
      <text x="588" y="222" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        負担が増えやすい
      </text>

      <text x="360" y="272" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        進み方には個人差がある。年齢だけで能力を決めつけない
      </text>
      <text x="360" y="300" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        低い音から先に聞こえなくなる、というのは逆
      </text>
      <text x="360" y="328" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        照明、音量、休憩、転倒防止など、環境と作業の見直しが中心
      </text>
      <text x="360" y="360" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        高齢者は一般に高い照度を必要とするが、まぶしさも感じやすい
      </text>
    </svg>
  );
}
