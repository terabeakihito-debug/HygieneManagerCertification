-- hygiene 第一種専用の科目1・科目2追加14問。既存Ⅰ・Ⅱの10問ずつは type2 専用へ移す。
-- 過去問行は削除しない。模試名は実在の回次を示さない。

UPDATE questions q
SET exam_type_id = (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type2')
WHERE q.exam_id = 'hygiene'
  AND q.source_type = 'original'
  AND q.source_note IN ('衛生管理者 オリジナル問題 問1', '衛生管理者 オリジナル問題 問2', '衛生管理者 オリジナル問題 問3', '衛生管理者 オリジナル問題 問4', '衛生管理者 オリジナル問題 問5', '衛生管理者 オリジナル問題 問6', '衛生管理者 オリジナル問題 問7', '衛生管理者 オリジナル問題 問8', '衛生管理者 オリジナル問題 問9', '衛生管理者 オリジナル問題 問10', '衛生管理者 オリジナル問題 問11', '衛生管理者 オリジナル問題 問12', '衛生管理者 オリジナル問題 問13', '衛生管理者 オリジナル問題 問14', '衛生管理者 オリジナル問題 問15', '衛生管理者 オリジナル問題 問16', '衛生管理者 オリジナル問題 問17', '衛生管理者 オリジナル問題 問18', '衛生管理者 オリジナル問題 問19', '衛生管理者 オリジナル問題 問20');

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c854107e-b713-48e1-8d2a-a05b9493508f',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$専任の衛生管理者を選任しなければならないものとして、法令上正しいものはどれか。$q$,
  $e$常時1,000人を超える事業場、または常時500人を超え坑内労働等の有害業務に常時30人以上従事させる事業場では、衛生管理者のうち少なくとも1人を専任とする。根拠は労働安全衛生規則第7条第1項第5号。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c854107e-b713-48e1-8d2a-a05b9493508f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c854107e-b713-48e1-8d2a-a05b9493508f'::uuid, $c$常時50人以上を使用するすべての事業場$c$, false, 1),
  ('c854107e-b713-48e1-8d2a-a05b9493508f'::uuid, $c$常時300人以上を使用するすべての事業場$c$, false, 2),
  ('c854107e-b713-48e1-8d2a-a05b9493508f'::uuid, $c$常時1,000人を超える労働者を使用する事業場$c$, true, 3),
  ('c854107e-b713-48e1-8d2a-a05b9493508f'::uuid, $c$常時100人以上を使用する製造業の事業場$c$, false, 4),
  ('c854107e-b713-48e1-8d2a-a05b9493508f'::uuid, $c$労働者を1人でも使用する事業場$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd518d98f-ecee-4ddd-8cbc-751619195131',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$専属の産業医を選任しなければならない事業場として、正しいものはどれか。$q$,
  $e$常時1,000人以上の労働者を使用する事業場、または法定の有害業務に常時500人以上を従事させる事業場では専属の産業医を選任する。常時3,000人を超える事業場では2人以上の産業医が必要。根拠は労働安全衛生規則第13条第1項。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd518d98f-ecee-4ddd-8cbc-751619195131'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d518d98f-ecee-4ddd-8cbc-751619195131'::uuid, $c$常時50人以上を使用するすべての事業場$c$, false, 1),
  ('d518d98f-ecee-4ddd-8cbc-751619195131'::uuid, $c$常時300人以上を使用するすべての事業場$c$, false, 2),
  ('d518d98f-ecee-4ddd-8cbc-751619195131'::uuid, $c$常時1,000人以上の労働者を使用する事業場$c$, true, 3),
  ('d518d98f-ecee-4ddd-8cbc-751619195131'::uuid, $c$常時30人以上を使用する事務業の事業場$c$, false, 4),
  ('d518d98f-ecee-4ddd-8cbc-751619195131'::uuid, $c$産業医の選任義務がある事業場は、すべて専属の産業医でなければならない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '31bcae0d-52e0-45ef-897c-efaa9cc4a790',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$一般健康診断の実施時期について、正しいものはどれか。$q$,
  $e$定期健康診断は1年以内ごとに1回実施する。特定業務従事者については6月以内ごとに1回の健康診断が必要。根拠は労働安全衛生法第66条、労働安全衛生規則第44条、第45条。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '31bcae0d-52e0-45ef-897c-efaa9cc4a790'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('31bcae0d-52e0-45ef-897c-efaa9cc4a790'::uuid, $c$定期健康診断は3年以内ごとに1回実施すればよい$c$, false, 1),
  ('31bcae0d-52e0-45ef-897c-efaa9cc4a790'::uuid, $c$雇入時健康診断は、雇入れ後1年以内に実施すればよい$c$, false, 2),
  ('31bcae0d-52e0-45ef-897c-efaa9cc4a790'::uuid, $c$定期健康診断は、1年以内ごとに1回、定期に実施する$c$, true, 3),
  ('31bcae0d-52e0-45ef-897c-efaa9cc4a790'::uuid, $c$一般健康診断は、本人が希望しない場合は実施しなくてよい$c$, false, 4),
  ('31bcae0d-52e0-45ef-897c-efaa9cc4a790'::uuid, $c$健康診断の実施義務は、常時1,000人以上の事業場に限られる$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c6bb7229-2d69-47ca-ba95-e5dc44aa451e',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働基準法に定める時間外労働の上限（原則）として、正しいものはどれか。$q$,
  $e$時間外労働の上限は原則として月45時間・年360時間である。特別条項を設ける場合でも年720時間以内、複数月平均80時間以内、月100時間未満などの規制がある。根拠は労働基準法第36条。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c6bb7229-2d69-47ca-ba95-e5dc44aa451e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c6bb7229-2d69-47ca-ba95-e5dc44aa451e'::uuid, $c$月60時間、年720時間までなら、36協定なしで命じられる$c$, false, 1),
  ('c6bb7229-2d69-47ca-ba95-e5dc44aa451e'::uuid, $c$原則として、時間外労働は月45時間・年360時間以内とする$c$, true, 2),
  ('c6bb7229-2d69-47ca-ba95-e5dc44aa451e'::uuid, $c$時間外労働に法律上の上限は設けられていない$c$, false, 3),
  ('c6bb7229-2d69-47ca-ba95-e5dc44aa451e'::uuid, $c$休日労働を除き、時間外労働は月100時間まで原則認められる$c$, false, 4),
  ('c6bb7229-2d69-47ca-ba95-e5dc44aa451e'::uuid, $c$中小企業には時間外労働の上限規制は適用されない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2f18b48c-0932-4d0a-953f-e6d64a4a7826',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$年次有給休暇が10日以上付与される労働者について、使用者が時季を指定して与えなければならない日数はどれか。$q$,
  $e$10日以上付与される労働者には、付与日から1年以内に5日について、使用者が時季を指定して与えなければならない。労働者が自ら取得した日数は5日から控除できる。根拠は労働基準法第39条第7項。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2f18b48c-0932-4d0a-953f-e6d64a4a7826'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2f18b48c-0932-4d0a-953f-e6d64a4a7826'::uuid, $c$3日$c$, false, 1),
  ('2f18b48c-0932-4d0a-953f-e6d64a4a7826'::uuid, $c$5日$c$, true, 2),
  ('2f18b48c-0932-4d0a-953f-e6d64a4a7826'::uuid, $c$7日$c$, false, 3),
  ('2f18b48c-0932-4d0a-953f-e6d64a4a7826'::uuid, $c$10日$c$, false, 4),
  ('2f18b48c-0932-4d0a-953f-e6d64a4a7826'::uuid, $c$付与日数の全部$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0b20ba08-3155-484a-ad69-14c860dfaeb9',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$衛生委員会の開催および構成について、正しいものはどれか。$q$,
  $e$衛生委員会は原則として毎月1回以上開催する。議長以外の委員の半数は、労働組合等の推薦に基づき指名した者でなければならない。根拠は労働安全衛生法第18条、労働安全衛生規則第23条。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0b20ba08-3155-484a-ad69-14c860dfaeb9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0b20ba08-3155-484a-ad69-14c860dfaeb9'::uuid, $c$3か月に1回開催すれば足りる$c$, false, 1),
  ('0b20ba08-3155-484a-ad69-14c860dfaeb9'::uuid, $c$委員の全員を事業者側から指名できる$c$, false, 2),
  ('0b20ba08-3155-484a-ad69-14c860dfaeb9'::uuid, $c$原則として毎月1回以上開催し、労働者側委員は半数とする$c$, true, 3),
  ('0b20ba08-3155-484a-ad69-14c860dfaeb9'::uuid, $c$常時10人以上の事業場に設置が義務付けられる$c$, false, 4),
  ('0b20ba08-3155-484a-ad69-14c860dfaeb9'::uuid, $c$賃金の決定を主要な調査審議事項とする$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a0b1077d-a662-49f1-a9ce-7d3a199b575b',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$危険または有害な業務で厚生労働省令で定めるものに労働者をつかせる場合の教育について、正しいものはどれか。$q$,
  $e$危険有害業務で省令に定めるものに従事させるときは、特別の教育を実施しなければならない。根拠は労働安全衛生法第59条第3項。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a0b1077d-a662-49f1-a9ce-7d3a199b575b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a0b1077d-a662-49f1-a9ce-7d3a199b575b'::uuid, $c$雇入れ時の教育を行えば、特別の教育は不要である$c$, false, 1),
  ('a0b1077d-a662-49f1-a9ce-7d3a199b575b'::uuid, $c$特別の教育を行わなければならない$c$, true, 2),
  ('a0b1077d-a662-49f1-a9ce-7d3a199b575b'::uuid, $c$教育は労働者の希望がある場合に限る$c$, false, 3),
  ('a0b1077d-a662-49f1-a9ce-7d3a199b575b'::uuid, $c$正社員以外には特別教育は不要である$c$, false, 4),
  ('a0b1077d-a662-49f1-a9ce-7d3a199b575b'::uuid, $c$作業を開始した後に教育すれば足りる$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5e25a8b0-fb5f-4598-b387-05740efc2355',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$事務室にいる労働者1人当たりの二酸化炭素発生量を毎時0.018m³、室内の二酸化炭素濃度の目標値を0.10％、外気の二酸化炭素濃度を0.04％とする。この労働者1人について必要な換気量は、毎時何m³か。$q$,
  $e$必要換気量は「二酸化炭素発生量÷室内外の濃度差」で求める。濃度差は0.10％－0.04％＝0.06％＝0.0006であるため、0.018÷0.0006＝30m³/hとなる。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5e25a8b0-fb5f-4598-b387-05740efc2355'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5e25a8b0-fb5f-4598-b387-05740efc2355'::uuid, $c$18m³$c$, false, 1),
  ('5e25a8b0-fb5f-4598-b387-05740efc2355'::uuid, $c$24m³$c$, false, 2),
  ('5e25a8b0-fb5f-4598-b387-05740efc2355'::uuid, $c$30m³$c$, true, 3),
  ('5e25a8b0-fb5f-4598-b387-05740efc2355'::uuid, $c$36m³$c$, false, 4),
  ('5e25a8b0-fb5f-4598-b387-05740efc2355'::uuid, $c$45m³$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '32030408-87a8-418e-84df-7a298d75cee8',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$メンタルヘルス不調の一次予防、二次予防および三次予防の組合せとして、適切なものはどれか。$q$,
  $e$一次予防は不調の未然防止、二次予防は早期発見・早期対応、三次予防は治療、職場復帰支援および再発防止を中心とする。管理監督者への教育や職場環境の改善は一次予防に該当する。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '32030408-87a8-418e-84df-7a298d75cee8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('32030408-87a8-418e-84df-7a298d75cee8'::uuid, $c$一次予防―休業者の職場復帰支援$c$, false, 1),
  ('32030408-87a8-418e-84df-7a298d75cee8'::uuid, $c$一次予防―管理監督者への教育や職場環境の改善$c$, true, 2),
  ('32030408-87a8-418e-84df-7a298d75cee8'::uuid, $c$二次予防―復職後の再発防止支援だけを行うこと$c$, false, 3),
  ('32030408-87a8-418e-84df-7a298d75cee8'::uuid, $c$三次予防―すべての労働者を対象とするストレス教育$c$, false, 4),
  ('32030408-87a8-418e-84df-7a298d75cee8'::uuid, $c$三次予防―メンタルヘルス不調の早期発見だけを行うこと$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0e7bd437-03f3-4df2-b911-4dcbf2951aca',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$労働衛生管理の「作業管理」に該当する措置はどれか。$q$,
  $e$作業時間、作業方法、作業姿勢、保護具の使用方法などを管理することは作業管理に当たる。（１）、（２）、（５）は作業環境管理、（３）は健康管理に該当する。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0e7bd437-03f3-4df2-b911-4dcbf2951aca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0e7bd437-03f3-4df2-b911-4dcbf2951aca'::uuid, $c$有害物質を有害性の低い物質に変更する$c$, false, 1),
  ('0e7bd437-03f3-4df2-b911-4dcbf2951aca'::uuid, $c$作業場に局所排気装置を設置する$c$, false, 2),
  ('0e7bd437-03f3-4df2-b911-4dcbf2951aca'::uuid, $c$健康診断の結果に基づいて就業上の措置を講ずる$c$, false, 3),
  ('0e7bd437-03f3-4df2-b911-4dcbf2951aca'::uuid, $c$有害物質へのばく露時間を短縮するよう作業手順を変更する$c$, true, 4),
  ('0e7bd437-03f3-4df2-b911-4dcbf2951aca'::uuid, $c$作業場の有害物質濃度を測定する$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '67211239-5e26-4200-8e09-2b25245446e4',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$THPにおける健康保持増進措置と、その担当者の組合せとして、適切なものはどれか。$q$,
  $e$THPでは、健康測定の結果等に基づき、運動指導、運動実践指導、保健指導、栄養指導、心理相談などを担当者が連携して行う。保健指導は産業保健指導担当者が担当する。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '67211239-5e26-4200-8e09-2b25245446e4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('67211239-5e26-4200-8e09-2b25245446e4'::uuid, $c$運動指導―産業栄養指導担当者$c$, false, 1),
  ('67211239-5e26-4200-8e09-2b25245446e4'::uuid, $c$栄養指導―心理相談担当者$c$, false, 2),
  ('67211239-5e26-4200-8e09-2b25245446e4'::uuid, $c$保健指導―産業保健指導担当者$c$, true, 3),
  ('67211239-5e26-4200-8e09-2b25245446e4'::uuid, $c$心理相談―運動実践担当者$c$, false, 4),
  ('67211239-5e26-4200-8e09-2b25245446e4'::uuid, $c$運動実践指導―産業栄養指導担当者$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8633c20f-87e6-4d35-9fe2-a8b803969d68',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$快適な職場環境の形成のための措置と、その区分の組合せとして、適切でないものはどれか。$q$,
  $e$作業場の温度、湿度、気流等の調整は「作業環境の管理」に該当する。快適な職場環境の形成では、作業環境、作業方法、疲労回復支援施設、職場生活支援施設などを改善する。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8633c20f-87e6-4d35-9fe2-a8b803969d68'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8633c20f-87e6-4d35-9fe2-a8b803969d68'::uuid, $c$不快な臭気の抑制―作業環境の管理$c$, false, 1),
  ('8633c20f-87e6-4d35-9fe2-a8b803969d68'::uuid, $c$不自然な作業姿勢の改善―作業方法の改善$c$, false, 2),
  ('8633c20f-87e6-4d35-9fe2-a8b803969d68'::uuid, $c$横になって休める設備の確保―疲労回復支援施設の整備$c$, false, 3),
  ('8633c20f-87e6-4d35-9fe2-a8b803969d68'::uuid, $c$洗面所の使いやすさの改善―職場生活支援施設の整備$c$, false, 4),
  ('8633c20f-87e6-4d35-9fe2-a8b803969d68'::uuid, $c$作業場の温度調整―労働者の採用方法の改善$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$作業時間または作業内容の拘束性が相当程度高い情報機器作業について、厚生労働省のガイドラインに沿った措置はどれか。$q$,
  $e$一連続作業時間が1時間を超えないようにし、次の連続作業までに10～15分の作業休止時間を設ける。また、一連続作業時間内に1～2回程度の小休止を設けることとされている。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'::uuid, $c$一連続作業時間を30分以内とし、30分ごとに20分の作業休止時間を設ける$c$, false, 1),
  ('a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'::uuid, $c$一連続作業時間を1時間以内とし、次の連続作業までに10～15分の作業休止時間を設ける$c$, true, 2),
  ('a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'::uuid, $c$一連続作業時間を2時間以内とし、次の連続作業までに5分の作業休止時間を設ける$c$, false, 3),
  ('a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'::uuid, $c$一連続作業時間を3時間以内とし、作業終了後に30分の休止時間を設ける$c$, false, 4),
  ('a2ac3da1-63a8-47cd-ad7c-6d9bb4c4e0ea'::uuid, $c$1日の作業終了時にまとめて休止すれば、連続作業中の小休止は設けない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '18243cfa-9c9d-40c5-bb9c-7c59afb39d00',
  'hygiene',
  (SELECT id FROM exam_types WHERE exam_id = 'hygiene' AND code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'hygiene' AND e.code = 'common' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$ある事業場における1年間の延べ実労働時間数が800,000時間で、同じ期間に度数率の算定対象となる労働災害の死傷者数が4人であった。この事業場の度数率はいくらか。$q$,
  $e$度数率は「労働災害による死傷者数÷延べ実労働時間数×1,000,000」で求める。したがって、4÷800,000×1,000,000＝5.0となる。度数率は災害発生の頻度を示す。$e$,
  'original',
  '衛生管理者 オリジナル問題 第一種 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '18243cfa-9c9d-40c5-bb9c-7c59afb39d00'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('18243cfa-9c9d-40c5-bb9c-7c59afb39d00'::uuid, $c$0.5$c$, false, 1),
  ('18243cfa-9c9d-40c5-bb9c-7c59afb39d00'::uuid, $c$2.0$c$, false, 2),
  ('18243cfa-9c9d-40c5-bb9c-7c59afb39d00'::uuid, $c$3.2$c$, false, 3),
  ('18243cfa-9c9d-40c5-bb9c-7c59afb39d00'::uuid, $c$5.0$c$, true, 4),
  ('18243cfa-9c9d-40c5-bb9c-7c59afb39d00'::uuid, $c$8.0$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

DO $$
DECLARE
  original_count int;
  type1_count int;
  type2_count int;
  common_count int;
  type1_only int;
  type2_only int;
  text_overlap int;
BEGIN
  SELECT count(*) INTO original_count
  FROM questions
  WHERE exam_id = 'hygiene'
    AND source_type = 'original'
    AND source_note LIKE '衛生管理者 オリジナル問題%';

  IF original_count <> 64 THEN
    RAISE EXCEPTION 'hygiene original questions must be 64 (got %)', original_count;
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

  SELECT count(*) INTO common_count
  FROM questions q
  JOIN exam_types et ON et.id = q.exam_type_id
  WHERE q.exam_id = 'hygiene'
    AND q.source_type = 'original'
    AND q.source_note LIKE '衛生管理者 オリジナル問題%'
    AND et.code = 'common';

  IF common_count <> 10 THEN
    RAISE EXCEPTION 'hygiene common originals must be 10 physiology (got %)', common_count;
  END IF;

  SELECT count(*) INTO type1_only
  FROM questions q
  JOIN exam_types et ON et.id = q.exam_type_id
  WHERE q.exam_id = 'hygiene'
    AND q.source_type = 'original'
    AND q.source_note LIKE '衛生管理者 オリジナル問題%'
    AND et.code = 'type1';

  IF type1_only <> 34 THEN
    RAISE EXCEPTION 'hygiene type1-only originals must be 34 (got %)', type1_only;
  END IF;

  SELECT count(*) INTO type2_only
  FROM questions q
  JOIN exam_types et ON et.id = q.exam_type_id
  WHERE q.exam_id = 'hygiene'
    AND q.source_type = 'original'
    AND q.source_note LIKE '衛生管理者 オリジナル問題%'
    AND et.code = 'type2';

  IF type2_only <> 20 THEN
    RAISE EXCEPTION 'hygiene type2-only originals must be 20 (got %)', type2_only;
  END IF;

  SELECT count(*) INTO text_overlap
  FROM questions q1
  JOIN exam_types e1 ON e1.id = q1.exam_type_id
  JOIN questions q2 ON q2.question_text = q1.question_text AND q2.id <> q1.id
  JOIN exam_types e2 ON e2.id = q2.exam_type_id
  WHERE q1.exam_id = 'hygiene'
    AND q1.source_type = 'original'
    AND q1.source_note LIKE '衛生管理者 オリジナル問題%'
    AND e1.code = 'type1'
    AND q2.exam_id = 'hygiene'
    AND q2.source_type = 'original'
    AND q2.source_note LIKE '衛生管理者 オリジナル問題%'
    AND e2.code = 'type2';

  IF text_overlap <> 0 THEN
    RAISE EXCEPTION 'type1 and type2 original stems overlapped (got %)', text_overlap;
  END IF;
END $$;
