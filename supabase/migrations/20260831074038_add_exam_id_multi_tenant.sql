-- マルチ試験対応: exams マスタと exam_id の導入
--
-- 確定事項(現行スキーマ):
-- - 第一種/第二種は question_class ではなく exam_types.code
--   (type1 / type2 / common)。exam_types は残し、exam_categories に同コードを複製する。
-- - 学習カレンダーは study_logs。アフィリエイトは products / category_products。
-- - ストリークは当面 exam_id ごとに分離する(unique を user_id+study_date+exam_id に拡張)。
--   衛生管理者のみの現状では行の中身は変わらない。

create table exams (
  id text primary key,
  name text not null,
  organization text,
  has_practical_exam boolean not null default false,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

insert into exams (id, name, organization, has_practical_exam) values
  ('hygiene', '第一種・第二種衛生管理者', '公益財団法人安全衛生技術試験協会', false);

create table exam_categories (
  id uuid primary key default gen_random_uuid(),
  exam_id text not null references exams(id),
  code text not null,
  label text not null,
  display_order int not null default 0,
  unique (exam_id, code)
);

insert into exam_categories (exam_id, code, label, display_order) values
  ('hygiene', 'type1', '第一種衛生管理者', 1),
  ('hygiene', 'type2', '第二種衛生管理者', 2),
  ('hygiene', 'common', '共通', 3);

alter table exams enable row level security;
create policy "exams_select_all" on exams for select using (true);

alter table exam_categories enable row level security;
create policy "exam_categories_select_all" on exam_categories for select using (true);

-- exam_types: 区分マスタを試験ごとに持てるよう unique を (exam_id, code) に変更
alter table exam_types add column exam_id text references exams(id);
update exam_types set exam_id = 'hygiene' where exam_id is null;
alter table exam_types alter column exam_id set not null;
alter table exam_types drop constraint exam_types_code_key;
alter table exam_types add constraint exam_types_exam_id_code_key unique (exam_id, code);

alter table categories add column exam_id text references exams(id);
update categories c
set exam_id = et.exam_id
from exam_types et
where c.exam_type_id = et.id
  and c.exam_id is null;
alter table categories alter column exam_id set not null;

alter table questions add column exam_id text references exams(id);
update questions set exam_id = 'hygiene' where exam_id is null;
alter table questions alter column exam_id set not null;

alter table products add column exam_id text references exams(id);
update products set exam_id = 'hygiene' where exam_id is null;
alter table products alter column exam_id set not null;

alter table mock_exams add column exam_id text references exams(id);
update mock_exams set exam_id = 'hygiene' where exam_id is null;
alter table mock_exams alter column exam_id set not null;

alter table user_progress add column exam_id text references exams(id);
update user_progress up
set exam_id = c.exam_id
from categories c
where up.category_id = c.id
  and up.exam_id is null;
alter table user_progress alter column exam_id set not null;

alter table review_list add column exam_id text references exams(id);
update review_list rl
set exam_id = q.exam_id
from questions q
where rl.question_id = q.id
  and rl.exam_id is null;
alter table review_list alter column exam_id set not null;

alter table user_answers add column exam_id text references exams(id);
update user_answers ua
set exam_id = q.exam_id
from questions q
where ua.question_id = q.id
  and ua.exam_id is null;
alter table user_answers alter column exam_id set not null;

alter table study_logs add column exam_id text references exams(id);
update study_logs set exam_id = 'hygiene' where exam_id is null;
alter table study_logs alter column exam_id set not null;
alter table study_logs drop constraint study_logs_user_id_study_date_key;
alter table study_logs add constraint study_logs_user_id_study_date_exam_id_key
  unique (user_id, study_date, exam_id);

alter table mock_exam_results add column exam_id text references exams(id);
update mock_exam_results mer
set exam_id = me.exam_id
from mock_exams me
where mer.mock_exam_id = me.id
  and mer.exam_id is null;
alter table mock_exam_results alter column exam_id set not null;

alter table user_settings add column exam_id text references exams(id);
update user_settings set exam_id = 'hygiene' where exam_id is null;
alter table user_settings alter column exam_id set not null;
alter table user_settings drop constraint user_settings_pkey;
alter table user_settings add primary key (user_id, exam_id);

create index idx_exam_types_exam_id on exam_types(exam_id);
create index idx_categories_exam_id on categories(exam_id);
create index idx_questions_exam_id on questions(exam_id);
create index idx_products_exam_id on products(exam_id);
create index idx_mock_exams_exam_id on mock_exams(exam_id);
create index idx_user_progress_exam_id on user_progress(exam_id);
create index idx_review_list_exam_id on review_list(exam_id);
create index idx_user_answers_exam_id on user_answers(exam_id);
create index idx_study_logs_exam_id on study_logs(exam_id);
create index idx_mock_exam_results_exam_id on mock_exam_results(exam_id);
create index idx_user_settings_exam_id on user_settings(exam_id);
