-- hygiene オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。
-- Ⅰ問1-7・Ⅱ問11-17・Ⅴは common。Ⅰ問8-10・Ⅱ問18-20は type2。Ⅲ・Ⅳは type1。

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'hygiene', '関係法令(有害業務に係るもの以外のもの)', 4
FROM exam_types et
WHERE et.exam_id = 'hygiene'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るもの以外のもの)'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'hygiene', '労働衛生(有害業務に係るもの以外のもの)', 5
FROM exam_types et
WHERE et.exam_id = 'hygiene'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務に係るもの以外のもの)'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '27b9983d-39ad-4bd0-a3a2-b781259dd26f',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$常時使用する労働者数と衛生管理者の選任について、法令上正しいものはどれか。$q$,
  $e$衛生管理者は、業種を問わず、常時50人以上の労働者を使用する事業場で選任する。根拠は労働安全衛生法第12条、労働安全衛生規則第7条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '27b9983d-39ad-4bd0-a3a2-b781259dd26f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('27b9983d-39ad-4bd0-a3a2-b781259dd26f'::uuid, $c$すべての事業場で、労働者数にかかわらず選任しなければならない$c$, false, 1),
  ('27b9983d-39ad-4bd0-a3a2-b781259dd26f'::uuid, $c$常時30人以上を使用するすべての事業場で選任しなければならない$c$, false, 2),
  ('27b9983d-39ad-4bd0-a3a2-b781259dd26f'::uuid, $c$常時50人以上を使用する事業場で選任しなければならない$c$, true, 3),
  ('27b9983d-39ad-4bd0-a3a2-b781259dd26f'::uuid, $c$常時100人以上を使用する製造業の事業場だけで選任しなければならない$c$, false, 4),
  ('27b9983d-39ad-4bd0-a3a2-b781259dd26f'::uuid, $c$常時300人以上を使用する事業場で選任しなければならない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '4a1db705-b1a3-43cc-8ffa-03d518b792a6',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$産業医および総括安全衛生管理者の選任基準について、正しいものはどれか。$q$,
  $e$産業医は常時50人以上を使用する事業場で選任する。総括安全衛生管理者の選任基準は業種ごとに100人、300人または1,000人以上と異なる。根拠は労働安全衛生法第10条、第13条、労働安全衛生規則第2条、第13条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '4a1db705-b1a3-43cc-8ffa-03d518b792a6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('4a1db705-b1a3-43cc-8ffa-03d518b792a6'::uuid, $c$産業医は常時30人以上を使用する事業場で選任する$c$, false, 1),
  ('4a1db705-b1a3-43cc-8ffa-03d518b792a6'::uuid, $c$産業医は業種にかかわらず、常時50人以上を使用する事業場で選任する$c$, true, 2),
  ('4a1db705-b1a3-43cc-8ffa-03d518b792a6'::uuid, $c$総括安全衛生管理者の選任基準は、すべての業種で常時50人以上である$c$, false, 3),
  ('4a1db705-b1a3-43cc-8ffa-03d518b792a6'::uuid, $c$総括安全衛生管理者は、労働者を1人でも使用すれば選任する$c$, false, 4),
  ('4a1db705-b1a3-43cc-8ffa-03d518b792a6'::uuid, $c$産業医と総括安全衛生管理者の選任基準は完全に同一である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '81b672ff-d0b1-48f0-bf2d-a3ace47ba489',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$一般健康診断の記録について、正しいものはどれか。$q$,
  $e$雇入時健康診断や定期健康診断などの一般健康診断について健康診断個人票を作成し、5年間保存する。根拠は労働安全衛生法第66条、労働安全衛生規則第43条、第44条、第51条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '81b672ff-d0b1-48f0-bf2d-a3ace47ba489'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('81b672ff-d0b1-48f0-bf2d-a3ace47ba489'::uuid, $c$雇入時健康診断の記録は1年間保存する$c$, false, 1),
  ('81b672ff-d0b1-48f0-bf2d-a3ace47ba489'::uuid, $c$定期健康診断の記録は3年間保存する$c$, false, 2),
  ('81b672ff-d0b1-48f0-bf2d-a3ace47ba489'::uuid, $c$雇入時健康診断は、雇入れ後1年以内に実施すればよい$c$, false, 3),
  ('81b672ff-d0b1-48f0-bf2d-a3ace47ba489'::uuid, $c$一般健康診断の結果に基づく健康診断個人票は5年間保存する$c$, true, 4),
  ('81b672ff-d0b1-48f0-bf2d-a3ace47ba489'::uuid, $c$健康診断個人票は、異常所見がなければ作成しなくてよい$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '429327c7-939a-4b3f-8a5e-8d72406d5d12',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働時間、休憩および休日の原則について、正しいものはどれか。$q$,
  $e$原則として1日8時間・週40時間が法定労働時間であり、6時間を超える場合は45分以上、8時間を超える場合は1時間以上の休憩が必要。休日は毎週1日または4週間を通じ4日以上。根拠は労働基準法第32条、第34条、第35条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '429327c7-939a-4b3f-8a5e-8d72406d5d12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('429327c7-939a-4b3f-8a5e-8d72406d5d12'::uuid, $c$法定労働時間は原則として1日7時間、週35時間である$c$, false, 1),
  ('429327c7-939a-4b3f-8a5e-8d72406d5d12'::uuid, $c$労働時間が6時間ちょうどの場合、45分の休憩が必要である$c$, false, 2),
  ('429327c7-939a-4b3f-8a5e-8d72406d5d12'::uuid, $c$労働時間が8時間を超える場合、少なくとも1時間の休憩が必要である$c$, true, 3),
  ('429327c7-939a-4b3f-8a5e-8d72406d5d12'::uuid, $c$休日は必ず毎週2日与えなければならない$c$, false, 4),
  ('429327c7-939a-4b3f-8a5e-8d72406d5d12'::uuid, $c$休憩時間は必ず勤務時間の終了後に与えなければならない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'abe36b46-fe95-4b50-9c7e-ae741d84eb1a',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$入社日から6か月間継続勤務し、全労働日の8割以上出勤した通常の労働者に、最初に付与される年次有給休暇の日数はどれか。$q$,
  $e$6か月継続勤務し、全労働日の8割以上出勤した通常の労働者には、原則として10日の年次有給休暇が付与される。根拠は労働基準法第39条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'abe36b46-fe95-4b50-9c7e-ae741d84eb1a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('abe36b46-fe95-4b50-9c7e-ae741d84eb1a'::uuid, $c$5日$c$, false, 1),
  ('abe36b46-fe95-4b50-9c7e-ae741d84eb1a'::uuid, $c$7日$c$, false, 2),
  ('abe36b46-fe95-4b50-9c7e-ae741d84eb1a'::uuid, $c$8日$c$, false, 3),
  ('abe36b46-fe95-4b50-9c7e-ae741d84eb1a'::uuid, $c$10日$c$, true, 4),
  ('abe36b46-fe95-4b50-9c7e-ae741d84eb1a'::uuid, $c$12日$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'fc062723-ffd5-4e85-aeaa-8d996439722c',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$衛生委員会について、正しいものはどれか。$q$,
  $e$衛生委員会は健康障害防止、健康保持増進、労働災害の原因・再発防止のうち衛生に関する事項などを調査審議し、原則として毎月1回以上開催する。根拠は労働安全衛生法第18条、労働安全衛生規則第22条、第23条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'fc062723-ffd5-4e85-aeaa-8d996439722c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('fc062723-ffd5-4e85-aeaa-8d996439722c'::uuid, $c$原則として3か月に1回開催すればよい$c$, false, 1),
  ('fc062723-ffd5-4e85-aeaa-8d996439722c'::uuid, $c$賃金の決定を主要な審議事項とする$c$, false, 2),
  ('fc062723-ffd5-4e85-aeaa-8d996439722c'::uuid, $c$労働者の健康障害防止や健康保持増進に関する事項を調査審議する$c$, true, 3),
  ('fc062723-ffd5-4e85-aeaa-8d996439722c'::uuid, $c$委員の全員を事業者側だけから指名できる$c$, false, 4),
  ('fc062723-ffd5-4e85-aeaa-8d996439722c'::uuid, $c$常時10人以上の労働者を使用するすべての事業場に設置する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '45a23631-334e-4d26-9bca-eac310844c4d',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$雇入れ時等の安全衛生教育について、正しいものはどれか。$q$,
  $e$労働者の雇入れ時および作業内容変更時には、従事する業務に関する安全衛生教育が必要。一定業種の非工業的業務では教育事項の一部省略が認められるが、全面的に不要となるわけではない。根拠は労働安全衛生法第59条、労働安全衛生規則第35条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '45a23631-334e-4d26-9bca-eac310844c4d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('45a23631-334e-4d26-9bca-eac310844c4d'::uuid, $c$正社員にだけ実施すればよい$c$, false, 1),
  ('45a23631-334e-4d26-9bca-eac310844c4d'::uuid, $c$労働者を雇い入れたときは、従事する業務に関する安全・衛生教育を行う$c$, true, 2),
  ('45a23631-334e-4d26-9bca-eac310844c4d'::uuid, $c$事務職には一切実施する必要がない$c$, false, 3),
  ('45a23631-334e-4d26-9bca-eac310844c4d'::uuid, $c$教育は労働者本人の希望がある場合だけ実施する$c$, false, 4),
  ('45a23631-334e-4d26-9bca-eac310844c4d'::uuid, $c$作業内容を変更した場合でも教育は不要である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '794fc64b-8485-46ca-8dd9-af94a04daf11',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$事務所の照度および空気環境について、正しいものはどれか。$q$,
  $e$一般的な事務作業を行う作業面は300ルクス以上、付随的な事務作業は150ルクス以上とする。根拠は事務所衛生基準規則第10条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '794fc64b-8485-46ca-8dd9-af94a04daf11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('794fc64b-8485-46ca-8dd9-af94a04daf11'::uuid, $c$一般的な事務作業を行う作業面の照度は70ルクス以上でよい$c$, false, 1),
  ('794fc64b-8485-46ca-8dd9-af94a04daf11'::uuid, $c$一般的な事務作業を行う作業面の照度は300ルクス以上とする$c$, true, 2),
  ('794fc64b-8485-46ca-8dd9-af94a04daf11'::uuid, $c$付随的な事務作業でも必ず1,000ルクス以上とする$c$, false, 3),
  ('794fc64b-8485-46ca-8dd9-af94a04daf11'::uuid, $c$照度の基準は通路にだけ適用される$c$, false, 4),
  ('794fc64b-8485-46ca-8dd9-af94a04daf11'::uuid, $c$換気設備があれば、室内空気の測定や管理は一切不要である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7f98ce0c-5391-4989-a892-a4079e6ee8fe',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$妊産婦に関する労働基準法上の措置として、正しいものはどれか。$q$,
  $e$妊娠中の女性が請求した場合、使用者は他の軽易な業務に転換させなければならない。妊産婦が請求した場合の時間外・休日・深夜業の制限もある。根拠は労働基準法第65条、第66条。$e$,
  'original',
  '衛生管理者 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7f98ce0c-5391-4989-a892-a4079e6ee8fe'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7f98ce0c-5391-4989-a892-a4079e6ee8fe'::uuid, $c$妊産婦から請求があっても時間外労働を命じることができる$c$, false, 1),
  ('7f98ce0c-5391-4989-a892-a4079e6ee8fe'::uuid, $c$妊娠中の女性は、本人の希望にかかわらずすべての業務に就かせられる$c$, false, 2),
  ('7f98ce0c-5391-4989-a892-a4079e6ee8fe'::uuid, $c$妊娠中の女性が請求した場合、他の軽易な業務に転換させなければならない$c$, true, 3),
  ('7f98ce0c-5391-4989-a892-a4079e6ee8fe'::uuid, $c$産後の女性には就業制限が存在しない$c$, false, 4),
  ('7f98ce0c-5391-4989-a892-a4079e6ee8fe'::uuid, $c$妊産婦に関する規定は正社員にだけ適用される$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ead09483-a29a-4b2c-862c-71d6bcdf2328',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$ストレスチェック制度について、正しいものはどれか。$q$,
  $e$常時50人以上を使用する事業場では、心理的な負担の程度を把握するための検査を1年以内ごとに1回実施する。結果の事業者への提供には本人の同意が必要。根拠は労働安全衛生法第66条の10、労働安全衛生規則第52条の9以下。
## Ⅱ　労働衛生一般$e$,
  'original',
  '衛生管理者 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ead09483-a29a-4b2c-862c-71d6bcdf2328'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ead09483-a29a-4b2c-862c-71d6bcdf2328'::uuid, $c$常時50人以上を使用する事業場では、原則として1年以内ごとに1回実施する$c$, true, 1),
  ('ead09483-a29a-4b2c-862c-71d6bcdf2328'::uuid, $c$検査結果は、本人の同意なしに人事担当者へ通知しなければならない$c$, false, 2),
  ('ead09483-a29a-4b2c-862c-71d6bcdf2328'::uuid, $c$高ストレスと判定された全員に、本人の申出がなくても医師の面接指導を強制する$c$, false, 3),
  ('ead09483-a29a-4b2c-862c-71d6bcdf2328'::uuid, $c$検査を受けなかった労働者は懲戒処分にしなければならない$c$, false, 4),
  ('ead09483-a29a-4b2c-862c-71d6bcdf2328'::uuid, $c$面接指導を申し出たことを理由とする不利益な取扱いが認められる$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '36be9a88-b1dd-4aed-9631-c426fae73839',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$室内の二酸化炭素濃度を基礎として必要換気量を求める考え方として、正しいものはどれか。$q$,
  $e$必要換気量は、室内での二酸化炭素発生量を、室内許容濃度と外気濃度との差で除して求める。濃度差が小さいほど、同じ発生量を希釈するため多くの換気が必要となる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '36be9a88-b1dd-4aed-9631-c426fae73839'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('36be9a88-b1dd-4aed-9631-c426fae73839'::uuid, $c$二酸化炭素発生量が増えるほど、必要換気量は少なくなる$c$, false, 1),
  ('36be9a88-b1dd-4aed-9631-c426fae73839'::uuid, $c$外気と室内の許容二酸化炭素濃度の差が小さいほど、必要換気量は大きくなる$c$, true, 2),
  ('36be9a88-b1dd-4aed-9631-c426fae73839'::uuid, $c$在室者数は必要換気量に影響しない$c$, false, 3),
  ('36be9a88-b1dd-4aed-9631-c426fae73839'::uuid, $c$室内の床面積だけで必要換気量が一意に決まる$c$, false, 4),
  ('36be9a88-b1dd-4aed-9631-c426fae73839'::uuid, $c$外気の二酸化炭素濃度は常にゼロとして計算する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '84eb8322-595c-48af-8746-959370ef3464',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$職場のメンタルヘルスケアにおける「4つのケア」に含まれないものはどれか。$q$,
  $e$4つのケアは、セルフケア、ラインによるケア、事業場内産業保健スタッフ等によるケア、事業場外資源によるケアである。$e$,
  'original',
  '衛生管理者 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '84eb8322-595c-48af-8746-959370ef3464'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('84eb8322-595c-48af-8746-959370ef3464'::uuid, $c$セルフケア$c$, false, 1),
  ('84eb8322-595c-48af-8746-959370ef3464'::uuid, $c$ラインによるケア$c$, false, 2),
  ('84eb8322-595c-48af-8746-959370ef3464'::uuid, $c$事業場内産業保健スタッフ等によるケア$c$, false, 3),
  ('84eb8322-595c-48af-8746-959370ef3464'::uuid, $c$事業場外資源によるケア$c$, false, 4),
  ('84eb8322-595c-48af-8746-959370ef3464'::uuid, $c$行政機関による懲戒的ケア$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2ebfc372-4725-4037-b973-bedd476542dd',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$労働衛生の「3管理」と具体例の組合せとして、正しいものはどれか。$q$,
  $e$有害物質の代替や発散源の密閉、局所排気装置の設置は作業環境管理に当たる。作業方法・時間や保護具は作業管理、健康診断や事後措置は健康管理に当たる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2ebfc372-4725-4037-b973-bedd476542dd'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2ebfc372-4725-4037-b973-bedd476542dd'::uuid, $c$作業環境管理―有害物質の代替や局所排気装置の設置$c$, true, 1),
  ('2ebfc372-4725-4037-b973-bedd476542dd'::uuid, $c$作業管理―定期健康診断による疾病の早期発見$c$, false, 2),
  ('2ebfc372-4725-4037-b973-bedd476542dd'::uuid, $c$健康管理―作業時間の短縮$c$, false, 3),
  ('2ebfc372-4725-4037-b973-bedd476542dd'::uuid, $c$作業環境管理―保護具の着用方法の決定$c$, false, 4),
  ('2ebfc372-4725-4037-b973-bedd476542dd'::uuid, $c$健康管理―騒音源の密閉$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd9e0fffc-0dac-4b36-bb97-c58a6750112a',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$THPにおける健康測定について、正しいものはどれか。$q$,
  $e$THPの健康測定は、健康保持増進のため、生活状況調査、医学的検査、運動機能検査などにより心身の状態を把握し、運動指導等へつなげるものである。$e$,
  'original',
  '衛生管理者 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd9e0fffc-0dac-4b36-bb97-c58a6750112a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d9e0fffc-0dac-4b36-bb97-c58a6750112a'::uuid, $c$疾病の確定診断だけを目的とする$c$, false, 1),
  ('d9e0fffc-0dac-4b36-bb97-c58a6750112a'::uuid, $c$健康診断と全く同じものであり、運動指導には利用しない$c$, false, 2),
  ('d9e0fffc-0dac-4b36-bb97-c58a6750112a'::uuid, $c$健康保持増進措置に必要な身体状況や生活状況を把握するために行う$c$, true, 3),
  ('d9e0fffc-0dac-4b36-bb97-c58a6750112a'::uuid, $c$本人の生活習慣は評価対象に含まれない$c$, false, 4),
  ('d9e0fffc-0dac-4b36-bb97-c58a6750112a'::uuid, $c$医療機関で治療中の疾病だけを対象とする$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '43a1e9b3-f2dc-4570-a3e0-2a4d726db968',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$快適な職場環境の形成に関する考え方として、適切でないものはどれか。$q$,
  $e$快適な職場環境の形成では、法定最低基準を守るだけでなく、作業環境、作業方法、疲労回復施設、生活施設等の継続的な改善が求められる。根拠は労働安全衛生法第71条の2、第71条の3。$e$,
  'original',
  '衛生管理者 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '43a1e9b3-f2dc-4570-a3e0-2a4d726db968'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('43a1e9b3-f2dc-4570-a3e0-2a4d726db968'::uuid, $c$作業環境を適切に維持管理する$c$, false, 1),
  ('43a1e9b3-f2dc-4570-a3e0-2a4d726db968'::uuid, $c$労働者の意見を反映する機会を設ける$c$, false, 2),
  ('43a1e9b3-f2dc-4570-a3e0-2a4d726db968'::uuid, $c$疲労を回復できる休憩施設を整備する$c$, false, 3),
  ('43a1e9b3-f2dc-4570-a3e0-2a4d726db968'::uuid, $c$継続的、計画的に改善を進める$c$, false, 4),
  ('43a1e9b3-f2dc-4570-a3e0-2a4d726db968'::uuid, $c$法定最低基準を満たせば、快適性への配慮は不要とする$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5c38a951-df28-47b7-8772-b1a87c4813fe',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$情報機器作業における健康障害防止対策として、適切なものはどれか。$q$,
  $e$グレアや映り込みを防ぎ、視距離、机・椅子、姿勢を適切に調整する。連続作業では適切な休止や作業休止時間を設け、拘束的な長時間作業を避ける。$e$,
  'original',
  '衛生管理者 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5c38a951-df28-47b7-8772-b1a87c4813fe'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5c38a951-df28-47b7-8772-b1a87c4813fe'::uuid, $c$ディスプレイ上端を常に頭頂部より高くする$c$, false, 1),
  ('5c38a951-df28-47b7-8772-b1a87c4813fe'::uuid, $c$画面への照明や窓の映り込みを減らす$c$, true, 2),
  ('5c38a951-df28-47b7-8772-b1a87c4813fe'::uuid, $c$同じ姿勢を保つため、休止時間を設けない$c$, false, 3),
  ('5c38a951-df28-47b7-8772-b1a87c4813fe'::uuid, $c$キーボードは身体からできるだけ遠ざける$c$, false, 4),
  ('5c38a951-df28-47b7-8772-b1a87c4813fe'::uuid, $c$椅子の高さは調節できないものを選ぶ$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$ある集団で、1年間に新たに発生した疾病者数を、その疾病にかかる可能性のある集団の人数で除して表す指標はどれか。$q$,
  $e$罹患率は一定期間に新たに発生した患者の割合を表す。有病率は、ある時点または期間に疾病を有する者の割合である。$e$,
  'original',
  '衛生管理者 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'::uuid, $c$有病率$c$, false, 1),
  ('84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'::uuid, $c$罹患率$c$, true, 2),
  ('84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'::uuid, $c$度数率$c$, false, 3),
  ('84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'::uuid, $c$強度率$c$, false, 4),
  ('84dbaa48-dc3c-4e35-b23d-6347c9c9f4a5'::uuid, $c$年千人率$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '98c4f77b-f4c4-4679-a3ef-b8cbef79347c',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$職場の受動喫煙防止対策として、適切なものはどれか。$q$,
  $e$事業者は、労働者の受動喫煙を防止するため、事業場の実情に応じた適切な措置を講ずるよう努める。根拠は労働安全衛生法第68条の2。$e$,
  'original',
  '衛生管理者 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '98c4f77b-f4c4-4679-a3ef-b8cbef79347c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('98c4f77b-f4c4-4679-a3ef-b8cbef79347c'::uuid, $c$換気扇があれば、どの場所でも喫煙を認める$c$, false, 1),
  ('98c4f77b-f4c4-4679-a3ef-b8cbef79347c'::uuid, $c$労働者の受動喫煙を防止するため、実情に応じた必要な措置を講ずる$c$, true, 2),
  ('98c4f77b-f4c4-4679-a3ef-b8cbef79347c'::uuid, $c$たばこの煙は作業環境に影響しないため、対策は不要である$c$, false, 3),
  ('98c4f77b-f4c4-4679-a3ef-b8cbef79347c'::uuid, $c$未成年者がいなければ受動喫煙対策は不要である$c$, false, 4),
  ('98c4f77b-f4c4-4679-a3ef-b8cbef79347c'::uuid, $c$喫煙場所の表示だけで、煙の流出対策は不要である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8a1dedb2-02b4-49dd-9afd-54f51443f408',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$職場における腰痛予防対策として、適切でないものはどれか。$q$,
  $e$ひねりを伴う不自然な姿勢や急激な動作は腰部への負担を増加させる。作業方法、作業姿勢、設備、作業時間などを総合的に改善する。$e$,
  'original',
  '衛生管理者 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8a1dedb2-02b4-49dd-9afd-54f51443f408'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8a1dedb2-02b4-49dd-9afd-54f51443f408'::uuid, $c$重量物を身体に近づけて持つ$c$, false, 1),
  ('8a1dedb2-02b4-49dd-9afd-54f51443f408'::uuid, $c$膝を適度に曲げ、脚の力を利用する$c$, false, 2),
  ('8a1dedb2-02b4-49dd-9afd-54f51443f408'::uuid, $c$必要に応じて補助機器や複数人での作業を採用する$c$, false, 3),
  ('8a1dedb2-02b4-49dd-9afd-54f51443f408'::uuid, $c$身体をひねった姿勢のまま急に重量物を持ち上げる$c$, true, 4),
  ('8a1dedb2-02b4-49dd-9afd-54f51443f408'::uuid, $c$作業台の高さや作業姿勢を見直す$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$食中毒と原因物質の組合せとして、正しいものはどれか。$q$,
  $e$フグ毒や毒キノコは自然毒による食中毒の原因となる。細菌性食中毒には感染型、食品内毒素型、生体内毒素型などがある。
## Ⅲ　有害業務に係る労働衛生$e$,
  'original',
  '衛生管理者 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'::uuid, $c$感染型食中毒―食品中であらかじめ作られた毒素だけにより発症する$c$, false, 1),
  ('cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'::uuid, $c$毒素型食中毒―摂取した生きた細菌が腸管内へ定着することだけで発症する$c$, false, 2),
  ('cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'::uuid, $c$自然毒食中毒―フグ毒や毒キノコなどにより起こる$c$, true, 3),
  ('cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'::uuid, $c$化学性食中毒―ノロウイルスだけを原因とする$c$, false, 4),
  ('cdcb5ec3-1b22-4f91-b261-21b4ecccdf0e'::uuid, $c$ウイルス性食中毒―食品中の重金属だけを原因とする$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1359d6ba-e1a3-4691-a4a6-b467cd1f46fa',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$局所排気装置について、正しいものはどれか。$q$,
  $e$局所排気装置は、フードで有害物質を発散源付近から捕捉し、ダクト、空気清浄装置、ファン、排気口を通して処理・排出する。$e$,
  'original',
  '衛生管理者 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'::uuid, $c$有害物質を作業場全体へ拡散させて濃度を均一にする装置である$c$, false, 1),
  ('1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'::uuid, $c$フードは発散源からできるだけ離して設置する$c$, false, 2),
  ('1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'::uuid, $c$有害物質を発散源付近で捕捉し、ダクトを通して排出する$c$, true, 3),
  ('1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'::uuid, $c$空気清浄装置は必ずフードより上流に置く$c$, false, 4),
  ('1359d6ba-e1a3-4691-a4a6-b467cd1f46fa'::uuid, $c$排気口は取り入れた空気が直ちに室内へ戻る位置に設ける$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$有機溶剤の一般的な性質および健康影響について、正しいものはどれか。$q$,
  $e$多くの有機溶剤は揮発性があり、吸入や皮膚接触によって体内に取り込まれる。急性影響として中枢神経抑制、慢性影響として肝臓、腎臓、造血器等への障害が生じる場合がある。$e$,
  'original',
  '衛生管理者 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'::uuid, $c$蒸気は呼吸器から吸収されない$c$, false, 1),
  ('f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'::uuid, $c$多くの有機溶剤は揮発性を有し、中枢神経系に影響することがある$c$, true, 2),
  ('f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'::uuid, $c$皮膚から吸収されることはない$c$, false, 3),
  ('f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'::uuid, $c$すべての有機溶剤が同じ臓器だけを障害する$c$, false, 4),
  ('f6ee302f-7a61-4e8d-8dfd-5706f88ad5d4'::uuid, $c$低濃度であれば、長期ばく露による影響は絶対に生じない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '21836355-512b-4934-b13d-bbfa74c8442e',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$呼吸用保護具の選択について、正しいものはどれか。$q$,
  $e$酸素欠乏環境では、ろ過式の防じん・防毒マスクは使用できない。送気マスクや自給式呼吸器など、清浄な呼吸用空気を供給する保護具が必要となる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '21836355-512b-4934-b13d-bbfa74c8442e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('21836355-512b-4934-b13d-bbfa74c8442e'::uuid, $c$防じんマスクは有機溶剤蒸気の除去に使用する$c$, false, 1),
  ('21836355-512b-4934-b13d-bbfa74c8442e'::uuid, $c$防毒マスクは酸素濃度が不明な場所で常に使用できる$c$, false, 2),
  ('21836355-512b-4934-b13d-bbfa74c8442e'::uuid, $c$酸素欠乏のおそれがある場所では、送気マスク等の給気式呼吸用保護具を検討する$c$, true, 3),
  ('21836355-512b-4934-b13d-bbfa74c8442e'::uuid, $c$吸収缶は破過しても継続使用できる$c$, false, 4),
  ('21836355-512b-4934-b13d-bbfa74c8442e'::uuid, $c$顔面との密着性は防護性能に影響しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8a9cfb18-2f47-4167-a665-bec411048a0e',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$騒音による健康障害と対策について、正しいものはどれか。$q$,
  $e$騒音対策は、低騒音機器、遮音・吸音、ばく露時間短縮、耳栓等を組み合わせる。騒音性難聴は内耳の障害による感音性難聴で、一般に回復しにくい。$e$,
  'original',
  '衛生管理者 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8a9cfb18-2f47-4167-a665-bec411048a0e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8a9cfb18-2f47-4167-a665-bec411048a0e'::uuid, $c$騒音性難聴は初期から会話音域だけが著しく低下する$c$, false, 1),
  ('8a9cfb18-2f47-4167-a665-bec411048a0e'::uuid, $c$騒音性難聴は一般に伝音性難聴である$c$, false, 2),
  ('8a9cfb18-2f47-4167-a665-bec411048a0e'::uuid, $c$騒音源対策、伝ぱ経路対策、作業管理、聴覚保護具を組み合わせる$c$, true, 3),
  ('8a9cfb18-2f47-4167-a665-bec411048a0e'::uuid, $c$耳栓を使用すれば、騒音源対策は一切不要である$c$, false, 4),
  ('8a9cfb18-2f47-4167-a665-bec411048a0e'::uuid, $c$騒音性難聴は騒音ばく露を中止すると必ず完全回復する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '070dff6c-ab8c-4e3f-96f9-b8e70768b5e0',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$じん肺について、正しいものはどれか。$q$,
  $e$じん肺は、粉じんを吸入することによって肺に線維増殖性変化を生じる疾病である。発散源対策、局所排気、湿式化、清掃、保護具等による総合対策が必要。$e$,
  'original',
  '衛生管理者 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'::uuid, $c$粉じんの吸入とは無関係な急性感染症である$c$, false, 1),
  ('070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'::uuid, $c$肺に粉じんが沈着し、肺組織に線維増殖性変化を生じる疾病である$c$, true, 2),
  ('070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'::uuid, $c$発症しても肺機能には影響しない$c$, false, 3),
  ('070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'::uuid, $c$防じんマスクだけが唯一の予防方法である$c$, false, 4),
  ('070dff6c-ab8c-4e3f-96f9-b8e70768b5e0'::uuid, $c$粉じん作業を離れれば病変は必ず短期間で消失する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6eba69de-02b4-487a-a27b-ddd49cb16d01',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$特殊健康診断について、正しいものはどれか。$q$,
  $e$特殊健康診断は、有機溶剤、特定化学物質、鉛、電離放射線等の有害業務について、各法令で定める対象者、時期、項目に従って実施する。$e$,
  'original',
  '衛生管理者 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6eba69de-02b4-487a-a27b-ddd49cb16d01'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6eba69de-02b4-487a-a27b-ddd49cb16d01'::uuid, $c$すべての労働者に同一項目で実施する一般健康診断である$c$, false, 1),
  ('6eba69de-02b4-487a-a27b-ddd49cb16d01'::uuid, $c$法令で定められた有害業務に従事する労働者等を対象として実施する$c$, true, 2),
  ('6eba69de-02b4-487a-a27b-ddd49cb16d01'::uuid, $c$異常所見があっても医師の意見を聴く必要はない$c$, false, 3),
  ('6eba69de-02b4-487a-a27b-ddd49cb16d01'::uuid, $c$作業との関連を検討してはならない$c$, false, 4),
  ('6eba69de-02b4-487a-a27b-ddd49cb16d01'::uuid, $c$実施時期や検査項目は事業者が自由に省略できる$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e6379387-9769-43d8-aa31-44017ec9b5a9',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$作業環境測定におけるA測定とB測定について、正しいものはどれか。$q$,
  $e$A測定は単位作業場所の有害物質濃度の平均的分布を把握する。B測定は、労働者のばく露が最大になると考えられる場所と時間に行う。$e$,
  'original',
  '衛生管理者 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e6379387-9769-43d8-aa31-44017ec9b5a9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e6379387-9769-43d8-aa31-44017ec9b5a9'::uuid, $c$A測定は発散源に最も近い1点だけを測定する$c$, false, 1),
  ('e6379387-9769-43d8-aa31-44017ec9b5a9'::uuid, $c$B測定は単位作業場所の平均的な状態だけを把握する$c$, false, 2),
  ('e6379387-9769-43d8-aa31-44017ec9b5a9'::uuid, $c$A測定は単位作業場所の平均的な濃度分布を把握するための測定である$c$, true, 3),
  ('e6379387-9769-43d8-aa31-44017ec9b5a9'::uuid, $c$A測定とB測定は必ず同じ測定点で行う$c$, false, 4),
  ('e6379387-9769-43d8-aa31-44017ec9b5a9'::uuid, $c$B測定では高濃度ばく露が予想される場所を考慮しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3e0f9249-4d15-4393-9726-798de8c423f1',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$WBGTについて、正しいものはどれか。$q$,
  $e$WBGTは気温だけでなく、湿度、放射熱、気流などの影響を反映する暑熱指標である。作業強度、暑熱順化、衣服、健康状態等も併せて評価する。$e$,
  'original',
  '衛生管理者 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3e0f9249-4d15-4393-9726-798de8c423f1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3e0f9249-4d15-4393-9726-798de8c423f1'::uuid, $c$気温だけから求める指標である$c$, false, 1),
  ('3e0f9249-4d15-4393-9726-798de8c423f1'::uuid, $c$寒冷による凍傷だけを評価する指標である$c$, false, 2),
  ('3e0f9249-4d15-4393-9726-798de8c423f1'::uuid, $c$暑熱環境による熱ストレスを評価する指標である$c$, true, 3),
  ('3e0f9249-4d15-4393-9726-798de8c423f1'::uuid, $c$値が高いほど熱中症の危険性は低い$c$, false, 4),
  ('3e0f9249-4d15-4393-9726-798de8c423f1'::uuid, $c$衣服や作業強度を考慮する必要はない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$電離放射線による健康影響について、正しいものはどれか。$q$,
  $e$確定的影響には組織反応としてのしきい線量があり、白内障や皮膚障害などが含まれる。がんや遺伝性影響は確率的影響として扱われる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'::uuid, $c$確定的影響には、線量にかかわらず一定の発生確率があるだけである$c$, false, 1),
  ('c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'::uuid, $c$確率的影響には、一般に発生の重篤度が線量とともに増すという特徴だけがある$c$, false, 2),
  ('c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'::uuid, $c$白内障や皮膚障害は確定的影響の例である$c$, true, 3),
  ('c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'::uuid, $c$がんは電離放射線と無関係である$c$, false, 4),
  ('c3fa8f3f-5e2a-40f1-b365-f9642c3c9e9e'::uuid, $c$外部被ばくだけを管理すれば内部被ばくは考慮しなくてよい$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b02b0b2d-aa4f-4a6e-96ed-f88b817564be',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$酸素欠乏症について、正しいものはどれか。$q$,
  $e$酸素欠乏症等防止規則では、酸素濃度18％未満の状態を酸素欠乏として扱う。測定、換気、作業主任者、適切な呼吸用保護具、救出用具等が必要となる。
## Ⅳ　有害業務関係法令$e$,
  'original',
  '衛生管理者 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b02b0b2d-aa4f-4a6e-96ed-f88b817564be'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b02b0b2d-aa4f-4a6e-96ed-f88b817564be'::uuid, $c$酸素濃度18％未満の空気を酸素欠乏空気という$c$, true, 1),
  ('b02b0b2d-aa4f-4a6e-96ed-f88b817564be'::uuid, $c$酸素濃度が低くても、臭いによって必ず気付くことができる$c$, false, 2),
  ('b02b0b2d-aa4f-4a6e-96ed-f88b817564be'::uuid, $c$酸素欠乏場所への立入りでは、防じんマスクを使用すれば十分である$c$, false, 3),
  ('b02b0b2d-aa4f-4a6e-96ed-f88b817564be'::uuid, $c$作業前の酸素濃度測定は不要である$c$, false, 4),
  ('b02b0b2d-aa4f-4a6e-96ed-f88b817564be'::uuid, $c$救助者は呼吸用保護具なしで直ちに進入する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bc64fee0-7eb6-4af2-a754-c09819f5c249',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$特定化学物質障害予防規則について、正しいものはどれか。$q$,
  $e$特定化学物質障害予防規則は、対象物質について設備、作業管理、作業主任者、測定、健康診断、記録等を定めている。対象物質の区分により適用内容は異なる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bc64fee0-7eb6-4af2-a754-c09819f5c249'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bc64fee0-7eb6-4af2-a754-c09819f5c249'::uuid, $c$特定化学物質による急性・慢性の健康障害を防止するための規則である$c$, true, 1),
  ('bc64fee0-7eb6-4af2-a754-c09819f5c249'::uuid, $c$騒音だけを規制対象とする$c$, false, 2),
  ('bc64fee0-7eb6-4af2-a754-c09819f5c249'::uuid, $c$対象物質を扱う場合でも発散抑制措置は不要である$c$, false, 3),
  ('bc64fee0-7eb6-4af2-a754-c09819f5c249'::uuid, $c$作業主任者制度は設けられていない$c$, false, 4),
  ('bc64fee0-7eb6-4af2-a754-c09819f5c249'::uuid, $c$作業記録や健康診断に関する規定は一切ない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1a4ec3a9-2767-48ac-8855-d85f7115928b',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$有機溶剤中毒予防規則について、正しいものはどれか。$q$,
  $e$有機溶剤中毒予防規則では、対象有機溶剤を第1種から第3種に区分し、業務や作業場所に応じて発散防止設備、作業主任者、健康診断等を定めている。$e$,
  'original',
  '衛生管理者 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1a4ec3a9-2767-48ac-8855-d85f7115928b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1a4ec3a9-2767-48ac-8855-d85f7115928b'::uuid, $c$有機溶剤を第1種、第2種および第3種に区分している$c$, true, 1),
  ('1a4ec3a9-2767-48ac-8855-d85f7115928b'::uuid, $c$すべての有機溶剤業務を屋外で行うことを義務付けている$c$, false, 2),
  ('1a4ec3a9-2767-48ac-8855-d85f7115928b'::uuid, $c$局所排気装置を設ければ、その点検や管理は不要である$c$, false, 3),
  ('1a4ec3a9-2767-48ac-8855-d85f7115928b'::uuid, $c$有機溶剤作業主任者は医師でなければならない$c$, false, 4),
  ('1a4ec3a9-2767-48ac-8855-d85f7115928b'::uuid, $c$有機溶剤の区分にかかわらず、規制内容は完全に同一である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '29388df4-406d-4888-a1fb-0a40f27956da',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$粉じん障害防止規則による対策として、適切なものはどれか。$q$,
  $e$粉じん障害防止規則は、特定粉じん発生源等について密閉、局所排気、プッシュプル型換気、湿潤化などの発散防止措置を定めている。$e$,
  'original',
  '衛生管理者 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '29388df4-406d-4888-a1fb-0a40f27956da'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('29388df4-406d-4888-a1fb-0a40f27956da'::uuid, $c$粉じんを乾いたほうきで激しく舞い上げて清掃する$c$, false, 1),
  ('29388df4-406d-4888-a1fb-0a40f27956da'::uuid, $c$粉じんの発散源を密閉し、局所排気や湿潤化を行う$c$, true, 2),
  ('29388df4-406d-4888-a1fb-0a40f27956da'::uuid, $c$呼吸用保護具があれば、設備対策は常に不要である$c$, false, 3),
  ('29388df4-406d-4888-a1fb-0a40f27956da'::uuid, $c$粉じん作業の種類を確認する必要はない$c$, false, 4),
  ('29388df4-406d-4888-a1fb-0a40f27956da'::uuid, $c$休憩設備への粉じん持込みは規制されない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1891ece3-2ee2-451f-b970-1d49c6d26b34',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$酸素欠乏危険作業について、正しいものはどれか。$q$,
  $e$酸素欠乏危険場所では、酸素濃度等の測定、換気、作業主任者の選任、関係者以外の立入禁止、保護具等が必要。純酸素による換気は火災等の危険があるため行わない。根拠は酸素欠乏症等防止規則。$e$,
  'original',
  '衛生管理者 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1891ece3-2ee2-451f-b970-1d49c6d26b34'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1891ece3-2ee2-451f-b970-1d49c6d26b34'::uuid, $c$作業開始前等に酸素濃度を測定する$c$, true, 1),
  ('1891ece3-2ee2-451f-b970-1d49c6d26b34'::uuid, $c$酸素欠乏危険作業主任者は選任できない$c$, false, 2),
  ('1891ece3-2ee2-451f-b970-1d49c6d26b34'::uuid, $c$換気に純酸素を使用することが推奨される$c$, false, 3),
  ('1891ece3-2ee2-451f-b970-1d49c6d26b34'::uuid, $c$立入禁止措置を講ずることはできない$c$, false, 4),
  ('1891ece3-2ee2-451f-b970-1d49c6d26b34'::uuid, $c$硫化水素の危険は対象外である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '48aeb4ee-69b1-4ad3-bba1-737cb008b5e5',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$電離放射線業務の管理について、正しいものはどれか。$q$,
  $e$電離放射線障害防止規則では、管理区域の明示、立入管理、線量測定、遮へい、汚染防止、健康診断等を定めている。$e$,
  'original',
  '衛生管理者 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'::uuid, $c$管理区域では、必要な標識等によって区域を明示する$c$, true, 1),
  ('48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'::uuid, $c$個人線量測定は、放射線業務と無関係な労働者だけに行う$c$, false, 2),
  ('48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'::uuid, $c$放射線源の遮へいは被ばく低減に効果がない$c$, false, 3),
  ('48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'::uuid, $c$被ばく時間を長くするほど線量を低減できる$c$, false, 4),
  ('48aeb4ee-69b1-4ad3-bba1-737cb008b5e5'::uuid, $c$放射性物質による汚染は管理対象外である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3adc7742-53d8-486d-87f8-39bc4ec39438',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$じん肺法上の健康管理について、正しいものはどれか。$q$,
  $e$じん肺法では、健康診断結果等に基づき管理1、管理2、管理3イ、管理3ロまたは管理4の管理区分が決定され、区分に応じた健康管理措置が行われる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3adc7742-53d8-486d-87f8-39bc4ec39438'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3adc7742-53d8-486d-87f8-39bc4ec39438'::uuid, $c$じん肺健康診断の結果は、じん肺管理区分の決定に用いられる$c$, true, 1),
  ('3adc7742-53d8-486d-87f8-39bc4ec39438'::uuid, $c$じん肺管理区分は事業者が診察せず自由に決定する$c$, false, 2),
  ('3adc7742-53d8-486d-87f8-39bc4ec39438'::uuid, $c$管理区分は管理1から管理3までしかない$c$, false, 3),
  ('3adc7742-53d8-486d-87f8-39bc4ec39438'::uuid, $c$エックス線写真は一切使用しない$c$, false, 4),
  ('3adc7742-53d8-486d-87f8-39bc4ec39438'::uuid, $c$じん肺有所見者に健康管理上の措置は不要である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8332fdf6-43f1-4b4f-9576-2413b0d0a2b4',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$法定の作業環境測定について、正しいものはどれか。$q$,
  $e$有害業務を行う一定の作業場では、法定の頻度・方法による作業環境測定と記録が必要。指定作業場の測定は作業環境測定士または作業環境測定機関に実施させる。根拠は労働安全衛生法第65条、作業環境測定法。$e$,
  'original',
  '衛生管理者 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'::uuid, $c$事業者は、法令で定める作業場について必要な作業環境測定を行い、結果を記録する$c$, true, 1),
  ('8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'::uuid, $c$測定結果はすべて直ちに廃棄する$c$, false, 2),
  ('8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'::uuid, $c$測定は労働者の希望がある場合に限り実施する$c$, false, 3),
  ('8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'::uuid, $c$指定作業場でも作業環境測定士は関与できない$c$, false, 4),
  ('8332fdf6-43f1-4b4f-9576-2413b0d0a2b4'::uuid, $c$測定結果に問題があっても改善措置は検討しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a01bbbdb-2e59-458c-ae76-08d49630c721',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$特殊健康診断の実施義務について、正しいものはどれか。$q$,
  $e$特殊健康診断は、有害因子ごとの規則に従って実施する。一部の有害業務では、過去に従事して現在は従事していない労働者も対象となる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a01bbbdb-2e59-458c-ae76-08d49630c721'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a01bbbdb-2e59-458c-ae76-08d49630c721'::uuid, $c$対象業務から配置転換すれば、法令上の健診対象になることは一切ない$c$, false, 1),
  ('a01bbbdb-2e59-458c-ae76-08d49630c721'::uuid, $c$対象者、検査項目および実施時期は、各有害業務関係法令に定められている$c$, true, 2),
  ('a01bbbdb-2e59-458c-ae76-08d49630c721'::uuid, $c$本人が健康であると申告すれば、事業者は常に実施を省略できる$c$, false, 3),
  ('a01bbbdb-2e59-458c-ae76-08d49630c721'::uuid, $c$結果の記録は作成してはならない$c$, false, 4),
  ('a01bbbdb-2e59-458c-ae76-08d49630c721'::uuid, $c$異常所見者について医師の意見を聴いてはならない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0d965af4-b84c-4d90-8645-0e19a7eb18a3',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働者に保護具を使用させる場合の事業者の対応として、適切なものはどれか。$q$,
  $e$保護具は有害因子、濃度、作業内容等に適合するものを選び、適切な装着、点検、保守管理、教育を行う。保護具は設備対策等を補完する重要な対策である。$e$,
  'original',
  '衛生管理者 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0d965af4-b84c-4d90-8645-0e19a7eb18a3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0d965af4-b84c-4d90-8645-0e19a7eb18a3'::uuid, $c$作業内容や有害因子に適合する保護具を選択する$c$, true, 1),
  ('0d965af4-b84c-4d90-8645-0e19a7eb18a3'::uuid, $c$保護具を渡した後は、装着状態を確認しない$c$, false, 2),
  ('0d965af4-b84c-4d90-8645-0e19a7eb18a3'::uuid, $c$破損した保護具でも交換せず使用させる$c$, false, 3),
  ('0d965af4-b84c-4d90-8645-0e19a7eb18a3'::uuid, $c$呼吸用保護具の面体と顔面の密着性は確認しない$c$, false, 4),
  ('0d965af4-b84c-4d90-8645-0e19a7eb18a3'::uuid, $c$設備による発散源対策が可能でも、常に保護具だけで対応する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c5f87a3b-1e32-4894-bbd2-be5b24b6efca',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$局所排気装置等の定期自主検査について、正しいものはどれか。$q$,
  $e$有機溶剤、特定化学物質、粉じん等の関係規則で対象となる局所排気装置等は、原則として1年以内ごとに1回、定期自主検査を行い、結果を記録する。
## Ⅴ　労働生理$e$,
  'original',
  '衛生管理者 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c5f87a3b-1e32-4894-bbd2-be5b24b6efca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c5f87a3b-1e32-4894-bbd2-be5b24b6efca'::uuid, $c$法令で定められた局所排気装置等は、原則として1年以内ごとに1回、定期自主検査を行う$c$, true, 1),
  ('c5f87a3b-1e32-4894-bbd2-be5b24b6efca'::uuid, $c$検査は10年以内ごとに1回でよい$c$, false, 2),
  ('c5f87a3b-1e32-4894-bbd2-be5b24b6efca'::uuid, $c$検査結果を記録する必要はない$c$, false, 3),
  ('c5f87a3b-1e32-4894-bbd2-be5b24b6efca'::uuid, $c$異常が認められても補修は不要である$c$, false, 4),
  ('c5f87a3b-1e32-4894-bbd2-be5b24b6efca'::uuid, $c$長期間使用していない装置は、再使用前の点検を一切行わなくてよい$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ad65bdbb-5392-4b12-a8ab-a86a1fab24ca',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$心臓と血液循環について、正しいものはどれか。$q$,
  $e$左心室から送り出された血液は大動脈を通って全身を循環する。右心室からは肺動脈を通って肺へ送られ、肺静脈から左心房へ戻る。$e$,
  'original',
  '衛生管理者 オリジナル問題 問41',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'::uuid, $c$左心室から肺動脈へ血液が送り出される$c$, false, 1),
  ('ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'::uuid, $c$右心室から大動脈へ血液が送り出される$c$, false, 2),
  ('ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'::uuid, $c$左心室から大動脈を通って全身へ血液が送り出される$c$, true, 3),
  ('ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'::uuid, $c$肺静脈は右心房へ血液を戻す$c$, false, 4),
  ('ad65bdbb-5392-4b12-a8ab-a86a1fab24ca'::uuid, $c$静脈には常に動脈血が流れている$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$神経系について、正しいものはどれか。$q$,
  $e$神経系は中枢神経系と末梢神経系に分けられ、中枢神経系は脳と脊髄からなる。自律神経系には交感神経と副交感神経がある。$e$,
  'original',
  '衛生管理者 オリジナル問題 問42',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'::uuid, $c$中枢神経系は脳と脊髄からなる$c$, true, 1),
  ('a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'::uuid, $c$末梢神経系は脳だけからなる$c$, false, 2),
  ('a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'::uuid, $c$自律神経系は随意運動だけを支配する$c$, false, 3),
  ('a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'::uuid, $c$交感神経と副交感神経は常に同じ作用を示す$c$, false, 4),
  ('a6c26069-5acb-4c53-bb2f-ff1f8a5d8b23'::uuid, $c$ニューロンは血液を運搬する細胞である$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6667afd6-422d-4f42-b564-1f8a10fb4c2b',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$腎臓における尿の生成について、正しいものはどれか。$q$,
  $e$糸球体で血液がろ過されて原尿が生じ、尿細管や集合管で水分、電解質、ブドウ糖などが再吸収・分泌され、最終的な尿となる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問43',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6667afd6-422d-4f42-b564-1f8a10fb4c2b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6667afd6-422d-4f42-b564-1f8a10fb4c2b'::uuid, $c$糸球体では血液中の成分の一部がろ過される$c$, true, 1),
  ('6667afd6-422d-4f42-b564-1f8a10fb4c2b'::uuid, $c$原尿中の水分はすべて尿として排出される$c$, false, 2),
  ('6667afd6-422d-4f42-b564-1f8a10fb4c2b'::uuid, $c$尿細管では物質の再吸収は行われない$c$, false, 3),
  ('6667afd6-422d-4f42-b564-1f8a10fb4c2b'::uuid, $c$健康な人の尿には通常、大量の血球が含まれる$c$, false, 4),
  ('6667afd6-422d-4f42-b564-1f8a10fb4c2b'::uuid, $c$腎臓は体液の電解質調節に関与しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$消化器系について、正しいものはどれか。$q$,
  $e$小腸では膵液、胆汁、腸液などの作用により消化が進み、多くの栄養素が吸収される。胆汁は肝臓で生成され、胆のうに蓄えられる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問44',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'::uuid, $c$胆汁は胆のうで生成される$c$, false, 1),
  ('21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'::uuid, $c$膵液には消化酵素が含まれない$c$, false, 2),
  ('21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'::uuid, $c$小腸は栄養素の消化・吸収の主要な場所である$c$, true, 3),
  ('21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'::uuid, $c$胃では一切の消化が行われない$c$, false, 4),
  ('21b48b64-d7a4-4ac6-9cc7-8d68ac77b51b'::uuid, $c$大腸は主に酸素を吸収する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '72c8b307-bbbf-4389-8438-cda37438ad55',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$血液の成分とはたらきについて、正しいものはどれか。$q$,
  $e$赤血球中のヘモグロビンは主に酸素を運搬する。白血球は生体防御、血小板は止血・血液凝固に関与する。$e$,
  'original',
  '衛生管理者 オリジナル問題 問45',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '72c8b307-bbbf-4389-8438-cda37438ad55'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('72c8b307-bbbf-4389-8438-cda37438ad55'::uuid, $c$赤血球は主として酸素を運搬する$c$, true, 1),
  ('72c8b307-bbbf-4389-8438-cda37438ad55'::uuid, $c$白血球は主として血液凝固を行う$c$, false, 2),
  ('72c8b307-bbbf-4389-8438-cda37438ad55'::uuid, $c$血小板は主として酸素を運搬する$c$, false, 3),
  ('72c8b307-bbbf-4389-8438-cda37438ad55'::uuid, $c$血しょうには水分がほとんど含まれない$c$, false, 4),
  ('72c8b307-bbbf-4389-8438-cda37438ad55'::uuid, $c$ヘモグロビンは白血球にだけ含まれる$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '83d52870-2dc4-430e-a909-208bce00f3b7',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$骨格筋の収縮について、正しいものはどれか。$q$,
  $e$骨格筋は運動神経の支配を受ける随意筋である。筋収縮にはATPが必要であり、関節運動では屈筋と伸筋が拮抗して働く。$e$,
  'original',
  '衛生管理者 オリジナル問題 問46',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '83d52870-2dc4-430e-a909-208bce00f3b7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('83d52870-2dc4-430e-a909-208bce00f3b7'::uuid, $c$骨格筋は一般に随意筋である$c$, true, 1),
  ('83d52870-2dc4-430e-a909-208bce00f3b7'::uuid, $c$骨格筋には神経からの刺激が伝わらない$c$, false, 2),
  ('83d52870-2dc4-430e-a909-208bce00f3b7'::uuid, $c$筋収縮にはエネルギーを必要としない$c$, false, 3),
  ('83d52870-2dc4-430e-a909-208bce00f3b7'::uuid, $c$上腕二頭筋と上腕三頭筋は常に同時に同じ程度収縮する$c$, false, 4),
  ('83d52870-2dc4-430e-a909-208bce00f3b7'::uuid, $c$筋肉への血流は運動時に減少するだけである$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f4b36b1f-dfff-41d5-870e-1e9f364dc832',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$暑熱環境における体温調節反応として、正しいものはどれか。$q$,
  $e$暑熱時には皮膚血管の拡張と発汗が起こり、放熱が促進される。湿度が高い場合は汗が蒸発しにくく、体温が上昇しやすい。$e$,
  'original',
  '衛生管理者 オリジナル問題 問47',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f4b36b1f-dfff-41d5-870e-1e9f364dc832'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f4b36b1f-dfff-41d5-870e-1e9f364dc832'::uuid, $c$皮膚血管が収縮し、皮膚血流が減少する$c$, false, 1),
  ('f4b36b1f-dfff-41d5-870e-1e9f364dc832'::uuid, $c$発汗が促進され、汗の蒸発による放熱が増える$c$, true, 2),
  ('f4b36b1f-dfff-41d5-870e-1e9f364dc832'::uuid, $c$代謝を高めるため、ふるえが必ず生じる$c$, false, 3),
  ('f4b36b1f-dfff-41d5-870e-1e9f364dc832'::uuid, $c$体温調節中枢は小脳だけに存在する$c$, false, 4),
  ('f4b36b1f-dfff-41d5-870e-1e9f364dc832'::uuid, $c$湿度が高いほど汗の蒸発が促進される$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ac366730-1d5e-497b-9d4e-d661016fc9b4',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$視覚および聴覚について、正しいものはどれか。$q$,
  $e$網膜の杆体・錐体が光を受容する。聴覚では、音による鼓膜の振動が耳小骨を介して内耳の蝸牛へ伝えられる。$e$,
  'original',
  '衛生管理者 オリジナル問題 問48',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ac366730-1d5e-497b-9d4e-d661016fc9b4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ac366730-1d5e-497b-9d4e-d661016fc9b4'::uuid, $c$網膜には光を受容する視細胞がある$c$, true, 1),
  ('ac366730-1d5e-497b-9d4e-d661016fc9b4'::uuid, $c$水晶体は音の振動を受容する$c$, false, 2),
  ('ac366730-1d5e-497b-9d4e-d661016fc9b4'::uuid, $c$蝸牛は平衡感覚だけを担当し、聴覚には関与しない$c$, false, 3),
  ('ac366730-1d5e-497b-9d4e-d661016fc9b4'::uuid, $c$鼓膜は眼球内にある$c$, false, 4),
  ('ac366730-1d5e-497b-9d4e-d661016fc9b4'::uuid, $c$暗所では瞳孔が縮小して入射光量を減らす$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '73a58534-2a88-40f8-8655-5b31624314d0',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$ホルモンと内分泌系について、正しいものはどれか。$q$,
  $e$インスリンは膵臓のランゲルハンス島β細胞から分泌され、血糖値を低下させる。ホルモンは内分泌腺から血液中へ分泌される。$e$,
  'original',
  '衛生管理者 オリジナル問題 問49',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '73a58534-2a88-40f8-8655-5b31624314d0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('73a58534-2a88-40f8-8655-5b31624314d0'::uuid, $c$インスリンは血糖値を低下させる方向に作用する$c$, true, 1),
  ('73a58534-2a88-40f8-8655-5b31624314d0'::uuid, $c$アドレナリンは膵臓からだけ分泌される$c$, false, 2),
  ('73a58534-2a88-40f8-8655-5b31624314d0'::uuid, $c$甲状腺ホルモンは代謝に関与しない$c$, false, 3),
  ('73a58534-2a88-40f8-8655-5b31624314d0'::uuid, $c$ホルモンは導管を通って体外へ分泌される$c$, false, 4),
  ('73a58534-2a88-40f8-8655-5b31624314d0'::uuid, $c$下垂体は他の内分泌腺の調節に関与しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '616ebe56-543e-43f8-b1b7-232bda27e4b6',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働生理'),
  $q$免疫のしくみについて、正しいものはどれか。$q$,
  $e$抗原刺激を受けたB細胞は形質細胞へ分化し、抗体を産生する。T細胞は細胞性免疫に関与し、獲得免疫には抗原特異性と免疫記憶がある。$e$,
  'original',
  '衛生管理者 オリジナル問題 問50',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '616ebe56-543e-43f8-b1b7-232bda27e4b6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('616ebe56-543e-43f8-b1b7-232bda27e4b6'::uuid, $c$抗体は主に形質細胞によって産生される$c$, true, 1),
  ('616ebe56-543e-43f8-b1b7-232bda27e4b6'::uuid, $c$好中球は抗原を記憶して抗体だけを産生する$c$, false, 2),
  ('616ebe56-543e-43f8-b1b7-232bda27e4b6'::uuid, $c$ワクチンは自然免疫だけを一時的に破壊する$c$, false, 3),
  ('616ebe56-543e-43f8-b1b7-232bda27e4b6'::uuid, $c$獲得免疫には特異性も免疫記憶もない$c$, false, 4),
  ('616ebe56-543e-43f8-b1b7-232bda27e4b6'::uuid, $c$細胞性免疫にはT細胞が関与しない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

DO $$
DECLARE
  original_count int;
  type1_count int;
  type2_count int;
BEGIN
  SELECT count(*) INTO original_count
  FROM questions
  WHERE exam_id = 'hygiene'
    AND source_type = 'original'
    AND source_note LIKE '衛生管理者 オリジナル問題%';

  IF original_count <> 50 THEN
    RAISE EXCEPTION 'hygiene original questions must be 50 (got %)', original_count;
  END IF;

  SELECT count(*) INTO type1_count
  FROM questions q
  JOIN exam_types et ON et.id = q.exam_type_id
  WHERE q.exam_id = 'hygiene'
    AND q.source_type = 'original'
    AND q.source_note LIKE '衛生管理者 オリジナル問題%'
    AND et.code IN ('type1', 'common');

  IF type1_count <> 44 THEN
    RAISE EXCEPTION 'hygiene type1 original set must be 44 (got %)', type1_count;
  END IF;

  SELECT count(*) INTO type2_count
  FROM questions q
  JOIN exam_types et ON et.id = q.exam_type_id
  WHERE q.exam_id = 'hygiene'
    AND q.source_type = 'original'
    AND q.source_note LIKE '衛生管理者 オリジナル問題%'
    AND et.code IN ('type2', 'common');

  IF type2_count <> 30 THEN
    RAISE EXCEPTION 'hygiene type2 original set must be 30 (got %)', type2_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter
)
SELECT
  'hygiene', exam_types.id, '第一種衛生管理者模擬試験A', 180, 44,
  '衛生管理者 オリジナル問題'
FROM exam_types
WHERE exam_types.exam_id = 'hygiene'
  AND exam_types.code = 'type1'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'hygiene'
      AND source_filter = '衛生管理者 オリジナル問題'
      AND exam_type_id = exam_types.id
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter
)
SELECT
  'hygiene', exam_types.id, '第二種衛生管理者模擬試験A', 180, 30,
  '衛生管理者 オリジナル問題'
FROM exam_types
WHERE exam_types.exam_id = 'hygiene'
  AND exam_types.code = 'type2'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'hygiene'
      AND source_filter = '衛生管理者 オリジナル問題'
      AND exam_type_id = exam_types.id
  );
