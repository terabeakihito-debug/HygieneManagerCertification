export function FoodPoisoningDiagram() {
  return (
    <svg
      viewBox="0 0 720 400"
      role="img"
      aria-label="食中毒の感染型と毒素型の分類"
      className="h-auto w-full overflow-visible"
    >
      <rect width="720" height="400" fill="#f9fafb" />

      <text x="192" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        感染型
      </text>
      <rect x="24" y="40" width="336" height="200" rx="10" fill="#fff" stroke="#374151" />
      <text x="192" y="72" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        菌そのものが体内で増える
      </text>
      <rect x="48" y="88" width="288" height="36" rx="6" fill="#ccfbf1" stroke="#0f766e" />
      <text x="192" y="111" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        サルモネラ菌
      </text>
      <rect x="48" y="132" width="288" height="36" rx="6" fill="#ccfbf1" stroke="#0f766e" />
      <text x="192" y="155" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        腸炎ビブリオ菌
      </text>
      <rect x="48" y="176" width="288" height="36" rx="6" fill="#ccfbf1" stroke="#0f766e" />
      <text x="192" y="199" textAnchor="middle" fill="#134e4a" fontSize="13" fontFamily="system-ui, sans-serif">
        カンピロバクター
      </text>

      <text x="528" y="28" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        毒素型
      </text>
      <rect x="384" y="40" width="312" height="200" rx="10" fill="#fff" stroke="#374151" />
      <text x="540" y="72" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        食物中の毒素を摂取する
      </text>
      <rect x="408" y="88" width="264" height="36" rx="6" fill="#e5e7eb" stroke="#6b7280" />
      <text x="540" y="111" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        黄色ブドウ球菌
      </text>
      <rect x="408" y="132" width="264" height="36" rx="6" fill="#e5e7eb" stroke="#6b7280" />
      <text x="540" y="155" textAnchor="middle" fill="#111827" fontSize="13" fontFamily="system-ui, sans-serif">
        ボツリヌス菌
      </text>
      <text x="540" y="204" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        ブドウ球菌毒素は熱に強い
      </text>

      <text x="360" y="272" textAnchor="middle" fill="#374151" fontSize="12" fontFamily="system-ui, sans-serif">
        カンピロバクターを毒素型に入れるのは誤り
      </text>
      <text x="360" y="300" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        ヒスタミンは加熱しても分解されにくい
      </text>
      <text x="360" y="328" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        ノロウイルス：十分な加熱、または塩素系消毒
      </text>
      <text x="360" y="360" textAnchor="middle" fill="#6b7280" fontSize="12" fontFamily="system-ui, sans-serif">
        手洗い、温度管理、二次汚染の防止が共通の予防
      </text>
    </svg>
  );
}
