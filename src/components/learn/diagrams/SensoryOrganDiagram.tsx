export function SensoryOrganDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="眼球の断面と視覚・聴覚の要点"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="176" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        眼球の断面（模式）
      </text>

      <ellipse cx="176" cy="168" rx="108" ry="90" fill="#fff" stroke="#374151" strokeWidth="2" />
      <path d="M80 148 Q68 168 80 188" fill="none" stroke="#0f766e" strokeWidth="3" />
      <text x="24" y="172" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        角膜
      </text>

      <ellipse cx="118" cy="168" rx="18" ry="26" fill="#ccfbf1" stroke="#0f766e" />
      <text x="118" y="172" textAnchor="middle" fill="#134e4a" fontSize="11" fontFamily="system-ui, sans-serif">
        水晶体
      </text>
      <text x="118" y="228" textAnchor="middle" fill="#6b7280" fontSize="11" fontFamily="system-ui, sans-serif">
        毛様体筋で厚みを調節
      </text>

      <path d="M264 112 Q290 168 264 224" fill="none" stroke="#374151" strokeWidth="3" />
      <text x="228" y="168" textAnchor="middle" fill="#111827" fontSize="12" fontFamily="system-ui, sans-serif">
        網膜
      </text>

      <path
        d="M286 168 H330"
        fill="none"
        stroke="#0f766e"
        strokeWidth="2"
        markerEnd="url(#sensory-arrow)"
      />
      <text x="338" y="164" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        視神経
      </text>

      <text x="176" y="288" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        錐状体：色を感じる
      </text>
      <text x="176" y="308" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        杆状体：明暗を感じる
      </text>
      <text x="176" y="332" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        暗い所では暗順応で徐々に見える
      </text>

      <text x="548" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        聴覚・加齢の要点
      </text>

      <rect x="420" y="48" width="272" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="556" y="78" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        前庭・半規管は内耳
      </text>
      <text x="556" y="100" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        体の傾きや回転を感じる
      </text>

      <rect x="420" y="136" width="272" height="72" rx="8" fill="#ccfbf1" stroke="#0f766e" />
      <text x="556" y="166" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        老人性難聴
      </text>
      <text x="556" y="188" textAnchor="middle" fill="#0f766e" fontSize="12" fontFamily="system-ui, sans-serif">
        高い音域から聞こえにくくなる
      </text>

      <rect x="420" y="224" width="272" height="72" rx="8" fill="#fff" stroke="#374151" />
      <text x="556" y="254" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        加齢による視覚
      </text>
      <text x="556" y="276" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        動体視力が衰え、高い照度が必要
      </text>

      <text x="360" y="372" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        水晶体の厚みを変えるのは毛様体筋。硝子体ではない
      </text>

      <defs>
        <marker id="sensory-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0 0 L8 4 L0 8 Z" fill="#0f766e" />
        </marker>
      </defs>
    </svg>
  );
}
