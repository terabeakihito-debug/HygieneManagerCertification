export function MuscleTypesDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="筋肉の種類と等尺性・等張性収縮"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="360" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        筋肉の種類
      </text>

      <rect x="24" y="44" width="216" height="120" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="132" y="76" textAnchor="middle" fill="#134e4a" fontSize="14" fontFamily="system-ui, sans-serif">
        骨格筋
      </text>
      <text x="132" y="102" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        意志で動かせる
      </text>
      <text x="132" y="124" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        手足の運動、ふるえ
      </text>
      <text x="132" y="146" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        膝蓋腱反射など
      </text>

      <rect x="252" y="44" width="216" height="120" rx="8" fill="#fff" stroke="#374151" />
      <text x="360" y="76" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        平滑筋
      </text>
      <text x="360" y="102" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        意志では動かしにくい
      </text>
      <text x="360" y="124" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        内臓や血管の壁
      </text>
      <text x="360" y="146" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        自律神経の影響
      </text>

      <rect x="480" y="44" width="216" height="120" rx="8" fill="#fff" stroke="#374151" />
      <text x="588" y="76" textAnchor="middle" fill="#111827" fontSize="14" fontFamily="system-ui, sans-serif">
        心筋
      </text>
      <text x="588" y="102" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        心臓だけにある
      </text>
      <text x="588" y="124" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        規則正しく収縮
      </text>
      <text x="588" y="146" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        洞房結節が起点
      </text>

      <text x="360" y="196" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        骨格筋の収縮のしかた
      </text>

      <rect x="24" y="212" width="336" height="88" rx="8" fill="#fff" stroke="#374151" />
      <text x="192" y="244" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        等張性収縮
      </text>
      <text x="192" y="268" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        関節が動き、長さが変わる
      </text>
      <text x="192" y="288" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        持ち上げる、屈伸する
      </text>

      <rect x="372" y="212" width="324" height="88" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="534" y="244" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        等尺性収縮
      </text>
      <text x="534" y="268" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        角度は変わらず、力だけ入る
      </text>
      <text x="534" y="288" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        同じ姿勢で支え続ける
      </text>

      <text x="360" y="332" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        酸素が十分ならグリコーゲンは二酸化炭素と水まで分解される
      </text>
      <text x="360" y="356" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        酸素不足で乳酸が増えやすい。活動性肥大は使って筋が太くなること
      </text>
    </svg>
  );
}
