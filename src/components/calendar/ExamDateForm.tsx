"use client";

import { useActionState } from "react";
import {
  saveUserSettingsAction,
  type UserSettingsState,
} from "@/lib/actions/user-settings";

const initialState: UserSettingsState = { error: null };

type ExamTypeOption = {
  id: string;
  name: string;
};

type ExamDateFormProps = {
  examTypes: ExamTypeOption[];
  targetExamTypeId: string | null;
  examDate: string | null;
};

export function ExamDateForm({
  examTypes,
  targetExamTypeId,
  examDate,
}: ExamDateFormProps) {
  const [state, formAction, pending] = useActionState(
    saveUserSettingsAction,
    initialState
  );

  return (
    <form action={formAction} className="flex flex-col gap-4">
      {state.error ? (
        <p className="rounded-sm border border-stamp px-3 py-2 text-sm text-stamp" role="alert">
          {state.error}
        </p>
      ) : null}

      <label className="flex flex-col gap-1 text-sm font-medium">
        試験区分
        <select
          name="target_exam_type_id"
          defaultValue={targetExamTypeId ?? ""}
          className="field-input"
        >
          <option value="">未設定</option>
          {examTypes.map((examType) => (
            <option key={examType.id} value={examType.id}>
              {examType.name}
            </option>
          ))}
        </select>
      </label>

      <label className="flex flex-col gap-1 text-sm font-medium">
        試験日
        <input
          type="date"
          name="exam_date"
          defaultValue={examDate ?? ""}
          className="field-input"
        />
      </label>

      <button
        type="submit"
        disabled={pending}
        className="btn-primary"
      >
        {pending ? "保存中..." : "設定を保存"}
      </button>
    </form>
  );
}
