-- お試し版模試を廃止し、mock_exams.source_filter を追加する。

alter table mock_exams
  add column source_filter text;

-- お試し版の受験履歴は2件とも0点。本番相当の模試と点数を比較できないので削除する。
delete from mock_exam_results
where mock_exam_id in (
  select id from mock_exams where name like '%お試し版%'
);

delete from mock_exams
where name like '%お試し版%';

alter table mock_exams
  alter column source_filter set not null;
