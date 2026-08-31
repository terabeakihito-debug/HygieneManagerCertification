import Link from "next/link";
import { CrossMark } from "@/components/ui/CrossMark";

const EXAM_ORG_HREF = "https://www.exam.or.jp/";

const FEATURES = [
  {
    no: "01",
    title: "問題演習",
    href: "/practice",
    body: "過去問と独自問題を合わせた実践的な問題を、マークシート形式で演習できます。資格区分・分野で絞り込んで、効率よく学習できます。",
  },
  {
    no: "02",
    title: "学習コンテンツ",
    href: "/learn",
    body: "図解と表で要点を整理した読み物コンテンツです。問題を解く前に、分野ごとの基礎知識を効率よくインプットできます。",
  },
  {
    no: "03",
    title: "模試",
    href: "/mock-exams",
    body: "本番同様の形式・制限時間で実力を試せます。合格ラインとの比較や、分野別の弱点も確認できます。",
  },
  {
    no: "04",
    title: "進捗管理",
    href: "/progress",
    body: "分野別の正答率を一覧で確認できます。苦手分野を自動的に検出し、重点的に復習すべき箇所が一目でわかります。",
  },
  {
    no: "05",
    title: "復習リスト",
    href: "/review",
    body: "間違えた問題は自動的に復習リストに追加されます。解けるようになるまで、繰り返し演習できます。",
  },
  {
    no: "06",
    title: "学習カレンダー",
    href: "/calendar",
    body: "毎日の学習実績を記録し、継続日数を可視化します。試験日を設定すれば、残り日数からの逆算スケジュールも確認できます。",
  },
] as const;

