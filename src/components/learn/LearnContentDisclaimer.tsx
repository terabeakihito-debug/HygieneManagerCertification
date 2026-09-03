export const LEARN_CONTENT_DISCLAIMER =
  "本コンテンツは公表された過去問題を基に作成した学習用の要約です。法令の内容は変更される場合があるため、実際の業務では厚生労働省・都道府県労働局が公表する最新の関係法令を必ずご確認ください。";

export function LearnContentDisclaimer() {
  return (
    <aside
      className="border-t border-hairline pt-3 text-[11px] leading-[1.7] text-graphite"
      role="note"
    >
      <p>{LEARN_CONTENT_DISCLAIMER}</p>
    </aside>
  );
}
