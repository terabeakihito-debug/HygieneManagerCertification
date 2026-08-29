"use client";

import Link from "next/link";
import { useState } from "react";
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
          <p className="text-sm text-gray-600">すべての問題に回答しました。</p>
          <button
            type="button"
            onClick={onRestart}
            className="rounded bg-gray-900 px-4 py-2 text-white"
          >
            もう一度解く
          </button>
        </div>
      );
    case "review":
      return (
        <div className="flex flex-col gap-3">
          <p className="text-base font-semibold">復習が完了しました</p>
          <p className="text-sm text-gray-600">
            このセッションで正解して復習完了にした問題：{resolvedInSession}件
          </p>
          <div className="flex flex-wrap gap-3 text-sm">
            <Link href="/review" className="rounded bg-gray-900 px-4 py-2 text-white">
              復習リストへ
            </Link>
            <Link href="/mypage" className="rounded border border-gray-300 px-4 py-2">
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

function choiceClassName(answered: boolean, choice: PracticeChoice, selectedId: string | null) {
  const base =
    "w-full rounded-lg border px-4 py-3 text-left text-sm leading-relaxed disabled:cursor-default";

  if (!answered) {
    return `${base} border-gray-300 bg-white hover:bg-gray-50`;
  }
  if (choice.is_correct) {
    return `${base} border-green-700 bg-green-100 text-green-950`;
  }
  if (choice.id === selectedId) {
    return `${base} border-red-700 bg-red-100 text-red-950`;
  }
  return `${base} border-gray-200 bg-white text-gray-500`;
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
    return (
      <p className="rounded-lg border border-gray-200 bg-white p-6 text-gray-600">
        {emptyMessage}
      </p>
    );
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
    <article className="rounded-lg border border-gray-200 bg-white p-5 shadow-sm sm:p-6">
      <p className="text-sm text-gray-500">
        {index + 1} / {questions.length}
      </p>
      <h2 className="mt-2 text-lg font-semibold leading-relaxed">{question.question_text}</h2>

      <ul className="mt-5 flex flex-col gap-3">
        {choices.map((choice) => (
          <li key={choice.id}>
            <button
              type="button"
              disabled={answered}
              onClick={() => handleSelect(choice.id)}
              className={choiceClassName(answered, choice, selectedId)}
            >
              {choice.choice_text}
            </button>
          </li>
        ))}
      </ul>

      {answered ? (
        <div className="mt-6 flex flex-col gap-4">
          <p
            className={`text-base font-bold ${isCorrect ? "text-green-800" : "text-red-800"}`}
          >
            {isCorrect ? "正解" : "不正解"}
          </p>
          <div className="rounded-lg bg-gray-50 p-4">
            <h3 className="text-sm font-semibold text-gray-700">解説</h3>
            <p className="mt-2 whitespace-pre-wrap text-sm leading-relaxed text-gray-800">
              {question.explanation}
            </p>
          </div>
          {saveError ? (
            <p className="text-sm text-red-700" role="alert">
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
            <button
              type="button"
              onClick={handleNext}
              className="rounded bg-gray-900 px-4 py-2 text-white"
            >
              次の問題へ
            </button>
          )}
        </div>
      ) : null}
    </article>
  );
}