const HERO_LINKS = [
  { href: "#about", label: "衛生管理者とは" },
  { href: "/progress", label: "進捗" },
  { href: "/review", label: "復習" },
  { href: "/mock-exams", label: "模試" },
  { href: "/calendar", label: "カレンダー" },
  { href: "/login", label: "ログイン" },
  { href: "/signup", label: "新規登録" },
] as const;

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
          <span className="eh-nav">SERVICES</span>
        </div>

        <div className="eh-mid">
          <div className="eh-eyebrow">CERTIFICATION EXAM PREP — 2026</div>
          <h1 className="eh-title">
            衛生管理者
            <br />
            試験対策
          </h1>
        </div>

        <div className="eh-cards">
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

        <div className="eh-bottom">
          <div className="eh-bottom-copy">
            <p className="eh-desc">
              第一種・第二種衛生管理者試験の
              <br />
              合格を目指す学習・演習サービス。
            </p>
            <nav className="eh-links" aria-label="主要ページ">
              {HERO_LINKS.map((link, index) => (
                <span key={link.href}>
                  {index > 0 ? (
                    <span className="eh-links-sep" aria-hidden>
                      /
                    </span>
                  ) : null}
                  <Link href={link.href}>{link.label}</Link>
                </span>
              ))}
            </nav>
          </div>
          <Link href="/practice" className="eh-cta">
            問題演習をはじめる →
          </Link>
        </div>
      </section>

      <main className="mx-auto flex max-w-2xl flex-col gap-10 px-4 py-16 sm:py-20">
        <section id="features" className="flex scroll-mt-6 flex-col gap-5">
          <div>
            <p className="font-mono text-[11px] tracking-[0.18em] text-amber">FEATURES</p>
            <h2 className="mt-2 text-2xl font-bold">できること</h2>
          </div>
          <ul>
            {FEATURES.map((feature) => (
              <li key={feature.no}>
                <Link
                  href={feature.href}
                  className="progress-row flex items-start gap-4 py-4 text-ink no-underline"
                >
                  <span className="w-8 shrink-0 font-mono text-xs tabular-nums text-graphite">
                    {feature.no}
                  </span>
                  <div className="min-w-0 flex-1">
                    <h3 className="font-display text-base font-bold">{feature.title}</h3>
                    <p className="mt-1 text-sm leading-7 text-graphite">{feature.body}</p>
                  </div>
                  <span className="shrink-0 font-mono text-sm text-graphite" aria-hidden>
                    →
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </section>

        <section id="about" className="flex scroll-mt-6 flex-col gap-6 text-sm leading-7 text-ink">
          <h2 className="text-2xl font-bold">衛生管理者とは</h2>
          <p>
            衛生管理者は、労働安全衛生法に基づく国家資格です。事業場における労働者の健康障害の防止、衛生に関する教育の実施、健康診断の実施等、職場の衛生に関する技術的事項を管理する役割を担います。
          </p>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">なぜ必要とされる資格か</h3>
            <p>
              労働安全衛生法では、常時50人以上の労働者を使用する事業場に、衛生管理者の選任が義務付けられています。労働者数の規模に応じて、必要な衛生管理者の人数も定められています。職場の安全と健康を守る専門知識を持つ人材として、多くの業種で必要とされる資格です。
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">第一種と第二種の違い</h3>
            <p>
              衛生管理者には第一種と第二種があり、対応できる業種の範囲が異なります。
            </p>
            <ul className="flex flex-col gap-3">
              <li className="border-l-2 border-hairline pl-3">
                <strong className="font-display font-bold">第二種衛生管理者</strong>
                : 有害業務を含まない業種(情報通信業、金融業、小売業等)で衛生管理者として選任できます。
              </li>
              <li className="border-l-2 border-hairline pl-3">
                <strong className="font-display font-bold">第一種衛生管理者</strong>
                : 有害業務を含む全ての業種(製造業、建設業等)で衛生管理者として選任できます。第二種の対象業種も含みます。
              </li>
            </ul>
            <p>
              多くの業種に対応できる第一種の方が、活躍の場が広い資格といえます。
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">試験の実施団体</h3>
            <p>
              衛生管理者試験は、厚生労働大臣が指定する試験機関である公益財団法人
              安全衛生技術試験協会が実施しています。試験は全国の安全衛生技術センター等で、定期的に実施されています。
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">試験科目</h3>
            <p>
              試験は「関係法令」「労働衛生」「労働生理」の3科目で構成されます。第一種は、これらに加えて有害業務に関する内容が出題範囲に含まれます。
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">受験資格</h3>
            <p>
              衛生管理者試験を受験するには、学歴に応じた一定の実務経験等の受験資格を満たす必要があります。受験資格の詳細は、受験する方の学歴・職歴によって異なるため、必ず安全衛生技術試験協会の
              <a
                href={EXAM_ORG_HREF}
                target="_blank"
                rel="noopener noreferrer"
                className="text-safety underline"
              >
                公式サイト
              </a>
              で最新の情報をご確認ください。
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-hairline pt-6">
            <h3 className="text-lg font-bold">最新情報について</h3>
            <p>
              試験日程、受験手数料、受験資格の詳細、試験会場等は変更される場合があります。正確な最新情報は、必ず公益財団法人
              安全衛生技術試験協会の公式サイト(
              <a
                href={EXAM_ORG_HREF}
                target="_blank"
                rel="noopener noreferrer"
                className="text-safety underline"
              >
                https://www.exam.or.jp/
              </a>
              )でご確認ください。
            </p>
          </div>
        </section>

        <section id="for-you" className="flex scroll-mt-6 flex-col gap-6">
          <div>
            <p className="font-mono text-[11px] tracking-[0.18em] text-amber">FOR YOU</p>
            <h2 className="mt-2 text-2xl font-bold">こんな方におすすめです</h2>
          </div>
          <ul className="flex flex-col gap-3">
            {[
              "初めて衛生管理者試験に挑戦する方",
              "過去に不合格となり、再受験を目指す方",
              "忙しい仕事の合間に、効率よく学習したい方",
              "独学での勉強に不安を感じている方",
            ].map((item) => (
              <li key={item} className="flex items-start gap-3 text-sm leading-7">
                <CrossMark size={16} className="mt-1 shrink-0" />
                <span>{item}</span>
              </li>
            ))}
          </ul>
          <p className="border-t border-hairline pt-6 text-lg leading-8">
            合格までの道のりを、私たちが最後まで支えます。
            <br />
            <span className="text-safety">
              あなたの努力が実を結ぶよう、心から応援しています。
            </span>
          </p>
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
          <Link href="#about" className="underline">
            衛生管理者とは
          </Link>
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
