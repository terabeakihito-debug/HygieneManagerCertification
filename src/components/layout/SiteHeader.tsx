"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { currentExam } from "@/config/exams";

export function SiteHeader() {
  const pathname = usePathname();

  if (pathname === "/") {
    return null;
  }

  return (
    <header className="border-b-4 border-safety bg-ink text-paper">
      <div className="mx-auto flex max-w-2xl items-baseline justify-between gap-4 px-4 py-3">
        <Link href="/" className="font-display text-base font-bold tracking-tight text-paper sm:text-lg">
          {currentExam.siteName}
        </Link>
        <Link href="/mypage" className="text-sm text-paper/80 underline">
          マイページ
        </Link>
      </div>
    </header>
  );
}
