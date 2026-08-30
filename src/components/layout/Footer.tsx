import Link from "next/link";

export function Footer() {
  return (
    <footer className="border-t border-gray-200 px-4 py-4 text-center text-xs text-gray-500">
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
