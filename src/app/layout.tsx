import type { Metadata } from "next";
import { JetBrains_Mono, Noto_Sans_JP, Zen_Kaku_Gothic_New } from "next/font/google";
import { AnonymousAuthProvider } from "@/components/auth/AnonymousAuthProvider";
import { Footer } from "@/components/layout/Footer";
import { SiteHeader } from "@/components/layout/SiteHeader";
import { currentExam } from "@/config/exams";
import { SITE_DESCRIPTION, SITE_NAME, SITE_URL } from "@/lib/seo";
import { SITE_MAINTENANCE } from "@/lib/site-maintenance";
import "./globals.css";

const zenKakuGothicNew = Zen_Kaku_Gothic_New({
  subsets: ["latin"],
  weight: ["400", "500", "700", "900"],
  variable: "--font-display",
  display: "swap",
});

const notoSansJp = Noto_Sans_JP({
  subsets: ["latin"],
  weight: ["400", "500", "700"],
  variable: "--font-body",
  display: "swap",
});

const jetbrainsMono = JetBrains_Mono({
  subsets: ["latin"],
  weight: ["400", "500", "700", "800"],
  variable: "--font-mono",
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: {
    default: SITE_MAINTENANCE
      ? `${SITE_NAME}｜メンテナンス中`
      : currentExam.seo.title,
    template: `%s｜${SITE_NAME}`,
  },
  description: SITE_MAINTENANCE
    ? "ただいまメンテナンス中です。再開までしばらくお待ちください。"
    : SITE_DESCRIPTION,
  keywords: [...currentExam.seo.keywords],
  alternates: {
    canonical: "/",
  },
  robots: SITE_MAINTENANCE
    ? { index: false, follow: false }
    : { index: true, follow: true },
  openGraph: {
    type: "website",
    locale: "ja_JP",
    siteName: SITE_NAME,
    title: SITE_MAINTENANCE
      ? `${SITE_NAME}｜メンテナンス中`
      : currentExam.seo.title,
    description: SITE_MAINTENANCE
      ? "ただいまメンテナンス中です。再開までしばらくお待ちください。"
      : SITE_DESCRIPTION,
    url: "/",
  },
  twitter: {
    card: "summary_large_image",
    title: SITE_MAINTENANCE
      ? `${SITE_NAME}｜メンテナンス中`
      : currentExam.seo.title,
    description: SITE_MAINTENANCE
      ? "ただいまメンテナンス中です。再開までしばらくお待ちください。"
      : SITE_DESCRIPTION,
  },
  icons: {
    icon: "/icon.svg",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="ja"
      className={`${zenKakuGothicNew.variable} ${notoSansJp.variable} ${jetbrainsMono.variable}`}
      suppressHydrationWarning
    >
      <body className="min-h-screen bg-paper font-body text-ink">
        {SITE_MAINTENANCE ? (
          <>
            {children}
            <Footer />
          </>
        ) : (
          <AnonymousAuthProvider>
            <SiteHeader />
            {children}
            <Footer />
          </AnonymousAuthProvider>
        )}
      </body>
    </html>
  );
}
