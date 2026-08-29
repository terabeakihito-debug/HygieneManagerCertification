export function BloodCompositionDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="血液の成分内訳とそれぞれの働き"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="200" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        血液のおよその内訳
      </text>

      <path d="M200 168 L200 60 A108 108 0 1 0 200 276 Z" fill="#f3f4f6" stroke="#374151" />
      <path d="M200 168 L200 276 A108 108 0 0 0 248 72 Z" fill="#ccfbf1" stroke="#0f766e" />
      <path d="M200 168 L248 72 A108 108 0 0 0 200 60 Z" fill="#e5e7eb" stroke="#6b7280" />

      <text x="248" y="150" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        赤血球
      </text>
      <text x="248" y="168" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        およそ4割台
      </text>
      <text x="118" y="168" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        血漿
      </text>
      <text x="118" y="186" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        半分より多い
      </text>
      <text x="214" y="88" fill="#374151" fontSize="11" fontFamily="system-ui, sans-serif">
        白血球
      </text>
      <text x="214" y="104" fill="#374151" fontSize="11" fontFamily="system-ui, sans-serif">
        ・血小板
      </text>

      <text x="520" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        主なはたらき
      </text>

      <rect x="380" y="48" width="308" height="52" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="534" y="70" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        赤血球：酸素を運ぶ
      </text>
      <text x="534" y="88" textAnchor="middle" fill="#0f766e" fontSize="11" fontFamily="system-ui, sans-serif">
        骨髄で産生、寿命はおよそ120日
      </text>

      <rect x="380" y="112" width="308" height="52" rx="8" fill="#fff" stroke="#374151" />
      <text x="534" y="134" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        白血球：免疫
      </text>
      <text x="534" y="152" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        好中球の貪食、リンパ球など
      </text>

      <rect x="380" y="176" width="308" height="52" rx="8" fill="#fff" stroke="#374151" />
      <text x="534" y="198" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        血小板：血液凝固
      </text>
      <text x="534" y="216" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        フィブリノーゲンがフィブリンへ
      </text>

      <rect x="380" y="240" width="308" height="52" rx="8" fill="#fff" stroke="#374151" />
      <text x="534" y="262" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        血漿蛋白質
      </text>
      <text x="534" y="280" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        アルブミン、グロブリンなど
      </text>

      <text x="360" y="328" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        ABO式血液型は赤血球の分類。A型の血清は抗B抗体を持つ
      </text>
      <text x="360" y="352" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        ヘマトクリットは赤血球の容積割合。貧血では低くなる
      </text>
    </svg>
  );
}
