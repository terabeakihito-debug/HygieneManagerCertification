-- 過去問(令和7年10月・令和8年4月公表)の questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

-- 既存 categories (2026-08-29 確認):
--   労働衛生(有害業務を含む) / type1
--   労働衛生(有害業務を除く) / type2
--   関係法令(有害業務に係るもの) / type1
--   関係法令(有害業務に係るものを除く) / type2
--   労働生理 / common
-- 不足していた第一種の非有害業務分野のみ新規追加する。

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務を含む)', 1
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務を含む)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務を除く)', 1
FROM exam_types et
WHERE et.code = 'type2'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務を除く)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るもの)', 2
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るもの)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るものを除く)', 2
FROM exam_types et
WHERE et.code = 'type2'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るものを除く)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働生理', 3
FROM exam_types et
WHERE et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働生理'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るもの以外のもの)', 4
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るもの以外のもの)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務に係るもの以外のもの)', 5
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務に係るもの以外のもの)'
  );

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '39f0a372-9477-44f9-bf56-7e9161d8faf8',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$常時400人の労働者を使用する製造業の事業場における衛生管理体制に関する(１)～(５)の記述のうち、法令上、誤っているものはどれか。
ただし、400人中には、屋内作業場において次の業務に常時従事する者が含まれているが、その他の有害業務はないものとし、衛生管理者及び産業医の選任の特例はないものとする。
深夜業を含む業務 200人
多量の高熱物体を取り扱う業務 50人
塩素を試験研究のため取り扱う作業を行う業務 30人$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('39f0a372-9477-44f9-bf56-7e9161d8faf8', $c$総括安全衛生管理者を選任しなければならない。$c$, false, 1),
  ('39f0a372-9477-44f9-bf56-7e9161d8faf8', $c$衛生管理者のうち少なくとも１人を専任の衛生管理者としなければならない。$c$, true, 2),
  ('39f0a372-9477-44f9-bf56-7e9161d8faf8', $c$衛生管理者は、全て第一種衛生管理者免許を有する者のうちから選任することができる。$c$, false, 3),
  ('39f0a372-9477-44f9-bf56-7e9161d8faf8', $c$産業医は、この事業場に専属でない者を選任することができる。$c$, false, 4),
  ('39f0a372-9477-44f9-bf56-7e9161d8faf8', $c$特定化学物質作業主任者を選任しなくてよい。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '840a515c-1540-462d-9ee8-fbfb5ebd1d61',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$厚生労働大臣が定める規格を具備しなければ、譲渡し、貸与し、又は設置してはならない機械等に該当するものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('840a515c-1540-462d-9ee8-fbfb5ebd1d61', $c$防振手袋$c$, false, 1),
  ('840a515c-1540-462d-9ee8-fbfb5ebd1d61', $c$硫化水素用防毒マスク$c$, false, 2),
  ('840a515c-1540-462d-9ee8-fbfb5ebd1d61', $c$防じん機能を有する電動ファン付き呼吸用保護具$c$, true, 3),
  ('840a515c-1540-462d-9ee8-fbfb5ebd1d61', $c$検知管方式による一酸化炭素検定器$c$, false, 4),
  ('840a515c-1540-462d-9ee8-fbfb5ebd1d61', $c$放射線測定器$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$次の設備のうち、法令に基づく定期自主検査の実施頻度が１年以内ごとに１回とされていないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb', $c$屋内の、砂型を用いて鋳物を製造する工程において、型ばらし装置を用いて砂型を壊す箇所に設置した局所排気装置に設けた除じん装置$c$, false, 1),
  ('5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb', $c$トルエンを用いて洗浄を行う屋内の作業場所に設置したプッシュプル型換気装置$c$, false, 2),
  ('5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb', $c$塩化水素を取り扱う特定化学設備$c$, true, 3),
  ('5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb', $c$弗化水素を含有する気体を排出する製造設備の排気筒に設置した排ガス処理装置$c$, false, 4),
  ('5ca7653d-ceca-4f08-a7f5-5c6edd58bbdb', $c$鉛化合物を製造する工程において鉛等の溶融を行う屋内の作業場所に設置した局所排気装置$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '866351fb-f270-4b18-bf78-b35fbb8e3422',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$特定化学物質の第一類物質に関する次の記述のうち、法令上、正しいものはどれか。
ただし、特定化学物質障害予防規則に定める適用除外はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('866351fb-f270-4b18-bf78-b35fbb8e3422', $c$第一類物質は、「クロム酸及びその塩」を始めとする７種の発がん性の認められた化学物質並びにそれらを一定量以上含有する混合物である。$c$, false, 1),
  ('866351fb-f270-4b18-bf78-b35fbb8e3422', $c$第一類物質を製造しようとする者は、あらかじめ、物質ごとに、かつ、当該物質を製造するプラントごとに厚生労働大臣の許可を受けなければならない。$c$, true, 2),
  ('866351fb-f270-4b18-bf78-b35fbb8e3422', $c$第一類物質を容器に入れ、容器から取り出し、又は反応槽等へ投入する作業を行うときは、発散源を密閉する設備、外付け式フードの局所排気装置又はプッシュプル型換気装置を設けなければならない。$c$, false, 3),
  ('866351fb-f270-4b18-bf78-b35fbb8e3422', $c$第一類物質を取り扱う屋内作業場についての作業環境測定結果及びその評価の記録を保存すべき期間は、３年である。$c$, false, 4),
  ('866351fb-f270-4b18-bf78-b35fbb8e3422', $c$第一類物質を取り扱う業務に常時従事する労働者に係る特定化学物質健康診断個人票を保存すべき期間は、全ての第一類物質について30年である。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '92f4483b-3dc7-4055-9387-bc84d03039bf',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$屋内作業場において、第二種有機溶剤等を使用して常時洗浄作業を行う場合の措置として、法令上、誤っているものは次のうちどれか。
ただし、有機溶剤中毒予防規則に定める適用除外及び設備の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('92f4483b-3dc7-4055-9387-bc84d03039bf', $c$作業場所に設けた局所排気装置について、下方吸引型外付け式フードの場合は0.5ｍ/ｓの制御風速を出し得る能力を有するものにする。$c$, false, 1),
  ('92f4483b-3dc7-4055-9387-bc84d03039bf', $c$有機溶剤等の区分の色分けによる表示を黄色で行う。$c$, false, 2),
  ('92f4483b-3dc7-4055-9387-bc84d03039bf', $c$作業場における空気中の有機溶剤の濃度を、６か月以内ごとに１回、定期に測定する。$c$, false, 3),
  ('92f4483b-3dc7-4055-9387-bc84d03039bf', $c$作業に常時従事する労働者に対し、６か月以内ごとに１回、定期に、特別の項目について医師による健康診断を行い、その結果に基づき作成した有機溶剤等健康診断個人票を３年間保存する。$c$, true, 4),
  ('92f4483b-3dc7-4055-9387-bc84d03039bf', $c$労働者が有機溶剤を多量に吸入したときは、速やかに、当該労働者に医師による診察又は処置を受けさせる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$次の業務に労働者を常時就かせるとき、法令に基づく安全又は衛生のための特別の教育を行わなければならないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8', $c$屋内の、セメントを袋詰めする場所における業務$c$, true, 1),
  ('e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8', $c$特定化学物質を用いて行う分析の業務$c$, false, 2),
  ('e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8', $c$水深10ｍ以上の場所における潜水業務$c$, false, 3),
  ('e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8', $c$強烈な騒音を発する場所における業務$c$, false, 4),
  ('e95c1e93-fbb4-4c93-ad24-a9f8b0bd26d8', $c$人力により重量物を取り扱う業務$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7582e81d-5202-4a14-9fd7-27b0648a24a5',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働安全衛生法に基づく免許を受けることによって取得できる資格に該当しないものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7582e81d-5202-4a14-9fd7-27b0648a24a5', $c$潜水士$c$, false, 1),
  ('7582e81d-5202-4a14-9fd7-27b0648a24a5', $c$鉛作業主任者$c$, true, 2),
  ('7582e81d-5202-4a14-9fd7-27b0648a24a5', $c$高圧室内作業主任者$c$, false, 3),
  ('7582e81d-5202-4a14-9fd7-27b0648a24a5', $c$エックス線作業主任者$c$, false, 4),
  ('7582e81d-5202-4a14-9fd7-27b0648a24a5', $c$ガンマ線透過写真撮影作業主任者$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3215e364-ec15-4945-bc86-25b7ec63e085',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働安全衛生法令上、名称等の表示が義務付けられている危険物及び有害物について、その危険物又は有害物を容器に入れ、又は包装して、譲渡し、又は提供する者が、その容器又は包装に表示しなければならない事項として、定められていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3215e364-ec15-4945-bc86-25b7ec63e085', $c$安定性及び反応性$c$, false, 1),
  ('3215e364-ec15-4945-bc86-25b7ec63e085', $c$人体に及ぼす作用$c$, false, 2),
  ('3215e364-ec15-4945-bc86-25b7ec63e085', $c$表示をする者の氏名（法人にあっては、その名称）、住所及び電話番号$c$, false, 3),
  ('3215e364-ec15-4945-bc86-25b7ec63e085', $c$注意喚起語$c$, false, 4),
  ('3215e364-ec15-4945-bc86-25b7ec63e085', $c$適用される法令$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c8048642-2a04-46be-bf3c-2eef1fdcd302',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$有害業務を行う作業場とその作業場において定期に測定することが義務付けられている項目の組合せとして、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c8048642-2a04-46be-bf3c-2eef1fdcd302', $c$溶融ガラスからガラス製品を成型する業務を行う屋内作業場 ……… 空気中の粉じんの濃度$c$, true, 1),
  ('c8048642-2a04-46be-bf3c-2eef1fdcd302', $c$加硫がまによりゴムを加硫する業務を行う屋内作業場 ……… 気温及び湿度$c$, false, 2),
  ('c8048642-2a04-46be-bf3c-2eef1fdcd302', $c$ドラムバーカーにより、木材を削皮する業務を行う屋内作業場 ……… 等価騒音レベル$c$, false, 3),
  ('c8048642-2a04-46be-bf3c-2eef1fdcd302', $c$エックス線装置を用いて透過写真撮影の業務を行う作業場の管理区域 ……… 線量当量率又は線量当量$c$, false, 4),
  ('c8048642-2a04-46be-bf3c-2eef1fdcd302', $c$廃棄物の焼却施設において焼却灰を取り扱う業務(設備の解体等に伴うものを除く。)を行う作業場 ………… 空気中のダイオキシン類の濃度$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6a76c5e2-cbad-4e2e-b531-63cc1f8b4148',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働基準法に基づく時間外労働に関する協定を締結し、これを所轄労働基準監督署長に届け出る場合においても、労働時間の延長が１日２時間を超えてはならない業務は、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6a76c5e2-cbad-4e2e-b531-63cc1f8b4148', $c$著しく湿潤な場所における業務$c$, false, 1),
  ('6a76c5e2-cbad-4e2e-b531-63cc1f8b4148', $c$著しく寒冷な場所における業務$c$, true, 2),
  ('6a76c5e2-cbad-4e2e-b531-63cc1f8b4148', $c$情報機器を用いる計器監視作業の業務$c$, false, 3),
  ('6a76c5e2-cbad-4e2e-b531-63cc1f8b4148', $c$病原体によって汚染されたものを取り扱う業務$c$, false, 4),
  ('6a76c5e2-cbad-4e2e-b531-63cc1f8b4148', $c$ヘリウム、アルゴン等の不活性の気体を入れたことのあるタンクの内部における業務$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7c149626-8b58-4127-a666-c258aecdc839',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$次の化学物質のうち、常温・常圧(25℃、１気圧)の空気中で蒸気として存在するものはどれか。
ただし、蒸気とは、常温・常圧で液体又は固体の物質が蒸気圧に応じて揮発又は昇華して気体となっているものをいうものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7c149626-8b58-4127-a666-c258aecdc839', $c$アクリロニトリル$c$, true, 1),
  ('7c149626-8b58-4127-a666-c258aecdc839', $c$アンモニア$c$, false, 2),
  ('7c149626-8b58-4127-a666-c258aecdc839', $c$エチレンオキシド$c$, false, 3),
  ('7c149626-8b58-4127-a666-c258aecdc839', $c$二酸化硫黄$c$, false, 4),
  ('7c149626-8b58-4127-a666-c258aecdc839', $c$ホルムアルデヒド$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '216798f3-3beb-46d5-b940-908ec1a3d0cc',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$化学物質等による疾病のリスクの低減措置について、法令に定められた措置以外の措置を検討する場合、優先度の最も高いものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('216798f3-3beb-46d5-b940-908ec1a3d0cc', $c$作業手順の改善$c$, false, 1),
  ('216798f3-3beb-46d5-b940-908ec1a3d0cc', $c$化学物質等に係る機械設備等の密閉化$c$, false, 2),
  ('216798f3-3beb-46d5-b940-908ec1a3d0cc', $c$危険性又は有害性のより低い物質への代替$c$, true, 3),
  ('216798f3-3beb-46d5-b940-908ec1a3d0cc', $c$化学物質等の有害性に応じた有効な保護具の使用$c$, false, 4),
  ('216798f3-3beb-46d5-b940-908ec1a3d0cc', $c$化学物質等に係る機械設備等への局所排気装置の設置$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd4924ef1-311f-4516-bf89-b1b3929d9f95',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$有機溶剤に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d4924ef1-311f-4516-bf89-b1b3929d9f95', $c$有機溶剤は、一般に揮発性が高く、その蒸気は空気より軽い。$c$, false, 1),
  ('d4924ef1-311f-4516-bf89-b1b3929d9f95', $c$有機溶剤は、脂溶性が低いため、脂肪の多い脳などには入りにくい。$c$, false, 2),
  ('d4924ef1-311f-4516-bf89-b1b3929d9f95', $c$メタノールによる障害として顕著なものには、網膜の微細動脈瘤を伴う脳血管障害がある。$c$, false, 3),
  ('d4924ef1-311f-4516-bf89-b1b3929d9f95', $c$二硫化炭素は、精神障害や意識障害を起こすことがある。$c$, true, 4),
  ('d4924ef1-311f-4516-bf89-b1b3929d9f95', $c$Ｎ,Ｎ-ジメチルホルムアミドによる障害として顕著なものには、視力低下を伴う視神経障害がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '957b12bf-bb08-4e45-8c6b-21e4e093fb92',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$厚生労働省の「騒音障害防止のためのガイドライン」に基づく騒音障害防止対策に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('957b12bf-bb08-4e45-8c6b-21e4e093fb92', $c$衛生管理者、安全衛生推進者等から騒音障害防止対策の管理者を選任し、ガイドラインで定める事項に取り組ませる必要がある。$c$, false, 1),
  ('957b12bf-bb08-4e45-8c6b-21e4e093fb92', $c$騒音対策としては、騒音発生源対策、伝ぱ経路対策、受音者対策（聴覚保護具の使用、作業時間の制限）があるが、このうち聴覚保護具の使用が最優先の対策である。$c$, true, 2),
  ('957b12bf-bb08-4e45-8c6b-21e4e093fb92', $c$屋内作業場では、原則として作業環境測定（定点測定）により等価騒音レベルの測定を行うが、騒音源が移動する場合には、個人ばく露測定により測定することができる。$c$, false, 3),
  ('957b12bf-bb08-4e45-8c6b-21e4e093fb92', $c$雇い入れの際の騒音健康診断では、250Ｈz、500Ｈz、1,000Ｈz、2,000Ｈz、4,000Ｈz、6,000Ｈz及び8,000Ｈzにおける聴力の検査を行う。$c$, false, 4),
  ('957b12bf-bb08-4e45-8c6b-21e4e093fb92', $c$騒音健康診断結果に基づく事後措置を講じる際には、加齢性難聴の影響を考慮する必要がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$有害光線などによる障害に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8', $c$赤外線は、可視光線より波長が長い電磁波で、ガラス加工作業などでばく露のおそれがあり、白内障を起こすことがある。$c$, false, 1),
  ('89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8', $c$紫外線は、可視光線より波長が短い電磁波で、アーク溶接作業などでばく露のおそれがあり、電光性眼炎を起こすことがある。$c$, false, 2),
  ('89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8', $c$レーザー光線は、誘導放出による光の増幅によって人工的に作られた電磁波で、レーザー機器による金属加工作業などでばく露のおそれがあり、網膜の損傷を起こすことがある。$c$, false, 3),
  ('89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8', $c$マイクロ波は、赤外線より波長が長い電磁波で、熱接着加工作業などでばく露のおそれがあり、組織壊死を起こすことがある。$c$, false, 4),
  ('89b75fed-cc3b-437c-bf7c-6bd4aa4b2ad8', $c$アルファ線は、セシウム137などの原子核から放出される電磁波で、物体への透過力が強く、非破壊検査作業などでばく露のおそれがあり、角膜の損傷を起こすことがある。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$労働衛生保護具に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e', $c$直結式防毒マスクは、隔離式防毒マスクよりも有害ガスの濃度が高い大気中で使用することができる。$c$, true, 1),
  ('e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e', $c$ガス又は蒸気状の有害物質が粉じんと混在している作業環境中で防毒マスクを使用するときは、防じん機能を有する防毒マスクを選択する。$c$, false, 2),
  ('e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e', $c$酸素濃度18％未満の場所で使用できる呼吸用保護具には、送気マスク、空気呼吸器のほか、酸素呼吸器がある。$c$, false, 3),
  ('e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e', $c$聴覚保護具は、日本産業規格（JIS）に規定する試験方法により測定された遮音値を目安に、必要かつ十分な遮音値のものを選定する。$c$, false, 4),
  ('e0451d1e-3adb-41e5-87f4-7cdfdbd94c5e', $c$保護めがねは、研磨、化学薬品取扱いなどの作業で、飛散する粒子、薬品の飛沫などによる眼の障害を防止するために使用する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'dc171646-1c53-41bc-90a0-ae484a416af2',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$金属などによる健康障害に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dc171646-1c53-41bc-90a0-ae484a416af2', $c$カドミウム中毒では、感情不安定、幻覚などの精神障害や手指の震えなどの症状がみられる。$c$, false, 1),
  ('dc171646-1c53-41bc-90a0-ae484a416af2', $c$クロム中毒では、貧血、腹部の疝痛などの症状がみられる。$c$, false, 2),
  ('dc171646-1c53-41bc-90a0-ae484a416af2', $c$ベリリウム中毒では、溶血性貧血、尿の赤色化などの症状がみられる。$c$, false, 3),
  ('dc171646-1c53-41bc-90a0-ae484a416af2', $c$マンガン中毒では、指の骨の溶解、肝臓の血管肉腫などがみられる。$c$, false, 4),
  ('dc171646-1c53-41bc-90a0-ae484a416af2', $c$金属水銀の標的臓器は脳で、その中毒では、手指の震え、精神障害などがみられる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b97e426e-3a8c-4c0e-bd04-56090e58e701',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$局所排気装置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b97e426e-3a8c-4c0e-bd04-56090e58e701', $c$建築ブース型フードは、作業面を除き周りが覆われているもので、囲い式フードに分類される。$c$, false, 1),
  ('b97e426e-3a8c-4c0e-bd04-56090e58e701', $c$外付け式フードは、有害物質の発散源の近くで有害物質を吸い込み気流によりフードまで吸引するものであり、囲い式フードと比較して吸い込み時の圧力損失が小さく、少ない排風量とすることができる。$c$, true, 2),
  ('b97e426e-3a8c-4c0e-bd04-56090e58e701', $c$フード開口部の周囲にフランジを付けることにより、フランジがないときと比較して、少ない排風量とすることができる。$c$, false, 3),
  ('b97e426e-3a8c-4c0e-bd04-56090e58e701', $c$ダクトの形状には円形、角形などがあるが、その断面積を小さくすると、ダクトの圧力損失が増大する。$c$, false, 4),
  ('b97e426e-3a8c-4c0e-bd04-56090e58e701', $c$排風機には、遠心式と軸流式があるが、いずれの方式の排風機も、一般に、空気清浄装置の後の清浄空気が通る位置に設置する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '322986ac-5a6b-4001-adf5-23a395f99b9c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$特殊健康診断に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('322986ac-5a6b-4001-adf5-23a395f99b9c', $c$有害業務への配置替えの際に行う特殊健康診断には、業務適性の判断と、その後の業務による影響を調べるための基礎資料を得るという目的がある。$c$, false, 1),
  ('322986ac-5a6b-4001-adf5-23a395f99b9c', $c$特殊健康診断の実施に当たっては、現在の作業内容及び有害要因へのばく露状況を把握する必要がある。$c$, false, 2),
  ('322986ac-5a6b-4001-adf5-23a395f99b9c', $c$体内に取り込まれた多くの有機溶剤は、生物学的半減期が短いので、有機溶剤等健康診断における尿中の代謝物の量の検査のための採尿の時刻は、厳重にチェックする必要がある。$c$, false, 3),
  ('322986ac-5a6b-4001-adf5-23a395f99b9c', $c$眼底検査は、電離放射線健康診断で実施され、動脈硬化の進展の有無を検査する。$c$, true, 4),
  ('322986ac-5a6b-4001-adf5-23a395f99b9c', $c$振動工具取扱い作業者に対する特殊健康診断を１年に２回実施する場合、そのうち１回は冬季に行うとよい。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '29c6cd6e-5c0a-4310-8968-d4031250403c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$有害化学物質とその生物学的モニタリングの指標として用いられる尿中の代謝物等との組合せとして、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('29c6cd6e-5c0a-4310-8968-d4031250403c', $c$鉛 ……………………………………… デルタアミノレブリン酸$c$, false, 1),
  ('29c6cd6e-5c0a-4310-8968-d4031250403c', $c$スチレン ……………………………… 馬尿酸$c$, true, 2),
  ('29c6cd6e-5c0a-4310-8968-d4031250403c', $c$キシレン ……………………………… メチル馬尿酸$c$, false, 3),
  ('29c6cd6e-5c0a-4310-8968-d4031250403c', $c$ノルマルヘキサン …………………… 2,5-ヘキサンジオン$c$, false, 4),
  ('29c6cd6e-5c0a-4310-8968-d4031250403c', $c$トリクロロエチレン ………………… トリクロロ酢酸$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '843eeaf2-f60d-416d-ba16-b3f74044030c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$産業医に関する次の記述のうち、法令上、誤っているものはどれか。
ただし、産業医の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('843eeaf2-f60d-416d-ba16-b3f74044030c', $c$産業医の選任は、選任すべき事由が発生した日から14日以内に行わなければならない。$c$, false, 1),
  ('843eeaf2-f60d-416d-ba16-b3f74044030c', $c$常時使用する労働者数が2,000人を超える事業場では、産業医を２人以上選任しなければならない。$c$, true, 2),
  ('843eeaf2-f60d-416d-ba16-b3f74044030c', $c$産業医が、事業者から、毎月１回以上、所定の情報の提供を受けている場合であって、事業者の同意を得ているときは、産業医の作業場等の巡視の頻度を、毎月１回以上から２か月に１回以上にすることができる。$c$, false, 3),
  ('843eeaf2-f60d-416d-ba16-b3f74044030c', $c$事業者は、産業医から労働者の健康管理等について勧告を受けたときは、当該勧告の内容及び当該勧告を踏まえて講じた措置の内容（措置を講じない場合にあっては、その旨及びその理由）を記録し、これを３年間保存しなければならない。$c$, false, 4),
  ('843eeaf2-f60d-416d-ba16-b3f74044030c', $c$事業者は、産業医が辞任したとき又は産業医を解任したときは、遅滞なく、その旨及びその理由を衛生委員会又は安全衛生委員会に報告しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6521eb06-35ab-4b47-bb98-31ef5e2f0f0c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働衛生コンサルタントに関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6521eb06-35ab-4b47-bb98-31ef5e2f0f0c', $c$労働衛生コンサルタント試験には、保健衛生及び労働衛生工学の２つの区分がある。$c$, false, 1),
  ('6521eb06-35ab-4b47-bb98-31ef5e2f0f0c', $c$労働衛生コンサルタント試験に合格した者は、厚生労働大臣の指定する指定登録機関に備える労働衛生コンサルタント名簿に、氏名、生年月日等所定の事項の登録を受けることにより、労働衛生コンサルタントとなることができる。$c$, false, 2),
  ('6521eb06-35ab-4b47-bb98-31ef5e2f0f0c', $c$労働衛生コンサルタントは、他人の求めに応じ報酬を得て、労働者の衛生の水準の向上を図るため、事業場の衛生についての診断及びこれに基づく指導を行うことを業とする。$c$, false, 3),
  ('6521eb06-35ab-4b47-bb98-31ef5e2f0f0c', $c$労働衛生コンサルタントが、その業務に関して知り得た秘密を漏らし、又は盗用したときは、その登録を取り消されることがある。$c$, false, 4),
  ('6521eb06-35ab-4b47-bb98-31ef5e2f0f0c', $c$労働衛生コンサルタントの診断及び指導を受けた事業者は、その記録を作成して、これを３年間保存しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b28f33dd-5c7f-4149-a4ed-7d6202ffc65d',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働安全衛生規則に基づく次の定期健康診断項目のうち、厚生労働大臣が定める基準に基づき、医師が必要でないと認めるときは、省略することができる項目に該当しないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b28f33dd-5c7f-4149-a4ed-7d6202ffc65d', $c$業務歴の調査$c$, true, 1),
  ('b28f33dd-5c7f-4149-a4ed-7d6202ffc65d', $c$腹囲の検査$c$, false, 2),
  ('b28f33dd-5c7f-4149-a4ed-7d6202ffc65d', $c$胸部エックス線検査$c$, false, 3),
  ('b28f33dd-5c7f-4149-a4ed-7d6202ffc65d', $c$貧血検査$c$, false, 4),
  ('b28f33dd-5c7f-4149-a4ed-7d6202ffc65d', $c$心電図検査$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd54a9d12-af29-4c9c-8163-195bf3620d33',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働時間の状況等が一定の要件に該当する労働者に対して、法令により実施することが義務付けられている医師による面接指導に関する次の記述のうち、誤っているものはどれか。
ただし、労働者の中に、新たな技術、商品又は役務の研究開発に係る業務に従事する者、高度プロフェッショナル制度の対象者及び医師はいないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d54a9d12-af29-4c9c-8163-195bf3620d33', $c$休憩時間を除き１週間当たり40時間を超えて労働させた場合におけるその超えた時間が１か月当たり100時間を超えた労働者に対し、本人の申出の有無にかかわらず医師による面接指導を行わなければならない。$c$, true, 1),
  ('d54a9d12-af29-4c9c-8163-195bf3620d33', $c$事業者は、面接指導を実施するため、タイムカードによる記録等の客観的な方法その他の適切な方法により、労働者の労働時間の状況を把握しなければならない。$c$, false, 2),
  ('d54a9d12-af29-4c9c-8163-195bf3620d33', $c$面接指導の対象となる労働者は、事業者の指定した医師が行う面接指導を受けることを希望しない場合は、他の医師の行う面接指導を受け、その結果を証明する書面を事業者に提出することができる。$c$, false, 3),
  ('d54a9d12-af29-4c9c-8163-195bf3620d33', $c$事業者は、面接指導の結果に基づき、労働者の健康を保持するために必要な措置について、原則として、面接指導が行われた後、遅滞なく、医師の意見を聴かなければならない。$c$, false, 4),
  ('d54a9d12-af29-4c9c-8163-195bf3620d33', $c$事業者は、面接指導の結果に基づき、当該面接指導の結果の記録を作成して、これを５年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bb2d8001-a24c-4761-96b6-b85d0b84af63',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$事業場の建築物、施設等に関する措置について、労働安全衛生規則の衛生基準に違反しているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bb2d8001-a24c-4761-96b6-b85d0b84af63', $c$有害業務を行っていない事業場において、窓その他の開口部の直接外気に向かって開放することができる部分の面積が、常時床面積の20分の１以上である屋内作業場に、換気設備を設けていない。$c$, false, 1),
  ('bb2d8001-a24c-4761-96b6-b85d0b84af63', $c$常時40人の労働者を就業させている屋内作業場の気積が、設備の占める容積及び床面から３ｍを超える高さにある空間を除き400ｍ３となっている。$c$, false, 2),
  ('bb2d8001-a24c-4761-96b6-b85d0b84af63', $c$男性５人を含む常時30人の労働者が就業している事業場で、女性用には臥床することのできる休養室を設けているが、男性用には、臥床することのできない休憩設備を利用させている。$c$, false, 3),
  ('bb2d8001-a24c-4761-96b6-b85d0b84af63', $c$労働者を常時就業させる場所の作業面の照度を、精密な作業については350ルクス、粗な作業については150ルクスとしている。$c$, false, 4),
  ('bb2d8001-a24c-4761-96b6-b85d0b84af63', $c$事業場に附属する炊事場の入口には、洗浄剤を含浸させたマットを設置して、土足のままでも立ち入ることができるようにしている。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '71dfffae-d042-430a-ab93-b29221a598ba',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$週所定労働時間が20時間、週所定労働日数が３日である労働者であって、雇入れの日から起算して２年６か月継続勤務したものに対して、その後１年間に新たに与えなければならない年次有給休暇日数として、法令上、正しいものは次のうちどれか。
ただし、その労働者はその直前の１年間に全労働日の８割以上出勤したものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('71dfffae-d042-430a-ab93-b29221a598ba', $c$５日$c$, false, 1),
  ('71dfffae-d042-430a-ab93-b29221a598ba', $c$６日$c$, true, 2),
  ('71dfffae-d042-430a-ab93-b29221a598ba', $c$７日$c$, false, 3),
  ('71dfffae-d042-430a-ab93-b29221a598ba', $c$８日$c$, false, 4),
  ('71dfffae-d042-430a-ab93-b29221a598ba', $c$９日$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6a09175f-f9a7-43bd-9398-542ed2b87fd0',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働基準法に基づく労使協定による時間外・休日労働に関する次の文中の[ ]内に入れるＡからＤの数値の組合せとして、正しいものは(１)～(５)のうちどれか。
ただし、労使協定とは、「労働者の過半数で組織する労働組合（その労働組合がない場合は労働者の過半数を代表する者）と使用者との書面による協定」をいうものとし、労働時間に関する適用猶予及び適用除外はないものとする。
「労使協定による時間外労働の限度時間は、変形労働時間制が適用されていない労働者については、１か月について[Ａ]時間、１年について[Ｂ]時間とされている。ただし、事業場において通常予見することのできない業務量の大幅な増加等に伴い、臨時的に限度時間を超えて労働させる必要がある場合には、１か月について時間外労働と休日労働の合計時間を[Ｃ]時間未満、１年について時間外労働の時間を[Ｄ]時間を超えない範囲とすることができる。」
Ａ Ｂ Ｃ Ｄ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6a09175f-f9a7-43bd-9398-542ed2b87fd0', $c$45 270 80 360$c$, false, 1),
  ('6a09175f-f9a7-43bd-9398-542ed2b87fd0', $c$45 360 80 720$c$, false, 2),
  ('6a09175f-f9a7-43bd-9398-542ed2b87fd0', $c$45 360 100 720$c$, true, 3),
  ('6a09175f-f9a7-43bd-9398-542ed2b87fd0', $c$80 720 100 960$c$, false, 4),
  ('6a09175f-f9a7-43bd-9398-542ed2b87fd0', $c$80 720 120 960$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2f7a8096-e81f-4c3a-9019-67dfdf047a31',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$温熱条件に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2f7a8096-e81f-4c3a-9019-67dfdf047a31', $c$温度感覚を左右する環境要素は、気温、湿度、気流及びふく射(放射)熱である。$c$, false, 1),
  ('2f7a8096-e81f-4c3a-9019-67dfdf047a31', $c$実効温度は、人の温熱感に基礎を置いた指標で、気温、湿度及び気流の総合効果を温度目盛りで表したものである。$c$, false, 2),
  ('2f7a8096-e81f-4c3a-9019-67dfdf047a31', $c$相対湿度は、空気中の水蒸気量と、その温度における飽和水蒸気量との比を百分率で示したものである。$c$, false, 3),
  ('2f7a8096-e81f-4c3a-9019-67dfdf047a31', $c$ＷＢＧＴは、自然湿球温度、黒球温度及び気温（乾球温度）から求められる指標で、暑熱環境による熱ストレス評価に用いられる。$c$, false, 4),
  ('2f7a8096-e81f-4c3a-9019-67dfdf047a31', $c$算出したＷＢＧＴの値が、作業内容に応じて設定されたＷＢＧＴ基準値未満である場合には、熱中症が発生するリスクが高まる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '51604936-e3bc-41c1-963b-6b61a1656342',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$厚生労働省の「事業場における労働者の健康保持増進のための指針」に基づく健康保持増進対策に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('51604936-e3bc-41c1-963b-6b61a1656342', $c$健康保持増進措置は、主に生活習慣上の課題を有する労働者の健康状態の改善を目指すために個々の労働者に対して実施するものと、事業場全体の健康状態の改善や健康保持増進に係る取組の活性化等、生活習慣上の課題の有無に関わらず労働者を集団として捉えて実施するものがある。$c$, false, 1),
  ('51604936-e3bc-41c1-963b-6b61a1656342', $c$健康保持増進に関する課題の把握や目標の設定等においては、労働者の健康状態等を客観的に把握できる数値を活用することが望ましい。$c$, false, 2),
  ('51604936-e3bc-41c1-963b-6b61a1656342', $c$健康測定の結果に基づき行う健康指導には、運動指導、メンタルヘルスケア、栄養指導、口腔保健指導、保健指導が含まれる。$c$, false, 3),
  ('51604936-e3bc-41c1-963b-6b61a1656342', $c$健康保持増進対策の推進に当たっては、事業者が労働者等の意見を聴きつつ事業場の実態に即した取組を行うため、労使、産業医、衛生管理者等で構成される衛生委員会等を活用する。$c$, false, 4),
  ('51604936-e3bc-41c1-963b-6b61a1656342', $c$医療保険者と連携したコラボヘルス等の労働者の健康保持増進対策を推進するためであっても、定期健康診断の結果の記録等、労働者の健康状態等が把握できる客観的な数値等を医療保険者に提供してはならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '88328a56-5908-4efc-ac04-f28e84479224',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$骨折に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('88328a56-5908-4efc-ac04-f28e84479224', $c$単純骨折とは、骨にひびが入った状態をいう。$c$, false, 1),
  ('88328a56-5908-4efc-ac04-f28e84479224', $c$不完全骨折では、骨折端どうしが擦れ合う軋轢音や変形などが認められる。$c$, false, 2),
  ('88328a56-5908-4efc-ac04-f28e84479224', $c$骨折が疑われる部位は、よく動かしてその程度を判断する必要がある。$c$, false, 3),
  ('88328a56-5908-4efc-ac04-f28e84479224', $c$骨折に対する処置として、副子を手や足に当てるときは、骨折部分の上下の関節まで固定できる長さで、かつ、幅の広いものを用いる。$c$, true, 4),
  ('88328a56-5908-4efc-ac04-f28e84479224', $c$脊髄損傷が疑われる場合は、硬い板の上に乗せて搬送してはならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '276f9039-f232-41f6-95af-7bcee0811962',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$脳血管疾患及び虚血性心疾患に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問31'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('276f9039-f232-41f6-95af-7bcee0811962', $c$虚血性の脳血管疾患である脳梗塞は、脳血管自体の動脈硬化性病変による脳塞栓症と、心臓や動脈壁の血栓が剥がれて脳血管を閉塞する脳血栓症に分類される。$c$, true, 1),
  ('276f9039-f232-41f6-95af-7bcee0811962', $c$高血圧性脳症は、急激な血圧上昇が誘因となって、脳が腫脹する病気で、頭痛、悪心、嘔吐、意識障害、視力障害、けいれんなどの症状がみられる。$c$, false, 2),
  ('276f9039-f232-41f6-95af-7bcee0811962', $c$虚血性心疾患は、冠動脈による心筋への血液の供給が不足したり途絶えることにより起こる心筋障害である。$c$, false, 3),
  ('276f9039-f232-41f6-95af-7bcee0811962', $c$虚血性心疾患は、心筋の一部分に可逆的な虚血が起こる狭心症と、不可逆的な心筋壊死が起こる心筋梗塞とに大別される。$c$, false, 4),
  ('276f9039-f232-41f6-95af-7bcee0811962', $c$運動負荷心電図検査は、虚血性心疾患の発見に有用である。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '266aa559-362c-4085-aa5c-555c7363c6c7',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$厚生労働省の「職場における腰痛予防対策指針」に基づく、重量物取扱い作業における腰痛予防対策に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問32'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('266aa559-362c-4085-aa5c-555c7363c6c7', $c$著しく重心の偏っている荷物は、その旨を明示する。$c$, false, 1),
  ('266aa559-362c-4085-aa5c-555c7363c6c7', $c$労働者全員に腰部保護ベルトを使用させる。$c$, true, 2),
  ('266aa559-362c-4085-aa5c-555c7363c6c7', $c$満18歳以上の男性労働者が人力のみにより取り扱う物の重量は、体重のおおむね40％以下とする。$c$, false, 3),
  ('266aa559-362c-4085-aa5c-555c7363c6c7', $c$床面などから荷物を持ち上げる場合には、片足を少し前に出し、膝を曲げ、腰を十分に降ろして当該荷物をかかえ、膝を伸ばすことによって立ち上がるようにする。$c$, false, 4),
  ('266aa559-362c-4085-aa5c-555c7363c6c7', $c$当該作業に配置する際及びその後６か月以内ごとに１回、定期に、腰痛の健康診断を実施する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '379fbb75-d883-4708-9f08-8704a7a1a6e6',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$事務室内において、空気を外気と入れ換えて二酸化炭素濃度を1,000ppm以下に保った状態で、在室することのできる最大の人数は次のうちどれか。
ただし、外気の二酸化炭素濃度を400ppm、外気と入れ換える空気量を600ｍ３/ｈ、１人当たりの呼出二酸化炭素量を0.018ｍ３/ｈとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問33'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('379fbb75-d883-4708-9f08-8704a7a1a6e6', $c$14人$c$, false, 1),
  ('379fbb75-d883-4708-9f08-8704a7a1a6e6', $c$16人$c$, false, 2),
  ('379fbb75-d883-4708-9f08-8704a7a1a6e6', $c$18人$c$, false, 3),
  ('379fbb75-d883-4708-9f08-8704a7a1a6e6', $c$20人$c$, true, 4),
  ('379fbb75-d883-4708-9f08-8704a7a1a6e6', $c$22人$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6af42cfd-5cb1-4fbe-bc83-2598afd060bb',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$採光、照明などに関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問34'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6af42cfd-5cb1-4fbe-bc83-2598afd060bb', $c$照度の単位はルクスで、１ルクスは光度１カンデラの光源から10ｍ離れた所で、その光に直角な面が受ける明るさに相当する。$c$, false, 1),
  ('6af42cfd-5cb1-4fbe-bc83-2598afd060bb', $c$高齢者は、若年者に比較して、一般に、高い照度が必要であるが、水晶体の混濁により、まぶしさを感じやすくなっている場合もあるので、注意が必要である。$c$, true, 2),
  ('6af42cfd-5cb1-4fbe-bc83-2598afd060bb', $c$部屋の彩色に当たり、目の高さから上の壁及び天井は、まぶしさを防ぐため濁色にするとよい。$c$, false, 3),
  ('6af42cfd-5cb1-4fbe-bc83-2598afd060bb', $c$前方から明かりをとるとき、目と光源を結ぶ線と視線とが作る角度は、30°以下になるようにする。$c$, false, 4),
  ('6af42cfd-5cb1-4fbe-bc83-2598afd060bb', $c$全般照明の照度は、作業面の局部照明による照度の10分の１以下になるようにする。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd7317f34-14d5-4f93-a05f-a74d94189a21',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$感覚又は感覚器に関する次の記述のうち、正しいものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問35'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d7317f34-14d5-4f93-a05f-a74d94189a21', $c$物理化学的な刺激の量と人間が意識する感覚の強度とは、直線的な比例関係にある。$c$, false, 1),
  ('d7317f34-14d5-4f93-a05f-a74d94189a21', $c$皮膚感覚には、触圧覚、痛覚、温度覚(温覚・冷覚)などがあり、これらのうち冷覚を感じる冷覚点の密度は他の感覚点に比べて高い。$c$, false, 2),
  ('d7317f34-14d5-4f93-a05f-a74d94189a21', $c$内臓感覚は、内臓の動き、炎症などを感じて、内臓痛などとして部位の特定ができる鋭敏な感覚である。$c$, false, 3),
  ('d7317f34-14d5-4f93-a05f-a74d94189a21', $c$網膜の錐状体は色を感じ、杆状体は明暗を感じる。$c$, true, 4),
  ('d7317f34-14d5-4f93-a05f-a74d94189a21', $c$平衡感覚に関係する器官である前庭及び半規管は、中耳にあって、体の傾きや回転の方向を知覚する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8e650ae6-ae13-41d6-bf8f-cb07ca95c750',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$消化器系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問36'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8e650ae6-ae13-41d6-bf8f-cb07ca95c750', $c$無機塩及びビタミン類は、酵素による分解を受けないでそのまま吸収される。$c$, false, 1),
  ('8e650ae6-ae13-41d6-bf8f-cb07ca95c750', $c$唾液の成分は、ほとんどが水であるが、デンプンをより小さい糖に分解する消化酵素を含む。$c$, false, 2),
  ('8e650ae6-ae13-41d6-bf8f-cb07ca95c750', $c$ペプシノーゲンは、胃酸によってペプシンという消化酵素になり、蛋白質を分解する。$c$, false, 3),
  ('8e650ae6-ae13-41d6-bf8f-cb07ca95c750', $c$胆汁は、酸性で、消化酵素は含まないが、食物中の脂肪を乳化させ、脂肪分解の働きを助ける。$c$, true, 4),
  ('8e650ae6-ae13-41d6-bf8f-cb07ca95c750', $c$小腸の表面は、ビロード状の絨毛という小突起で覆われており、栄養素の吸収の効率を上げるために役立っている。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bf861a77-76db-4c50-893e-0d6cbad25924',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$神経系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問37'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bf861a77-76db-4c50-893e-0d6cbad25924', $c$神経細胞の細胞体が集合しているところを、中枢神経系では神経節といい、末梢神経系では神経核という。$c$, true, 1),
  ('bf861a77-76db-4c50-893e-0d6cbad25924', $c$中枢神経系は、脳と脊髄から成る。$c$, false, 2),
  ('bf861a77-76db-4c50-893e-0d6cbad25924', $c$有髄神経線維は、無髄神経線維よりも神経伝導速度が速い。$c$, false, 3),
  ('bf861a77-76db-4c50-893e-0d6cbad25924', $c$交感神経と副交感神経は、同一器官に分布していても、その作用はほぼ正反対である。$c$, false, 4),
  ('bf861a77-76db-4c50-893e-0d6cbad25924', $c$大脳の外側の皮質は、感覚、思考などの作用を支配する中枢として機能する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'da1b1475-e4c5-4bdb-a90e-0359d6fc9cde',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$肝臓の機能として、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問38'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('da1b1475-e4c5-4bdb-a90e-0359d6fc9cde', $c$コレステロールを合成する。$c$, false, 1),
  ('da1b1475-e4c5-4bdb-a90e-0359d6fc9cde', $c$尿素を合成する。$c$, false, 2),
  ('da1b1475-e4c5-4bdb-a90e-0359d6fc9cde', $c$ヘモグロビンを合成する。$c$, true, 3),
  ('da1b1475-e4c5-4bdb-a90e-0359d6fc9cde', $c$血液中の身体に有害な物質を分解する。$c$, false, 4),
  ('da1b1475-e4c5-4bdb-a90e-0359d6fc9cde', $c$グリコーゲンを合成し、及び分解する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'acfda628-6dec-4e41-8d70-02e6028fdcfc',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$腎臓又は尿に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問39'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('acfda628-6dec-4e41-8d70-02e6028fdcfc', $c$尿は淡黄色の液体で、固有の臭気を有し、通常、弱アルカリ性である。$c$, false, 1),
  ('acfda628-6dec-4e41-8d70-02e6028fdcfc', $c$血中の蛋白質は、糸球体からボウマン嚢に濾出される。$c$, false, 2),
  ('acfda628-6dec-4e41-8d70-02e6028fdcfc', $c$血中の老廃物は、尿細管からボウマン嚢に濾出される。$c$, false, 3),
  ('acfda628-6dec-4e41-8d70-02e6028fdcfc', $c$原尿中に濾出された水分の大部分は、そのまま尿として排出される。$c$, false, 4),
  ('acfda628-6dec-4e41-8d70-02e6028fdcfc', $c$原尿中に濾出された電解質の多くは、尿細管から血中に再吸収される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '28a15fdf-bc8f-4cfe-a431-0746f562a6d9',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$血液に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問40'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('28a15fdf-bc8f-4cfe-a431-0746f562a6d9', $c$血液は、血漿と有形成分から成り、血漿には、アルブミン、グロブリンなどの蛋白質が含まれている。$c$, false, 1),
  ('28a15fdf-bc8f-4cfe-a431-0746f562a6d9', $c$赤血球は、血球の中で最も多く、全血液の体積の約60％を占めている。$c$, true, 2),
  ('28a15fdf-bc8f-4cfe-a431-0746f562a6d9', $c$血小板は、核を持たない不定形の細胞で、血液凝固作用に関与している。$c$, false, 3),
  ('28a15fdf-bc8f-4cfe-a431-0746f562a6d9', $c$出血すると、血漿中のフィブリノーゲンがフィブリンに変化し、血球と結合して凝固する。$c$, false, 4),
  ('28a15fdf-bc8f-4cfe-a431-0746f562a6d9', $c$ＡＢＯ式血液型は、赤血球の血液型分類の一つで、Ａ型の血清は抗Ｂ抗体を持つ。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5ec16a54-fad5-492a-ba1c-b3b00e000f45',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$視覚に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問41'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5ec16a54-fad5-492a-ba1c-b3b00e000f45', $c$遠見視力の検査は、一般に、５ｍの距離で実施する。$c$, false, 1),
  ('5ec16a54-fad5-492a-ba1c-b3b00e000f45', $c$眼を使う作業を継続すると、硝子体の厚みを調節するときに毛様体筋の緊張や脳の疲労によって、「目が疲れる」、「目が痛い」などの症状がみられることがある。$c$, true, 2),
  ('5ec16a54-fad5-492a-ba1c-b3b00e000f45', $c$角膜が歪んでいたり、表面に凹凸があるために、眼軸などに異常がなくても、物体の像が網膜上に正しく結ばれないものを乱視という。$c$, false, 3),
  ('5ec16a54-fad5-492a-ba1c-b3b00e000f45', $c$視野とは、眼の前の一点を凝視したときに見えている空間の範囲をいい、一般に、上方及び鼻側は約60度、下方は約70度、耳側は約100度である。$c$, false, 4),
  ('5ec16a54-fad5-492a-ba1c-b3b00e000f45', $c$明るい所から急に暗い所に入ると、初めは見えにくいが、暗順応によって徐々に見えるようになる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1ab9155c-f653-4900-bfcc-8fd5d1cde2ee',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$体温調節に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問42'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1ab9155c-f653-4900-bfcc-8fd5d1cde2ee', $c$計算上、100ｇの水分が体重70㎏の人の体表面から蒸発すると、気化熱が奪われ、体温が約１℃下がる。$c$, false, 1),
  ('1ab9155c-f653-4900-bfcc-8fd5d1cde2ee', $c$体温調節にみられるように、外部環境などが変化しても身体内部の状態を一定に保とうとする性質を恒常性(ホメオスタシス)という。$c$, false, 2),
  ('1ab9155c-f653-4900-bfcc-8fd5d1cde2ee', $c$体温調節中枢は、間脳の視床下部にある。$c$, false, 3),
  ('1ab9155c-f653-4900-bfcc-8fd5d1cde2ee', $c$発汗とは、水分が皮膚から蒸発する現象をいい、不感蒸泄とは、水分が呼気により失われる現象をいう。$c$, true, 4),
  ('1ab9155c-f653-4900-bfcc-8fd5d1cde2ee', $c$寒冷な環境においては、皮膚の血管が収縮して血流量が減って、熱の放散が減少する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bad2553e-8d7f-4edc-becf-1c4d73220fa5',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$免疫に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問43'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bad2553e-8d7f-4edc-becf-1c4d73220fa5', $c$抗原とは、免疫に関係する細胞によって異物として認識される物質のことである。$c$, false, 1),
  ('bad2553e-8d7f-4edc-becf-1c4d73220fa5', $c$抗原となる物質には、蛋白質、糖質などがある。$c$, false, 2),
  ('bad2553e-8d7f-4edc-becf-1c4d73220fa5', $c$抗原に対する免疫が、逆に、人体の組織や細胞に傷害を与えてしまうことをアレルギーといい、主なアレルギー性疾患としては、気管支ぜんそく、アトピー性皮膚炎などがある。$c$, false, 3),
  ('bad2553e-8d7f-4edc-becf-1c4d73220fa5', $c$好中球は白血球の一種であり、偽足を出してアメーバ様運動を行い、体内に侵入してきた細菌などを貪食する。$c$, false, 4),
  ('bad2553e-8d7f-4edc-becf-1c4d73220fa5', $c$免疫には、リンパ球が産生する抗体によって病原体を攻撃する細胞性免疫と、リンパ球などが直接に病原体などを取り込んで排除する体液性免疫の二つがある。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a784ceb8-0806-44fc-a942-09332be93dbd',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$中高年齢者における加齢による生理機能などの変化に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第一種衛生管理者試験 問44'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a784ceb8-0806-44fc-a942-09332be93dbd', $c$加齢により、動体視力が衰える。$c$, false, 1),
  ('a784ceb8-0806-44fc-a942-09332be93dbd', $c$加齢により、体温調節機能が低下して、熱中症が起こりやすくなる。$c$, false, 2),
  ('a784ceb8-0806-44fc-a942-09332be93dbd', $c$加齢により、骨密度が減少し、筋力が低下して、骨折しやすくなる。$c$, false, 3),
  ('a784ceb8-0806-44fc-a942-09332be93dbd', $c$加齢により、平衡感覚が低下して、転びやすくなる。$c$, false, 4),
  ('a784ceb8-0806-44fc-a942-09332be93dbd', $c$老人性難聴では、1000Ｈzより低い音域の音から聞こえにくくなる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2d6549a8-8435-4fc7-bd72-419b11f3a47b',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$常時400人の労働者を使用する製造業の事業場における衛生管理体制に関する(１)～(５)の記述のうち、法令上、誤っているものはどれか。
ただし、400人中には、屋内作業場において次の業務に常時従事する者が含まれているが、その他の有害業務はないものとし、衛生管理者及び産業医の選任の特例はないものとする。
深夜業を含む業務 200人
多量の高熱物体を取り扱う業務 50人
塩素を試験研究のため取り扱う作業を行う業務 30人$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2d6549a8-8435-4fc7-bd72-419b11f3a47b', $c$総括安全衛生管理者を選任しなければならない。$c$, false, 1),
  ('2d6549a8-8435-4fc7-bd72-419b11f3a47b', $c$衛生管理者のうち少なくとも１人を専任の衛生管理者としなければならない。$c$, true, 2),
  ('2d6549a8-8435-4fc7-bd72-419b11f3a47b', $c$衛生管理者は、全て第一種衛生管理者免許を有する者のうちから選任することができる。$c$, false, 3),
  ('2d6549a8-8435-4fc7-bd72-419b11f3a47b', $c$産業医は、この事業場に専属でない者を選任することができる。$c$, false, 4),
  ('2d6549a8-8435-4fc7-bd72-419b11f3a47b', $c$特定化学物質作業主任者を選任しなくてよい。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '156a6dc8-6684-4c19-87f2-ffa6a030b53b',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$次のＡからＤの作業について、法令上、作業主任者の選任が義務付けられているものの組合せは(１)～(５)のうちどれか。
Ａ 水深10ｍ以上の場所における潜水の作業
Ｂ セメント製造工程においてセメントを袋詰めする作業
Ｃ 圧気工法により、大気圧を超える気圧下の作業室において行う作業
Ｄ 石炭を入れてあるホッパーの内部における作業$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('156a6dc8-6684-4c19-87f2-ffa6a030b53b', $c$Ａ，Ｂ$c$, false, 1),
  ('156a6dc8-6684-4c19-87f2-ffa6a030b53b', $c$Ａ，Ｃ$c$, false, 2),
  ('156a6dc8-6684-4c19-87f2-ffa6a030b53b', $c$Ａ，Ｄ$c$, false, 3),
  ('156a6dc8-6684-4c19-87f2-ffa6a030b53b', $c$Ｂ，Ｃ$c$, false, 4),
  ('156a6dc8-6684-4c19-87f2-ffa6a030b53b', $c$Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd715ac00-186b-439b-acb0-7ef540438999',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$厚生労働大臣が定める規格を具備しなければ、譲渡し、貸与し、又は設置してはならない機械等に該当するものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d715ac00-186b-439b-acb0-7ef540438999', $c$騒音計$c$, false, 1),
  ('d715ac00-186b-439b-acb0-7ef540438999', $c$放射線測定器$c$, false, 2),
  ('d715ac00-186b-439b-acb0-7ef540438999', $c$検知管方式による一酸化炭素検定器$c$, false, 3),
  ('d715ac00-186b-439b-acb0-7ef540438999', $c$アンモニア用防毒マスク$c$, true, 4),
  ('d715ac00-186b-439b-acb0-7ef540438999', $c$化学防護服$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5b730743-59b1-40d8-8422-810bb0a10d0d',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$特定化学物質障害予防規則による特別管理物質を製造する事業者が事業を廃止しようとするとき、法令に基づき実施した措置に関する次のＡからＥの記録等について、特別管理物質等関係記録等報告書に添えて、所轄労働基準監督署長に提出することが、法令上、定められているものの組合せは(１)～(５)のうちどれか。
Ａ 特別管理物質を製造する作業場所に設けられた密閉する設備、局所排気装置又はプッシュプル型換気装置の定期自主検査の記録又はその写し
Ｂ 特別管理物質を製造する作業場において、労働者が常時従事した作業の概要及び当該作業に従事した期間等の記録又はその写し
Ｃ 特別管理物質を製造する屋内作業場について行った作業環境測定の記録又はその写し
Ｄ 特別管理物質を製造する作業場所に設けられた特定化学設備の定期自主検査の記録又はその写し
Ｅ 特別管理物質を製造する業務に常時従事する労働者に対し行った特定化学物質健康診断の結果に基づく特定化学物質健康診断個人票又はその写し$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5b730743-59b1-40d8-8422-810bb0a10d0d', $c$Ａ，Ｂ，Ｄ$c$, false, 1),
  ('5b730743-59b1-40d8-8422-810bb0a10d0d', $c$Ａ，Ｃ，Ｄ$c$, false, 2),
  ('5b730743-59b1-40d8-8422-810bb0a10d0d', $c$Ａ，Ｃ，Ｅ$c$, false, 3),
  ('5b730743-59b1-40d8-8422-810bb0a10d0d', $c$Ｂ，Ｃ，Ｅ$c$, true, 4),
  ('5b730743-59b1-40d8-8422-810bb0a10d0d', $c$Ｂ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '20b167b1-ad68-4a3c-8389-f89bbe1c12fd',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働安全衛生規則の衛生基準について、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('20b167b1-ad68-4a3c-8389-f89bbe1c12fd', $c$多量のドライアイスを取り扱う業務を行う屋内作業場については、半月以内ごとに１回、定期に、当該作業場における気温、湿度及びふく射熱を測定しなければならない。$c$, true, 1),
  ('20b167b1-ad68-4a3c-8389-f89bbe1c12fd', $c$強烈な騒音を発する屋内作業場においては、その伝ぱを防ぐため、隔壁を設ける等必要な措置を講じなければならない。$c$, false, 2),
  ('20b167b1-ad68-4a3c-8389-f89bbe1c12fd', $c$屋内作業場に多量の熱を放散する溶融炉があるときは、加熱された空気を直接屋外に排出し、又はその放射するふく射熱から労働者を保護する措置を講じなければならない。$c$, false, 3),
  ('20b167b1-ad68-4a3c-8389-f89bbe1c12fd', $c$坑内における気温は、原則として、37℃以下にしなければならない。$c$, false, 4),
  ('20b167b1-ad68-4a3c-8389-f89bbe1c12fd', $c$著しく暑熱又は多湿の作業場においては、坑内等特殊な作業場でやむを得ない事由がある場合を除き、休憩の設備を作業場外に設けなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '160de9cc-aeec-4890-869a-61a325ca5648',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$次のＡからＥの粉じん発生源について、法令上、特定粉じん発生源に該当するものの組合せは(１)～(５)のうちどれか。
Ａ 屋内において、耐火物を用いた炉を解体する箇所
Ｂ 屋内の、ガラスを製造する工程において、原料を溶解炉に投げ入れる箇所
Ｃ 屋内において、研磨材を用いて手持式動力工具により金属を研磨する箇所
Ｄ 屋内において、粉状の炭素製品を袋詰めする箇所
Ｅ 屋内において、固定の溶射機により金属を溶射する箇所$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('160de9cc-aeec-4890-869a-61a325ca5648', $c$Ａ，Ｂ$c$, false, 1),
  ('160de9cc-aeec-4890-869a-61a325ca5648', $c$Ａ，Ｅ$c$, false, 2),
  ('160de9cc-aeec-4890-869a-61a325ca5648', $c$Ｂ，Ｃ$c$, false, 3),
  ('160de9cc-aeec-4890-869a-61a325ca5648', $c$Ｃ，Ｄ$c$, false, 4),
  ('160de9cc-aeec-4890-869a-61a325ca5648', $c$Ｄ，Ｅ$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0a26028b-74a9-44be-8b36-1d7be9542d58',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$酸素欠乏症等防止規則に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0a26028b-74a9-44be-8b36-1d7be9542d58', $c$し尿を入れたことのあるポンプを修理する場合で、これを分解する作業に労働者を従事させるときは、指揮者を選任し、作業を指揮させなければならない。$c$, false, 1),
  ('0a26028b-74a9-44be-8b36-1d7be9542d58', $c$パルプ液を入れたことのある槽の内部における作業については、酸素欠乏危険作業主任者技能講習を修了した者のうちから、酸素欠乏危険作業主任者を選任しなければならない。$c$, true, 2),
  ('0a26028b-74a9-44be-8b36-1d7be9542d58', $c$硫化水素中毒とは、硫化水素の濃度が10ppmを超える空気を吸入することにより生ずる症状が認められる状態をいう。$c$, false, 3),
  ('0a26028b-74a9-44be-8b36-1d7be9542d58', $c$タンクの内部その他通風が不十分な場所において、アルゴン等を使用して行う溶接の作業に労働者を従事させるときは、作業を行う場所の空気中の酸素の濃度を18％以上に保つように換気し、又は労働者に空気呼吸器、酸素呼吸器若しくは送気マスクを使用させなければならない。$c$, false, 4),
  ('0a26028b-74a9-44be-8b36-1d7be9542d58', $c$第一種酸素欠乏危険作業を行う作業場については、その日の作業を開始する前に、当該作業場における空気中の酸素の濃度を測定しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b7463bf4-344d-4693-96e9-b056c45a9c8e',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$有害業務を行う作業場とその作業場において定期に測定することが義務付けられている項目の組合せとして、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b7463bf4-344d-4693-96e9-b056c45a9c8e', $c$溶融ガラスからガラス製品を成型する業務を行う屋内作業場 ……… 空気中の粉じんの濃度$c$, true, 1),
  ('b7463bf4-344d-4693-96e9-b056c45a9c8e', $c$加硫がまによりゴムを加硫する業務を行う屋内作業場 ……… 気温及び湿度$c$, false, 2),
  ('b7463bf4-344d-4693-96e9-b056c45a9c8e', $c$ドラムバーカーにより、木材を削皮する業務を行う屋内作業場 ……… 等価騒音レベル$c$, false, 3),
  ('b7463bf4-344d-4693-96e9-b056c45a9c8e', $c$エックス線装置を用いて透過写真撮影の業務を行う作業場の管理区域 ……… 線量当量率又は線量当量$c$, false, 4),
  ('b7463bf4-344d-4693-96e9-b056c45a9c8e', $c$廃棄物の焼却施設において焼却灰を取り扱う業務(設備の解体等に伴うものを除く。)を行う作業場 ………… 空気中のダイオキシン類の濃度$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '07155f82-cf4b-4320-ae56-9574ab49110d',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$有機溶剤等を取り扱う場合の措置について、有機溶剤中毒予防規則に違反しているものは次のうちどれか。
ただし、同規則に定める適用除外及び設備の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('07155f82-cf4b-4320-ae56-9574ab49110d', $c$地下室の内部で第一種有機溶剤等を用いて作業を行わせるとき、その作業場所に局所排気装置を設け、有効に稼働させているが、作業者に送気マスクも有機ガス用防毒マスクも使用させていない。$c$, false, 1),
  ('07155f82-cf4b-4320-ae56-9574ab49110d', $c$地下室の内部で第二種有機溶剤等を用いて作業を行わせるとき、その作業場所にプッシュプル型換気装置を設けブース内の気流の乱れもなく稼働させているが、作業者に送気マスクも有機ガス用防毒マスクも使用させていない。$c$, false, 2),
  ('07155f82-cf4b-4320-ae56-9574ab49110d', $c$地下室の内部で第三種有機溶剤等を用いて吹付けによる作業を行わせるとき、その作業場所に全体換気装置を設け有効に稼働させ、作業者に有機ガス用防毒マスクを使用させている。$c$, true, 3),
  ('07155f82-cf4b-4320-ae56-9574ab49110d', $c$屋内作業場に設けた空気清浄装置のない局所排気装置の排気口で、厚生労働大臣が定める濃度以上の有機溶剤を排出するものの高さを、屋根から２ｍとしている。$c$, false, 4),
  ('07155f82-cf4b-4320-ae56-9574ab49110d', $c$有機溶剤等を入れてあった空容器で有機溶剤の蒸気が発散するおそれのあるものを、屋外の一定の場所に集積している。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5fdf900a-70d1-4c96-b5ab-0c1d9e005152',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの)'),
  $q$労働基準法に基づく時間外労働に関する協定を締結し、所轄労働基準監督署長への届出を行うとき、延長する労働時間が１日について２時間以内に制限されない業務は、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5fdf900a-70d1-4c96-b5ab-0c1d9e005152', $c$著しく暑熱な場所における業務$c$, false, 1),
  ('5fdf900a-70d1-4c96-b5ab-0c1d9e005152', $c$多量の低温物体を取り扱う業務$c$, false, 2),
  ('5fdf900a-70d1-4c96-b5ab-0c1d9e005152', $c$ヘリウム、アルゴン等の不活性の気体を入れたことのあるタンクの内部における業務$c$, true, 3),
  ('5fdf900a-70d1-4c96-b5ab-0c1d9e005152', $c$削岩機、鋲打機等の使用によって身体に著しい振動を与える業務$c$, false, 4),
  ('5fdf900a-70d1-4c96-b5ab-0c1d9e005152', $c$土石、獣毛等のじんあい又は粉末を著しく飛散する場所における業務$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1a4bbd4a-754a-4b13-8a72-e4277498c205',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$化学物質とその常温・常圧(25℃、１気圧)での空気中における状態との組合せとして、誤っているものは次のうちどれか。
ただし、ガスとは、常温・常圧で気体のものをいい、蒸気とは、常温・常圧で液体又は固体の物質が蒸気圧に応じて揮発又は昇華して気体となっているものをいうものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1a4bbd4a-754a-4b13-8a72-e4277498c205', $c$ホルムアルデヒド ……………………… ガス$c$, false, 1),
  ('1a4bbd4a-754a-4b13-8a72-e4277498c205', $c$塩化ビニル ……………………………… ガス$c$, false, 2),
  ('1a4bbd4a-754a-4b13-8a72-e4277498c205', $c$アクリロニトリル ……………………… ガス$c$, true, 3),
  ('1a4bbd4a-754a-4b13-8a72-e4277498c205', $c$二硫化炭素 ……………………………… 蒸気$c$, false, 4),
  ('1a4bbd4a-754a-4b13-8a72-e4277498c205', $c$アセトン ………………………………… 蒸気$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0e59e2e3-b44d-40d9-8f65-de901b1f1e91',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$金属などによる健康障害に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0e59e2e3-b44d-40d9-8f65-de901b1f1e91', $c$ベリリウム中毒では、溶血性貧血、尿の赤色化などの症状がみられる。$c$, true, 1),
  ('0e59e2e3-b44d-40d9-8f65-de901b1f1e91', $c$砒素中毒では、角化症、黒皮症などの皮膚障害、末梢神経障害などがみられる。$c$, false, 2),
  ('0e59e2e3-b44d-40d9-8f65-de901b1f1e91', $c$マンガン中毒では、筋のこわばり、震え、歩行困難などのパーキンソン病に似た症状がみられる。$c$, false, 3),
  ('0e59e2e3-b44d-40d9-8f65-de901b1f1e91', $c$カドミウム中毒では、上気道炎、肺炎、腎機能障害などがみられる。$c$, false, 4),
  ('0e59e2e3-b44d-40d9-8f65-de901b1f1e91', $c$金属水銀中毒では、感情不安定、幻覚などの精神障害がみられる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '37efbe63-df4b-4a84-83d5-8d4e843e2136',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$粉じんによる健康障害に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('37efbe63-df4b-4a84-83d5-8d4e843e2136', $c$米杉、ラワンなどの木材粉じんは、ぜんそくを起こすことがある。$c$, false, 1),
  ('37efbe63-df4b-4a84-83d5-8d4e843e2136', $c$じん肺の自覚症状は、初期にはあまりみられないが、進行すると咳、痰、呼吸困難などがみられる。$c$, false, 2),
  ('37efbe63-df4b-4a84-83d5-8d4e843e2136', $c$じん肺は、続発性気管支炎、肺結核などを合併することがある。$c$, false, 3),
  ('37efbe63-df4b-4a84-83d5-8d4e843e2136', $c$石綿肺では、胸膜の肥厚(プラーク)、胸膜の石灰化などがみられる。$c$, false, 4),
  ('37efbe63-df4b-4a84-83d5-8d4e843e2136', $c$けい肺は、鉄、アルミニウムなどの金属粉じんを吸入することによって発症するじん肺である。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ac199aa6-01f5-48ff-9d53-4a45c90b5cef',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$作業環境における騒音及びそれによる健康障害に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ac199aa6-01f5-48ff-9d53-4a45c90b5cef', $c$騒音性難聴の初期に認められる4,000Ｈz付近の音から始まる聴力低下の型をｃ５dipという。$c$, false, 1),
  ('ac199aa6-01f5-48ff-9d53-4a45c90b5cef', $c$音圧レベルは、通常、人間が聴くことができる最も小さな音圧に対する比の常用対数を20倍して求められる。$c$, false, 2),
  ('ac199aa6-01f5-48ff-9d53-4a45c90b5cef', $c$騒音は、自律神経系や内分泌系へも影響を与えるため、騒音ばく露により、交感神経の活動の亢進や副腎皮質ホルモンの分泌の増加が認められることがある。$c$, false, 3),
  ('ac199aa6-01f5-48ff-9d53-4a45c90b5cef', $c$人が聴くことのできる音の周波数は、10Ｈzから30,000Ｈz程度までであり、このうち会話音域は2,000Ｈzから4,000Ｈz程度までである。$c$, true, 4),
  ('ac199aa6-01f5-48ff-9d53-4a45c90b5cef', $c$等価騒音レベルは、時間的に変動する騒音レベルのエネルギー的な平均値を表す量で、変動する騒音に対する人間の生理・心理的反応とよく対応している。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bf654903-15b8-4730-8923-f11885704641',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$厚生労働省の「化学物質等による危険性又は有害性等の調査等に関する指針」に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bf654903-15b8-4730-8923-f11885704641', $c$リスクアセスメントの基本的手順のうち最初に実施するのは、労働者の就業に係るリスクアセスメント対象物による危険性又は有害性を特定することである。$c$, false, 1),
  ('bf654903-15b8-4730-8923-f11885704641', $c$ハザードは、労働災害発生の可能性と負傷又は疾病の重大性(重篤度)の組合せであると定義される。$c$, true, 2),
  ('bf654903-15b8-4730-8923-f11885704641', $c$リスクアセスメント対象物による疾病のリスク低減措置の検討では、リスクアセスメント対象物の有害性に応じた有効な保護具の使用よりも作業手順の改善、立入禁止等の管理的対策を優先する。$c$, false, 3),
  ('bf654903-15b8-4730-8923-f11885704641', $c$リスクアセスメント対象物による疾病のリスク低減措置の検討では、法令に定められた事項を除けば、危険性又は有害性のより低い物質への代替等を最優先する。$c$, false, 4),
  ('bf654903-15b8-4730-8923-f11885704641', $c$リスクアセスメント対象物による疾病のリスク低減措置の検討に当たっては、より優先順位の高い措置を実施することにした場合であって、当該措置により十分にリスクが低減される場合には、当該措置よりも優先順位の低い措置の検討は必要ない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'cf7ef20c-33e6-45a5-b440-9fc38f0863cf',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$有機溶剤の人体に対する影響に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cf7ef20c-33e6-45a5-b440-9fc38f0863cf', $c$脂溶性があり、脂肪の多い脳などに入りやすい。$c$, false, 1),
  ('cf7ef20c-33e6-45a5-b440-9fc38f0863cf', $c$呼吸器の症状には、咳、上気道の炎症などがある。$c$, false, 2),
  ('cf7ef20c-33e6-45a5-b440-9fc38f0863cf', $c$低濃度の繰り返しばく露による慢性中毒では、めまい、不眠などの不定愁訴がみられる。$c$, false, 3),
  ('cf7ef20c-33e6-45a5-b440-9fc38f0863cf', $c$皮膚や粘膜に対する症状には、黒皮症、鼻中隔穿孔などがある。$c$, true, 4),
  ('cf7ef20c-33e6-45a5-b440-9fc38f0863cf', $c$肝機能障害や腎機能障害を起こすものがある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b2137ffb-7a76-4a82-8987-490d57d7efe3',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$特殊健康診断に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b2137ffb-7a76-4a82-8987-490d57d7efe3', $c$有害業務への配置替えの際に行う特殊健康診断には、業務適性の判断と、その後の業務による影響を調べるための基礎資料を得るという目的がある。$c$, false, 1),
  ('b2137ffb-7a76-4a82-8987-490d57d7efe3', $c$特殊健康診断が法定労働時間外に行われた場合には、割増賃金を支払う必要がある。$c$, false, 2),
  ('b2137ffb-7a76-4a82-8987-490d57d7efe3', $c$眼底検査は、電離放射線健康診断で実施され、動脈硬化の進展の有無を検査する。$c$, true, 3),
  ('b2137ffb-7a76-4a82-8987-490d57d7efe3', $c$振動工具取扱い作業者に対する特殊健康診断を１年に２回実施する場合、そのうち１回は冬季に行うとよい。$c$, false, 4),
  ('b2137ffb-7a76-4a82-8987-490d57d7efe3', $c$特殊健康診断において適切な健診デザインを行うためには、作業内容と有害要因へのばく露状況を把握する必要がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '45991464-ca64-48b9-8def-485d0249eda8',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$厚生労働省の「作業環境測定基準」及び「作業環境評価基準」に基づく作業環境測定及びその結果の評価に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('45991464-ca64-48b9-8def-485d0249eda8', $c$Ａ測定の第二評価値が管理濃度を超えている単位作業場所は、Ｂ測定の結果に関係なく第三管理区分になる。$c$, true, 1),
  ('45991464-ca64-48b9-8def-485d0249eda8', $c$Ａ測定における測定点の高さの範囲は、床上100㎝以上150㎝以下である。$c$, false, 2),
  ('45991464-ca64-48b9-8def-485d0249eda8', $c$Ａ測定は、原材料を反応槽へ投入する場合など、間欠的に大量の有害物質の発散を伴う作業における最高濃度を知るために行う測定である。$c$, false, 3),
  ('45991464-ca64-48b9-8def-485d0249eda8', $c$評価の指標として用いられる管理濃度は、個々の労働者の有害物質へのばく露限界を示すものである。$c$, false, 4),
  ('45991464-ca64-48b9-8def-485d0249eda8', $c$Ｂ測定の測定値が管理濃度を超えている単位作業場所は、Ａ測定の結果に関係なく第三管理区分になる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5c959c4a-3b32-4ee1-bf30-9915b506f14f',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$呼吸用保護具に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5c959c4a-3b32-4ee1-bf30-9915b506f14f', $c$防毒マスクの吸収缶の色は、アンモニア用は緑色で、有機ガス用は黒色である。$c$, true, 1),
  ('5c959c4a-3b32-4ee1-bf30-9915b506f14f', $c$２種類以上の有害ガスが混在している場合には、そのうち最も毒性の強いガス用の防毒マスクを使用する。$c$, false, 2),
  ('5c959c4a-3b32-4ee1-bf30-9915b506f14f', $c$型式検定合格標章のある防じんマスクでも、ヒュームのような微細な粒子に対しては効果がない。$c$, false, 3),
  ('5c959c4a-3b32-4ee1-bf30-9915b506f14f', $c$防じんマスクは、オイルミストが堆積しても粒子捕集効率は低下しないので、吸気抵抗が上昇しない限り使用することができる。$c$, false, 4),
  ('5c959c4a-3b32-4ee1-bf30-9915b506f14f', $c$エアラインマスクは、自給式呼吸器の一種である。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b6f5284e-322c-4e54-a02c-9f2b58e1d20f',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務を含む)'),
  $q$作業環境における有害要因による健康障害に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b6f5284e-322c-4e54-a02c-9f2b58e1d20f', $c$電離放射線の被ばくによる白内障は、晩発障害に分類され、被ばく後、半年～30年後に現れる。$c$, true, 1),
  ('b6f5284e-322c-4e54-a02c-9f2b58e1d20f', $c$マイクロ波は、赤外線より波長が短い電磁波で、照射部位の組織を加熱する作用がある。$c$, false, 2),
  ('b6f5284e-322c-4e54-a02c-9f2b58e1d20f', $c$金属熱は、金属の溶融作業において、高温環境により体温調節中枢が麻痺することにより発生し、長期間にわたる発熱、関節痛などの症状がみられる。$c$, false, 3),
  ('b6f5284e-322c-4e54-a02c-9f2b58e1d20f', $c$凍瘡は、皮膚組織の凍結壊死を伴うしもやけのことで、０℃以下の寒冷にばく露することによって発生する。$c$, false, 4),
  ('b6f5284e-322c-4e54-a02c-9f2b58e1d20f', $c$潜水業務における減圧症は、浮上による減圧に伴い、血液中に溶け込んでいた酸素が気泡となり、血管を閉塞したり組織を圧迫することにより発生する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6fe5768d-ad4f-432a-b165-25d62fbf8f86',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$衛生管理者が管理すべき業務として、法令上、定められていないものは次のうちどれか。
ただし、次のそれぞれの業務のうち衛生に係る技術的事項に限るものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6fe5768d-ad4f-432a-b165-25d62fbf8f86', $c$労働災害の原因の調査及び再発防止対策に関すること。$c$, false, 1),
  ('6fe5768d-ad4f-432a-b165-25d62fbf8f86', $c$安全衛生に関する方針の表明に関すること。$c$, false, 2),
  ('6fe5768d-ad4f-432a-b165-25d62fbf8f86', $c$少なくとも毎日１回作業場等を巡視し、衛生状態に有害のおそれがあるときは、直ちに、労働者の健康障害を防止するため必要な措置を講ずること。$c$, true, 3),
  ('6fe5768d-ad4f-432a-b165-25d62fbf8f86', $c$化学物質等による危険性又は有害性等の調査及びその結果に基づき講ずる措置に関すること。$c$, false, 4),
  ('6fe5768d-ad4f-432a-b165-25d62fbf8f86', $c$健康診断の実施その他健康の保持増進のための措置に関すること。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8f8677bb-adc4-4a46-b4e4-444d2ca3026a',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$衛生委員会に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8f8677bb-adc4-4a46-b4e4-444d2ca3026a', $c$衛生委員会の議長を除く委員の半数については、事業場に労働者の過半数で組織する労働組合がないときは、労働者の過半数を代表する者の推薦に基づき指名しなければならない。$c$, false, 1),
  ('8f8677bb-adc4-4a46-b4e4-444d2ca3026a', $c$衛生委員会の議長は、原則として、総括安全衛生管理者又は総括安全衛生管理者以外の者で事業場においてその事業の実施を統括管理するもの若しくはこれに準ずる者のうちから事業者が指名した委員がなるものとする。$c$, false, 2),
  ('8f8677bb-adc4-4a46-b4e4-444d2ca3026a', $c$事業場に専属ではないが、衛生管理者として選任している労働衛生コンサルタントを、衛生委員会の委員として指名することができる。$c$, false, 3),
  ('8f8677bb-adc4-4a46-b4e4-444d2ca3026a', $c$作業環境測定を外部の作業環境測定機関に委託して実施している場合、当該作業環境測定を実施している作業環境測定士を、衛生委員会の委員として指名することができる。$c$, true, 4),
  ('8f8677bb-adc4-4a46-b4e4-444d2ca3026a', $c$衛生委員会の付議事項には、長時間にわたる労働による労働者の健康障害の防止を図るための対策の樹立に関することが含まれる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b8836a20-be27-4048-9206-8b83642322a6',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$常時使用する労働者数が100人の事業場で、法令上、総括安全衛生管理者の選任が義務付けられている業種は、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b8836a20-be27-4048-9206-8b83642322a6', $c$医療業$c$, false, 1),
  ('b8836a20-be27-4048-9206-8b83642322a6', $c$熱供給業$c$, false, 2),
  ('b8836a20-be27-4048-9206-8b83642322a6', $c$通信業$c$, false, 3),
  ('b8836a20-be27-4048-9206-8b83642322a6', $c$水道業$c$, false, 4),
  ('b8836a20-be27-4048-9206-8b83642322a6', $c$清掃業$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd117b09e-44e1-4b30-9476-77cb92d0fdb0',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働安全衛生法に基づく心理的な負担の程度を把握するための検査の結果に基づき実施する面接指導に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d117b09e-44e1-4b30-9476-77cb92d0fdb0', $c$常時50人以上の労働者を使用する事業者は、１年以内ごとに１回、定期に、心理的な負担の程度を把握するための検査及び面接指導の結果を所轄労働基準監督署長に報告しなければならない。$c$, true, 1),
  ('d117b09e-44e1-4b30-9476-77cb92d0fdb0', $c$事業者は、面接指導の対象となる労働者の要件に該当する労働者から申出があったときは、申出の日から３か月以内に、面接指導を行わなければならない。$c$, false, 2),
  ('d117b09e-44e1-4b30-9476-77cb92d0fdb0', $c$事業者は、面接指導を行った場合は、当該面接指導の結果を当該事業場の当該部署に所属する労働者の集団その他の一定規模の集団ごとに集計し、その結果について分析しなければならない。$c$, false, 3),
  ('d117b09e-44e1-4b30-9476-77cb92d0fdb0', $c$面接指導の結果は、健康診断個人票に記載しなければならない。$c$, false, 4),
  ('d117b09e-44e1-4b30-9476-77cb92d0fdb0', $c$面接指導を行う医師として事業者が指名できる医師は、法定の研修を修了した医師に限られる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '02146b4a-bbd9-466c-a766-84e02235449f',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$事業場の建築物、施設等に関する措置について、労働安全衛生規則の衛生基準に違反しているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('02146b4a-bbd9-466c-a766-84e02235449f', $c$常時40人の労働者を就業させている屋内作業場の気積が、設備の占める容積及び床面から３ｍを超える高さにある空間を除き400ｍ３となっている。$c$, false, 1),
  ('02146b4a-bbd9-466c-a766-84e02235449f', $c$ねずみ、昆虫等の発生場所、生息場所及び侵入経路並びにねずみ、昆虫等による被害の状況について、６か月ごとに１回、定期に、統一的に調査を実施し、その調査結果に基づき、必要な措置を講じている。$c$, false, 2),
  ('02146b4a-bbd9-466c-a766-84e02235449f', $c$男性５人を含む常時30人の労働者が就業している事業場で、女性用には臥床することのできる休養室を設けているが、男性用には、臥床することのできない休憩設備を利用させている。$c$, false, 3),
  ('02146b4a-bbd9-466c-a766-84e02235449f', $c$事業場に附属する食堂の床面積を、食事の際の１人について、１ｍ２を超えるようにしている。$c$, false, 4),
  ('02146b4a-bbd9-466c-a766-84e02235449f', $c$事業場に附属する炊事場の入口には、洗浄剤を含浸させたマットを設置して、土足のままでも立ち入ることができるようにしている。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b7e4ebc5-b28e-4402-ba60-f02af38fa848',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$労働基準法における労働時間等に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b7e4ebc5-b28e-4402-ba60-f02af38fa848', $c$監視又は断続的労働に従事する労働者であって、所轄労働基準監督署長の許可を受けたものについては、労働時間、休憩及び休日に関する規定は適用されない。$c$, true, 1),
  ('b7e4ebc5-b28e-4402-ba60-f02af38fa848', $c$１日８時間を超えて労働させることができるのは、時間外労働の協定を締結し、これを所轄労働基準監督署長に届け出た場合に限られている。$c$, false, 2),
  ('b7e4ebc5-b28e-4402-ba60-f02af38fa848', $c$フレックスタイム制の清算期間は、６か月以内の期間に限られる。$c$, false, 3),
  ('b7e4ebc5-b28e-4402-ba60-f02af38fa848', $c$満20歳未満の者については、時間外・休日労働をさせることはできない。$c$, false, 4),
  ('b7e4ebc5-b28e-4402-ba60-f02af38fa848', $c$労働時間が８時間を超える場合においては少なくとも60分、12時間を超える場合においては少なくとも90分の休憩時間を労働時間の途中に与えなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a3b53f66-c155-479f-a0e9-c77dab0729a1',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '関係法令(有害業務に係るもの以外のもの)'),
  $q$週所定労働時間が24時間、週所定労働日数が４日である労働者であって、雇入れの日から起算して３年６か月継続勤務したものに対して、その後１年間に新たに与えなければならない年次有給休暇日数として、法令上、正しいものは次のうちどれか。
ただし、その労働者はその直前の１年間に全労働日の８割以上出勤したものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a3b53f66-c155-479f-a0e9-c77dab0729a1', $c$９日$c$, false, 1),
  ('a3b53f66-c155-479f-a0e9-c77dab0729a1', $c$10日$c$, true, 2),
  ('a3b53f66-c155-479f-a0e9-c77dab0729a1', $c$11日$c$, false, 3),
  ('a3b53f66-c155-479f-a0e9-c77dab0729a1', $c$12日$c$, false, 4),
  ('a3b53f66-c155-479f-a0e9-c77dab0729a1', $c$13日$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1f096753-785d-4831-9603-5ced2884c1e8',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$厚生労働省の「労働者の心の健康の保持増進のための指針」に基づくメンタルヘルスケアの実施に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1f096753-785d-4831-9603-5ced2884c1e8', $c$心の健康づくり計画の実施に当たっては、メンタルヘルス不調を未然に防止する「一次予防」、メンタルヘルス不調を早期に発見し、適切な措置を行う「二次予防」及びメンタルヘルス不調となった労働者の職場復帰支援等を行う「三次予防」が円滑に行われるようにする必要がある。$c$, false, 1),
  ('1f096753-785d-4831-9603-5ced2884c1e8', $c$プライバシー保護の観点から、衛生委員会や安全衛生委員会において、ストレスチェック制度に関する調査審議とメンタルヘルスケアに関する調査審議を関連付けて行うことは避ける。$c$, true, 2),
  ('1f096753-785d-4831-9603-5ced2884c1e8', $c$「セルフケア」とは、労働者自身がストレスや心の健康について理解し、自らのストレスを予防、軽減する、あるいはこれに対処することである。$c$, false, 3),
  ('1f096753-785d-4831-9603-5ced2884c1e8', $c$心の健康問題を抱える労働者に対して、健康問題以外の観点から評価が行われる傾向が強いという問題があることに留意する。$c$, false, 4),
  ('1f096753-785d-4831-9603-5ced2884c1e8', $c$労働者の心の健康は、職場配置、人事異動、職場の組織等の要因によって影響を受ける可能性があるため、人事労務管理部門と連携するようにする。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4310edd0-ae31-45b1-a715-68737f25513f',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$厚生労働省の「事業場における労働者の健康保持増進のための指針」に基づく健康保持増進対策に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4310edd0-ae31-45b1-a715-68737f25513f', $c$健康保持増進措置は、主に生活習慣上の課題を有する労働者の健康状態の改善を目指すために個々の労働者に対して実施するものと、事業場全体の健康状態の改善や健康保持増進に係る取組の活性化等、生活習慣上の課題の有無に関わらず労働者を集団として捉えて実施するものがある。$c$, false, 1),
  ('4310edd0-ae31-45b1-a715-68737f25513f', $c$健康保持増進に関する課題の把握や目標の設定等においては、労働者の健康状態等を客観的に把握できる数値を活用することが望ましい。$c$, false, 2),
  ('4310edd0-ae31-45b1-a715-68737f25513f', $c$健康測定の結果に基づき行う健康指導には、運動指導、メンタルヘルスケア、栄養指導、口腔保健指導、保健指導が含まれる。$c$, false, 3),
  ('4310edd0-ae31-45b1-a715-68737f25513f', $c$健康保持増進対策の推進に当たっては、事業者が労働者等の意見を聴きつつ事業場の実態に即した取組を行うため、労使、産業医、衛生管理者等で構成される衛生委員会等を活用する。$c$, false, 4),
  ('4310edd0-ae31-45b1-a715-68737f25513f', $c$医療保険者と連携したコラボヘルス等の労働者の健康保持増進対策を推進するためであっても、定期健康診断の結果の記録等、労働者の健康状態等が把握できる客観的な数値等を医療保険者に提供してはならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '41ffdc46-93fc-4e01-87e7-246f50ef27e3',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$食中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('41ffdc46-93fc-4e01-87e7-246f50ef27e3', $c$毒素型食中毒は、食物に付着した細菌により産生された毒素によって起こる食中毒で、ボツリヌス菌によるものがある。$c$, false, 1),
  ('41ffdc46-93fc-4e01-87e7-246f50ef27e3', $c$感染型食中毒は、食物に付着した細菌そのものの感染によって起こる食中毒で、サルモネラ菌によるものがある。$c$, false, 2),
  ('41ffdc46-93fc-4e01-87e7-246f50ef27e3', $c$Ｏ-157やＯ-111は、ベロ毒素を産生する大腸菌で、これらによる食中毒は、腹痛や出血を伴う水様性の下痢などの症状を呈する。$c$, false, 3),
  ('41ffdc46-93fc-4e01-87e7-246f50ef27e3', $c$ノロウイルスの失活化には、煮沸消毒又は塩素系の消毒剤が効果的である。$c$, false, 4),
  ('41ffdc46-93fc-4e01-87e7-246f50ef27e3', $c$魚、チーズなどに含まれるヒスチジンが細菌により分解されて生成するヒスタミンは、加熱により分解される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ba01397e-1928-4f72-93a7-094e1addecea',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$虚血性心疾患に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問31'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ba01397e-1928-4f72-93a7-094e1addecea', $c$運動負荷心電図検査は、心筋の異常や不整脈の発見には役立つが、虚血性心疾患の発見には有用でない。$c$, true, 1),
  ('ba01397e-1928-4f72-93a7-094e1addecea', $c$虚血性心疾患は、狭心症と心筋梗塞とに大別される。$c$, false, 2),
  ('ba01397e-1928-4f72-93a7-094e1addecea', $c$狭心症は、心臓の血管の一部の血流が一時的に悪くなる病気である。$c$, false, 3),
  ('ba01397e-1928-4f72-93a7-094e1addecea', $c$心筋梗塞では、突然激しい胸痛が起こり、「締め付けられるように痛い」、「胸が苦しい」などの症状が長時間続き、１時間以上になることもある。$c$, false, 4),
  ('ba01397e-1928-4f72-93a7-094e1addecea', $c$狭心症の痛みの場所は、心筋梗塞とほぼ同じであるが、その発作が続く時間は、通常数分程度で、長くても15分以内におさまることが多い。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '74c68875-7e5a-418a-a314-bfd79f2c4b8c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$骨折及びその救急処置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問32'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('74c68875-7e5a-418a-a314-bfd79f2c4b8c', $c$開放骨折のことを複雑骨折という。$c$, false, 1),
  ('74c68875-7e5a-418a-a314-bfd79f2c4b8c', $c$複雑骨折は、感染が起こりやすく治りにくい。$c$, false, 2),
  ('74c68875-7e5a-418a-a314-bfd79f2c4b8c', $c$骨折部を副子で固定するときには、骨折した部分が変形していても、そのままの状態を保持して、直近の関節部を含めた広い範囲を固定する。$c$, false, 3),
  ('74c68875-7e5a-418a-a314-bfd79f2c4b8c', $c$単純骨折とは、骨にひびが入った状態のことをいう。$c$, true, 4),
  ('74c68875-7e5a-418a-a314-bfd79f2c4b8c', $c$完全骨折では、骨折端どうしが擦れ合う軋轢音が認められることがある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e933ca8c-589f-43d2-8a18-635970a7386c',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$労働衛生管理に用いられる統計に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問33'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e933ca8c-589f-43d2-8a18-635970a7386c', $c$健康管理統計において、ある時点での検査における有所見者の割合を有所見率といい、これは発生率と同じ意味で用いられる。$c$, true, 1),
  ('e933ca8c-589f-43d2-8a18-635970a7386c', $c$集団を比較する場合、調査の対象とした項目のデータの平均値が等しくても分散が異なっていれば、異なった特徴をもつ集団であると評価される。$c$, false, 2),
  ('e933ca8c-589f-43d2-8a18-635970a7386c', $c$ばらつきをもって分布するデータの代表値として、平均値、中央値などがあるが、どの代表値を選択するかは、データの内容と分布による。$c$, false, 3),
  ('e933ca8c-589f-43d2-8a18-635970a7386c', $c$ある事象と健康事象との間に、統計上、一方が多いと他方も多いというような相関関係が認められたとしても、それらの間に因果関係があるとは限らない。$c$, false, 4),
  ('e933ca8c-589f-43d2-8a18-635970a7386c', $c$病休度数率は、在籍労働者の延べ実労働時間数100万時間当たりの疾病休業件数で示される。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '9568b072-4386-4205-9a44-3d05b67afc99',
  (SELECT id FROM exam_types WHERE code = 'type1'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type1' AND c.name = '労働衛生(有害業務に係るもの以外のもの)'),
  $q$ＢＭＩに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問34'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9568b072-4386-4205-9a44-3d05b67afc99', $c$ＢＭＩは肥満や低体重（痩せ）の判定に用いられる指数で、この数値が大きいほど肥満の傾向があり、小さいほど痩せの傾向がある。$c$, false, 1),
  ('9568b072-4386-4205-9a44-3d05b67afc99', $c$ＢＭＩによる肥満度の判定基準には、男性と女性とで同一の数値が用いられる。$c$, false, 2),
  ('9568b072-4386-4205-9a44-3d05b67afc99', $c$ＢＭＩは、内臓脂肪の重量と直線的な比例関係にある。$c$, true, 3),
  ('9568b072-4386-4205-9a44-3d05b67afc99', $c$ＢＭＩが22になる場合の体重は、標準体重といわれる。$c$, false, 4),
  ('9568b072-4386-4205-9a44-3d05b67afc99', $c$ＢＭＩが18.5以上25未満の範囲となる場合の体重は、普通体重といわれる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f8ea7e78-08f4-4d70-81e4-8f3b090bd0db',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$腎臓又は尿に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問35'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f8ea7e78-08f4-4d70-81e4-8f3b090bd0db', $c$血中の蛋白質は、糸球体からボウマン嚢に濾出される。$c$, false, 1),
  ('f8ea7e78-08f4-4d70-81e4-8f3b090bd0db', $c$血中の老廃物は、尿細管からボウマン嚢に濾出される。$c$, false, 2),
  ('f8ea7e78-08f4-4d70-81e4-8f3b090bd0db', $c$原尿中に濾出された水分の大部分は、そのまま尿として排出される。$c$, false, 3),
  ('f8ea7e78-08f4-4d70-81e4-8f3b090bd0db', $c$尿は淡黄色の液体で、固有の臭気を有し、通常、弱アルカリ性である。$c$, false, 4),
  ('f8ea7e78-08f4-4d70-81e4-8f3b090bd0db', $c$原尿中に濾出された電解質の多くは、尿細管から血中に再吸収される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '85882294-cc3a-4010-8ef6-94f554f930db',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$心臓及び血液循環に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問36'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('85882294-cc3a-4010-8ef6-94f554f930db', $c$心臓の中にある洞結節(洞房結節)で発生した刺激が、刺激伝導系を介して心筋に伝わることにより、心臓は規則正しく収縮と拡張を繰り返す。$c$, false, 1),
  ('85882294-cc3a-4010-8ef6-94f554f930db', $c$心臓の拍動は、自律神経の支配を受けている。$c$, false, 2),
  ('85882294-cc3a-4010-8ef6-94f554f930db', $c$体循環では、血液は左心室から大動脈に入り、静脈血となって右心房に戻ってくる。$c$, false, 3),
  ('85882294-cc3a-4010-8ef6-94f554f930db', $c$肺循環とは、右心室から肺静脈を経て肺の毛細血管に入り、肺動脈を通って左心房に戻る血液の循環をいう。$c$, true, 4),
  ('85882294-cc3a-4010-8ef6-94f554f930db', $c$動脈硬化とは、コレステロールの蓄積などにより、動脈壁が肥厚・硬化して弾力性を失った状態であり、進行すると血管の狭窄や閉塞を招き、臓器への酸素や栄養分の供給が妨げられる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'cda58613-de1b-4183-a3b4-e56537da242d',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$ヒトのホルモン、その内分泌器官及びそのはたらきの組合せとして、誤っているものは次のうちどれか。
ホルモン 内分泌器官 はたらき$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問37'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cda58613-de1b-4183-a3b4-e56537da242d', $c$コルチゾール 副腎皮質 血糖量の増加$c$, false, 1),
  ('cda58613-de1b-4183-a3b4-e56537da242d', $c$アルドステロン 副腎皮質 体液中の塩類バランスの調節$c$, false, 2),
  ('cda58613-de1b-4183-a3b4-e56537da242d', $c$メラトニン 副甲状腺 体液中のカルシウムバランスの調節$c$, true, 3),
  ('cda58613-de1b-4183-a3b4-e56537da242d', $c$インスリン 膵臓 血糖量の減少$c$, false, 4),
  ('cda58613-de1b-4183-a3b4-e56537da242d', $c$グルカゴン 膵臓 血糖量の増加$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7bdb9062-9c4d-4693-9bca-47f0b4ad10b9',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$蛋白質並びにその分解、吸収及び代謝に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問38'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7bdb9062-9c4d-4693-9bca-47f0b4ad10b9', $c$蛋白質は、約20種類のアミノ酸が結合してできており、内臓、筋肉、皮膚など人体の臓器等を構成する主成分である。$c$, false, 1),
  ('7bdb9062-9c4d-4693-9bca-47f0b4ad10b9', $c$蛋白質は、膵臓から分泌される消化酵素である膵リパーゼなどによりアミノ酸に分解され、小腸から吸収される。$c$, true, 2),
  ('7bdb9062-9c4d-4693-9bca-47f0b4ad10b9', $c$血液循環に入ったアミノ酸は、体内の各組織において蛋白質に再合成される。$c$, false, 3),
  ('7bdb9062-9c4d-4693-9bca-47f0b4ad10b9', $c$肝臓では、アミノ酸から血漿蛋白質が合成される。$c$, false, 4),
  ('7bdb9062-9c4d-4693-9bca-47f0b4ad10b9', $c$飢餓時には、肝臓などでアミノ酸などからブドウ糖を生成する糖新生が行われる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '285d209e-0041-4b72-b2d3-f974c966152e',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$消化器系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問39'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('285d209e-0041-4b72-b2d3-f974c966152e', $c$十二指腸に胃から酸性の消化物が入ってくると、アルカリ性の膵液が分泌され、酸を中和する。$c$, false, 1),
  ('285d209e-0041-4b72-b2d3-f974c966152e', $c$無機塩及びビタミン類は、酵素による分解を受けないでそのまま吸収される。$c$, false, 2),
  ('285d209e-0041-4b72-b2d3-f974c966152e', $c$胆汁はアルカリ性で、蛋白質を分解するトリプシンなどの消化酵素を含んでいる。$c$, true, 3),
  ('285d209e-0041-4b72-b2d3-f974c966152e', $c$ペプシノーゲンは、胃酸によってペプシンという消化酵素になり、蛋白質を分解する。$c$, false, 4),
  ('285d209e-0041-4b72-b2d3-f974c966152e', $c$小腸の表面は、ビロード状の絨毛という小突起で覆われており、栄養素の吸収の効率を上げるために役立っている。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$血液に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問40'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67', $c$赤血球は、骨髄で産生され、寿命は約120日で、血球の中で最も多い。$c$, false, 1),
  ('a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67', $c$血液中に占める赤血球の容積の割合をヘマトクリットといい、貧血になるとその値は低くなる。$c$, false, 2),
  ('a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67', $c$好中球は、白血球の約60％を占め、偽足を出してアメーバ様運動を行い、体内に侵入してきた細菌などを貪食する。$c$, false, 3),
  ('a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67', $c$リンパ球は、白血球の約30％を占め、Ｔリンパ球、Ｂリンパ球などの種類があり、免疫反応に関与している。$c$, false, 4),
  ('a1e31b6e-0c71-4c4f-9cc6-c063f2cebb67', $c$ＡＢＯ式血液型は、白血球による血液型分類の一つで、Ａ型血液の血清は抗Ｂ抗体をもつ。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '59b64bfe-e756-497f-8464-bc27fdb5c0d7',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$神経系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問41'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('59b64bfe-e756-497f-8464-bc27fdb5c0d7', $c$神経系は、中枢神経系と末梢神経系に大別され、中枢神経系は脳と脊髄から成る。$c$, false, 1),
  ('59b64bfe-e756-497f-8464-bc27fdb5c0d7', $c$大脳の内側の髄質は、神経細胞の細胞体が集合した灰白質で、感覚、運動、思考などの作用を支配する中枢として機能する。$c$, true, 2),
  ('59b64bfe-e756-497f-8464-bc27fdb5c0d7', $c$神経系を構成する基本的な単位である神経細胞は、通常、１個の細胞体、１本の軸索、複数の樹状突起から成り、ニューロンともいわれる。$c$, false, 3),
  ('59b64bfe-e756-497f-8464-bc27fdb5c0d7', $c$交感神経系は、心拍数を増加したり、消化管の運動を抑制する。$c$, false, 4),
  ('59b64bfe-e756-497f-8464-bc27fdb5c0d7', $c$体性神経には感覚器官からの情報を中枢に伝える感覚神経と、中枢からの命令を運動器官に伝える運動神経がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5bb7b00f-aa7c-4561-a0c1-5a42ae242877',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$筋肉に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問42'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5bb7b00f-aa7c-4561-a0c1-5a42ae242877', $c$刺激に対して意識とは無関係に起こる定型的な反応を反射といい、最も単純な反射には膝蓋腱反射などの伸張反射がある。$c$, false, 1),
  ('5bb7b00f-aa7c-4561-a0c1-5a42ae242877', $c$筋肉が収縮して出す最大筋力は、筋肉の単位断面積当たりの平均値をとると、性差や年齢差はほとんどない。$c$, false, 2),
  ('5bb7b00f-aa7c-4561-a0c1-5a42ae242877', $c$運動することによって筋肉が太くなることを筋肉の活動性肥大という。$c$, false, 3),
  ('5bb7b00f-aa7c-4561-a0c1-5a42ae242877', $c$荷物を持ち上げたり屈伸運動をするとき、関節運動に関与する筋肉には、等張性収縮が生じている。$c$, false, 4),
  ('5bb7b00f-aa7c-4561-a0c1-5a42ae242877', $c$筋肉中のグリコーゲンは、酸素が十分に供給されると完全に分解され、最後に乳酸になる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e0d59bf1-ef8b-4125-bc56-5aab2529e4e1',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$体温調節に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問43'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e0d59bf1-ef8b-4125-bc56-5aab2529e4e1', $c$寒冷な環境においては、皮膚の血管が拡張して血流量を増し、皮膚温を上昇させる。$c$, false, 1),
  ('e0d59bf1-ef8b-4125-bc56-5aab2529e4e1', $c$暑熱な環境においては、内臓の血流量が増加し体内の代謝活動が亢進することにより、人体からの熱の放散が促進される。$c$, false, 2),
  ('e0d59bf1-ef8b-4125-bc56-5aab2529e4e1', $c$体温調節のように、外部環境が変化しても身体内部の状態を一定に保つ生体の仕組みを同調性といい、筋肉と神経系により調整されている。$c$, false, 3),
  ('e0d59bf1-ef8b-4125-bc56-5aab2529e4e1', $c$体温調節中枢は、小脳にあり、熱の産生と放散のバランスを維持し体温を一定に保つよう機能している。$c$, false, 4),
  ('e0d59bf1-ef8b-4125-bc56-5aab2529e4e1', $c$甲状腺ホルモンの分泌により、代謝が亢進し、体温は上昇する。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3d342b10-6093-415e-834b-3676d74c5aac',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$ストレスに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第一種衛生管理者試験 問44'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3d342b10-6093-415e-834b-3676d74c5aac', $c$外部からの刺激であるストレッサーは、その形態や程度にかかわらず、自律神経系と内分泌系を介して、心身の活動を抑圧する。$c$, true, 1),
  ('3d342b10-6093-415e-834b-3676d74c5aac', $c$ストレスに伴う心身の反応には、ノルアドレナリン、アドレナリンなどのカテコールアミンや副腎皮質ホルモンが深く関与している。$c$, false, 2),
  ('3d342b10-6093-415e-834b-3676d74c5aac', $c$昇進、転勤、配置替えなどがストレスの原因となることがある。$c$, false, 3),
  ('3d342b10-6093-415e-834b-3676d74c5aac', $c$職場環境における騒音、気温、湿度、悪臭などがストレスの原因となることがある。$c$, false, 4),
  ('3d342b10-6093-415e-834b-3676d74c5aac', $c$ストレスにより、自律神経系と内分泌系のバランスが崩れ、精神神経科的疾患又は内科的疾患が生じる場合がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '52135ad2-f09d-4a4b-a2dc-031c4859d4a6',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事業場の衛生管理体制に関する次の記述のうち、法令上、誤っているものはどれか｡
ただし、衛生管理者及び産業医の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('52135ad2-f09d-4a4b-a2dc-031c4859d4a6', $c$常時300人以上の労働者を使用する各種商品小売業の事業場では、総括安全衛生管理者を選任しなければならない。$c$, false, 1),
  ('52135ad2-f09d-4a4b-a2dc-031c4859d4a6', $c$常時1,000人を超え2,000人以下の労働者を使用する事業場では、４人以上の衛生管理者を選任しなければならない。$c$, false, 2),
  ('52135ad2-f09d-4a4b-a2dc-031c4859d4a6', $c$常時900人の労働者を使用し、そのうち、深夜業を含む業務に常時100人の労働者を従事させる事業場では、衛生管理者のうち少なくとも１人を専任の衛生管理者としなければならない。$c$, true, 3),
  ('52135ad2-f09d-4a4b-a2dc-031c4859d4a6', $c$常時50人以上の労働者を使用するゴルフ場業の事業場では、第二種衛生管理者免許を有する者のうちから衛生管理者を選任することができる。$c$, false, 4),
  ('52135ad2-f09d-4a4b-a2dc-031c4859d4a6', $c$常時1,000人以上の労働者を使用する事業場では、その事業場に専属の産業医を選任しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b20dde7b-72f2-447a-96a7-d564b14721a2',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$産業医に関する次の記述のうち、法令上、誤っているものはどれか。
ただし、産業医の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b20dde7b-72f2-447a-96a7-d564b14721a2', $c$産業医の選任は、選任すべき事由が発生した日から14日以内に行わなければならない。$c$, false, 1),
  ('b20dde7b-72f2-447a-96a7-d564b14721a2', $c$常時使用する労働者数が2,000人を超える事業場では、産業医を２人以上選任しなければならない。$c$, true, 2),
  ('b20dde7b-72f2-447a-96a7-d564b14721a2', $c$産業医が、事業者から、毎月１回以上、所定の情報の提供を受けている場合であって、事業者の同意を得ているときは、産業医の作業場等の巡視の頻度を、毎月１回以上から２か月に１回以上にすることができる。$c$, false, 3),
  ('b20dde7b-72f2-447a-96a7-d564b14721a2', $c$事業者は、産業医から労働者の健康管理等について勧告を受けたときは、当該勧告の内容及び当該勧告を踏まえて講じた措置の内容（措置を講じない場合にあっては、その旨及びその理由）を記録し、これを３年間保存しなければならない。$c$, false, 4),
  ('b20dde7b-72f2-447a-96a7-d564b14721a2', $c$事業者は、産業医が辞任したとき又は産業医を解任したときは、遅滞なく、その旨及びその理由を衛生委員会又は安全衛生委員会に報告しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ad57e0fe-8d85-4655-a366-5e7156ef10d4',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働衛生コンサルタントに関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ad57e0fe-8d85-4655-a366-5e7156ef10d4', $c$労働衛生コンサルタント試験には、保健衛生及び労働衛生工学の２つの区分がある。$c$, false, 1),
  ('ad57e0fe-8d85-4655-a366-5e7156ef10d4', $c$労働衛生コンサルタント試験に合格した者は、厚生労働大臣の指定する指定登録機関に備える労働衛生コンサルタント名簿に、氏名、生年月日等所定の事項の登録を受けることにより、労働衛生コンサルタントとなることができる。$c$, false, 2),
  ('ad57e0fe-8d85-4655-a366-5e7156ef10d4', $c$労働衛生コンサルタントは、他人の求めに応じ報酬を得て、労働者の衛生の水準の向上を図るため、事業場の衛生についての診断及びこれに基づく指導を行うことを業とする。$c$, false, 3),
  ('ad57e0fe-8d85-4655-a366-5e7156ef10d4', $c$労働衛生コンサルタントが、その業務に関して知り得た秘密を漏らし、又は盗用したときは、その登録を取り消されることがある。$c$, false, 4),
  ('ad57e0fe-8d85-4655-a366-5e7156ef10d4', $c$労働衛生コンサルタントの診断及び指導を受けた事業者は、その記録を作成して、これを３年間保存しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '05547153-36d6-4f30-a51f-af0f055b4db3',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働安全衛生規則に基づく次の定期健康診断項目のうち、厚生労働大臣が定める基準に基づき、医師が必要でないと認めるときは、省略することができる項目に該当しないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('05547153-36d6-4f30-a51f-af0f055b4db3', $c$業務歴の調査$c$, true, 1),
  ('05547153-36d6-4f30-a51f-af0f055b4db3', $c$腹囲の検査$c$, false, 2),
  ('05547153-36d6-4f30-a51f-af0f055b4db3', $c$胸部エックス線検査$c$, false, 3),
  ('05547153-36d6-4f30-a51f-af0f055b4db3', $c$貧血検査$c$, false, 4),
  ('05547153-36d6-4f30-a51f-af0f055b4db3', $c$心電図検査$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働時間の状況等が一定の要件に該当する労働者に対して、法令により実施することが義務付けられている医師による面接指導に関する次の記述のうち、誤っているものはどれか。
ただし、労働者の中に、新たな技術、商品又は役務の研究開発に係る業務に従事する者、高度プロフェッショナル制度の対象者及び医師はいないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7', $c$休憩時間を除き１週間当たり40時間を超えて労働させた場合におけるその超えた時間が１か月当たり100時間を超えた労働者に対し、本人の申出の有無にかかわらず医師による面接指導を行わなければならない。$c$, true, 1),
  ('0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7', $c$事業者は、面接指導を実施するため、タイムカードによる記録等の客観的な方法その他の適切な方法により、労働者の労働時間の状況を把握しなければならない。$c$, false, 2),
  ('0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7', $c$面接指導の対象となる労働者は、事業者の指定した医師が行う面接指導を受けることを希望しない場合は、他の医師の行う面接指導を受け、その結果を証明する書面を事業者に提出することができる。$c$, false, 3),
  ('0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7', $c$事業者は、面接指導の結果に基づき、労働者の健康を保持するために必要な措置について、原則として、面接指導が行われた後、遅滞なく、医師の意見を聴かなければならない。$c$, false, 4),
  ('0fd1ba6f-0ee4-4c78-ad48-e774d02df2a7', $c$事業者は、面接指導の結果に基づき、当該面接指導の結果の記録を作成して、これを５年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$衛生委員会に関する次の記述のうち、法令上、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba', $c$衛生委員会の議長を除く委員の半数は、事業場に労働者の過半数で組織する労働組合がないときは、労働者の過半数を代表する者が指名しなければならない。$c$, false, 1),
  ('2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba', $c$産業医のうち衛生委員会の委員として指名することができるのは、当該事業場に専属の産業医に限られる。$c$, false, 2),
  ('2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba', $c$当該事業場の労働者で、作業環境測定を実施している作業環境測定士であるものを衛生委員会の委員として指名することはできない。$c$, false, 3),
  ('2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba', $c$衛生委員会の付議事項には、労働基準監督官から文書により指導を受けた事項のうち、労働者の健康障害の防止に関することが含まれる。$c$, true, 4),
  ('2a8b02f8-9e09-4fd6-8532-8ee3870fe9ba', $c$衛生委員会は、毎月１回以上開催し、全ての議事の概要を記録して、これを２年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4caeafab-a9aa-44c3-8b25-b474625b39bd',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事業場の建築物、施設等に関する措置について、労働安全衛生規則の衛生基準に違反しているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4caeafab-a9aa-44c3-8b25-b474625b39bd', $c$有害業務を行っていない事業場において、窓その他の開口部の直接外気に向かって開放することができる部分の面積が、常時床面積の20分の１以上である屋内作業場に、換気設備を設けていない。$c$, false, 1),
  ('4caeafab-a9aa-44c3-8b25-b474625b39bd', $c$常時40人の労働者を就業させている屋内作業場の気積が、設備の占める容積及び床面から３ｍを超える高さにある空間を除き400ｍ３となっている。$c$, false, 2),
  ('4caeafab-a9aa-44c3-8b25-b474625b39bd', $c$男性５人を含む常時30人の労働者が就業している事業場で、女性用には臥床することのできる休養室を設けているが、男性用には、臥床することのできない休憩設備を利用させている。$c$, false, 3),
  ('4caeafab-a9aa-44c3-8b25-b474625b39bd', $c$労働者を常時就業させる場所の作業面の照度を、精密な作業については350ルクス、粗な作業については150ルクスとしている。$c$, false, 4),
  ('4caeafab-a9aa-44c3-8b25-b474625b39bd', $c$事業場に附属する炊事場の入口には、洗浄剤を含浸させたマットを設置して、土足のままでも立ち入ることができるようにしている。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0a0d58eb-b5db-4895-8ace-53503a157d75',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事務室の空気環境の測定、設備の点検等に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0a0d58eb-b5db-4895-8ace-53503a157d75', $c$中央管理方式の空気調和設備を設けた建築物の室については、所定の頻度で、空気中の一酸化炭素及び二酸化炭素の含有率、室温及び外気温並びに相対湿度を測定しなければならない。$c$, false, 1),
  ('0a0d58eb-b5db-4895-8ace-53503a157d75', $c$空気調和設備の冷却塔、冷却水の水管及び加湿装置の清掃を、それぞれ１年以内ごとに１回、定期に、行わなければならない。$c$, false, 2),
  ('0a0d58eb-b5db-4895-8ace-53503a157d75', $c$機械による換気のための設備については、６か月以内ごとに１回、定期に、異常の有無を点検しなければならない。$c$, true, 3),
  ('0a0d58eb-b5db-4895-8ace-53503a157d75', $c$室の照明設備については、６か月以内ごとに１回、定期に、点検しなければならない。$c$, false, 4),
  ('0a0d58eb-b5db-4895-8ace-53503a157d75', $c$燃焼器具を使用するときは、発熱量が著しく少ないものを除き、毎日、異常の有無を点検しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'db5b98ee-ac14-4141-afa1-9693e7fa6e27',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$週所定労働時間が20時間、週所定労働日数が３日である労働者であって、雇入れの日から起算して２年６か月継続勤務したものに対して、その後１年間に新たに与えなければならない年次有給休暇日数として、法令上、正しいものは次のうちどれか。
ただし、その労働者はその直前の１年間に全労働日の８割以上出勤したものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('db5b98ee-ac14-4141-afa1-9693e7fa6e27', $c$５日$c$, false, 1),
  ('db5b98ee-ac14-4141-afa1-9693e7fa6e27', $c$６日$c$, true, 2),
  ('db5b98ee-ac14-4141-afa1-9693e7fa6e27', $c$７日$c$, false, 3),
  ('db5b98ee-ac14-4141-afa1-9693e7fa6e27', $c$８日$c$, false, 4),
  ('db5b98ee-ac14-4141-afa1-9693e7fa6e27', $c$９日$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8980edc6-4121-48dc-afec-d5bdc502aaa3',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働基準法に基づく労使協定による時間外・休日労働に関する次の文中の[ ]内に入れるＡからＤの数値の組合せとして、正しいものは(１)～(５)のうちどれか。
ただし、労使協定とは、「労働者の過半数で組織する労働組合（その労働組合がない場合は労働者の過半数を代表する者）と使用者との書面による協定」をいうものとし、労働時間に関する適用猶予及び適用除外はないものとする。
「労使協定による時間外労働の限度時間は、変形労働時間制が適用されていない労働者については、１か月について[Ａ]時間、１年について[Ｂ]時間とされている。ただし、事業場において通常予見することのできない業務量の大幅な増加等に伴い、臨時的に限度時間を超えて労働させる必要がある場合には、１か月について時間外労働と休日労働の合計時間を[Ｃ]時間未満、１年について時間外労働の時間を[Ｄ]時間を超えない範囲とすることができる。」
Ａ Ｂ Ｃ Ｄ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8980edc6-4121-48dc-afec-d5bdc502aaa3', $c$45 270 80 360$c$, false, 1),
  ('8980edc6-4121-48dc-afec-d5bdc502aaa3', $c$45 360 80 720$c$, false, 2),
  ('8980edc6-4121-48dc-afec-d5bdc502aaa3', $c$45 360 100 720$c$, true, 3),
  ('8980edc6-4121-48dc-afec-d5bdc502aaa3', $c$80 720 100 960$c$, false, 4),
  ('8980edc6-4121-48dc-afec-d5bdc502aaa3', $c$80 720 120 960$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'eca9c34c-072b-4b71-b932-9803fda04677',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$1,000人を対象としたある疾病のスクリーニング検査の結果と精密検査結果によるその疾病の有無は下表のとおりであった。このスクリーニング検査の偽陽性率及び偽陰性率の近似値の組合せとして、適切なものは(１)～(５)のうちどれか。
ただし、偽陽性率とは、疾病無しの者を陽性と判定する率をいい、偽陰性率とは、疾病有りの者を陰性と判定する率をいう。
（表：疾病有り 陽性35 陰性10、疾病無し 陽性160 陰性795）$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('eca9c34c-072b-4b71-b932-9803fda04677', $c$16.0 0.1$c$, false, 1),
  ('eca9c34c-072b-4b71-b932-9803fda04677', $c$16.0 1.2$c$, false, 2),
  ('eca9c34c-072b-4b71-b932-9803fda04677', $c$16.8 1.2$c$, false, 3),
  ('eca9c34c-072b-4b71-b932-9803fda04677', $c$16.8 22.2$c$, true, 4),
  ('eca9c34c-072b-4b71-b932-9803fda04677', $c$20.1 22.2$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f4f22d5e-d801-402c-9846-7e0796c10fc0',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$食中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f4f22d5e-d801-402c-9846-7e0796c10fc0', $c$毒素型食中毒は、食物に付着した細菌により産生された毒素によって起こる食中毒で、カンピロバクターによるものなどがある。$c$, true, 1),
  ('f4f22d5e-d801-402c-9846-7e0796c10fc0', $c$ボツリヌス菌による毒素は、神経毒である。$c$, false, 2),
  ('f4f22d5e-d801-402c-9846-7e0796c10fc0', $c$黄色ブドウ球菌による毒素は、熱に強い。$c$, false, 3),
  ('f4f22d5e-d801-402c-9846-7e0796c10fc0', $c$腸炎ビブリオ菌は、病原性好塩菌ともいわれる。$c$, false, 4),
  ('f4f22d5e-d801-402c-9846-7e0796c10fc0', $c$ノロウイルスの失活化には、煮沸消毒又は塩素系の消毒剤が効果的である。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8d24cae3-0743-43b4-ac80-e3dc368fb1e3',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$一次救命処置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8d24cae3-0743-43b4-ac80-e3dc368fb1e3', $c$一次救命処置は、できる限り単独で行うことは避け、大声で周囲に呼びかけ、応援を求める。$c$, false, 1),
  ('8d24cae3-0743-43b4-ac80-e3dc368fb1e3', $c$傷病者の胸と腹部の動きを観察し、胸と腹部が上下に動いていない場合やよくわからない場合には、心停止とみなし、心肺蘇生を開始する。$c$, false, 2),
  ('8d24cae3-0743-43b4-ac80-e3dc368fb1e3', $c$胸骨圧迫は、胸が約５cm沈む強さで胸骨の上半分を圧迫し、１分間に100～120回のテンポで行う。$c$, true, 3),
  ('8d24cae3-0743-43b4-ac80-e3dc368fb1e3', $c$気道を確保するためには、片手で額を押さえながら、もう一方の手の指であご先を上に引き上げるようにする。$c$, false, 4),
  ('8d24cae3-0743-43b4-ac80-e3dc368fb1e3', $c$ＡＥＤ(自動体外式除細動器)を用いた場合、電気ショックを行った後や電気ショック不要の音声メッセージが出たときは、胸骨圧迫を再開し、心肺蘇生を続ける。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '60cf829f-e507-4b64-8f6b-246e065dc8e3',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$温熱条件に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('60cf829f-e507-4b64-8f6b-246e065dc8e3', $c$温度感覚を左右する環境要素は、気温、湿度、気流及びふく射(放射)熱である。$c$, false, 1),
  ('60cf829f-e507-4b64-8f6b-246e065dc8e3', $c$実効温度は、人の温熱感に基礎を置いた指標で、気温、湿度及び気流の総合効果を温度目盛りで表したものである。$c$, false, 2),
  ('60cf829f-e507-4b64-8f6b-246e065dc8e3', $c$相対湿度は、空気中の水蒸気量と、その温度における飽和水蒸気量との比を百分率で示したものである。$c$, false, 3),
  ('60cf829f-e507-4b64-8f6b-246e065dc8e3', $c$ＷＢＧＴは、自然湿球温度、黒球温度及び気温（乾球温度）から求められる指標で、暑熱環境による熱ストレス評価に用いられる。$c$, false, 4),
  ('60cf829f-e507-4b64-8f6b-246e065dc8e3', $c$算出したＷＢＧＴの値が、作業内容に応じて設定されたＷＢＧＴ基準値未満である場合には、熱中症が発生するリスクが高まる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1dc4242f-ad67-479e-93b3-c5135b74da43',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$厚生労働省の「事業場における労働者の健康保持増進のための指針」に基づく健康保持増進対策に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1dc4242f-ad67-479e-93b3-c5135b74da43', $c$健康保持増進措置は、主に生活習慣上の課題を有する労働者の健康状態の改善を目指すために個々の労働者に対して実施するものと、事業場全体の健康状態の改善や健康保持増進に係る取組の活性化等、生活習慣上の課題の有無に関わらず労働者を集団として捉えて実施するものがある。$c$, false, 1),
  ('1dc4242f-ad67-479e-93b3-c5135b74da43', $c$健康保持増進に関する課題の把握や目標の設定等においては、労働者の健康状態等を客観的に把握できる数値を活用することが望ましい。$c$, false, 2),
  ('1dc4242f-ad67-479e-93b3-c5135b74da43', $c$健康測定の結果に基づき行う健康指導には、運動指導、メンタルヘルスケア、栄養指導、口腔保健指導、保健指導が含まれる。$c$, false, 3),
  ('1dc4242f-ad67-479e-93b3-c5135b74da43', $c$健康保持増進対策の推進に当たっては、事業者が労働者等の意見を聴きつつ事業場の実態に即した取組を行うため、労使、産業医、衛生管理者等で構成される衛生委員会等を活用する。$c$, false, 4),
  ('1dc4242f-ad67-479e-93b3-c5135b74da43', $c$医療保険者と連携したコラボヘルス等の労働者の健康保持増進対策を推進するためであっても、定期健康診断の結果の記録等、労働者の健康状態等が把握できる客観的な数値等を医療保険者に提供してはならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1baf5388-c198-46b0-a143-e84584fc0935',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$骨折に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1baf5388-c198-46b0-a143-e84584fc0935', $c$単純骨折とは、骨にひびが入った状態をいう。$c$, false, 1),
  ('1baf5388-c198-46b0-a143-e84584fc0935', $c$不完全骨折では、骨折端どうしが擦れ合う軋轢音や変形などが認められる。$c$, false, 2),
  ('1baf5388-c198-46b0-a143-e84584fc0935', $c$骨折が疑われる部位は、よく動かしてその程度を判断する必要がある。$c$, false, 3),
  ('1baf5388-c198-46b0-a143-e84584fc0935', $c$骨折に対する処置として、副子を手や足に当てるときは、骨折部分の上下の関節まで固定できる長さで、かつ、幅の広いものを用いる。$c$, true, 4),
  ('1baf5388-c198-46b0-a143-e84584fc0935', $c$脊髄損傷が疑われる場合は、硬い板の上に乗せて搬送してはならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c6cf7af4-0f96-45c0-87f9-056229582205',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$脳血管疾患及び虚血性心疾患に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c6cf7af4-0f96-45c0-87f9-056229582205', $c$虚血性の脳血管疾患である脳梗塞は、脳血管自体の動脈硬化性病変による脳塞栓症と、心臓や動脈壁の血栓が剥がれて脳血管を閉塞する脳血栓症に分類される。$c$, true, 1),
  ('c6cf7af4-0f96-45c0-87f9-056229582205', $c$高血圧性脳症は、急激な血圧上昇が誘因となって、脳が腫脹する病気で、頭痛、悪心、嘔吐、意識障害、視力障害、けいれんなどの症状がみられる。$c$, false, 2),
  ('c6cf7af4-0f96-45c0-87f9-056229582205', $c$虚血性心疾患は、冠動脈による心筋への血液の供給が不足したり途絶えることにより起こる心筋障害である。$c$, false, 3),
  ('c6cf7af4-0f96-45c0-87f9-056229582205', $c$虚血性心疾患は、心筋の一部分に可逆的な虚血が起こる狭心症と、不可逆的な心筋壊死が起こる心筋梗塞とに大別される。$c$, false, 4),
  ('c6cf7af4-0f96-45c0-87f9-056229582205', $c$運動負荷心電図検査は、虚血性心疾患の発見に有用である。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '53a2cd22-e702-45d2-9954-f73bf583483f',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$厚生労働省の「職場における腰痛予防対策指針」に基づく、重量物取扱い作業における腰痛予防対策に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('53a2cd22-e702-45d2-9954-f73bf583483f', $c$著しく重心の偏っている荷物は、その旨を明示する。$c$, false, 1),
  ('53a2cd22-e702-45d2-9954-f73bf583483f', $c$労働者全員に腰部保護ベルトを使用させる。$c$, true, 2),
  ('53a2cd22-e702-45d2-9954-f73bf583483f', $c$満18歳以上の男性労働者が人力のみにより取り扱う物の重量は、体重のおおむね40％以下とする。$c$, false, 3),
  ('53a2cd22-e702-45d2-9954-f73bf583483f', $c$床面などから荷物を持ち上げる場合には、片足を少し前に出し、膝を曲げ、腰を十分に降ろして当該荷物をかかえ、膝を伸ばすことによって立ち上がるようにする。$c$, false, 4),
  ('53a2cd22-e702-45d2-9954-f73bf583483f', $c$当該作業に配置する際及びその後６か月以内ごとに１回、定期に、腰痛の健康診断を実施する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7c100f64-385d-4f2d-bfea-2b0befa840f6',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$事務室内において、空気を外気と入れ換えて二酸化炭素濃度を1,000ppm以下に保った状態で、在室することのできる最大の人数は次のうちどれか。
ただし、外気の二酸化炭素濃度を400ppm、外気と入れ換える空気量を600ｍ３/ｈ、１人当たりの呼出二酸化炭素量を0.018ｍ３/ｈとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7c100f64-385d-4f2d-bfea-2b0befa840f6', $c$14人$c$, false, 1),
  ('7c100f64-385d-4f2d-bfea-2b0befa840f6', $c$16人$c$, false, 2),
  ('7c100f64-385d-4f2d-bfea-2b0befa840f6', $c$18人$c$, false, 3),
  ('7c100f64-385d-4f2d-bfea-2b0befa840f6', $c$20人$c$, true, 4),
  ('7c100f64-385d-4f2d-bfea-2b0befa840f6', $c$22人$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c3ec4a5f-6293-426d-bd6b-a302bf33179d',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$採光、照明などに関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c3ec4a5f-6293-426d-bd6b-a302bf33179d', $c$照度の単位はルクスで、１ルクスは光度１カンデラの光源から10ｍ離れた所で、その光に直角な面が受ける明るさに相当する。$c$, false, 1),
  ('c3ec4a5f-6293-426d-bd6b-a302bf33179d', $c$高齢者は、若年者に比較して、一般に、高い照度が必要であるが、水晶体の混濁により、まぶしさを感じやすくなっている場合もあるので、注意が必要である。$c$, true, 2),
  ('c3ec4a5f-6293-426d-bd6b-a302bf33179d', $c$部屋の彩色に当たり、目の高さから上の壁及び天井は、まぶしさを防ぐため濁色にするとよい。$c$, false, 3),
  ('c3ec4a5f-6293-426d-bd6b-a302bf33179d', $c$前方から明かりをとるとき、目と光源を結ぶ線と視線とが作る角度は、30°以下になるようにする。$c$, false, 4),
  ('c3ec4a5f-6293-426d-bd6b-a302bf33179d', $c$全般照明の照度は、作業面の局部照明による照度の10分の１以下になるようにする。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e03c8f3e-a29f-45a2-9464-372cb2d5e337',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$感覚又は感覚器に関する次の記述のうち、正しいものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e03c8f3e-a29f-45a2-9464-372cb2d5e337', $c$物理化学的な刺激の量と人間が意識する感覚の強度とは、直線的な比例関係にある。$c$, false, 1),
  ('e03c8f3e-a29f-45a2-9464-372cb2d5e337', $c$皮膚感覚には、触圧覚、痛覚、温度覚(温覚・冷覚)などがあり、これらのうち冷覚を感じる冷覚点の密度は他の感覚点に比べて高い。$c$, false, 2),
  ('e03c8f3e-a29f-45a2-9464-372cb2d5e337', $c$内臓感覚は、内臓の動き、炎症などを感じて、内臓痛などとして部位の特定ができる鋭敏な感覚である。$c$, false, 3),
  ('e03c8f3e-a29f-45a2-9464-372cb2d5e337', $c$網膜の錐状体は色を感じ、杆状体は明暗を感じる。$c$, true, 4),
  ('e03c8f3e-a29f-45a2-9464-372cb2d5e337', $c$平衡感覚に関係する器官である前庭及び半規管は、中耳にあって、体の傾きや回転の方向を知覚する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ea97d129-e1e0-4184-8e89-f064358d438b',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$消化器系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ea97d129-e1e0-4184-8e89-f064358d438b', $c$無機塩及びビタミン類は、酵素による分解を受けないでそのまま吸収される。$c$, false, 1),
  ('ea97d129-e1e0-4184-8e89-f064358d438b', $c$唾液の成分は、ほとんどが水であるが、デンプンをより小さい糖に分解する消化酵素を含む。$c$, false, 2),
  ('ea97d129-e1e0-4184-8e89-f064358d438b', $c$ペプシノーゲンは、胃酸によってペプシンという消化酵素になり、蛋白質を分解する。$c$, false, 3),
  ('ea97d129-e1e0-4184-8e89-f064358d438b', $c$胆汁は、酸性で、消化酵素は含まないが、食物中の脂肪を乳化させ、脂肪分解の働きを助ける。$c$, true, 4),
  ('ea97d129-e1e0-4184-8e89-f064358d438b', $c$小腸の表面は、ビロード状の絨毛という小突起で覆われており、栄養素の吸収の効率を上げるために役立っている。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '199a9174-0a9d-4116-899c-e6ce8eb0013d',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$神経系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('199a9174-0a9d-4116-899c-e6ce8eb0013d', $c$神経細胞の細胞体が集合しているところを、中枢神経系では神経節といい、末梢神経系では神経核という。$c$, true, 1),
  ('199a9174-0a9d-4116-899c-e6ce8eb0013d', $c$中枢神経系は、脳と脊髄から成る。$c$, false, 2),
  ('199a9174-0a9d-4116-899c-e6ce8eb0013d', $c$有髄神経線維は、無髄神経線維よりも神経伝導速度が速い。$c$, false, 3),
  ('199a9174-0a9d-4116-899c-e6ce8eb0013d', $c$交感神経と副交感神経は、同一器官に分布していても、その作用はほぼ正反対である。$c$, false, 4),
  ('199a9174-0a9d-4116-899c-e6ce8eb0013d', $c$大脳の外側の皮質は、感覚、思考などの作用を支配する中枢として機能する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2bda244f-e7ce-4a26-b103-fd8359cd1d68',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$肝臓の機能として、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2bda244f-e7ce-4a26-b103-fd8359cd1d68', $c$コレステロールを合成する。$c$, false, 1),
  ('2bda244f-e7ce-4a26-b103-fd8359cd1d68', $c$尿素を合成する。$c$, false, 2),
  ('2bda244f-e7ce-4a26-b103-fd8359cd1d68', $c$ヘモグロビンを合成する。$c$, true, 3),
  ('2bda244f-e7ce-4a26-b103-fd8359cd1d68', $c$血液中の身体に有害な物質を分解する。$c$, false, 4),
  ('2bda244f-e7ce-4a26-b103-fd8359cd1d68', $c$グリコーゲンを合成し、及び分解する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e245ad6b-0d61-47f3-87f8-d430181c9fd8',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$腎臓又は尿に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e245ad6b-0d61-47f3-87f8-d430181c9fd8', $c$尿は淡黄色の液体で、固有の臭気を有し、通常、弱アルカリ性である。$c$, false, 1),
  ('e245ad6b-0d61-47f3-87f8-d430181c9fd8', $c$血中の蛋白質は、糸球体からボウマン嚢に濾出される。$c$, false, 2),
  ('e245ad6b-0d61-47f3-87f8-d430181c9fd8', $c$血中の老廃物は、尿細管からボウマン嚢に濾出される。$c$, false, 3),
  ('e245ad6b-0d61-47f3-87f8-d430181c9fd8', $c$原尿中に濾出された水分の大部分は、そのまま尿として排出される。$c$, false, 4),
  ('e245ad6b-0d61-47f3-87f8-d430181c9fd8', $c$原尿中に濾出された電解質の多くは、尿細管から血中に再吸収される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3b594ed4-2c38-45a5-bd60-ca98250ef2bc',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$血液に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3b594ed4-2c38-45a5-bd60-ca98250ef2bc', $c$血液は、血漿と有形成分から成り、血漿には、アルブミン、グロブリンなどの蛋白質が含まれている。$c$, false, 1),
  ('3b594ed4-2c38-45a5-bd60-ca98250ef2bc', $c$赤血球は、血球の中で最も多く、全血液の体積の約60％を占めている。$c$, true, 2),
  ('3b594ed4-2c38-45a5-bd60-ca98250ef2bc', $c$血小板は、核を持たない不定形の細胞で、血液凝固作用に関与している。$c$, false, 3),
  ('3b594ed4-2c38-45a5-bd60-ca98250ef2bc', $c$出血すると、血漿中のフィブリノーゲンがフィブリンに変化し、血球と結合して凝固する。$c$, false, 4),
  ('3b594ed4-2c38-45a5-bd60-ca98250ef2bc', $c$ＡＢＯ式血液型は、赤血球の血液型分類の一つで、Ａ型の血清は抗Ｂ抗体を持つ。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '85f96ff6-de39-449b-98d9-66104794d56e',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$視覚に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('85f96ff6-de39-449b-98d9-66104794d56e', $c$遠見視力の検査は、一般に、５ｍの距離で実施する。$c$, false, 1),
  ('85f96ff6-de39-449b-98d9-66104794d56e', $c$眼を使う作業を継続すると、硝子体の厚みを調節するときに毛様体筋の緊張や脳の疲労によって、「目が疲れる」、「目が痛い」などの症状がみられることがある。$c$, true, 2),
  ('85f96ff6-de39-449b-98d9-66104794d56e', $c$角膜が歪んでいたり、表面に凹凸があるために、眼軸などに異常がなくても、物体の像が網膜上に正しく結ばれないものを乱視という。$c$, false, 3),
  ('85f96ff6-de39-449b-98d9-66104794d56e', $c$視野とは、眼の前の一点を凝視したときに見えている空間の範囲をいい、一般に、上方及び鼻側は約60度、下方は約70度、耳側は約100度である。$c$, false, 4),
  ('85f96ff6-de39-449b-98d9-66104794d56e', $c$明るい所から急に暗い所に入ると、初めは見えにくいが、暗順応によって徐々に見えるようになる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '9bab78f0-6f07-40fa-bc18-c4c16c3abd72',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$体温調節に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9bab78f0-6f07-40fa-bc18-c4c16c3abd72', $c$計算上、100ｇの水分が体重70㎏の人の体表面から蒸発すると、気化熱が奪われ、体温が約１℃下がる。$c$, false, 1),
  ('9bab78f0-6f07-40fa-bc18-c4c16c3abd72', $c$体温調節にみられるように、外部環境などが変化しても身体内部の状態を一定に保とうとする性質を恒常性(ホメオスタシス)という。$c$, false, 2),
  ('9bab78f0-6f07-40fa-bc18-c4c16c3abd72', $c$体温調節中枢は、間脳の視床下部にある。$c$, false, 3),
  ('9bab78f0-6f07-40fa-bc18-c4c16c3abd72', $c$発汗とは、水分が皮膚から蒸発する現象をいい、不感蒸泄とは、水分が呼気により失われる現象をいう。$c$, true, 4),
  ('9bab78f0-6f07-40fa-bc18-c4c16c3abd72', $c$寒冷な環境においては、皮膚の血管が収縮して血流量が減って、熱の放散が減少する。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'aecc5ca6-35b7-409f-8d88-90e95825053d',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$免疫に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('aecc5ca6-35b7-409f-8d88-90e95825053d', $c$抗原とは、免疫に関係する細胞によって異物として認識される物質のことである。$c$, false, 1),
  ('aecc5ca6-35b7-409f-8d88-90e95825053d', $c$抗原となる物質には、蛋白質、糖質などがある。$c$, false, 2),
  ('aecc5ca6-35b7-409f-8d88-90e95825053d', $c$抗原に対する免疫が、逆に、人体の組織や細胞に傷害を与えてしまうことをアレルギーといい、主なアレルギー性疾患としては、気管支ぜんそく、アトピー性皮膚炎などがある。$c$, false, 3),
  ('aecc5ca6-35b7-409f-8d88-90e95825053d', $c$好中球は白血球の一種であり、偽足を出してアメーバ様運動を行い、体内に侵入してきた細菌などを貪食する。$c$, false, 4),
  ('aecc5ca6-35b7-409f-8d88-90e95825053d', $c$免疫には、リンパ球が産生する抗体によって病原体を攻撃する細胞性免疫と、リンパ球などが直接に病原体などを取り込んで排除する体液性免疫の二つがある。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '23915ed5-dd77-4634-abf9-6b73433a791e',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$中高年齢者における加齢による生理機能などの変化に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 第二種衛生管理者試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('23915ed5-dd77-4634-abf9-6b73433a791e', $c$加齢により、動体視力が衰える。$c$, false, 1),
  ('23915ed5-dd77-4634-abf9-6b73433a791e', $c$加齢により、体温調節機能が低下して、熱中症が起こりやすくなる。$c$, false, 2),
  ('23915ed5-dd77-4634-abf9-6b73433a791e', $c$加齢により、骨密度が減少し、筋力が低下して、骨折しやすくなる。$c$, false, 3),
  ('23915ed5-dd77-4634-abf9-6b73433a791e', $c$加齢により、平衡感覚が低下して、転びやすくなる。$c$, false, 4),
  ('23915ed5-dd77-4634-abf9-6b73433a791e', $c$老人性難聴では、1000Ｈzより低い音域の音から聞こえにくくなる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3a63b701-2a3c-4771-855b-36b750b4883e',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事業場の衛生管理体制に関する次の記述のうち、法令上、誤っているものはどれか｡
ただし、衛生管理者及び産業医の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3a63b701-2a3c-4771-855b-36b750b4883e', $c$常時500人を超え1,000人以下の労働者を使用し、そのうち、深夜業を含む業務に常時30人以上の労働者を従事させる事業場では、衛生管理者のうち少なくとも１人を専任の衛生管理者としなければならない。$c$, true, 1),
  ('3a63b701-2a3c-4771-855b-36b750b4883e', $c$常時1,000人を超え2,000人以下の労働者を使用する事業場では、４人以上の衛生管理者を選任しなければならない。$c$, false, 2),
  ('3a63b701-2a3c-4771-855b-36b750b4883e', $c$常時50人以上の労働者を使用するゴルフ場業の事業場では、第二種衛生管理者免許を有する者のうちから衛生管理者を選任することができる。$c$, false, 3),
  ('3a63b701-2a3c-4771-855b-36b750b4883e', $c$常時1,000人以上の労働者を使用する事業場では、その事業場に専属の産業医を選任しなければならない。$c$, false, 4),
  ('3a63b701-2a3c-4771-855b-36b750b4883e', $c$衛生管理者を選任したときは、遅滞なく、その氏名等を所轄労働基準監督署長に報告しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'db20cb18-482d-478d-aa0d-0cc2cf48c78d',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$衛生管理者が管理すべき業務として、法令上、定められていないものは次のうちどれか。
ただし、次のそれぞれの業務のうち衛生に係る技術的事項に限るものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('db20cb18-482d-478d-aa0d-0cc2cf48c78d', $c$労働災害の原因の調査及び再発防止対策に関すること。$c$, false, 1),
  ('db20cb18-482d-478d-aa0d-0cc2cf48c78d', $c$安全衛生に関する方針の表明に関すること。$c$, false, 2),
  ('db20cb18-482d-478d-aa0d-0cc2cf48c78d', $c$少なくとも毎日１回作業場等を巡視し、衛生状態に有害のおそれがあるときは、直ちに、労働者の健康障害を防止するため必要な措置を講ずること。$c$, true, 3),
  ('db20cb18-482d-478d-aa0d-0cc2cf48c78d', $c$化学物質等による危険性又は有害性等の調査及びその結果に基づき講ずる措置に関すること。$c$, false, 4),
  ('db20cb18-482d-478d-aa0d-0cc2cf48c78d', $c$健康診断の実施その他健康の保持増進のための措置に関すること。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '45ec4158-418f-4fe8-8232-50dcbb88e05e',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$衛生委員会に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('45ec4158-418f-4fe8-8232-50dcbb88e05e', $c$衛生委員会の議長を除く委員の半数については、事業場に労働者の過半数で組織する労働組合がないときは、労働者の過半数を代表する者の推薦に基づき指名しなければならない。$c$, false, 1),
  ('45ec4158-418f-4fe8-8232-50dcbb88e05e', $c$衛生委員会の議長は、原則として、総括安全衛生管理者又は総括安全衛生管理者以外の者で事業場においてその事業の実施を統括管理するもの若しくはこれに準ずる者のうちから事業者が指名した委員がなるものとする。$c$, false, 2),
  ('45ec4158-418f-4fe8-8232-50dcbb88e05e', $c$事業場に専属ではないが、衛生管理者として選任している労働衛生コンサルタントを、衛生委員会の委員として指名することができる。$c$, false, 3),
  ('45ec4158-418f-4fe8-8232-50dcbb88e05e', $c$作業環境測定を外部の作業環境測定機関に委託して実施している場合、当該作業環境測定を実施している作業環境測定士を、衛生委員会の委員として指名することができる。$c$, true, 4),
  ('45ec4158-418f-4fe8-8232-50dcbb88e05e', $c$衛生委員会の付議事項には、長時間にわたる労働による労働者の健康障害の防止を図るための対策の樹立に関することが含まれる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '15dbba31-0350-4026-b54a-9e604c3c2f57',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$常時使用する労働者数が100人の事業場で、法令上、総括安全衛生管理者の選任が義務付けられている業種は、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('15dbba31-0350-4026-b54a-9e604c3c2f57', $c$医療業$c$, false, 1),
  ('15dbba31-0350-4026-b54a-9e604c3c2f57', $c$熱供給業$c$, false, 2),
  ('15dbba31-0350-4026-b54a-9e604c3c2f57', $c$通信業$c$, false, 3),
  ('15dbba31-0350-4026-b54a-9e604c3c2f57', $c$水道業$c$, false, 4),
  ('15dbba31-0350-4026-b54a-9e604c3c2f57', $c$清掃業$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '84e205eb-a32f-464f-a5a1-53637884b765',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働安全衛生法に基づく心理的な負担の程度を把握するための検査の結果に基づき実施する面接指導に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('84e205eb-a32f-464f-a5a1-53637884b765', $c$常時50人以上の労働者を使用する事業者は、１年以内ごとに１回、定期に、心理的な負担の程度を把握するための検査及び面接指導の結果を所轄労働基準監督署長に報告しなければならない。$c$, true, 1),
  ('84e205eb-a32f-464f-a5a1-53637884b765', $c$事業者は、面接指導の対象となる労働者の要件に該当する労働者から申出があったときは、申出の日から３か月以内に、面接指導を行わなければならない。$c$, false, 2),
  ('84e205eb-a32f-464f-a5a1-53637884b765', $c$事業者は、面接指導を行った場合は、当該面接指導の結果を当該事業場の当該部署に所属する労働者の集団その他の一定規模の集団ごとに集計し、その結果について分析しなければならない。$c$, false, 3),
  ('84e205eb-a32f-464f-a5a1-53637884b765', $c$面接指導の結果は、健康診断個人票に記載しなければならない。$c$, false, 4),
  ('84e205eb-a32f-464f-a5a1-53637884b765', $c$面接指導を行う医師として事業者が指名できる医師は、法定の研修を修了した医師に限られる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0506799d-b62a-44c0-90d6-4e3a0a9b449d',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働安全衛生規則に基づく医師による雇入時の健康診断に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0506799d-b62a-44c0-90d6-4e3a0a9b449d', $c$事業場に雇い入れる日の６か月前に医師による健康診断を受けた労働者に対しても、法定の全ての項目について雇入時の健康診断を行わなければならない。$c$, false, 1),
  ('0506799d-b62a-44c0-90d6-4e3a0a9b449d', $c$雇入時の健康診断における聴力の検査は、1,000Hz及び4,000Hzの音に係る聴力について行わなければならない。$c$, false, 2),
  ('0506799d-b62a-44c0-90d6-4e3a0a9b449d', $c$50人以上の労働者に対して雇入時の健康診断を行ったときは、遅滞なく、その結果を所轄労働基準監督署長に報告しなければならない。$c$, true, 3),
  ('0506799d-b62a-44c0-90d6-4e3a0a9b449d', $c$事業場において実施した雇入時の健康診断の項目に異常の所見があると診断された労働者については、その結果に基づき、健康を保持するために必要な措置について、健康診断が行われた日から３か月以内に、医師の意見を聴かなければならない。$c$, false, 4),
  ('0506799d-b62a-44c0-90d6-4e3a0a9b449d', $c$雇入時の健康診断の結果に基づき、健康診断個人票を作成して、これを５年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3f692ce6-d6df-4466-a889-01770ba0a433',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事業場の建築物、施設等に関する措置について、労働安全衛生規則の衛生基準に違反しているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3f692ce6-d6df-4466-a889-01770ba0a433', $c$常時40人の労働者を就業させている屋内作業場の気積が、設備の占める容積及び床面から３ｍを超える高さにある空間を除き400ｍ３となっている。$c$, false, 1),
  ('3f692ce6-d6df-4466-a889-01770ba0a433', $c$ねずみ、昆虫等の発生場所、生息場所及び侵入経路並びにねずみ、昆虫等による被害の状況について、６か月ごとに１回、定期に、統一的に調査を実施し、その調査結果に基づき、必要な措置を講じている。$c$, false, 2),
  ('3f692ce6-d6df-4466-a889-01770ba0a433', $c$男性５人を含む常時30人の労働者が就業している事業場で、女性用には臥床することのできる休養室を設けているが、男性用には、臥床することのできない休憩設備を利用させている。$c$, false, 3),
  ('3f692ce6-d6df-4466-a889-01770ba0a433', $c$事業場に附属する食堂の床面積を、食事の際の１人について、１ｍ２を超えるようにしている。$c$, false, 4),
  ('3f692ce6-d6df-4466-a889-01770ba0a433', $c$事業場に附属する炊事場の入口には、洗浄剤を含浸させたマットを設置して、土足のままでも立ち入ることができるようにしている。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a13edbc0-7005-46af-8a73-d46167c096d5',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$事務室の設備の定期的な点検等に関する次の記述のうち、法令上、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a13edbc0-7005-46af-8a73-d46167c096d5', $c$機械による換気のための設備については、３か月以内ごとに１回、定期に、異常の有無を点検しなければならない。$c$, false, 1),
  ('a13edbc0-7005-46af-8a73-d46167c096d5', $c$空気調和設備の冷却塔及び冷却水については、原則として、１か月以内ごとに１回、定期に、その汚れの状況を点検しなければならない。$c$, true, 2),
  ('a13edbc0-7005-46af-8a73-d46167c096d5', $c$空気調和設備内に設けられた排水受けについては、原則として、２か月以内ごとに１回、定期に、その汚れ及び閉塞の状況を点検しなければならない。$c$, false, 3),
  ('a13edbc0-7005-46af-8a73-d46167c096d5', $c$空気調和設備の加湿装置については、原則として、２か月以内ごとに１回、定期に、その汚れの状況を点検しなければならない。$c$, false, 4),
  ('a13edbc0-7005-46af-8a73-d46167c096d5', $c$燃焼器具を使用するときは、発熱量が著しく少ないものを除き、１か月以内ごとに１回、定期に、異常の有無を点検しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '519a8b55-a32f-442e-a249-16c77f6d4b3e',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$労働基準法における労働時間等に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('519a8b55-a32f-442e-a249-16c77f6d4b3e', $c$監視又は断続的労働に従事する労働者であって、所轄労働基準監督署長の許可を受けたものについては、労働時間、休憩及び休日に関する規定は適用されない。$c$, true, 1),
  ('519a8b55-a32f-442e-a249-16c77f6d4b3e', $c$１日８時間を超えて労働させることができるのは、時間外労働の協定を締結し、これを所轄労働基準監督署長に届け出た場合に限られている。$c$, false, 2),
  ('519a8b55-a32f-442e-a249-16c77f6d4b3e', $c$フレックスタイム制の清算期間は、６か月以内の期間に限られる。$c$, false, 3),
  ('519a8b55-a32f-442e-a249-16c77f6d4b3e', $c$満20歳未満の者については、時間外・休日労働をさせることはできない。$c$, false, 4),
  ('519a8b55-a32f-442e-a249-16c77f6d4b3e', $c$労働時間が８時間を超える場合においては少なくとも60分、12時間を超える場合においては少なくとも90分の休憩時間を労働時間の途中に与えなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '64425fc6-f354-49b4-8fb9-0f48f7e5f746',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'),
  $q$週所定労働時間が24時間、週所定労働日数が４日である労働者であって、雇入れの日から起算して３年６か月継続勤務したものに対して、その後１年間に新たに与えなければならない年次有給休暇日数として、法令上、正しいものは次のうちどれか。
ただし、その労働者はその直前の１年間に全労働日の８割以上出勤したものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('64425fc6-f354-49b4-8fb9-0f48f7e5f746', $c$９日$c$, false, 1),
  ('64425fc6-f354-49b4-8fb9-0f48f7e5f746', $c$10日$c$, true, 2),
  ('64425fc6-f354-49b4-8fb9-0f48f7e5f746', $c$11日$c$, false, 3),
  ('64425fc6-f354-49b4-8fb9-0f48f7e5f746', $c$12日$c$, false, 4),
  ('64425fc6-f354-49b4-8fb9-0f48f7e5f746', $c$13日$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '06c5d69c-49d1-4dc9-90de-9b8a1e50da5f',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$ＷＢＧＴ(湿球黒球温度)に関する次の文中の[ ]内に入れるＡ及びＢの語句の組合せとして、正しいものは(１)～(５)のうちどれか。
「ＷＢＧＴは、暑熱環境による熱ストレスの評価を行うための指標で、その値は次の式により算出される。
日射がある場合：ＷＢＧＴ＝0.7×自然湿球温度＋0.2×[Ａ]＋0.1×[Ｂ]
日射がない場合：ＷＢＧＴ＝0.7×自然湿球温度＋0.3×[Ａ]」
Ａ Ｂ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('06c5d69c-49d1-4dc9-90de-9b8a1e50da5f', $c$黒球温度 風速$c$, false, 1),
  ('06c5d69c-49d1-4dc9-90de-9b8a1e50da5f', $c$黒球温度 気温（乾球温度）$c$, true, 2),
  ('06c5d69c-49d1-4dc9-90de-9b8a1e50da5f', $c$風速 黒球温度$c$, false, 3),
  ('06c5d69c-49d1-4dc9-90de-9b8a1e50da5f', $c$気温（乾球温度） 風速$c$, false, 4),
  ('06c5d69c-49d1-4dc9-90de-9b8a1e50da5f', $c$気温（乾球温度） 黒球温度$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd65a1bec-034a-4296-843a-abb0256efe56',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$照明、採光などに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d65a1bec-034a-4296-843a-abb0256efe56', $c$北向きの窓では、直射日光はほとんど入らないが一年中平均した明るさが得られる。$c$, false, 1),
  ('d65a1bec-034a-4296-843a-abb0256efe56', $c$全般照明と局部照明を併用する場合、全般照明による照度は、局部照明による照度の10分の１以下になるようにする。$c$, true, 2),
  ('d65a1bec-034a-4296-843a-abb0256efe56', $c$前方から明かりを取るときは、まぶしさをなくすため、眼と光源を結ぶ線と視線とがなす角度が、おおむね30°以上になるように光源の位置を決めるとよい。$c$, false, 3),
  ('d65a1bec-034a-4296-843a-abb0256efe56', $c$あらゆる方向から同程度の明るさの光がくると、見る物に影ができなくなり立体感がなくなるので、不都合な場合がある。$c$, false, 4),
  ('d65a1bec-034a-4296-843a-abb0256efe56', $c$部屋の彩色として、目の高さ以下は、まぶしさを防ぎ安定感を出すために濁色とし、目より上方の壁や天井は、明るい色を用いるとよい。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f56ea562-4533-4005-92f1-bbf5de034244',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$事務室における必要換気量Ｑ(ｍ３/ｈ)を算出する式として、適切なものは(１)～(５)のうちどれか。
ただし、ＡからＤは次のとおりとする。
Ａ 室内二酸化炭素濃度の測定値(ppm)
Ｂ 室内二酸化炭素基準濃度(ppm)
Ｃ 外気の二酸化炭素濃度(ppm)
Ｄ 在室者全員が１時間に呼出する二酸化炭素量(ｍ３/ｈ)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f56ea562-4533-4005-92f1-bbf5de034244', $c$Ｑ ＝｛ Ｄ /（Ａ － Ｂ）｝× 100$c$, false, 1),
  ('f56ea562-4533-4005-92f1-bbf5de034244', $c$Ｑ ＝｛ Ｄ /（Ａ － Ｃ）｝× 100$c$, false, 2),
  ('f56ea562-4533-4005-92f1-bbf5de034244', $c$Ｑ ＝｛ Ｄ /（Ｂ － Ｃ）｝× 100$c$, false, 3),
  ('f56ea562-4533-4005-92f1-bbf5de034244', $c$Ｑ ＝｛ Ｄ /（Ａ － Ｂ）｝× 1,000,000$c$, false, 4),
  ('f56ea562-4533-4005-92f1-bbf5de034244', $c$Ｑ ＝｛ Ｄ /（Ｂ － Ｃ）｝× 1,000,000$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '32601df6-a3f4-4441-9ac2-c51533c9dc60',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$厚生労働省の「労働者の心の健康の保持増進のための指針」に基づくメンタルヘルスケアの実施に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('32601df6-a3f4-4441-9ac2-c51533c9dc60', $c$心の健康づくり計画の実施に当たっては、メンタルヘルス不調を未然に防止する「一次予防」、メンタルヘルス不調を早期に発見し、適切な措置を行う「二次予防」及びメンタルヘルス不調となった労働者の職場復帰支援等を行う「三次予防」が円滑に行われるようにする必要がある。$c$, false, 1),
  ('32601df6-a3f4-4441-9ac2-c51533c9dc60', $c$プライバシー保護の観点から、衛生委員会や安全衛生委員会において、ストレスチェック制度に関する調査審議とメンタルヘルスケアに関する調査審議を関連付けて行うことは避ける。$c$, true, 2),
  ('32601df6-a3f4-4441-9ac2-c51533c9dc60', $c$「セルフケア」とは、労働者自身がストレスや心の健康について理解し、自らのストレスを予防、軽減する、あるいはこれに対処することである。$c$, false, 3),
  ('32601df6-a3f4-4441-9ac2-c51533c9dc60', $c$心の健康問題を抱える労働者に対して、健康問題以外の観点から評価が行われる傾向が強いという問題があることに留意する。$c$, false, 4),
  ('32601df6-a3f4-4441-9ac2-c51533c9dc60', $c$労働者の心の健康は、職場配置、人事異動、職場の組織等の要因によって影響を受ける可能性があるため、人事労務管理部門と連携するようにする。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bdfc3c17-3158-41b0-916b-a35ba22215f8',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$厚生労働省の「事業場における労働者の健康保持増進のための指針」に基づく健康保持増進対策に関する次の記述のうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bdfc3c17-3158-41b0-916b-a35ba22215f8', $c$健康保持増進措置は、主に生活習慣上の課題を有する労働者の健康状態の改善を目指すために個々の労働者に対して実施するものと、事業場全体の健康状態の改善や健康保持増進に係る取組の活性化等、生活習慣上の課題の有無に関わらず労働者を集団として捉えて実施するものがある。$c$, false, 1),
  ('bdfc3c17-3158-41b0-916b-a35ba22215f8', $c$健康保持増進に関する課題の把握や目標の設定等においては、労働者の健康状態等を客観的に把握できる数値を活用することが望ましい。$c$, false, 2),
  ('bdfc3c17-3158-41b0-916b-a35ba22215f8', $c$健康測定の結果に基づき行う健康指導には、運動指導、メンタルヘルスケア、栄養指導、口腔保健指導、保健指導が含まれる。$c$, false, 3),
  ('bdfc3c17-3158-41b0-916b-a35ba22215f8', $c$健康保持増進対策の推進に当たっては、事業者が労働者等の意見を聴きつつ事業場の実態に即した取組を行うため、労使、産業医、衛生管理者等で構成される衛生委員会等を活用する。$c$, false, 4),
  ('bdfc3c17-3158-41b0-916b-a35ba22215f8', $c$医療保険者と連携したコラボヘルス等の労働者の健康保持増進対策を推進するためであっても、定期健康診断の結果の記録等、労働者の健康状態等が把握できる客観的な数値等を医療保険者に提供してはならない。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b21e700c-6784-4c74-ab73-2e27fe27f5d2',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$食中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b21e700c-6784-4c74-ab73-2e27fe27f5d2', $c$毒素型食中毒は、食物に付着した細菌により産生された毒素によって起こる食中毒で、ボツリヌス菌によるものがある。$c$, false, 1),
  ('b21e700c-6784-4c74-ab73-2e27fe27f5d2', $c$感染型食中毒は、食物に付着した細菌そのものの感染によって起こる食中毒で、サルモネラ菌によるものがある。$c$, false, 2),
  ('b21e700c-6784-4c74-ab73-2e27fe27f5d2', $c$Ｏ-157やＯ-111は、ベロ毒素を産生する大腸菌で、これらによる食中毒は、腹痛や出血を伴う水様性の下痢などの症状を呈する。$c$, false, 3),
  ('b21e700c-6784-4c74-ab73-2e27fe27f5d2', $c$ノロウイルスの失活化には、煮沸消毒又は塩素系の消毒剤が効果的である。$c$, false, 4),
  ('b21e700c-6784-4c74-ab73-2e27fe27f5d2', $c$魚、チーズなどに含まれるヒスチジンが細菌により分解されて生成するヒスタミンは、加熱により分解される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '98956d75-9176-4986-a96f-e60ab0602f53',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$虚血性心疾患に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('98956d75-9176-4986-a96f-e60ab0602f53', $c$運動負荷心電図検査は、心筋の異常や不整脈の発見には役立つが、虚血性心疾患の発見には有用でない。$c$, true, 1),
  ('98956d75-9176-4986-a96f-e60ab0602f53', $c$虚血性心疾患は、狭心症と心筋梗塞とに大別される。$c$, false, 2),
  ('98956d75-9176-4986-a96f-e60ab0602f53', $c$狭心症は、心臓の血管の一部の血流が一時的に悪くなる病気である。$c$, false, 3),
  ('98956d75-9176-4986-a96f-e60ab0602f53', $c$心筋梗塞では、突然激しい胸痛が起こり、「締め付けられるように痛い」、「胸が苦しい」などの症状が長時間続き、１時間以上になることもある。$c$, false, 4),
  ('98956d75-9176-4986-a96f-e60ab0602f53', $c$狭心症の痛みの場所は、心筋梗塞とほぼ同じであるが、その発作が続く時間は、通常数分程度で、長くても15分以内におさまることが多い。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4a492c88-b743-4674-b5c3-657743d3e59e',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$骨折及びその救急処置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4a492c88-b743-4674-b5c3-657743d3e59e', $c$開放骨折のことを複雑骨折という。$c$, false, 1),
  ('4a492c88-b743-4674-b5c3-657743d3e59e', $c$複雑骨折は、感染が起こりやすく治りにくい。$c$, false, 2),
  ('4a492c88-b743-4674-b5c3-657743d3e59e', $c$骨折部を副子で固定するときには、骨折した部分が変形していても、そのままの状態を保持して、直近の関節部を含めた広い範囲を固定する。$c$, false, 3),
  ('4a492c88-b743-4674-b5c3-657743d3e59e', $c$単純骨折とは、骨にひびが入った状態のことをいう。$c$, true, 4),
  ('4a492c88-b743-4674-b5c3-657743d3e59e', $c$完全骨折では、骨折端どうしが擦れ合う軋轢音が認められることがある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a2747c78-1138-451f-9046-fb4eca633c76',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$労働衛生管理に用いられる統計に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a2747c78-1138-451f-9046-fb4eca633c76', $c$健康管理統計において、ある時点での検査における有所見者の割合を有所見率といい、これは発生率と同じ意味で用いられる。$c$, true, 1),
  ('a2747c78-1138-451f-9046-fb4eca633c76', $c$集団を比較する場合、調査の対象とした項目のデータの平均値が等しくても分散が異なっていれば、異なった特徴をもつ集団であると評価される。$c$, false, 2),
  ('a2747c78-1138-451f-9046-fb4eca633c76', $c$ばらつきをもって分布するデータの代表値として、平均値、中央値などがあるが、どの代表値を選択するかは、データの内容と分布による。$c$, false, 3),
  ('a2747c78-1138-451f-9046-fb4eca633c76', $c$ある事象と健康事象との間に、統計上、一方が多いと他方も多いというような相関関係が認められたとしても、それらの間に因果関係があるとは限らない。$c$, false, 4),
  ('a2747c78-1138-451f-9046-fb4eca633c76', $c$病休度数率は、在籍労働者の延べ実労働時間数100万時間当たりの疾病休業件数で示される。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd99bc2cf-d747-4ab9-a947-40583a3eb135',
  (SELECT id FROM exam_types WHERE code = 'type2'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'),
  $q$ＢＭＩに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d99bc2cf-d747-4ab9-a947-40583a3eb135', $c$ＢＭＩは肥満や低体重（痩せ）の判定に用いられる指数で、この数値が大きいほど肥満の傾向があり、小さいほど痩せの傾向がある。$c$, false, 1),
  ('d99bc2cf-d747-4ab9-a947-40583a3eb135', $c$ＢＭＩによる肥満度の判定基準には、男性と女性とで同一の数値が用いられる。$c$, false, 2),
  ('d99bc2cf-d747-4ab9-a947-40583a3eb135', $c$ＢＭＩは、内臓脂肪の重量と直線的な比例関係にある。$c$, true, 3),
  ('d99bc2cf-d747-4ab9-a947-40583a3eb135', $c$ＢＭＩが22になる場合の体重は、標準体重といわれる。$c$, false, 4),
  ('d99bc2cf-d747-4ab9-a947-40583a3eb135', $c$ＢＭＩが18.5以上25未満の範囲となる場合の体重は、普通体重といわれる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7ec2fcab-df0b-41e2-9d29-59f5acd015d4',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$腎臓又は尿に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7ec2fcab-df0b-41e2-9d29-59f5acd015d4', $c$血中の蛋白質は、糸球体からボウマン嚢に濾出される。$c$, false, 1),
  ('7ec2fcab-df0b-41e2-9d29-59f5acd015d4', $c$血中の老廃物は、尿細管からボウマン嚢に濾出される。$c$, false, 2),
  ('7ec2fcab-df0b-41e2-9d29-59f5acd015d4', $c$原尿中に濾出された水分の大部分は、そのまま尿として排出される。$c$, false, 3),
  ('7ec2fcab-df0b-41e2-9d29-59f5acd015d4', $c$尿は淡黄色の液体で、固有の臭気を有し、通常、弱アルカリ性である。$c$, false, 4),
  ('7ec2fcab-df0b-41e2-9d29-59f5acd015d4', $c$原尿中に濾出された電解質の多くは、尿細管から血中に再吸収される。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5ae2ebb5-178f-4fce-8647-27b9fcd0c464',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$心臓及び血液循環に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5ae2ebb5-178f-4fce-8647-27b9fcd0c464', $c$心臓の中にある洞結節(洞房結節)で発生した刺激が、刺激伝導系を介して心筋に伝わることにより、心臓は規則正しく収縮と拡張を繰り返す。$c$, false, 1),
  ('5ae2ebb5-178f-4fce-8647-27b9fcd0c464', $c$心臓の拍動は、自律神経の支配を受けている。$c$, false, 2),
  ('5ae2ebb5-178f-4fce-8647-27b9fcd0c464', $c$体循環では、血液は左心室から大動脈に入り、静脈血となって右心房に戻ってくる。$c$, false, 3),
  ('5ae2ebb5-178f-4fce-8647-27b9fcd0c464', $c$肺循環とは、右心室から肺静脈を経て肺の毛細血管に入り、肺動脈を通って左心房に戻る血液の循環をいう。$c$, true, 4),
  ('5ae2ebb5-178f-4fce-8647-27b9fcd0c464', $c$動脈硬化とは、コレステロールの蓄積などにより、動脈壁が肥厚・硬化して弾力性を失った状態であり、進行すると血管の狭窄や閉塞を招き、臓器への酸素や栄養分の供給が妨げられる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4f1f9635-5a35-4011-9db4-870d934e2800',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$ヒトのホルモン、その内分泌器官及びそのはたらきの組合せとして、誤っているものは次のうちどれか。
ホルモン 内分泌器官 はたらき$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4f1f9635-5a35-4011-9db4-870d934e2800', $c$コルチゾール 副腎皮質 血糖量の増加$c$, false, 1),
  ('4f1f9635-5a35-4011-9db4-870d934e2800', $c$アルドステロン 副腎皮質 体液中の塩類バランスの調節$c$, false, 2),
  ('4f1f9635-5a35-4011-9db4-870d934e2800', $c$メラトニン 副甲状腺 体液中のカルシウムバランスの調節$c$, true, 3),
  ('4f1f9635-5a35-4011-9db4-870d934e2800', $c$インスリン 膵臓 血糖量の減少$c$, false, 4),
  ('4f1f9635-5a35-4011-9db4-870d934e2800', $c$グルカゴン 膵臓 血糖量の増加$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5e4b312d-8a92-4b53-a383-0d2f0ab5bf48',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$蛋白質並びにその分解、吸収及び代謝に関する次の記述のうち、誤っているものはどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5e4b312d-8a92-4b53-a383-0d2f0ab5bf48', $c$蛋白質は、約20種類のアミノ酸が結合してできており、内臓、筋肉、皮膚など人体の臓器等を構成する主成分である。$c$, false, 1),
  ('5e4b312d-8a92-4b53-a383-0d2f0ab5bf48', $c$蛋白質は、膵臓から分泌される消化酵素である膵リパーゼなどによりアミノ酸に分解され、小腸から吸収される。$c$, true, 2),
  ('5e4b312d-8a92-4b53-a383-0d2f0ab5bf48', $c$血液循環に入ったアミノ酸は、体内の各組織において蛋白質に再合成される。$c$, false, 3),
  ('5e4b312d-8a92-4b53-a383-0d2f0ab5bf48', $c$肝臓では、アミノ酸から血漿蛋白質が合成される。$c$, false, 4),
  ('5e4b312d-8a92-4b53-a383-0d2f0ab5bf48', $c$飢餓時には、肝臓などでアミノ酸などからブドウ糖を生成する糖新生が行われる。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c4891d26-eb49-4e30-9c87-f9e51b2455a4',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$消化器系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c4891d26-eb49-4e30-9c87-f9e51b2455a4', $c$十二指腸に胃から酸性の消化物が入ってくると、アルカリ性の膵液が分泌され、酸を中和する。$c$, false, 1),
  ('c4891d26-eb49-4e30-9c87-f9e51b2455a4', $c$無機塩及びビタミン類は、酵素による分解を受けないでそのまま吸収される。$c$, false, 2),
  ('c4891d26-eb49-4e30-9c87-f9e51b2455a4', $c$胆汁はアルカリ性で、蛋白質を分解するトリプシンなどの消化酵素を含んでいる。$c$, true, 3),
  ('c4891d26-eb49-4e30-9c87-f9e51b2455a4', $c$ペプシノーゲンは、胃酸によってペプシンという消化酵素になり、蛋白質を分解する。$c$, false, 4),
  ('c4891d26-eb49-4e30-9c87-f9e51b2455a4', $c$小腸の表面は、ビロード状の絨毛という小突起で覆われており、栄養素の吸収の効率を上げるために役立っている。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4bf1ab88-4598-477c-9092-33c9bcf7bf9e',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$血液に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4bf1ab88-4598-477c-9092-33c9bcf7bf9e', $c$赤血球は、骨髄で産生され、寿命は約120日で、血球の中で最も多い。$c$, false, 1),
  ('4bf1ab88-4598-477c-9092-33c9bcf7bf9e', $c$血液中に占める赤血球の容積の割合をヘマトクリットといい、貧血になるとその値は低くなる。$c$, false, 2),
  ('4bf1ab88-4598-477c-9092-33c9bcf7bf9e', $c$好中球は、白血球の約60％を占め、偽足を出してアメーバ様運動を行い、体内に侵入してきた細菌などを貪食する。$c$, false, 3),
  ('4bf1ab88-4598-477c-9092-33c9bcf7bf9e', $c$リンパ球は、白血球の約30％を占め、Ｔリンパ球、Ｂリンパ球などの種類があり、免疫反応に関与している。$c$, false, 4),
  ('4bf1ab88-4598-477c-9092-33c9bcf7bf9e', $c$ＡＢＯ式血液型は、白血球による血液型分類の一つで、Ａ型血液の血清は抗Ｂ抗体をもつ。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5e57bb78-d2e6-4a2f-8575-4a012db86603',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$神経系に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5e57bb78-d2e6-4a2f-8575-4a012db86603', $c$神経系は、中枢神経系と末梢神経系に大別され、中枢神経系は脳と脊髄から成る。$c$, false, 1),
  ('5e57bb78-d2e6-4a2f-8575-4a012db86603', $c$大脳の内側の髄質は、神経細胞の細胞体が集合した灰白質で、感覚、運動、思考などの作用を支配する中枢として機能する。$c$, true, 2),
  ('5e57bb78-d2e6-4a2f-8575-4a012db86603', $c$神経系を構成する基本的な単位である神経細胞は、通常、１個の細胞体、１本の軸索、複数の樹状突起から成り、ニューロンともいわれる。$c$, false, 3),
  ('5e57bb78-d2e6-4a2f-8575-4a012db86603', $c$交感神経系は、心拍数を増加したり、消化管の運動を抑制する。$c$, false, 4),
  ('5e57bb78-d2e6-4a2f-8575-4a012db86603', $c$体性神経には感覚器官からの情報を中枢に伝える感覚神経と、中枢からの命令を運動器官に伝える運動神経がある。$c$, false, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'dbe6aafe-2a9b-4ac3-a492-9f116fc284d9',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$筋肉に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dbe6aafe-2a9b-4ac3-a492-9f116fc284d9', $c$刺激に対して意識とは無関係に起こる定型的な反応を反射といい、最も単純な反射には膝蓋腱反射などの伸張反射がある。$c$, false, 1),
  ('dbe6aafe-2a9b-4ac3-a492-9f116fc284d9', $c$筋肉が収縮して出す最大筋力は、筋肉の単位断面積当たりの平均値をとると、性差や年齢差はほとんどない。$c$, false, 2),
  ('dbe6aafe-2a9b-4ac3-a492-9f116fc284d9', $c$運動することによって筋肉が太くなることを筋肉の活動性肥大という。$c$, false, 3),
  ('dbe6aafe-2a9b-4ac3-a492-9f116fc284d9', $c$荷物を持ち上げたり屈伸運動をするとき、関節運動に関与する筋肉には、等張性収縮が生じている。$c$, false, 4),
  ('dbe6aafe-2a9b-4ac3-a492-9f116fc284d9', $c$筋肉中のグリコーゲンは、酸素が十分に供給されると完全に分解され、最後に乳酸になる。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$体温調節に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9', $c$寒冷な環境においては、皮膚の血管が拡張して血流量を増し、皮膚温を上昇させる。$c$, false, 1),
  ('f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9', $c$暑熱な環境においては、内臓の血流量が増加し体内の代謝活動が亢進することにより、人体からの熱の放散が促進される。$c$, false, 2),
  ('f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9', $c$体温調節のように、外部環境が変化しても身体内部の状態を一定に保つ生体の仕組みを同調性といい、筋肉と神経系により調整されている。$c$, false, 3),
  ('f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9', $c$体温調節中枢は、小脳にあり、熱の産生と放散のバランスを維持し体温を一定に保つよう機能している。$c$, false, 4),
  ('f8cd12d2-cf1b-40c1-9ecf-a7328b9389a9', $c$甲状腺ホルモンの分泌により、代謝が亢進し、体温は上昇する。$c$, true, 5);

INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e350b4e6-ffd4-44b8-bd43-74ba6ed969ca',
  (SELECT id FROM exam_types WHERE code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = 'common' AND c.name = '労働生理'),
  $q$ストレスに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 第二種衛生管理者試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e350b4e6-ffd4-44b8-bd43-74ba6ed969ca', $c$外部からの刺激であるストレッサーは、その形態や程度にかかわらず、自律神経系と内分泌系を介して、心身の活動を抑圧する。$c$, true, 1),
  ('e350b4e6-ffd4-44b8-bd43-74ba6ed969ca', $c$ストレスに伴う心身の反応には、ノルアドレナリン、アドレナリンなどのカテコールアミンや副腎皮質ホルモンが深く関与している。$c$, false, 2),
  ('e350b4e6-ffd4-44b8-bd43-74ba6ed969ca', $c$昇進、転勤、配置替えなどがストレスの原因となることがある。$c$, false, 3),
  ('e350b4e6-ffd4-44b8-bd43-74ba6ed969ca', $c$職場環境における騒音、気温、湿度、悪臭などがストレスの原因となることがある。$c$, false, 4),
  ('e350b4e6-ffd4-44b8-bd43-74ba6ed969ca', $c$ストレスにより、自律神経系と内分泌系のバランスが崩れ、精神神経科的疾患又は内科的疾患が生じる場合がある。$c$, false, 5);
