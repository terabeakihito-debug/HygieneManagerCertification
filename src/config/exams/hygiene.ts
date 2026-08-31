export const examConfig = {
  id: "hygiene",
  displayName: "衛生管理者",
  siteName: "衛生管理者試験対策",
  officialName: "第一種・第二種衛生管理者",
  organization: "公益財団法人安全衛生技術試験協会",
  aboutNavLabel: "衛生管理者とは",
  hasPracticalExam: false,
  categories: [
    { code: "type1", label: "第一種衛生管理者", shortLabel: "第一種", displayOrder: 1 },
    { code: "type2", label: "第二種衛生管理者", shortLabel: "第二種", displayOrder: 2 },
  ],
  sharedCategoryCode: "common",
  practiceFilters: [
    { value: "type1", label: "第一種", codes: ["type1", "common"] },
    { value: "type2", label: "第二種", codes: ["type2", "common"] },
    { value: "all", label: "両方(共通含む)", codes: ["type1", "type2", "common"] },
  ],
  affiliateCategoryMap: {} as Readonly<Record<string, string>>,
  seo: {
    title: "衛生管理者試験対策｜第一種・第二種の過去問演習と模試",
    description:
      "第一種・第二種衛生管理者試験の合格を目指す学習サービス。公表過去問と解説、マークシート形式の問題演習、模試、進捗管理、学習カレンダーを無料で利用できます。会員登録なしでもすぐに始められます。",
    keywords: [
      "衛生管理者",
      "衛生管理者試験",
      "第一種衛生管理者",
      "第二種衛生管理者",
      "衛生管理者 過去問",
      "衛生管理者 独学",
    ],
    heroLines: ["衛生管理者", "試験対策"] as const,
    ogSub: "第一種・第二種対応｜過去問演習・模試・学習コンテンツ",
  },
} as const;
