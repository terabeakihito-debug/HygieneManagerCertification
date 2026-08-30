import Link from "next/link";
import { SignupForm } from "./SignupForm";

export default function SignupPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
      <h1 className="mb-6 text-2xl font-bold">新規登録</h1>
      <div className="card-surface p-6">
        <SignupForm />
      </div>
      <p className="mt-4 text-center text-xs text-graphite">
        登録することで
        <Link href="/privacy" className="underline">
          プライバシーポリシー
        </Link>
        に同意したものとみなされます
      </p>
      <p className="mt-3 text-center text-sm text-graphite">
        アカウントをお持ちの方は{" "}
        <Link href="/login" className="underline">
          ログイン
        </Link>
      </p>
    </main>
  );
}
