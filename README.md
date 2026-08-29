# 衛生管理者試験対策サービス (HygieneManagerCertification)

第一種・第二種衛生管理者試験の受験者向けの学習・演習Webサービス。
問題演習・模試・進捗管理・復習機能・学習カレンダー・苦手分野連動型アフィリエイトを備える。

## ドキュメント

開発を始める前に、必ず以下を読んでください。AIツール(Claude / Codex / Cursor)に実装を依頼する際も、これらのドキュメントを前提として参照させることを推奨します。

- [`docs/要件定義書.md`](./docs/要件定義書.md) — サービスの目的・機能要件・非機能要件・技術スタック
- [`docs/問題データ設計書.md`](./docs/問題データ設計書.md) — DBテーブル設計・スキーマ定義・苦手分野連動レコメンドのロジック

## 技術スタック

| 領域 | 技術 |
|---|---|
| フロントエンド | Next.js 14 (App Router) + TypeScript + Tailwind CSS |
| バックエンド | Next.js API Routes / Server Actions |
| DB・認証 | Supabase (PostgreSQL, Supabase Auth, RLS) |
| ホスティング | Vercel |

## ディレクトリ構成

```
.
├── docs/                        # 要件定義書・設計書
├── src/
│   ├── app/                     # Next.js App Router(ページ・レイアウト)
│   ├── components/              # 共有UIコンポーネント
│   ├── lib/
│   │   └── supabase/            # Supabaseクライアント(client/server)
│   ├── types/                   # DBスキーマに対応する型定義
│   └── middleware.ts            # Supabaseセッション更新ミドルウェア
├── supabase/
│   └── migrations/              # DBマイグレーションSQL
├── .env.example                 # 環境変数テンプレート
└── package.json
```

## セットアップ手順

### 1. 依存パッケージのインストール

```bash
npm install
```

### 2. Supabaseプロジェクトの作成

1. [Supabase](https://supabase.com) でプロジェクトを新規作成
2. `Project Settings > API` から `URL` と `anon public key` を取得
3. `.env.example` を `.env.local` にコピーし、値を設定

```bash
cp .env.example .env.local
```

### 3. DBマイグレーションの適用

Supabase CLIを使う場合:

```bash
npx supabase login
npx supabase link --project-ref <あなたのプロジェクトref>
npx supabase db push
```

または、Supabaseダッシュボードの SQL Editor で `supabase/migrations/` 内のSQLファイルを番号順に実行してください。

- `0001_init_schema.sql` — テーブル定義一式
- `0002_rls_policies.sql` — Row Level Security(アクセス制御)設定

### 4. 開発サーバーの起動

```bash
npm run dev
```

`http://localhost:3000` で確認できます。

## 開発の役割分担(このプロジェクトでの想定)

| ツール | 主な役割 |
|---|---|
| Claude | 要件定義・仕様設計、DBスキーマ設計、複雑なロジックの相談、ドキュメント整備 |
| Cursor | 日常的なコーディング、コンポーネント実装、リファクタリング |
| Codex | 個別関数・APIエンドポイント・テストコードの自動生成 |

CursorやCodexに実装を依頼する際は、`docs/要件定義書.md` と `docs/問題データ設計書.md` を読み込ませたうえで指示すると、一貫性のある実装になりやすいです。

## 今後のステップ

- [ ] MVP範囲の確定(最初にどこまでの機能を作るか)
- [ ] 問題データの初期投入(過去問整形 + 独自作問)
- [ ] 認証フロー(サインアップ/ログイン画面)の実装
- [ ] 問題演習画面の実装
- [ ] 進捗管理・復習リストの実装
- [ ] 模試機能の実装
- [ ] 学習カレンダーの実装
- [ ] アフィリエイト商品マスタの初期データ投入・レコメンド機能の実装
