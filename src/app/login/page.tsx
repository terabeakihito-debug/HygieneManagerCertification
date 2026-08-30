import Link from "next/link";
import { LoginForm } from "./LoginForm";

type LoginPageProps = {
  searchParams: Promise<{ error?: string }>;
};

export default async function LoginPage({ searchParams }: LoginPageProps) {
  const params = await searchParams;

  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
      <h1 className="mb-6 text-2xl font-bold">ログイン</h1>
      <div className="card-surface p-6">
        <LoginForm confirmFailed={params.error === "confirm_failed"} />
      </div>
      <p className="mt-4 text-center text-sm text-graphite">
        アカウントをお持ちでない方は{" "}
        <Link href="/signup" className="underline">
          新規登録
        </Link>
      </p>
    </main>
  );
}
