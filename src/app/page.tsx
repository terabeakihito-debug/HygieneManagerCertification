import Link from "next/link";
import { MaintenanceHome } from "@/components/layout/MaintenanceHome";
import { CrossMark } from "@/components/ui/CrossMark";
import { currentExam } from "@/config/exams";
import { EXAM_ORG_HREF, EXAM_ORG_PUBLISHED_QUESTIONS_HREF } from "@/lib/exam-org";
import { SITE_DESCRIPTION, SITE_NAME, SITE_URL } from "@/lib/seo";
import { SITE_MAINTENANCE } from "@/lib/site-maintenance";

const categoryLabels = currentExam.categories.map((category) => category.label);

const websiteJsonLd = {
  "@context": "https://schema.org",
  "@type": "WebSite",
  name: SITE_NAME,
  url: SITE_URL,
};

const courseJsonLd = {
  "@context": "https://schema.org",
  "@type": "Course",
  name: SITE_NAME,
  description: SITE_DESCRIPTION,
  url: SITE_URL,
  inLanguage: "ja",
  about: categoryLabels,
  educationalLevel: categoryLabels.join(", "),
  provider: {
    "@type": "Organization",
    name: "ExamStudyCoach",
    url: SITE_URL,
  },
  isAccessibleForFree: true,
};

const FEATURES = [
  {
    title: "問題演習",
    href: "/practice",
    body:
      currentExam.practiceFilters.length > 1
        ? "試験範囲と関係法令をもとに独自作成した学習用問題を、マークシート形式で演習できます。資格区分・分野で絞り込んで、効率よく学習できます。"
        : "試験範囲と関係法令をもとに独自作成した学習用問題をマークシート形式で演習できます。分野で絞り込んで、効率よく学習できます。",
  },
  ...(currentExam.hasLearnContent
    ? [
        {
          title: "学習コンテンツ",
          href: "/learn",
          body: "図解と表で要点を整理した読み物コンテンツです。問題を解く前に、分野ごとの基礎知識を効率よくインプットできます。",
        },
      ]
    : []),
  {
    title: "模試",
    href: "/mock-exams",
    body: "本番同様の形式・制限時間で、独自作成した学習用問題の実力を試せます。合格ラインとの比較や、分野別の弱点も確認できます。",
  },
  {
    title: "進捗管理",
    href: "/progress",
    body: "分野別の正答率を一覧で確認できます。苦手分野を自動的に検出し、重点的に復習すべき箇所が一目でわかります。",
  },
  {
    title: "復習リスト",
    href: "/review",
    body: "間違えた問題は自動的に復習リストに追加されます。解けるようになるまで、繰り返し演習できます。",
  },
  {
    title: "学習カレンダー",
    href: "/calendar",
    body: "毎日の学習実績を記録し、継続日数を可視化します。試験日を設定すれば、残り日数からの逆算スケジュールも確認できます。",
  },
];

const HERO_LINKS = [
  { href: "#about", label: currentExam.aboutNavLabel },
  { href: "/progress", label: "進捗" },
  { href: "/review", label: "復習" },
  { href: "/mock-exams", label: "模試" },
  { href: "/calendar", label: "カレンダー" },
  { href: "/login", label: "ログイン" },
  { href: "/signup", label: "新規登録" },
] as const;

export default function HomePage() {
  if (SITE_MAINTENANCE) {
    return <MaintenanceHome />;
  }

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(websiteJsonLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(courseJsonLd) }}
      />
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
            {currentExam.seo.heroLines[0]}
            <br />
            {currentExam.seo.heroLines[1]}
          </h1>
        </div>

        <div className="eh-cards">
          {currentExam.hasLearnContent ? (
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
          ) : (
            <Link href="/mock-exams" className="id-card text-ink no-underline">
              <div className="id-card-no text-graphite" style={{ color: "#4B4F49" }}>
                NO. 01
              </div>
              <h2 className="id-card-title">模試</h2>
              <div className="id-card-rule" />
              <p className="id-card-sub">本番形式で、今の実力を確かめる</p>
              <span className="id-card-mark">
                <CrossMark size={18} />
              </span>
            </Link>
          )}
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
              {currentExam.heroDescription[0]}
              <br />
              {currentExam.heroDescription[1]}
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
            {FEATURES.map((feature, index) => (
              <li key={feature.href}>
                <Link
                  href={feature.href}
                  className="progress-row flex items-start gap-4 py-4 text-ink no-underline"
                >
                  <span className="w-8 shrink-0 font-mono text-xs tabular-nums text-graphite">
                    {String(index + 1).padStart(2, "0")}
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
          <h2 className="text-2xl font-bold">{currentExam.aboutNavLabel}</h2>
          <p>{currentExam.aboutIntro}</p>

          {currentExam.aboutSections.map((section) => (
            <div key={section.title} className="flex flex-col gap-3 border-t border-hairline pt-6">
              <h3 className="text-lg font-bold">{section.title}</h3>
              {section.paragraphs[0] ? <p>{section.paragraphs[0]}</p> : null}
              {"items" in section && section.items ? (
                <ul className="flex flex-col gap-3">
                  {section.items.map((item) => (
                    <li key={item.label} className="border-l-2 border-hairline pl-3">
                      <strong className="font-display font-bold">{item.label}</strong>
                      : {item.text}
                    </li>
                  ))}
                </ul>
              ) : null}
              {section.paragraphs.slice(1).map((paragraph) => (
                <p key={paragraph}>{paragraph}</p>
              ))}
              {section.title === "受験資格" || section.title === "最新情報について" ? (
                <div className="flex flex-col gap-2">
                  <p>
                    <a
                      href={EXAM_ORG_HREF}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-safety underline"
                    >
                      {EXAM_ORG_HREF}
                    </a>
                  </p>
                  {section.title === "最新情報について" ? (
                    <p>
                      公式の公表問題は
                      <a
                        href={EXAM_ORG_PUBLISHED_QUESTIONS_HREF}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="ml-1 text-safety underline"
                      >
                        協会の公表試験問題ページ
                      </a>
                      でご確認ください。
                    </p>
                  ) : null}
                </div>
              ) : null}
            </div>
          ))}
        </section>

        <section id="for-you" className="flex scroll-mt-6 flex-col gap-6">
          <div>
            <p className="font-mono text-[11px] tracking-[0.18em] text-amber">FOR YOU</p>
            <h2 className="mt-2 text-2xl font-bold">こんな方におすすめです</h2>
          </div>
          <ul className="flex flex-col gap-3">
            {[
              `初めて${currentExam.displayName}試験に挑戦する方`,
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
            {currentExam.aboutNavLabel}
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
