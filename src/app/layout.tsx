import type { Metadata } from "next";
import { JetBrains_Mono, Noto_Sans_JP, Zen_Kaku_Gothic_New } from "next/font/google";
import { AnonymousAuthProvider } from "@/components/auth/AnonymousAuthProvider";
import { Footer } from "@/components/layout/Footer";
import { SiteHeader } from "@/components/layout/SiteHeader";
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
  title: "衛生管理者試験対策",
  description: "第一種・第二種衛生管理者試験の学習・演習サービス",
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
        <AnonymousAuthProvider>
          <SiteHeader />
          {children}
          <Footer />
        </AnonymousAuthProvider>
      </body>
    </html>
  );
}
