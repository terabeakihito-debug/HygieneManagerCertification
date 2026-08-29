import Link from "next/link";
import { SignupForm } from "./SignupForm";

export default function SignupPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
      <h1 className="mb-6 text-2xl font-bold">新規登録</h1>
      <div className="rounded-lg border border-gray-200 bg-white p-6 shadow-sm">
        <SignupForm />
      </div>
      <p className="mt-4 text-center text-sm text-gray-600">
        アカウントをお持ちの方は{" "}
        <Link href="/login" className="underline">
          ログイン
        </Link>
      </p>
    </main>
  );
}
