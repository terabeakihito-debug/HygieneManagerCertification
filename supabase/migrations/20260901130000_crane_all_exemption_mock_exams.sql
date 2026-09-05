-- 免除模試用の科目絞り込み列。NULL は source_filter に一致する全問。
alter table mock_exams
  add column category_scope text[];

comment on column mock_exams.category_scope is
  '出題する科目名(categories.name)。NULL のときは source_filter に一致する全問を出題する。';
