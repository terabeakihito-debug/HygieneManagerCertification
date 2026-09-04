import Link from "next/link";
import { currentExam } from "@/config/exams";
import { SITE_MAINTENANCE } from "@/lib/site-maintenance";

export function Footer() {
  if (SITE_MAINTENANCE) {
    return (
      <footer className="border-t border-graphite bg-ink px-4 py-4 text-center text-xs text-paper/70">
        <p>© 2026 {currentExam.siteName}</p>
      </footer>
    );
  }

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
