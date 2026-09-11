import {
  EXAM_ORG_HREF,
  EXAM_ORG_NAME,
  EXAM_ORG_PUBLISHED_QUESTIONS_HREF,
} from "@/lib/exam-org";

export const ORIGINAL_QUESTION_NOTICE =
  "本サービスの演習問題は、試験範囲・関係法令・一般的な専門知識をもとに独自作成した学習用問題です。安全衛生技術試験協会が公表する試験問題そのものではありません。公式の公表問題や最新の試験情報は、同協会の公式サイトでご確認ください。";

export const ORIGINAL_QUESTION_NOTICE_COMPACT =
  "本サービスの問題は独自作成した学習用問題です。安全衛生技術試験協会が公表する試験問題そのものではありません。";

type OriginalQuestionNoticeProps = {
  compact?: boolean;
};

function PublishedQuestionsLink({ className }: { className?: string }) {
  return (
    <a
      href={EXAM_ORG_PUBLISHED_QUESTIONS_HREF}
      target="_blank"
      rel="noopener noreferrer"
      className={className}
    >
      協会の公表試験問題ページ
    </a>
  );
}

export function OriginalQuestionNotice({ compact = false }: OriginalQuestionNoticeProps) {
  if (compact) {
    return (
      <aside className="text-[11px] leading-[1.7] text-graphite" role="note">
        <p>
          {ORIGINAL_QUESTION_NOTICE_COMPACT}{" "}
          <PublishedQuestionsLink className="text-safety underline" />
        </p>
      </aside>
    );
  }

  return (
    <aside
      className="border border-hairline px-3 py-3 text-[11px] leading-[1.7] text-graphite"
      role="note"
    >
      <p className="font-medium text-ink">独自作成の学習用問題</p>
      <p className="mt-1">{ORIGINAL_QUESTION_NOTICE}</p>
      <p className="mt-2">
        <PublishedQuestionsLink className="text-safety underline" />
        {" · "}
        <a
          href={EXAM_ORG_HREF}
          target="_blank"
          rel="noopener noreferrer"
          className="text-safety underline"
        >
          {EXAM_ORG_NAME}公式サイト
        </a>
      </p>
    </aside>
  );
}
