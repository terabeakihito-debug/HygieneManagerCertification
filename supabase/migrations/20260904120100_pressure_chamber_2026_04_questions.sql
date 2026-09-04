-- pressure_chamber 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'pressure_chamber', '高圧室内作業主任者', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'pressure_chamber');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'pressure_chamber', 'common', '高圧室内作業主任者'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'pressure_chamber', 'common', '高圧室内作業主任者', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'pressure_chamber' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '圧気工法', 1
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '圧気工法'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '送気及び排気', 2
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '送気及び排気'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '高気圧障害', 3
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '高気圧障害'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '関係法令', 4
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6f4f5922-e896-46ff-b549-59017173167d',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソン工法に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6f4f5922-e896-46ff-b549-59017173167d', $c$オープンケーソン工法と比べた場合、沈下中のケーソンの変位や傾斜に対して補正が容易である。$c$, false, 1),
  ('6f4f5922-e896-46ff-b549-59017173167d', $c$作業室内の水替え作業がないので、地下水位が低下することなく、周囲の地盤を乱すことが少ない。$c$, false, 2),
  ('6f4f5922-e896-46ff-b549-59017173167d', $c$直接水の影響を受けずに設置する築島方式による陸上施工の方式は、陸上ニューマチックケーソンの工法の一種である。$c$, true, 3),
  ('6f4f5922-e896-46ff-b549-59017173167d', $c$掘削底面から地下水が湧き上がる現象をボイリングという。$c$, false, 4),
  ('6f4f5922-e896-46ff-b549-59017173167d', $c$作業室内の気圧が、掘削中の地盤のヒービングやボイリングを抑える作用をする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの種類とその概要に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc', $c$止水壁ケーソン方式のケーソンでは、ケーソンの沈下完了後に地下部分において橋脚躯体を構築しなければならないため、下部工の施工はピアケーソン方式に比べ精度が劣る。$c$, true, 1),
  ('dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc', $c$ピアケーソン方式では、ケーソンの頂版、橋脚躯体を連続的に施工するため、止水壁ケーソン方式に比べ工程を短縮することができる。$c$, false, 2),
  ('dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc', $c$止水壁ケーソン方式では、止水壁の構造は、コンクリート壁方式又は鋼矢板方式が一般的である。$c$, false, 3),
  ('dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc', $c$ピアケーソン方式では、頂版重量及び橋脚躯体重量が沈下荷重となる。$c$, false, 4),
  ('dcb0fb92-8d9d-4439-aa4e-9b13a8c704cc', $c$ケーソンの躯体のうち作業室より上方の外壁と隔壁に囲まれる空間は、水荷重用の水を入れて沈下荷重を加減する等の役割をもっている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2f18479f-7551-4da6-acdc-b8737e9a2587',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの施工に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2f18479f-7551-4da6-acdc-b8737e9a2587', $c$軟らかい砂地盤では、ニューマチックケーソン中心部から掘削を始め、次第に刃口周辺まで掘り進む。$c$, false, 1),
  ('2f18479f-7551-4da6-acdc-b8737e9a2587', $c$据付け地盤が、初期構築時の自重に十分耐え得る地盤であることを確認する。$c$, false, 2),
  ('2f18479f-7551-4da6-acdc-b8737e9a2587', $c$土砂セントルは、鋼製セントルではセントル撤去作業時の沈下量が大きいと予測される場合に採用される。$c$, false, 3),
  ('2f18479f-7551-4da6-acdc-b8737e9a2587', $c$刃口下の掘り下げは50cm以上行わない。$c$, false, 4),
  ('2f18479f-7551-4da6-acdc-b8737e9a2587', $c$躯体形状が矩形であり、かつ、フリクションカットがあるニューマチックケーソンは、一般に、周辺が攪乱されにくい。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '773182da-019f-44a4-b68c-6fb02a8517ab',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの沈下に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('773182da-019f-44a4-b68c-6fb02a8517ab', $c$粘性地盤では、作業室中央部を刃口下より50 ㎝以上深く掘り下げることがある。$c$, false, 1),
  ('773182da-019f-44a4-b68c-6fb02a8517ab', $c$摩擦力の減少や載荷による沈下が非常に困難な場合には、作業室内の圧力を減少させることによる減圧沈下を行うことがある。$c$, false, 2),
  ('773182da-019f-44a4-b68c-6fb02a8517ab', $c$粗砂・砂礫地盤は、刃先の抵抗力が小さいので、刃口下の抜き掘りを左右対称にしないなど、その方法を誤るとケーソンは傾斜する。$c$, true, 3),
  ('773182da-019f-44a4-b68c-6fb02a8517ab', $c$沈下深度が浅い場合には、沈下抵抗力に占める刃口抵抗力の割合が大きい。$c$, false, 4),
  ('773182da-019f-44a4-b68c-6fb02a8517ab', $c$粗砂・砂礫地盤の掘削で、作業室地盤を刃先より掘り下げると水が出てくるときは、まず刃口下の地盤を水中で抜き掘りする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '25eb128a-fb73-4694-8a95-ad4d8ebebe72',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気トンネル工法に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('25eb128a-fb73-4694-8a95-ad4d8ebebe72', $c$マンロックとマテリアルロックを別々に設置する場合は、これらを兼用する場合に比べ、送気量及び送気設備の容量の算出が複雑になる。$c$, true, 1),
  ('25eb128a-fb73-4694-8a95-ad4d8ebebe72', $c$マンロックとマテリアルロックを上下別々に設置する場合は、上方をマンロックとする。$c$, false, 2),
  ('25eb128a-fb73-4694-8a95-ad4d8ebebe72', $c$一般に、切羽下部から多少の漏水があっても、断面の上部が圧気により乾燥して地盤強度が小さくならないように圧気圧を設定する。$c$, false, 3),
  ('25eb128a-fb73-4694-8a95-ad4d8ebebe72', $c$内径2.6ｍ程度の断面のシールドでは、マンロックとマテリアルロックを兼用した人荷共用のロックを設備する。$c$, false, 4),
  ('25eb128a-fb73-4694-8a95-ad4d8ebebe72', $c$大断面の圧気シールドトンネルでは、一般に、切羽上端から２Ｄ/３(Ｄは掘削径)の位置の地下水圧に相当する空気圧をかける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2233f9c2-8162-49ce-b386-2d7933f28298',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工法において、作業気圧を計算する際に用いる土質係数について、土質を土質係数が小さい方から順に並べたものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2233f9c2-8162-49ce-b386-2d7933f28298', $c$シルト 細砂 粗砂$c$, true, 1),
  ('2233f9c2-8162-49ce-b386-2d7933f28298', $c$砂礫 粗砂 シルト$c$, false, 2),
  ('2233f9c2-8162-49ce-b386-2d7933f28298', $c$砂礫 粗砂 玉石$c$, false, 3),
  ('2233f9c2-8162-49ce-b386-2d7933f28298', $c$玉石 粘土 細砂$c$, false, 4),
  ('2233f9c2-8162-49ce-b386-2d7933f28298', $c$粗砂 細砂 粘土$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f665a04c-d949-46bf-902d-df8574c3c63e',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工法における作業気圧、送気量等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f665a04c-d949-46bf-902d-df8574c3c63e', $c$ニューマチックケーソンでは、理想的な空気圧は、刃口が水に没入するかしないかの状態に保つ圧力である。$c$, false, 1),
  ('f665a04c-d949-46bf-902d-df8574c3c63e', $c$圧気工法においては、作業者一人当たりに必要な送気量は、40ｍ³/時間とされている。$c$, false, 2),
  ('f665a04c-d949-46bf-902d-df8574c3c63e', $c$圧気トンネル工法で土かぶりが小さい場合は、注入工法等の補助工法を併用し、圧気圧力をできるだけ小さくする。$c$, false, 3),
  ('f665a04c-d949-46bf-902d-df8574c3c63e', $c$粘性地盤の掘削では、作業気圧が理論気圧より常に高い状態で掘削する。$c$, true, 4),
  ('f665a04c-d949-46bf-902d-df8574c3c63e', $c$圧気工法の所要空気圧を概算する場合は、通常、真水も海水も水の単位体積重量を9.8kＮ/ｍ³として計算する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a45906fc-8db9-4c9c-a8fb-ee0f46d08b25',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソン工事に関し、刃口下部から土砂中に漏出する空気量が 150 ｍ³/h、作業員のための換気に必要な安全衛生上の所要空気量が200ｍ³/hであるとき、全体の所要空気量を示す式は(１)～(５)のうちどれか。
ただし、各式における記号の定義は、次のとおりとする。
Ｑ 全体の所要空気量
ｑ１ 送気管の継手から漏出する空気量
ｑ２ エアロック、シャフトの継手から漏出する空気量
ｑ３ 刃口下部から土砂中に漏出する空気量
ｑ４ エアロックの開閉による空気量
ｑ５ ワイヤボックスから漏出する空気量
ｑ６ 作業員のための換気に必要な空気量$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a45906fc-8db9-4c9c-a8fb-ee0f46d08b25', $c$Ｑ＝ｑ１＋ｑ２＋ｑ３＋ｑ４＋ｑ５$c$, false, 1),
  ('a45906fc-8db9-4c9c-a8fb-ee0f46d08b25', $c$Ｑ＝ｑ１＋ｑ２＋ｑ３＋ｑ４＋ｑ６$c$, false, 2),
  ('a45906fc-8db9-4c9c-a8fb-ee0f46d08b25', $c$Ｑ＝ｑ１＋ｑ２＋ｑ３＋ｑ５＋ｑ６$c$, false, 3),
  ('a45906fc-8db9-4c9c-a8fb-ee0f46d08b25', $c$Ｑ＝ｑ１＋ｑ２＋ｑ４＋ｑ５＋ｑ６$c$, true, 4),
  ('a45906fc-8db9-4c9c-a8fb-ee0f46d08b25', $c$Ｑ＝ｑ１＋ｑ３＋ｑ４＋ｑ５＋ｑ６$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '92505418-c2bc-4ac4-8bae-3e7b7077d1db',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$24ｍ沈下させたニューマチックケーソン(断面は円形、外径12ｍ、質量1600ｔ)を、更に沈下させるのに必要な最小の載荷荷重(水荷重等)の質量は、570ｔであった。このニューマチックケーソンの周面摩擦力度が11kＮ/ｍ²であるとすると、このときの作業室内の圧力(ゲージ圧力)の値に最も近いものは次のうちどれか。ただし、刃口下の地盤抵抗力は無視するものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('92505418-c2bc-4ac4-8bae-3e7b7077d1db', $c$0.08ＭPa$c$, false, 1),
  ('92505418-c2bc-4ac4-8bae-3e7b7077d1db', $c$0.10ＭPa$c$, true, 2),
  ('92505418-c2bc-4ac4-8bae-3e7b7077d1db', $c$0.12ＭPa$c$, false, 3),
  ('92505418-c2bc-4ac4-8bae-3e7b7077d1db', $c$0.14ＭPa$c$, false, 4),
  ('92505418-c2bc-4ac4-8bae-3e7b7077d1db', $c$0.16ＭPa$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'efb11690-018e-4034-a7be-5096f0300e06',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工事における有害ガス及びその測定などに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('efb11690-018e-4034-a7be-5096f0300e06', $c$硫化水素による健康障害では、脳神経細胞の障害による意識消失や呼吸麻痺がみられる。$c$, false, 1),
  ('efb11690-018e-4034-a7be-5096f0300e06', $c$一酸化炭素は、血液中のグロブリンと結合し体内組織への酸素供給を妨げる。$c$, true, 2),
  ('efb11690-018e-4034-a7be-5096f0300e06', $c$メタンは、臭いはなく、空気より軽いため作業室内の上部に滞留し、爆発の危険が生じる。$c$, false, 3),
  ('efb11690-018e-4034-a7be-5096f0300e06', $c$ポータブル複合ガス検知器は、圧気下での使用には適さない。$c$, false, 4),
  ('efb11690-018e-4034-a7be-5096f0300e06', $c$酸素、一酸化炭素及び硫化水素は、検知管式測定器で測定することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '97a69174-28e2-4044-ad1d-b7846123eb9f',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる電気設備に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('97a69174-28e2-4044-ad1d-b7846123eb9f', $c$工事に使用される機械類の主動力源は電力であり、その電力消費の大部分を空気圧縮機が占める。$c$, false, 1),
  ('97a69174-28e2-4044-ad1d-b7846123eb9f', $c$作業室内への動力、照明などのための電線の引き込み方法は、通常、キャブタイヤケーブルを躯体内に埋め込む方法をとる。$c$, false, 2),
  ('97a69174-28e2-4044-ad1d-b7846123eb9f', $c$工事用電力は、一般に6600Ｖで受電されるため、空気圧縮機、その他の機械、一般照明等はそれぞれの電圧、消費電力に応じた変圧器を設置する。$c$, false, 3),
  ('97a69174-28e2-4044-ad1d-b7846123eb9f', $c$作業室内で使用する電力の配線には、ビニルキャブタイヤケーブル(ＶＣＴＦ)を使用する。$c$, true, 4),
  ('97a69174-28e2-4044-ad1d-b7846123eb9f', $c$分電盤は、作業室外に設置し、感電防止用漏電遮断器を通して各キャブタイヤケーブルを接続する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8a4ee372-f043-449a-8a7d-0478131d622d',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素欠乏事故の発生及びその防止対策に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8a4ee372-f043-449a-8a7d-0478131d622d', $c$酸素欠乏空気発生の原因には、酸素欠乏空気の貫流、減圧による逆流及び地層内埋没酸欠空気の湧出がある。$c$, false, 1),
  ('8a4ee372-f043-449a-8a7d-0478131d622d', $c$ニューマチックケーソンの間で貫流する距離は、一般に、地下水位が低いほど、また地盤の含水比が小さいほど大きくなる。$c$, false, 2),
  ('8a4ee372-f043-449a-8a7d-0478131d622d', $c$鋼矢板、ＳＭＷなどによる遮断壁工は、エアブロー防止遮断壁工としての効果が期待できる。$c$, false, 3),
  ('8a4ee372-f043-449a-8a7d-0478131d622d', $c$エアブローの発生が問題となるケーソンでは、エアブロー防止のため作業圧力の設定を刃先から20cm程度上とし、刃先を水没させる掘削方法を採用する。$c$, false, 4),
  ('8a4ee372-f043-449a-8a7d-0478131d622d', $c$酸素欠乏空気を吸入するおそれのある場合は、送気マスク、電動ファン付呼吸用保護具又は空気呼吸器を装着しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '206c0e22-dc5b-45e6-a1bb-753da5f53cba',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる空気圧縮機等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('206c0e22-dc5b-45e6-a1bb-753da5f53cba', $c$異常温度自動警報装置は、クーリングタワーを通る循環水が異常温度となったときに警報を発する装置である。$c$, true, 1),
  ('206c0e22-dc5b-45e6-a1bb-753da5f53cba', $c$オイルフリースクリュー型の空気圧縮機は、圧縮過程で潤滑油を供給する必要のないオイルレスタイプの圧縮機である。$c$, false, 2),
  ('206c0e22-dc5b-45e6-a1bb-753da5f53cba', $c$空気圧縮機の使用電圧は、通常、3300Ｖである。$c$, false, 3),
  ('206c0e22-dc5b-45e6-a1bb-753da5f53cba', $c$レシーバータンクは、送気管に流れる圧縮空気の脈動を緩和し、空気使用量の変動を吸収し、さらに、除去しきれなかった沈殿物を分離する設備である。$c$, false, 4),
  ('206c0e22-dc5b-45e6-a1bb-753da5f53cba', $c$圧縮空気清浄装置は、レシーバータンクの前又は後に設ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bf589482-6ff9-4058-976d-c6bde5021ea8',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる送排気管に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bf589482-6ff9-4058-976d-c6bde5021ea8', $c$送気管の破損時に作業室内の空気が逆流しないように、送気管路の必要な箇所にチャッキバルブを設ける。$c$, false, 1),
  ('bf589482-6ff9-4058-976d-c6bde5021ea8', $c$圧縮空気が作業室に吐出する送気管の末端にはレギュレータバルブを取り付ける。$c$, true, 2),
  ('bf589482-6ff9-4058-976d-c6bde5021ea8', $c$排気管には、作業室側にグランドコックを取り付ける。$c$, false, 3),
  ('bf589482-6ff9-4058-976d-c6bde5021ea8', $c$函内送排気管は、通常直径100mm又は125mmとし、最低でも３本設置する。$c$, false, 4),
  ('bf589482-6ff9-4058-976d-c6bde5021ea8', $c$送気本管は、空気圧縮機と圧力調整装置の間に敷設する送気幹線の設備である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '735b88b1-ce8a-40a1-af55-8c41b80c441a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソンの送排気に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('735b88b1-ce8a-40a1-af55-8c41b80c441a', $c$通常掘削時には、作業室送気管のバルブを閉め、ロック送気管のバルブを開放した状態の函内送気とし、バック圧を作業室送気管からとる。$c$, true, 1),
  ('735b88b1-ce8a-40a1-af55-8c41b80c441a', $c$中埋めコンクリート施工中には、作業室内の気圧が増大するので、排気を行ってこれを一定に調整する作業をブローパイプバルブ調整という。$c$, false, 2),
  ('735b88b1-ce8a-40a1-af55-8c41b80c441a', $c$作業室内を換気するときは、室内圧の低下を最小限に保ちながら、排気バルブを所定の時間、開けておく。$c$, false, 3),
  ('735b88b1-ce8a-40a1-af55-8c41b80c441a', $c$作業室への送気を断つと、ケーソンの沈下不能や、傾斜、移動等の悪影響を及ぼす要因となる。$c$, false, 4),
  ('735b88b1-ce8a-40a1-af55-8c41b80c441a', $c$作業室において、排気管の吸込み口は、送気管の吹出し口の反対側に設け、効率よく換気するようにする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c57279e2-6aeb-43f7-8219-c07a8c2b8ac4',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素減圧及び酸素減圧設備に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c57279e2-6aeb-43f7-8219-c07a8c2b8ac4', $c$酸素減圧では、酸素マスクによる酸素呼吸とマンロック内の高圧空気の呼吸(エアブレイク)を繰り返しつつ減圧する。$c$, false, 1),
  ('c57279e2-6aeb-43f7-8219-c07a8c2b8ac4', $c$純酸素を吸入すると、血中の窒素の呼気への排出量が減少する。$c$, true, 2),
  ('c57279e2-6aeb-43f7-8219-c07a8c2b8ac4', $c$酸素減圧を行うときは、マンロック内の酸素濃度が常に23％以下となるように換気を行う。$c$, false, 3),
  ('c57279e2-6aeb-43f7-8219-c07a8c2b8ac4', $c$酸素減圧を行うときは、酸素、炭酸ガスなどの濃度の監視のためにガス濃度測定機器を設備し、測定値をマンロック内に表示する。$c$, false, 4),
  ('c57279e2-6aeb-43f7-8219-c07a8c2b8ac4', $c$高い酸素濃度で吐き出される呼気をマンロック内に排気すると、室内の酸素濃度が上昇し火災のリスクが高まる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1a8c4682-26e2-43ab-8d2b-4f2ad2e02311',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$混合ガス設備等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1a8c4682-26e2-43ab-8d2b-4f2ad2e02311', $c$ヘリウム混合ガスシステムでは、高気圧障害の発症防止のため、作業気圧0.40ＭPa以上において、作業者が所定の比率で混合されたヘリウム混合ガスを呼吸しながら、作業及びその減圧を行う。$c$, false, 1),
  ('1a8c4682-26e2-43ab-8d2b-4f2ad2e02311', $c$ヘリウムロックＡは、艤装設備の最下端に設置し、加圧作業、ヘリウム混合ガスの供給及び減圧作業の途中までを行うロックである。$c$, false, 2),
  ('1a8c4682-26e2-43ab-8d2b-4f2ad2e02311', $c$ヘリウム呼吸マスクは、環境空気がマスク内に混入することを防ぐため、マスク内圧が環境圧よりわずかに高い陽圧デマンド型を採用している。$c$, false, 3),
  ('1a8c4682-26e2-43ab-8d2b-4f2ad2e02311', $c$混合ガスのガス組成比率は、高気圧作業における酸素分圧の限度の範囲内において、なるべく高い酸素分圧となるようにガス組成比率を決定する。$c$, false, 4),
  ('1a8c4682-26e2-43ab-8d2b-4f2ad2e02311', $c$トライミックスは、ヘリウムと酸素の２種の混合ガスで、大深度の圧気土木で汎用的に用いられている。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e9e9e1bb-71ae-4d12-a8ad-21ce34480085',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる設備等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e9e9e1bb-71ae-4d12-a8ad-21ce34480085', $c$作業室内に設置する消火器は、強化液型で、吐出圧力が0.7～0.98ＭPa(ゲージ圧力)のものがある。$c$, false, 1),
  ('e9e9e1bb-71ae-4d12-a8ad-21ce34480085', $c$高圧下での空気呼吸器としては、ゲージ圧力0.1～0.4ＭPaまで30分間使用できるものと、0.1～0.25ＭPaまで45分間使用できるものがある。$c$, false, 2),
  ('e9e9e1bb-71ae-4d12-a8ad-21ce34480085', $c$電動式小型バックホウは、クローラ式の掘削機で、一般に掘削地点とアースバケットの積み込み地点の距離が短いケーソンなどで使用される。$c$, false, 3),
  ('e9e9e1bb-71ae-4d12-a8ad-21ce34480085', $c$ヘリウム混合ガスマスクを使用する場合には、連絡通信設備として無線機を用いることがある。$c$, false, 4),
  ('e9e9e1bb-71ae-4d12-a8ad-21ce34480085', $c$天井走行式ショベルの掘削推力の反力は、一般に、躯体側壁に伝えて受け止める。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9802e82e-710c-467a-8557-9f2c3c005850',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$再圧室での再圧に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9802e82e-710c-467a-8557-9f2c3c005850', $c$酸素再圧は、空気再圧に比べばく露圧力が低く、所要時間を少なくすることができる。$c$, false, 1),
  ('9802e82e-710c-467a-8557-9f2c3c005850', $c$酸素再圧では、0.18ＭPa(ゲージ圧力)に到達したら加圧を停止する。$c$, false, 2),
  ('9802e82e-710c-467a-8557-9f2c3c005850', $c$酸素再圧では、減圧を開始するまでの所定の時間、圧力0.18ＭPa(ゲージ圧力)において継続して酸素のみの呼吸を行う。$c$, true, 3),
  ('9802e82e-710c-467a-8557-9f2c3c005850', $c$酸素再圧による再圧中は、再圧室内の換気を十分に行う。$c$, false, 4),
  ('9802e82e-710c-467a-8557-9f2c3c005850', $c$空気再圧は、設備や技術の面から酸素再圧を行うことが困難な場合に行うべき手技である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '699f7f89-70c4-4c49-9b2b-8d455e3eb08a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ビュールマンのＺＨ－Ｌ16モデルにおける半飽和時間、半飽和組織等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('699f7f89-70c4-4c49-9b2b-8d455e3eb08a', $c$Ｍ値とは、ある環境圧力に対して、労働者の身体が許容できるそれぞれの半飽和組織の最大の不活性ガス分圧である。$c$, false, 1),
  ('699f7f89-70c4-4c49-9b2b-8d455e3eb08a', $c$不活性ガスの半飽和時間が短い組織は、血流が豊富で、半飽和時間が長い組織は、血流が乏しい。$c$, false, 2),
  ('699f7f89-70c4-4c49-9b2b-8d455e3eb08a', $c$全ての半飽和組織において、半飽和時間は、ヘリウムより窒素の方が長い。$c$, false, 3),
  ('699f7f89-70c4-4c49-9b2b-8d455e3eb08a', $c$Ｍ値は、半飽和時間が短い組織ほど小さい。$c$, true, 4),
  ('699f7f89-70c4-4c49-9b2b-8d455e3eb08a', $c$最後の減圧を終了してから、14時間を経過しない間に、次の高気圧作業を行う場合は、大気圧下に戻った後も不活性ガス分圧の計算を継続する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3a0d7378-6332-4f7f-8128-75d447586775',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$空気をゲージ圧力 0.2 ＭPaに加圧したとき、窒素の分圧(絶対圧力)に最も近いものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3a0d7378-6332-4f7f-8128-75d447586775', $c$0.08ＭPa$c$, false, 1),
  ('3a0d7378-6332-4f7f-8128-75d447586775', $c$0.16ＭPa$c$, false, 2),
  ('3a0d7378-6332-4f7f-8128-75d447586775', $c$0.20ＭPa$c$, false, 3),
  ('3a0d7378-6332-4f7f-8128-75d447586775', $c$0.24ＭPa$c$, true, 4),
  ('3a0d7378-6332-4f7f-8128-75d447586775', $c$0.32ＭPa$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7121a1ec-d967-4eea-8a21-3f833d75859b',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$流体の性質等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7121a1ec-d967-4eea-8a21-3f833d75859b', $c$25℃は、絶対温度では約298Ｋである。$c$, false, 1),
  ('7121a1ec-d967-4eea-8a21-3f833d75859b', $c$体積分率0.1％の二酸化炭素は、1000ppmである。$c$, false, 2),
  ('7121a1ec-d967-4eea-8a21-3f833d75859b', $c$体積が一定の場合、気体の圧力は絶対温度に比例する。$c$, false, 3),
  ('7121a1ec-d967-4eea-8a21-3f833d75859b', $c$ヘリウムが水に接しているとき、これが水に溶け込むことのできる量は、温度が一定であれば、ヘリウムの分圧に比例する。$c$, false, 4),
  ('7121a1ec-d967-4eea-8a21-3f833d75859b', $c$温度が一定の場合、気体の体積は圧力に比例する。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a488c831-e416-4499-bcb7-7759dd131ba7',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$二酸化炭素及び二酸化炭素中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a488c831-e416-4499-bcb7-7759dd131ba7', $c$吸入空気中の二酸化炭素の量が多くなり、体内に蓄積が起こると、呼吸中枢が刺激され、呼吸が速く深くなる。$c$, false, 1),
  ('a488c831-e416-4499-bcb7-7759dd131ba7', $c$地上における人間の呼気中には、通常、二酸化炭素が約0.4％含まれている。$c$, true, 2),
  ('a488c831-e416-4499-bcb7-7759dd131ba7', $c$二酸化炭素は、空気より重い。$c$, false, 3),
  ('a488c831-e416-4499-bcb7-7759dd131ba7', $c$二酸化炭素中毒にかかると、空気飢餓感、頭痛、異常な発汗、顔面の紅潮などの症状が現れる。$c$, false, 4),
  ('a488c831-e416-4499-bcb7-7759dd131ba7', $c$二酸化炭素は、人体の代謝作用や物質の燃焼により発生する無色、無臭の気体で、人の呼吸の維持に微量必要なものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e2db78f3-4f7a-418e-a23c-1737538b0950',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$窒素及び窒素酔いに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e2db78f3-4f7a-418e-a23c-1737538b0950', $c$吸入空気中の二酸化炭素の量が多くなると、窒素酔いにかかりにくくなる。$c$, true, 1),
  ('e2db78f3-4f7a-418e-a23c-1737538b0950', $c$窒素酔いの症状が起こったときは、症状が消失するまで減圧する。$c$, false, 2),
  ('e2db78f3-4f7a-418e-a23c-1737538b0950', $c$窒素による麻酔効果と窒素ガスの脂肪組織への溶解には正の相関関係が存在する。$c$, false, 3),
  ('e2db78f3-4f7a-418e-a23c-1737538b0950', $c$窒素酔いでは、精神的機能の緩慢化や多幸症と呼ばれる精神の高揚状態に陥ってしまう現象を呈する。$c$, false, 4),
  ('e2db78f3-4f7a-418e-a23c-1737538b0950', $c$窒素は、常温・常圧では、化学的に安定した不活性の気体で麻酔作用もない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cf3e13f1-ab83-4f82-82b6-b4eb62ad7033',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$酸素ばく露量及び酸素中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cf3e13f1-ab83-4f82-82b6-b4eb62ad7033', $c$１週間当たりの酸素の許容最大ばく露量は、2,500ＵＰＴＤである。$c$, false, 1),
  ('cf3e13f1-ab83-4f82-82b6-b4eb62ad7033', $c$ＵＰＴＤは、酸素分圧が 50kPaを超える場合に算定する。$c$, false, 2),
  ('cf3e13f1-ab83-4f82-82b6-b4eb62ad7033', $c$酸素中毒は、暑いときや寒いときなど環境条件の悪いときに起こりやすく、作業強度等も影響する。$c$, false, 3),
  ('cf3e13f1-ab83-4f82-82b6-b4eb62ad7033', $c$長時間高気圧下にいなければならないときは、酸素中毒予防のため吸気の酸素分圧を 0.3 ＭPa程度以下とする。$c$, true, 4),
  ('cf3e13f1-ab83-4f82-82b6-b4eb62ad7033', $c$中枢神経型酸素中毒は急性型であり、肺型酸素中毒は慢性型である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '43955d63-9864-4e7a-8d2f-ec7c3661cbd8',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧症に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('43955d63-9864-4e7a-8d2f-ec7c3661cbd8', $c$減圧症は、作業中の空気圧が0.1ＭPa(ゲージ圧力)以下の場合はほとんど発生しない。$c$, false, 1),
  ('43955d63-9864-4e7a-8d2f-ec7c3661cbd8', $c$急激な減圧により極めて多数の気泡が発生し、これらが肺の毛細血管を塞栓すると、チョークスという重篤な肺減圧症を引き起こす。$c$, false, 2),
  ('43955d63-9864-4e7a-8d2f-ec7c3661cbd8', $c$心臓の左右の心房の間が卵円孔開存で通じていると、減圧障害を引き起こすおそれがある。$c$, false, 3),
  ('43955d63-9864-4e7a-8d2f-ec7c3661cbd8', $c$減圧症は、発生した時の様子だけからでは、その後の症状の経過を予測することが難しい。$c$, false, 4),
  ('43955d63-9864-4e7a-8d2f-ec7c3661cbd8', $c$減圧症にかかった作業者にみられる無菌性骨壊死は、肩関節や股関節に発症した場合は大きな障害はないが、骨幹部に発症した場合は痛みや運動機能障害を起こすことが多い。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b4759a2c-445e-4c96-a313-47ebef5a84e0',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$圧外傷に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b4759a2c-445e-4c96-a313-47ebef5a84e0', $c$加圧時の圧外傷は、加圧による圧力変化のために体腔の容積が増えることで生じ、中耳腔、副鼻腔などで生じる。$c$, true, 1),
  ('b4759a2c-445e-4c96-a313-47ebef5a84e0', $c$副鼻腔に障害が生じても、同じ圧力下にしばらくいると痛みが和らぐことが多い。$c$, false, 2),
  ('b4759a2c-445e-4c96-a313-47ebef5a84e0', $c$中耳腔内外の圧力差が0.03ＭPaになると、多くの人は鼓膜に痛みを感じるようになる。$c$, false, 3),
  ('b4759a2c-445e-4c96-a313-47ebef5a84e0', $c$歯髄腔と呼ばれる小さな神経や血管が入っている空洞や歯の周囲の組織に締め付け障害を起こすと、歯が痛んだり、歯ぐきが腫れることがある。$c$, false, 4),
  ('b4759a2c-445e-4c96-a313-47ebef5a84e0', $c$リバース・スクイーズによる障害は、減圧の際に発生する圧外傷である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f378817b-17ca-4fbb-b683-a560bbcef3d3',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$肺の破裂及びその合併症に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f378817b-17ca-4fbb-b683-a560bbcef3d3', $c$減圧のとき息を止めていると、肺は弾性の限界を超えて過膨張状態となり、ついには肺胞が破れてしまう。$c$, false, 1),
  ('f378817b-17ca-4fbb-b683-a560bbcef3d3', $c$肺胞の破れにより肺の毛細血管に侵入した空気が気泡状になり、血流によって全身に運ばれ、塞栓となって末梢血管を閉塞して生じる疾患を空気塞栓症(エア・エンボリズム)という。$c$, false, 2),
  ('f378817b-17ca-4fbb-b683-a560bbcef3d3', $c$破れた肺胞が胸膜腔と通じると、肺は縮んでしまい換気できなくなる。$c$, false, 3),
  ('f378817b-17ca-4fbb-b683-a560bbcef3d3', $c$0.1ＭPa(ゲージ圧力)程度の比較的低い圧力からの減圧では、肺の過膨張の危険性は低い。$c$, true, 4),
  ('f378817b-17ca-4fbb-b683-a560bbcef3d3', $c$肺胞から漏れた空気が胸部中央の縦隔洞や頚部にまで入り込み、縦隔気腫や皮下気腫となることがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '687ba4f9-7636-49d6-a0bb-02b1a35a1dbc',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$高気圧下での作業環境、高気圧作業に伴う影響等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('687ba4f9-7636-49d6-a0bb-02b1a35a1dbc', $c$体組織の窒素分圧が空気の窒素分圧より高いときは、体組織→静脈→肺という経路で、体組織の窒素が排出される。$c$, false, 1),
  ('687ba4f9-7636-49d6-a0bb-02b1a35a1dbc', $c$１日の高圧下の作業時間が同じ場合、高圧下の作業を半分ずつ２回作業に分けるよりも、連続した１回作業にする。$c$, false, 2),
  ('687ba4f9-7636-49d6-a0bb-02b1a35a1dbc', $c$高気圧下の作業を終え、マンロックで減圧するときは、断熱圧縮により気温が低下する。$c$, true, 3),
  ('687ba4f9-7636-49d6-a0bb-02b1a35a1dbc', $c$体内組織に溶解する窒素の量は、0.3ＭPa(ゲージ圧力)の空気中では大気圧下の４倍となる。$c$, false, 4),
  ('687ba4f9-7636-49d6-a0bb-02b1a35a1dbc', $c$吸入空気の圧力が高くなると、空気の密度が増加し気道抵抗が増加するので、肺の換気能力が低下する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '920e62a3-a2e8-4d82-a3d9-3555cc3c952a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$一次救命処置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('920e62a3-a2e8-4d82-a3d9-3555cc3c952a', $c$傷病者の肩を軽くたたきながら呼びかけて、反応がない場合は、その場で大声で叫んで周囲の注意を喚起し、応援を呼ぶ。$c$, false, 1),
  ('920e62a3-a2e8-4d82-a3d9-3555cc3c952a', $c$一次救命処置は、できる限り単独で行うことは避ける。$c$, false, 2),
  ('920e62a3-a2e8-4d82-a3d9-3555cc3c952a', $c$傷病者に反応がない場合は、約１分間呼吸の有無を観察し、正常な呼吸がないと判断したときに、胸骨圧迫を開始する。$c$, true, 3),
  ('920e62a3-a2e8-4d82-a3d9-3555cc3c952a', $c$胸骨圧迫は、胸が約５cm沈む強さで、１分間に100～120回のテンポで行う。$c$, false, 4),
  ('920e62a3-a2e8-4d82-a3d9-3555cc3c952a', $c$ＡＥＤを用いた場合、電気ショックを行った後や電気ショックは不要とメッセージがあったときには、胸骨圧迫を再開し心肺蘇生を続ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd47e8854-c0f4-4a4e-97e9-9431ae4b54a1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の設備等に関する次の措置のうち、法令に違反しているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d47e8854-c0f4-4a4e-97e9-9431ae4b54a1', $c$作業室の気積が50ｍ³であるので、同時に高圧室内業務に従事させる作業者を12人とした。$c$, false, 1),
  ('d47e8854-c0f4-4a4e-97e9-9431ae4b54a1', $c$気こう室の床面積が４ｍ²、気積が7.9ｍ³であるので、同時に加圧又は減圧を受ける高圧室内作業者を15人とした。$c$, true, 2),
  ('d47e8854-c0f4-4a4e-97e9-9431ae4b54a1', $c$作業室へ送気するための送気管には、作業室に近接する部分に逆止弁を設けた。$c$, false, 3),
  ('d47e8854-c0f4-4a4e-97e9-9431ae4b54a1', $c$空気圧縮機と気こう室との間に空気清浄装置を設けた。$c$, false, 4),
  ('d47e8854-c0f4-4a4e-97e9-9431ae4b54a1', $c$潜函の気こう室内の高圧室内作業者に減圧を行うための排気管を、内径52㎜のものとした。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'de030bed-40cf-47bf-a6f7-5de09d2ded89',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内作業主任者の免許及び選任に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('de030bed-40cf-47bf-a6f7-5de09d2ded89', $c$高圧室内作業を行う作業室が２以上ある場合においては、作業室ごとに作業主任者を選任しなければならない。$c$, false, 1),
  ('de030bed-40cf-47bf-a6f7-5de09d2ded89', $c$免許に係る業務に現に就いている者は、免許証を損傷したときは、免許証の再交付を受けなければならない。$c$, false, 2),
  ('de030bed-40cf-47bf-a6f7-5de09d2ded89', $c$免許に係る業務に現に就いている者は、住所を変更したときは、免許証の書替えを受けなければならない。$c$, true, 3),
  ('de030bed-40cf-47bf-a6f7-5de09d2ded89', $c$労働安全衛生法違反の事由により免許の取消しの処分を受けた者は、取消しの日から１年間は、免許を受けることができない。$c$, false, 4),
  ('de030bed-40cf-47bf-a6f7-5de09d2ded89', $c$満20歳に満たない者は、免許を受けることができない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '79ad8b4f-85b4-4db2-9487-41eef5aa6e77',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務に労働者を就かせるときに行う特別教育の教育事項として、法令で定められていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('79ad8b4f-85b4-4db2-9487-41eef5aa6e77', $c$圧気工法の知識に関すること。$c$, false, 1),
  ('79ad8b4f-85b4-4db2-9487-41eef5aa6e77', $c$圧気工法に係る設備に関すること。$c$, false, 2),
  ('79ad8b4f-85b4-4db2-9487-41eef5aa6e77', $c$急激な圧力低下、火災等の防止に関すること。$c$, false, 3),
  ('79ad8b4f-85b4-4db2-9487-41eef5aa6e77', $c$救急蘇生法に関すること。$c$, true, 4),
  ('79ad8b4f-85b4-4db2-9487-41eef5aa6e77', $c$高気圧障害の知識に関すること。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd7b7d147-85c4-4d94-bb7f-ba07e2f76966',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の管理に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d7b7d147-85c4-4d94-bb7f-ba07e2f76966', $c$減圧を終了した高圧室内作業者に対しては、当該減圧を終了した時から14時間は、重激な業務に従事させてはならない。$c$, false, 1),
  ('d7b7d147-85c4-4d94-bb7f-ba07e2f76966', $c$高圧室内業務を行うときは、高圧室内作業者及び空気圧縮機の運転を行う者との連絡等の措置を講ずるための連絡員を、気こう室の付近に、常時配置しなければならない。$c$, false, 2),
  ('d7b7d147-85c4-4d94-bb7f-ba07e2f76966', $c$必要のある者以外の者が気こう室及び作業室に立ち入ることを禁止しなければならない。$c$, false, 3),
  ('d7b7d147-85c4-4d94-bb7f-ba07e2f76966', $c$高圧室内業務を行うときは、高圧室内作業者及び空気圧縮機の運転を行う者と連絡員とが通話することができる通話装置を設けなければならない。$c$, false, 4),
  ('d7b7d147-85c4-4d94-bb7f-ba07e2f76966', $c$高圧室内業務を行うときは、通話装置が故障した場合においても連絡することができる方法を定めるとともに、高圧室内作業者、空気圧縮機の運転を行う者及び連絡員に対し、３か月以内ごとに１回、連絡方法についての訓練を実施しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5f4ef1e0-41ab-4f98-bbcd-aae8affd0182',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務を行うときにあらかじめ定めることとされている作業計画において、法令上、示さなければならない事項に該当しないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5f4ef1e0-41ab-4f98-bbcd-aae8affd0182', $c$作業室又は気こう室へ送気する気体の成分組成$c$, false, 1),
  ('5f4ef1e0-41ab-4f98-bbcd-aae8affd0182', $c$当該高圧室内業務における平均作業圧力$c$, true, 2),
  ('5f4ef1e0-41ab-4f98-bbcd-aae8affd0182', $c$加圧及び減圧の速度$c$, false, 3),
  ('5f4ef1e0-41ab-4f98-bbcd-aae8affd0182', $c$減圧を停止する圧力及び当該圧力下において減圧を停止する時間$c$, false, 4),
  ('5f4ef1e0-41ab-4f98-bbcd-aae8affd0182', $c$加圧を開始する時から減圧を開始する時までの時間$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'be3cf663-4efb-438c-ab2c-1e084fe152ec',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務に係る作業室又は気こう室におけるガス分圧及び酸素ばく露量に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('be3cf663-4efb-438c-ab2c-1e084fe152ec', $c$１ＵＰＴＤは、100kPaの平均酸素分圧に１分間ばく露したときの毒性量単位である。$c$, false, 1),
  ('be3cf663-4efb-438c-ab2c-1e084fe152ec', $c$１日当たりの酸素ばく露量は、600ＵＰＴＤを超えてはならない。$c$, false, 2),
  ('be3cf663-4efb-438c-ab2c-1e084fe152ec', $c$酸素の分圧は、18 kPa未満であってはならない。$c$, false, 3),
  ('be3cf663-4efb-438c-ab2c-1e084fe152ec', $c$窒素の分圧は、400kPaを超えてはならない。$c$, false, 4),
  ('be3cf663-4efb-438c-ab2c-1e084fe152ec', $c$炭酸ガスの分圧は、５kPa以下としなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a244fc97-e250-40bd-b3e5-6421405b0d88',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$気こう室における加圧又は減圧時に行う措置に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a244fc97-e250-40bd-b3e5-6421405b0d88', $c$気こう室において高圧室内業務従事者に加圧を行うときは、毎分0.08ＭPa以下の速度で行わなければならない。$c$, false, 1),
  ('a244fc97-e250-40bd-b3e5-6421405b0d88', $c$減圧に要する時間が１時間を超える場合には、高圧室内業務従事者に椅子その他の休息用具を使用させなければならない。$c$, false, 2),
  ('a244fc97-e250-40bd-b3e5-6421405b0d88', $c$気こう室において高圧室内業務従事者に減圧を行うときは、あらかじめ、当該減圧に要する時間を当該高圧室内業務従事者に周知させなければならない。$c$, false, 3),
  ('a244fc97-e250-40bd-b3e5-6421405b0d88', $c$気こう室の照明の光度を20カンデラ以上としなければならない。$c$, true, 4),
  ('a244fc97-e250-40bd-b3e5-6421405b0d88', $c$気こう室内の温度が10℃以下である場合には、高圧室内業務従事者に毛布その他の適当な保温用具を使用させなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '031e26bb-2127-494e-94eb-5dcfa6964fd8',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務において、法令上、特定の設備については一定期間ごとに１回以上点検しなければならないが、次の設備とその期間との組合せのうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('031e26bb-2127-494e-94eb-5dcfa6964fd8', $c$異常温度の自動警報装置 ……………………………… １週$c$, false, 1),
  ('031e26bb-2127-494e-94eb-5dcfa6964fd8', $c$空気圧縮機 ……………………………………………… １週$c$, false, 2),
  ('031e26bb-2127-494e-94eb-5dcfa6964fd8', $c$空気清浄装置 …………………………………………… １週$c$, true, 3),
  ('031e26bb-2127-494e-94eb-5dcfa6964fd8', $c$潜函等に設けられた電路 ……………………………… １か月$c$, false, 4),
  ('031e26bb-2127-494e-94eb-5dcfa6964fd8', $c$気こう室からの排気を調節するためのバルブ ……… １日$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'be8a6cb2-3ef8-4dad-ba1c-fd26f936de45',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務に常時従事する労働者に対して行う高気圧業務健康診断において、法令上、実施することが義務付けられていない項目は次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('be8a6cb2-3ef8-4dad-ba1c-fd26f936de45', $c$四肢の運動機能の検査$c$, false, 1),
  ('be8a6cb2-3ef8-4dad-ba1c-fd26f936de45', $c$尿中の糖の有無の検査$c$, false, 2),
  ('be8a6cb2-3ef8-4dad-ba1c-fd26f936de45', $c$尿中の蛋白の有無の検査$c$, false, 3),
  ('be8a6cb2-3ef8-4dad-ba1c-fd26f936de45', $c$白血球数及び白血球百分率の検査$c$, true, 4),
  ('be8a6cb2-3ef8-4dad-ba1c-fd26f936de45', $c$血圧の測定$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd2b56094-bde9-4a20-baee-59bc89d44f8a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高気圧作業安全衛生規則における用語の意義に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 高圧室内作業主任者試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d2b56094-bde9-4a20-baee-59bc89d44f8a', $c$高気圧障害とは、高気圧による減圧症、酸素、窒素又はヘリウムによる中毒その他の高気圧による健康障害をいう。$c$, true, 1),
  ('d2b56094-bde9-4a20-baee-59bc89d44f8a', $c$高圧室内業務とは、潜函工法その他の圧気工法により、大気圧を超える気圧下の作業室又はシャフトの内部において行う作業に係る業務をいう。$c$, false, 2),
  ('d2b56094-bde9-4a20-baee-59bc89d44f8a', $c$気こう室とは、高圧室内作業者が、作業室への出入りに際し加圧又は減圧を受ける室をいう。$c$, false, 3),
  ('d2b56094-bde9-4a20-baee-59bc89d44f8a', $c$窒素及びヘリウムの気体は、不活性ガスである。$c$, false, 4),
  ('d2b56094-bde9-4a20-baee-59bc89d44f8a', $c$一酸化炭素及びメタンガスは、有害ガスである。$c$, false, 5);

do $$
declare
  pressure_chamber_2026_04 int;
  scoped int;
begin
  select count(*) into pressure_chamber_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 高圧室内作業主任者試験%';

  if pressure_chamber_2026_04 <> 40 then
    raise exception 'pressure_chamber 2026-04 sitting must be 40 questions (got %)', pressure_chamber_2026_04;
  end if;

  select count(*) into scoped
  from mock_exams
  where exam_id = 'pressure_chamber'
    and category_scope is not null;

  if scoped <> 0 then
    raise exception 'pressure_chamber mocks must not use category_scope (got %)', scoped;
  end if;
end $$;

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'pressure_chamber',
  exam_types.id,
  '高圧室内作業主任者模擬試験(令和8年4月)',
  240,
  40,
  '令和8年4月公表 高圧室内作業主任者試験'
from exam_types
where exam_types.exam_id = 'pressure_chamber'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'pressure_chamber'
      and source_filter = '令和8年4月公表 高圧室内作業主任者試験'
      and category_scope is null
  );
