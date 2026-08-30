import Link from "next/link";

export default function CheckEmailPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col justify-center px-4 py-16">
      <h1 className="mb-4 text-2xl font-bold">確認メールを送信しました</h1>
      <p className="text-graphite">
        登録したメールアドレスに確認用のリンクを送りました。メール内のリンクをクリックして、登録を完了してください。
      </p>
      <p className="mt-6 text-sm text-graphite">
        確認が完了したら{" "}
        <Link href="/login" className="underline">
          ログイン
        </Link>
        してください。
      </p>
    </main>
  );
}
