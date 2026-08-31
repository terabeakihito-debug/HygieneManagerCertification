import type { Metadata } from "next";

export const SITE_URL = "https://hygiene.examstudycoach.com";

export const SITE_NAME = "衛生管理者試験対策";

export const SITE_DESCRIPTION =
  "第一種・第二種衛生管理者試験の合格を目指す学習サービス。公表過去問と解説、マークシート形式の問題演習、模試、進捗管理、学習カレンダーを無料で利用できます。会員登録なしでもすぐに始められます。";

export const noIndexRobots = {
  index: false,
  follow: false,
} as const satisfies Metadata["robots"];

export const noIndexMetadata = {
  robots: noIndexRobots,
} as const satisfies Metadata;

export function topicDescription(body: string): string {
  const compact = body.replace(/\s+/g, " ").trim();
  if (compact.length <= 100) {
    return compact;
  }
  return `${compact.slice(0, 100)}…`;
}
