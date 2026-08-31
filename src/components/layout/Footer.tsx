import Link from "next/link";
import { currentExam } from "@/config/exams";

export function Footer() {
  return (
    <footer className="border-t border-graphite bg-ink px-4 py-4 text-center text-xs text-paper/70">
      <p>
        © 2026 {currentExam.siteName}
        {" · "}
        <Link href="/#about" className="underline">
          {currentExam.aboutNavLabel}
        </Link>
        {" · "}
        <Link href="/privacy" className="underline">
          プライバシーポリシー
        </Link>
      </p>
    </footer>
  );
}
