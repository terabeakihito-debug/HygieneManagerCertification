-- 衛生管理者試験対策サービス 初期スキーマ
-- 詳細設計意図は docs/問題データ設計書.md を参照

create extension if not exists "pgcrypto";

-- 1. 資格区分マスタ
create table exam_types (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  name text not null
);

-- 2. 分野マスタ
create table categories (
  id uuid primary key default gen_random_uuid(),
  exam_type_id uuid not null references exam_types(id),
  name text not null,
  sort_order int not null default 0
);

-- 3. 問題本体
create table questions (
  id uuid primary key default gen_random_uuid(),
  exam_type_id uuid not null references exam_types(id),
  category_id uuid not null references categories(id),
  question_text text not null,
  explanation text not null,
  source_type text not null check (source_type in ('past_exam', 'original')),
  source_note text,
  difficulty int,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 4. 選択肢
create table choices (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references questions(id) on delete cascade,
  choice_text text not null,
  is_correct boolean not null default false,
  sort_order int not null default 0
);

-- 5. アフィリエイト商品マスタ
create table products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  asp text not null check (asp in ('amazon', 'rakuten')),
  affiliate_url text not null,
  image_url text,
  product_type text not null check (product_type in ('book', 'course', 'goods')),
  exam_type_id uuid references exam_types(id),
  is_active boolean not null default true,
  priority int not null default 0
);

-- 6. 分野⇔商品の紐づけ(苦手分野連動レコメンド用)
create table category_products (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references categories(id) on delete cascade,
  product_id uuid not null references products(id) on delete cascade,
  unique (category_id, product_id)
);

-- 7. ユーザー進捗(分野別正答率)
create table user_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  category_id uuid not null references categories(id),
  total_answered int not null default 0,
  total_correct int not null default 0,
  updated_at timestamptz not null default now(),
  unique (user_id, category_id)
);

-- 8. 回答履歴
create table user_answers (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  question_id uuid not null references questions(id),
  selected_choice_id uuid not null references choices(id),
  is_correct boolean not null,
  answered_at timestamptz not null default now()
);

-- 9. 復習リスト
create table review_list (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  question_id uuid not null references questions(id),
  added_at timestamptz not null default now(),
  resolved boolean not null default false,
  review_count int not null default 0,
  unique (user_id, question_id)
);

-- 10. 模試セット定義
create table mock_exams (
  id uuid primary key default gen_random_uuid(),
  exam_type_id uuid not null references exam_types(id),
  name text not null,
  time_limit_minutes int not null,
  question_count int not null
);

-- 11. 模試結果
create table mock_exam_results (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  mock_exam_id uuid not null references mock_exams(id),
  score int not null,
  category_breakdown jsonb not null default '{}'::jsonb,
  taken_at timestamptz not null default now()
);

-- 12. 学習カレンダー用ログ
create table study_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  study_date date not null,
  questions_answered int not null default 0,
  unique (user_id, study_date)
);
