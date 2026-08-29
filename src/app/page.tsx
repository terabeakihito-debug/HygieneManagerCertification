import Link from "next/link";

export default function HomePage() {
  return (
    <main className="mx-auto flex max-w-2xl flex-col items-center gap-6 px-4 py-16 text-center">
      <h1 className="text-3xl font-bold">衛生管理者試験対策</h1>
      <p className="text-gray-600">
        第一種・第二種衛生管理者試験の合格を目指す学習・演習サービスです。
      </p>
      <p className="flex gap-4 text-sm">
        <Link href="/signup" className="underline">
          新規登録
        </Link>
        <Link href="/login" className="underline">
          ログイン
        </Link>
        <Link href="/practice" className="underline">
          問題演習
        </Link>
        <Link href="/progress" className="underline">
          進捗
        </Link>
        <Link href="/review" className="underline">
          復習
        </Link>
        <Link href="/mock-exams" className="underline">
          模試
        </Link>
      </p>
      <p className="text-sm text-gray-400">
        セットアップ手順は README.md を参照してください。
      </p>
    </main>
  );
}
