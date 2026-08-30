import type { Metadata } from "next";
import { AnonymousAuthProvider } from "@/components/auth/AnonymousAuthProvider";
import { Footer } from "@/components/layout/Footer";
import "./globals.css";

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
    <html lang="ja">
      <body className="min-h-screen bg-gray-50 text-gray-900">
        <AnonymousAuthProvider>
          {children}
          <Footer />
        </AnonymousAuthProvider>
      </body>
    </html>
  );
}
