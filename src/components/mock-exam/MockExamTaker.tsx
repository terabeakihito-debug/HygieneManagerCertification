"use client";

import { useEffect, useRef, useState } from "react";
import { ChoiceMark } from "@/components/ui/ChoiceMark";
import { gradeMockExamAction } from "@/lib/actions/mock-exam";

export type MockExamChoice = {
  id: string;
  choice_text: string;
  sort_order: number;
};

export type MockExamQuestion = {
  id: string;
  question_text: string;
  choices: MockExamChoice[];
};

type MockExamTakerProps = {
  mockExamId: string;
  timeLimitMinutes: number;
  questions: MockExamQuestion[];
};

function formatRemaining(totalSeconds: number): string {
  const safe = Math.max(0, totalSeconds);
  const hours = Math.floor(safe / 3600);
  const minutes = Math.floor((safe % 3600) / 60);
  const seconds = safe % 60;
  if (hours > 0) {
    return `${hours}:${minutes.toString().padStart(2, "0")}:${seconds.toString().padStart(2, "0")}`;
  }
  return `${minutes}:${seconds.toString().padStart(2, "0")}`;
}

export function MockExamTaker({
  mockExamId,
  timeLimitMinutes,
  questions,
}: MockExamTakerProps) {
  const [index, setIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string | null>>({});
  const [remaining, setRemaining] = useState(Math.max(0, timeLimitMinutes) * 60);
  const [error, setError] = useState<string | null>(null);
  const [pending, setPending] = useState(false);
  const submitted = useRef(false);
  const answersRef = useRef(answers);
  answersRef.current = answers;

  const question = questions[index];
  const isLast = index >= questions.length - 1;

  useEffect(() => {
    const timer = window.setInterval(() => {
      setRemaining((current) => (current <= 0 ? 0 : current - 1));
    }, 1000);
    return () => window.clearInterval(timer);
  }, []);

  useEffect(() => {
    if (remaining === 0 && !submitted.current) {
      void submitGrade();
    }
  }, [remaining]);

  async function submitGrade() {
    if (submitted.current || pending) {
      return;
    }
    submitted.current = true;
    setPending(true);
    setError(null);

    const result = await gradeMockExamAction({
      mockExamId,
      answers: questions.map((item) => ({
        questionId: item.id,
        selectedChoiceId: answersRef.current[item.id] ?? null,
      })),
    });

    if (result?.error) {
      submitted.current = false;
      setPending(false);
      setError(result.error);
    }
  }

  function handleSelect(choiceId: string) {
    if (!question || pending) {
      return;
    }
    setAnswers((current) => ({ ...current, [question.id]: choiceId }));
    if (!isLast) {
      setIndex((current) => current + 1);
    }
  }

  function handleSkip() {
    if (!question || pending) {
      return;
    }
    setAnswers((current) => ({ ...current, [question.id]: null }));
    if (!isLast) {
      setIndex((current) => current + 1);
    }
  }

  if (!question) {
    return <p className="card-surface p-6 text-graphite">出題できる問題がありません。</p>;
  }

  const choices = [...question.choices].sort((a, b) => a.sort_order - b.sort_order);
  const selectedId = answers[question.id];

  return (
    <div className="flex flex-col gap-4">
      <div
        className={`rounded-sm px-4 py-3 text-center font-display font-semibold ${
          remaining <= 60 ? "border border-stamp bg-paper text-stamp" : "bg-ink text-paper"
        }`}
      >
        残り時間 <span className="font-mono">{formatRemaining(remaining)}</span>
      </div>

      <article className="card-surface p-5 sm:p-6">
        <div className="flex items-center gap-3">
          <span className="q-number">{String(index + 1).padStart(2, "0")}</span>
          <p className="font-mono text-sm text-graphite">
            {index + 1} / {questions.length}
          </p>
        </div>
        <h2 className="mt-3 text-lg font-semibold leading-relaxed">{question.question_text}</h2>

        <ul className="mt-5 flex flex-col gap-3">
          {choices.map((choice) => (
            <li key={choice.id}>
              <button
                type="button"
                disabled={pending}
                onClick={() => handleSelect(choice.id)}
                className="flex w-full items-start gap-3 rounded-sm px-1 py-2 text-left text-sm leading-relaxed"
              >
                <ChoiceMark state={selectedId === choice.id ? "marked" : "idle"} />
                <span>{choice.choice_text}</span>
              </button>
            </li>
          ))}
        </ul>

        <div className="mt-6 flex flex-col gap-3 sm:flex-row">
          <button type="button" disabled={pending} onClick={handleSkip} className="btn-secondary text-sm">
            スキップ
          </button>
          {isLast ? (
            <button
              type="button"
              disabled={pending}
              onClick={() => void submitGrade()}
              className="btn-primary text-sm"
            >
              {pending ? "採点中..." : "採点する"}
            </button>
          ) : null}
        </div>

        {error ? (
          <p className="mt-4 text-sm text-stamp" role="alert">
            {error}
          </p>
        ) : null}
      </article>
    </div>
  );
}
