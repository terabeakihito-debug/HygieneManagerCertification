"use client";

import { useRouter } from "next/navigation";
import type { Category } from "@/types/database";
import type { PracticeExamType } from "./exam-type";

type CategoryFilterProps = {
  examType: PracticeExamType;
  categories: Pick<Category, "id" | "name">[];
  selectedCategoryId: string | null;
};

export function CategoryFilter({
  examType,
  categories,
  selectedCategoryId,
}: CategoryFilterProps) {
  const router = useRouter();

  function handleChange(event: React.ChangeEvent<HTMLSelectElement>) {
    const params = new URLSearchParams();
    if (examType !== "all") {
      params.set("exam_type", examType);
    }
    if (event.target.value) {
      params.set("category_id", event.target.value);
    }
    const query = params.toString();
    router.push(query ? `/practice?${query}` : "/practice");
  }

  return (
    <label className="flex flex-col gap-1 text-sm font-medium">
      分野
      <select
        value={selectedCategoryId ?? ""}
        onChange={handleChange}
        className="rounded border border-gray-300 bg-white px-3 py-2 font-normal"
      >
        <option value="">すべての分野</option>
        {categories.map((category) => (
          <option key={category.id} value={category.id}>
            {category.name}
          </option>
        ))}
      </select>
    </label>
  );
}
