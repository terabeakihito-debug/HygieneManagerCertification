"use client";

import Link from "next/link";
import { useState } from "react";
import { OriginalQuestionNotice } from "@/components/questions/OriginalQuestionNotice";
import { ChoiceMark } from "@/components/ui/ChoiceMark";
import { submitAnswerAction } from "@/lib/actions/practice";

export type PracticeChoice = {
  id: string;
  choice_text: string;
  is_correct: boolean;
  sort_order: number;
};

export type PracticeQuestion = {
  id: string;
  question_text: string;
  figure_url: string | null;
  explanation: string;
  choices: PracticeChoice[];
};

type CompleteMode = "practice" | "review";

type QuestionCardProps = {
  questions: PracticeQuestion[];
  emptyMessage?: string;
  completeMode?: CompleteMode;
};

function CompletePanel({
  completeMode,
  resolvedInSession,
  onRestart,
}: {
  completeMode: CompleteMode;
  resolvedInSession: number;
  onRestart: () => void;
}) {
  switch (completeMode) {
    case "practice":
      return (
        <div className="flex flex-col gap-3">
          <p className="text-sm text-graphite">すべての問題に回答しました。</p>
          <button type="button" onClick={onRestart} className="btn-primary">
            もう一度解く
          </button>
        </div>
      );
    case "review":
      return (
        <div className="flex flex-col gap-3">
          <p className="font-display text-base font-semibold">復習が完了しました</p>
          <p className="text-sm text-graphite">
            このセッションで正解して復習完了にした問題：{resolvedInSession}件
          </p>
          <div className="flex flex-wrap gap-3 text-sm">
            <Link href="/review" className="btn-primary">
              復習リストへ
            </Link>
            <Link href="/mypage" className="btn-secondary">
              マイページへ
            </Link>
          </div>
        </div>
      );
    default: {
      const _never: never = completeMode;
      return _never;
    }
  }
}

function choiceState(
  answered: boolean,
  choice: PracticeChoice,
  selectedId: string | null
): "idle" | "marked" | "correct" | "incorrect" {
  if (!answered) {
    return "idle";
  }
  if (choice.is_correct) {
    return "correct";
  }
  if (choice.id === selectedId) {
    return "incorrect";
  }
  return "idle";
}

export function QuestionCard({
  questions,
  emptyMessage = "該当する問題がありません。区分や分野を変えてみてください。",
  completeMode = "practice",
}: QuestionCardProps) {
  const [index, setIndex] = useState(0);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [pending, setPending] = useState(false);
  const [resolvedInSession, setResolvedInSession] = useState(0);

  const question = questions[index];

  if (!question) {
    return <p className="card-surface p-6 text-graphite">{emptyMessage}</p>;
  }

  const choices = [...question.choices].sort((a, b) => a.sort_order - b.sort_order);
  const answered = selectedId !== null;
  const selected = choices.find((choice) => choice.id === selectedId);
  const isCorrect = selected?.is_correct ?? false;
  const isLast = index >= questions.length - 1;

  async function handleSelect(choiceId: string) {
    if (answered || pending) {
      return;
    }

    setSelectedId(choiceId);
    setPending(true);
    setSaveError(null);

    const result = await submitAnswerAction({
      questionId: question.id,
      selectedChoiceId: choiceId,
    });

    if (result.error) {
      setSaveError(result.error);
    } else if (choices.find((choice) => choice.id === choiceId)?.is_correct) {
      setResolvedInSession((current) => current + 1);
    }
    setPending(false);
  }

  function handleNext() {
    setSelectedId(null);
    setSaveError(null);
    setIndex((current) => current + 1);
  }

  function handleRestart() {
    setSelectedId(null);
    setSaveError(null);
    setIndex(0);
  }

  return (
    <article className="card-surface p-5 sm:p-6">
      <OriginalQuestionNotice compact />
      <div className="mt-3 flex items-center gap-3">
        <span className="q-number">{String(index + 1).padStart(2, "0")}</span>
        <p className="font-mono text-sm text-graphite">
          {index + 1} / {questions.length}
        </p>
      </div>
      <h2 className="mt-3 whitespace-pre-wrap text-lg font-semibold leading-relaxed">{question.question_text}</h2>
      {question.figure_url ? (
        <img
          src={question.figure_url}
          alt="設問の図"
          className="mt-4 w-full border border-hairline bg-paper"
        />
      ) : null}

      <ul className="mt-5 flex flex-col gap-3">
        {choices.map((choice) => (
          <li key={choice.id}>
            <button
              type="button"
              disabled={answered}
              onClick={() => handleSelect(choice.id)}
              className="flex w-full items-start gap-3 rounded-sm px-1 py-2 text-left text-sm leading-relaxed disabled:cursor-default"
            >
              <ChoiceMark state={choiceState(answered, choice, selectedId)} />
              <span className={answered && !choice.is_correct && choice.id !== selectedId ? "text-graphite" : ""}>
                {choice.choice_text}
              </span>
            </button>
          </li>
        ))}
      </ul>

      {answered ? (
        <div className="mt-6 flex flex-col gap-4">
          <p className={`font-display text-base font-bold ${isCorrect ? "text-safety" : "text-stamp"}`}>
            {isCorrect ? "正解" : "不正解"}
          </p>
          <div className="explanation">
            <h3 className="text-sm font-semibold text-safety-dark">解説</h3>
            <p className="mt-2 whitespace-pre-wrap text-sm leading-relaxed text-ink">
              {question.explanation}
            </p>
          </div>
          {saveError ? (
            <p className="text-sm text-stamp" role="alert">
              {saveError}
            </p>
          ) : null}
          {isLast ? (
            <CompletePanel
              completeMode={completeMode}
              resolvedInSession={resolvedInSession}
              onRestart={handleRestart}
            />
          ) : (
            <button type="button" onClick={handleNext} className="btn-primary">
              次の問題へ
            </button>
          )}
        </div>
      ) : null}
    </article>
  );
}
