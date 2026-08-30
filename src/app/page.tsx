import Link from "next/link";
import { CrossMark } from "@/components/ui/CrossMark";

export default function HomePage() {
  return (
    <>
      <section className="editorial-hero">
        <div className="eh-bgnum" aria-hidden>
          01
        </div>

        <div className="eh-top">
          <span className="eh-mark">
            <CrossMark size={28} />
            EXAMSTUDYCOACH
          </span>
          <span className="eh-nav">MENU</span>
        </div>

        <div className="eh-mid">
          <div className="eh-eyebrow">CERTIFICATION EXAM PREP — 2026</div>
          <h1 className="eh-title">
            衛生管理者
            <br />
            試験対策
          </h1>
        </div>

        <div className="eh-bottom">
          <p className="eh-desc">
            第一種・第二種衛生管理者試験の
            <br />
            合格を目指す学習・演習サービス。
          </p>
          <Link href="/practice" className="eh-cta">
            問題演習をはじめる →
          </Link>
        </div>
      </section>

      <main className="mx-auto flex max-w-2xl flex-col gap-10 px-4 py-16 sm:py-20">
        <section className="flex flex-col gap-4">
        <p className="font-mono text-[11px] tracking-[0.18em] text-amber">GET STARTED</p>
        <div className="grid gap-4 sm:grid-cols-2">
          <Link href="/learn" className="id-card text-ink no-underline">
            <div className="id-card-no text-graphite" style={{ color: "#4B4F49" }}>
              NO. 01
            </div>
            <h2 className="id-card-title">学習コンテンツ</h2>
            <div className="id-card-rule" />
            <p className="id-card-sub">図解と関係法令で、出題の急所を先に押さえる</p>
            <span className="id-card-mark">
              <CrossMark size={18} />
            </span>
          </Link>
          <Link href="/practice" className="id-card text-ink no-underline">
            <div className="id-card-no text-graphite" style={{ color: "#4B4F49" }}>
              NO. 02
            </div>
            <h2 className="id-card-title">問題演習</h2>
            <div className="id-card-rule" />
            <p className="id-card-sub">マークシート形式で、分野を選んで解く</p>
            <span className="id-card-mark">
              <CrossMark size={18} />
            </span>
          </Link>
        </div>
        </section>

        <div className="flex flex-col gap-3 sm:flex-row">
          <Link href="/practice" className="btn-primary">
            問題演習をはじめる
          </Link>
          <Link href="/signup" className="btn-secondary">
            新規登録
          </Link>
        </div>

        <nav className="flex flex-wrap gap-x-4 gap-y-2 text-sm text-graphite">
          <Link href="/login" className="underline">
            ログイン
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
          <Link href="/calendar" className="underline">
            カレンダー
          </Link>
        </nav>
      </main>
    </>
  );
}
