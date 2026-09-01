-- 免除模試用の科目絞り込み。NULL は source_filter に一致する全問（既存のフル模試）。
alter table mock_exams
  add column category_scope text[];

comment on column mock_exams.category_scope is
  '出題する科目名(categories.name)。NULL のときは source_filter に一致する全問を出題する。';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和7年10月)【力学免除】',
  120,
  30,
  '令和7年10月公表 クレーン・デリック運転士（限定なし）試験',
  array[
    'クレーン及びデリックに関する知識',
    '関係法令',
    '原動機及び電気に関する知識'
  ]
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and name = 'クレーン・デリック運転士模擬試験(令和7年10月)【力学免除】'
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和8年4月)【力学免除】',
  120,
  30,
  '令和8年4月公表 クレーン・デリック運転士（限定なし）試験',
  array[
    'クレーン及びデリックに関する知識',
    '関係法令',
    '原動機及び電気に関する知識'
  ]
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and name = 'クレーン・デリック運転士模擬試験(令和8年4月)【力学免除】'
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和7年10月)【原動機電気・力学免除】',
  75,
  20,
  '令和7年10月公表 クレーン・デリック運転士（限定なし）試験',
  array[
    'クレーン及びデリックに関する知識',
    '関係法令'
  ]
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and name = 'クレーン・デリック運転士模擬試験(令和7年10月)【原動機電気・力学免除】'
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和8年4月)【原動機電気・力学免除】',
  75,
  20,
  '令和8年4月公表 クレーン・デリック運転士（限定なし）試験',
  array[
    'クレーン及びデリックに関する知識',
    '関係法令'
  ]
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and name = 'クレーン・デリック運転士模擬試験(令和8年4月)【原動機電気・力学免除】'
  );
