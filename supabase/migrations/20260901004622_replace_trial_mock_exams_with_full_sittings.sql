-- お試し版模試を廃止し、公表過去問1回分を本番相当の模試として登録する。
-- 出題セットは中間テーブルではなく questions.source_note で特定する
-- (労働生理は exam_types.code = common に入っているため、exam_type_id だけでは揃わない)。

alter table mock_exams
  add column source_filter text;

do $$
declare
  t1_2026_04 int;
  t1_2025_10 int;
  t2_2026_04 int;
  t2_2025_10 int;
  b2_2025_10 int;
begin
  select count(*) into t1_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 第一種衛生管理者試験%';
  select count(*) into t1_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 第一種衛生管理者試験%';
  select count(*) into t2_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 第二種衛生管理者試験%';
  select count(*) into t2_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 第二種衛生管理者試験%';
  select count(*) into b2_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 二級ボイラー技士試験%';

  if t1_2026_04 <> 44 or t1_2025_10 <> 44 then
    raise exception 'hygiene type1 sittings must be 44 questions (got % and %)', t1_2026_04, t1_2025_10;
  end if;
  if t2_2026_04 <> 30 or t2_2025_10 <> 30 then
    raise exception 'hygiene type2 sittings must be 30 questions (got % and %)', t2_2026_04, t2_2025_10;
  end if;
  if b2_2025_10 <> 40 then
    raise exception 'boiler2 2025-10 sitting must be 40 questions (got %)', b2_2025_10;
  end if;
end $$;

-- お試し版の受験履歴は2件とも0点。本番相当の模試と点数を比較できないので削除する。
delete from mock_exam_results
where mock_exam_id in (
  select id from mock_exams where name like '%お試し版%'
);

delete from mock_exams
where name like '%お試し版%';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'hygiene',
  exam_types.id,
  '第一種模擬試験(令和8年4月)',
  180,
  44,
  '令和8年4月公表 第一種衛生管理者試験'
from exam_types
where exam_types.exam_id = 'hygiene'
  and exam_types.code = 'type1';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'hygiene',
  exam_types.id,
  '第一種模擬試験(令和7年10月)',
  180,
  44,
  '令和7年10月公表 第一種衛生管理者試験'
from exam_types
where exam_types.exam_id = 'hygiene'
  and exam_types.code = 'type1';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'hygiene',
  exam_types.id,
  '第二種模擬試験(令和8年4月)',
  180,
  30,
  '令和8年4月公表 第二種衛生管理者試験'
from exam_types
where exam_types.exam_id = 'hygiene'
  and exam_types.code = 'type2';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'hygiene',
  exam_types.id,
  '第二種模擬試験(令和7年10月)',
  180,
  30,
  '令和7年10月公表 第二種衛生管理者試験'
from exam_types
where exam_types.exam_id = 'hygiene'
  and exam_types.code = 'type2';

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'boiler2',
  exam_types.id,
  '二級ボイラー技士模擬試験(令和7年10月)',
  180,
  40,
  '令和7年10月公表 二級ボイラー技士試験'
from exam_types
where exam_types.exam_id = 'boiler2'
  and exam_types.code = 'common';

alter table mock_exams
  alter column source_filter set not null;
