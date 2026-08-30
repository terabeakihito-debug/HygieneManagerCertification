import Link from "next/link";

export function Footer() {
  return (
    <footer className="border-t border-graphite bg-ink px-4 py-4 text-center text-xs text-paper/70">
      <p>
        © 2026 衛生管理者試験対策
        {" · "}
        <Link href="/privacy" className="underline">
          プライバシーポリシー
        </Link>
      </p>
    </footer>
  );
}
