-- Row Level Security (RLS) 設定
-- 方針: マスタデータ(問題・分野・商品等)は全ユーザー読み取り可能
--       ユーザー固有データは本人のみアクセス可能

-- マスタデータ: 読み取り専用で全員に公開
alter table exam_types enable row level security;
create policy "exam_types_select_all" on exam_types for select using (true);

alter table categories enable row level security;
create policy "categories_select_all" on categories for select using (true);

alter table questions enable row level security;
create policy "questions_select_all" on questions for select using (true);

alter table choices enable row level security;
create policy "choices_select_all" on choices for select using (true);

alter table products enable row level security;
create policy "products_select_all" on products for select using (true);

alter table category_products enable row level security;
create policy "category_products_select_all" on category_products for select using (true);

alter table mock_exams enable row level security;
create policy "mock_exams_select_all" on mock_exams for select using (true);

-- ユーザー固有データ: 本人のみ読み書き可能
alter table user_progress enable row level security;
create policy "user_progress_own_rows" on user_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

alter table user_answers enable row level security;
create policy "user_answers_own_rows" on user_answers
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

alter table review_list enable row level security;
create policy "review_list_own_rows" on review_list
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

alter table mock_exam_results enable row level security;
create policy "mock_exam_results_own_rows" on mock_exam_results
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

alter table study_logs enable row level security;
create policy "study_logs_own_rows" on study_logs
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
