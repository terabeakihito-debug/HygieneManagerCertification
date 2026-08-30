type ChoiceMarkState = "idle" | "marked" | "correct" | "incorrect";

type ChoiceMarkProps = {
  state: ChoiceMarkState;
};

function bubbleClassName(state: ChoiceMarkState): string {
  switch (state) {
    case "correct":
      return "bubble bubble-correct";
    case "incorrect":
      return "bubble bubble-incorrect";
    case "marked":
      return "bubble bubble-marked";
    case "idle":
      return "bubble";
    default: {
      const _never: never = state;
      return _never;
    }
  }
}

export function ChoiceMark({ state }: ChoiceMarkProps) {
  const filled = state !== "idle";

  return (
    <span className={bubbleClassName(state)} aria-hidden>
      {filled ? <span className="bubble-inner" /> : null}
    </span>
  );
}
