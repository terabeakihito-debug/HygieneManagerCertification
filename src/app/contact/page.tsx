import type { Metadata } from "next";
import { currentExam } from "@/config/exams";
import { SITE_NAME } from "@/lib/seo";

const CONTACT_EMAIL = "contact@examstudycoach.com";

export const metadata: Metadata = {
  title: "お問い合わせ",
  description: `${SITE_NAME}へのお問い合わせ方法をご案内します。`,
  alternates: {
    canonical: "/contact",
  },
};

export default function ContactPage() {
  const subject = encodeURIComponent(
    `${currentExam.displayName}試験対策サイトへのお問い合わせ`
  );

  return (
    <main className="mx-auto max-w-2xl px-4 py-10">
      <article className="prose max-w-none prose-headings:font-display prose-headings:text-ink prose-a:text-safety prose-p:text-ink">
        <h1>お問い合わせ</h1>
        <p>
          本サービスの内容、不具合、個人情報の取り扱いに関するご連絡は、
          以下のメールアドレスまでお願いいたします。
        </p>

        <h2>連絡先</h2>
        <dl>
          <div>
            <dt>運営者</dt>
            <dd>TERABE AKIHITO</dd>
          </div>
          <div>
            <dt>メールアドレス</dt>
            <dd>
              <a href={`mailto:${CONTACT_EMAIL}?subject=${subject}`}>
                {CONTACT_EMAIL}
              </a>
            </dd>
          </div>
        </dl>

        <h2>お問い合わせ時のお願い</h2>
        <ul>
          <li>不具合の場合は、利用ページ、操作内容、発生日時をご記載ください。</li>
          <li>
            問題や解説に関するご指摘は、資格名、分野、問題番号等をご記載ください。
          </li>
          <li>
            個人情報に関する請求では、本人確認に必要な情報をお願いする場合があります。
          </li>
        </ul>

        <p className="text-sm text-graphite">
          内容を確認のうえ対応しますが、返信まで時間をいただく場合や、
          営業・勧誘等には返信しない場合があります。
        </p>
      </article>
    </main>
  );
}
