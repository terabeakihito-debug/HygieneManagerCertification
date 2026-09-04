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
  '12d44326-9378-4ccd-b6c5-d1a85bdcddac',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソン工法に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('12d44326-9378-4ccd-b6c5-d1a85bdcddac', $c$ニューマチックケーソン工法では、作業室内で支持地盤の地耐力を確認する平板載荷試験等ができる。$c$, false, 1),
  ('12d44326-9378-4ccd-b6c5-d1a85bdcddac', $c$ニューマチックケーソン工法は、転石や岩盤中に設置しなければならない場合でも確実に施工できる。$c$, false, 2),
  ('12d44326-9378-4ccd-b6c5-d1a85bdcddac', $c$ニューマチックケーソン工法は、作業室内の水替え作業がないので、地下水位が低下することなく、周囲の地盤を乱すことが少ない。$c$, false, 3),
  ('12d44326-9378-4ccd-b6c5-d1a85bdcddac', $c$ニューマチックケーソン工法は、オープンケーソン工法と比べた場合、沈下中のケーソンの変位や傾斜に対して補正が容易である。$c$, false, 4),
  ('12d44326-9378-4ccd-b6c5-d1a85bdcddac', $c$掘削中の地盤の掘削底面が膨れ上がる現象をボイリングという。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'aa582daf-2189-4156-b701-34be90ade446',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの種類と工法に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('aa582daf-2189-4156-b701-34be90ade446', $c$陸上ニューマチックケーソン工法の一種として、直接水の影響を受けずに設置する築島方式による陸上施工の方式がある。$c$, true, 1),
  ('aa582daf-2189-4156-b701-34be90ade446', $c$水上ニューマチックケーソン工法の一種として、鋼殻方式による水上施工の方式がある。$c$, false, 2),
  ('aa582daf-2189-4156-b701-34be90ade446', $c$作業室の真上にもう一つの部屋を作り、エアロックとして利用する構造のケーソンがある。$c$, false, 3),
  ('aa582daf-2189-4156-b701-34be90ade446', $c$ピアケーソン方式では、止水壁ケーソン方式に比べ工程を短縮することができる。$c$, false, 4),
  ('aa582daf-2189-4156-b701-34be90ade446', $c$止水壁ケーソン方式では、ケーソンの沈下完了後に橋脚躯体を構築することから、ピアケーソン方式に比べ精度の高い下部工が築造できる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f33c281d-aada-40a5-8455-7a74d12aa437',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの施工に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f33c281d-aada-40a5-8455-7a74d12aa437', $c$据付け地盤は、地下水の影響を受けない高さとする。$c$, false, 1),
  ('f33c281d-aada-40a5-8455-7a74d12aa437', $c$鋼製セントルは、作業室の不等沈下や傾斜が発生した時に、セントル全体のねじれを生じる場合がある。$c$, false, 2),
  ('f33c281d-aada-40a5-8455-7a74d12aa437', $c$躯体形状が矩形であり、かつ、フリクションカットがあるニューマチックケーソンは、一般に、周辺が攪乱されやすい。$c$, false, 3),
  ('f33c281d-aada-40a5-8455-7a74d12aa437', $c$セントルは、その使用材料から鋼製セントル及び土砂セントルに大別される。$c$, false, 4),
  ('f33c281d-aada-40a5-8455-7a74d12aa437', $c$鋼製セントルは、土砂セントルではセントル撤去作業時の沈下量が大きいと予測される場合に採用される。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気トンネル工法に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a', $c$トンネルにおける圧気工法は、シールド工法での切羽前面の支障物撤去、ビット交換など切羽を解放せざるを得ない場合に補助的に採用する。$c$, false, 1),
  ('cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a', $c$マンロックとマテリアルロックを兼用する場合は、これらを別々に設置する場合に比べ、送気量及び送気設備の容量の算出が複雑になる。$c$, false, 2),
  ('cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a', $c$マンロックとマテリアルロックを上下別々に設置する場合は、上方をマンロックとする。$c$, false, 3),
  ('cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a', $c$一般に、切羽下部から多少の漏水があっても、断面の上部が圧気により乾燥して地盤強度が小さくならないように圧気圧を設定する。$c$, false, 4),
  ('cfb5014b-ad7c-4d79-bc3c-ab69a65bc84a', $c$大断面シールドでは、圧気圧を切羽下端から２Ｄ/３(Ｄは掘削径)の位置の水圧に合わせる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f8d1e03a-2bd2-4c7a-adaa-3878f0462836',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工法における作業気圧を計算する際に、一般に使用される土質係数に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f8d1e03a-2bd2-4c7a-adaa-3878f0462836', $c$圧気工法における作業気圧Ｐ(ＭPa)と、地下水面から刃口先端までの深さＨ(ｍ)及び土質係数ｍの関係は、計算式 Ｐ＝0.01×ｍ×(Ｈ＋1.0)で表される。$c$, false, 1),
  ('f8d1e03a-2bd2-4c7a-adaa-3878f0462836', $c$周辺が攪乱されにくいニューマチックケーソンでは、攪乱されやすいものの場合より大きな土質係数を採用する。$c$, true, 2),
  ('f8d1e03a-2bd2-4c7a-adaa-3878f0462836', $c$周辺が攪乱されやすいニューマチックケーソンでは、シルトと粘土では同一の土質係数を採用する。$c$, false, 3),
  ('f8d1e03a-2bd2-4c7a-adaa-3878f0462836', $c$周辺が攪乱されやすいニューマチックケーソンでは、砂礫と玉石の土質係数は共に1.0を採用する。$c$, false, 4),
  ('f8d1e03a-2bd2-4c7a-adaa-3878f0462836', $c$シルトは、粘土より粒径が大きい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '996f7a00-1145-4850-ae13-1d585f913596',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気トンネル工法において、切羽前面から土砂中に漏出する空気量が、作業室内における安全衛生上の所要空気量を上回っているときに、全体の所要空気量の算定式の中に算定しないものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('996f7a00-1145-4850-ae13-1d585f913596', $c$セグメントの継手から漏出する空気量$c$, false, 1),
  ('996f7a00-1145-4850-ae13-1d585f913596', $c$切羽前面から土砂中に漏出する空気量$c$, false, 2),
  ('996f7a00-1145-4850-ae13-1d585f913596', $c$エアロックの継手から漏出する空気量$c$, false, 3),
  ('996f7a00-1145-4850-ae13-1d585f913596', $c$作業室内の安全衛生上の所要空気量$c$, true, 4),
  ('996f7a00-1145-4850-ae13-1d585f913596', $c$送気管の継手から漏出する空気量$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f9d0b15f-cce3-4945-8e0f-1af9c9dedb20',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの沈下掘削に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f9d0b15f-cce3-4945-8e0f-1af9c9dedb20', $c$摩擦力の減少や載荷による沈下が非常に困難な場合には、作業室内の圧力を減少させることによる減圧沈下を行うことがある。$c$, false, 1),
  ('f9d0b15f-cce3-4945-8e0f-1af9c9dedb20', $c$粘性地盤では、まず刃口周辺から掘り始め、次第にケーソン中央部に掘り進む。$c$, true, 2),
  ('f9d0b15f-cce3-4945-8e0f-1af9c9dedb20', $c$粗砂・砂礫地盤では、刃先の抵抗力が大きい。$c$, false, 3),
  ('f9d0b15f-cce3-4945-8e0f-1af9c9dedb20', $c$粗砂・砂礫地盤の掘削で、作業室地盤を刃先より掘り下げると水が出てくるときは、まず刃口下の地盤を水中で抜き掘りする。$c$, false, 4),
  ('f9d0b15f-cce3-4945-8e0f-1af9c9dedb20', $c$送気を一時的に停止し自然の漏気により函内圧力を降下させて、少しずつ沈下させる方法を調圧沈下という。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3d9bd38f-341b-475c-a94b-f1a16727c6be',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工法における作業気圧、送気量等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3d9bd38f-341b-475c-a94b-f1a16727c6be', $c$理論気圧とは、刃口先端の深さの地下水圧に等しい気圧をいう。$c$, false, 1),
  ('3d9bd38f-341b-475c-a94b-f1a16727c6be', $c$粘性地盤掘削中は、作業気圧を理論気圧より低くしても作業室に水が浸入したり、地盤が乱されるとは限らない。$c$, false, 2),
  ('3d9bd38f-341b-475c-a94b-f1a16727c6be', $c$圧気トンネル工法で土かぶりが小さい場合は、注入工法等の補助工法を併用し、圧気圧力をできるだけ小さくする。$c$, false, 3),
  ('3d9bd38f-341b-475c-a94b-f1a16727c6be', $c$ニューマチックケーソンでは、理想的な空気圧は、刃口が水に没入するかしないかの状態に保つ空気圧である。$c$, false, 4),
  ('3d9bd38f-341b-475c-a94b-f1a16727c6be', $c$圧気工法においては、作業者一人当たりに必要な送気量は、20ｍ³/時間とされている。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a57d39ec-3737-42a7-b7a6-5eeed5e09f42',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工事における有害ガス等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a57d39ec-3737-42a7-b7a6-5eeed5e09f42', $c$検知管の濃度目盛りは、一般に20℃で校正されている。$c$, false, 1),
  ('a57d39ec-3737-42a7-b7a6-5eeed5e09f42', $c$ポータブル複合ガス検知器の高圧下での使用は避ける。$c$, false, 2),
  ('a57d39ec-3737-42a7-b7a6-5eeed5e09f42', $c$高圧下でガス検知を行うと、表示濃度が高くなるので、取扱説明書により補正を行う必要がある。$c$, false, 3),
  ('a57d39ec-3737-42a7-b7a6-5eeed5e09f42', $c$酸素欠乏空気を吸入するおそれのある場合は、送気マスク、電動ファン付き呼吸用保護具又は空気呼吸器を装着しなければならない。$c$, true, 4),
  ('a57d39ec-3737-42a7-b7a6-5eeed5e09f42', $c$ポータブル複合型検知器には、１台で酸素、可燃性ガス、硫化水素及び一酸化炭素を測定できるものと、二酸化炭素、酸素、可燃性ガス及び一酸化炭素を測定できるものの２種類が一般的である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b3bcd97e-396e-4797-b8eb-6fbd201940b3',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$20ｍ沈下させたニューマチックケーソン(断面は円、直径15ｍ、重量2000ｔ)を、さらに沈下させるのに必要な最小の載荷荷重(水荷重等)の重量の近似値は1220ｔであった。このニューマチックケーソンの周面摩擦力度は11kＮ/ｍ²であるとすると、このときの作業室内の圧力(ゲージ圧力)の値に最も近いものは次のうちどれか。ただし、刃口下の地盤抵抗力は無視するものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b3bcd97e-396e-4797-b8eb-6fbd201940b3', $c$0.10ＭPa$c$, false, 1),
  ('b3bcd97e-396e-4797-b8eb-6fbd201940b3', $c$0.12ＭPa$c$, true, 2),
  ('b3bcd97e-396e-4797-b8eb-6fbd201940b3', $c$0.14ＭPa$c$, false, 3),
  ('b3bcd97e-396e-4797-b8eb-6fbd201940b3', $c$0.16ＭPa$c$, false, 4),
  ('b3bcd97e-396e-4797-b8eb-6fbd201940b3', $c$0.18ＭPa$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cb58473c-75bc-462f-846f-9478b7d5b208',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる電気設備に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cb58473c-75bc-462f-846f-9478b7d5b208', $c$工事用電力は、一般に6600Ｖで受電されるが、空気圧縮機は400Ｖ、その他の諸機械は200～400Ｖ、一般照明は100Ｖで使用されるので、それぞれの使用電圧に応じた変圧器を設置する。$c$, true, 1),
  ('cb58473c-75bc-462f-846f-9478b7d5b208', $c$作業室内の動力、照明等に使用する電力の配線は、通常、キャブタイヤケーブルをケーソン躯体内に埋め込む方法をとる。$c$, false, 2),
  ('cb58473c-75bc-462f-846f-9478b7d5b208', $c$２種クロロプレンキャブタイヤケーブル(２ＰＮＣＴ)は、作業室内で使用する電気機器類の配線に使用される。$c$, false, 3),
  ('cb58473c-75bc-462f-846f-9478b7d5b208', $c$分電盤は、作業室外の安全な箇所に設置する。$c$, false, 4),
  ('cb58473c-75bc-462f-846f-9478b7d5b208', $c$電気機器の接続は防水コネクタを使用し、長期に接続する場合はコネクタの接続部分にビニールテープを巻き付け、防水効果を高める。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a8c13e9e-662c-4252-8b40-c6d6e7f866da',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素欠乏事故の発生及びその防止対策に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a8c13e9e-662c-4252-8b40-c6d6e7f866da', $c$酸素欠乏空気発生のメカニズムには、酸素欠乏空気の貫流、減圧による逆流及び地層内埋没酸欠空気の湧出がある。$c$, false, 1),
  ('a8c13e9e-662c-4252-8b40-c6d6e7f866da', $c$ニューマチックケーソンの間で空気が貫流する距離は、最大で1000ｍ程度と考えられる。$c$, false, 2),
  ('a8c13e9e-662c-4252-8b40-c6d6e7f866da', $c$ニューマチックケーソンの間で空気が貫流する距離は、一般に、地下水位が高いほど、また、地盤の透気係数が小さいほど大きくなる。$c$, true, 3),
  ('a8c13e9e-662c-4252-8b40-c6d6e7f866da', $c$エアブローの発生が問題となるケーソンでは、エアブロー防止のため作業圧力の設定を刃先から20cm程度上とし、刃先を水没させる掘削方法を採用する。$c$, false, 4),
  ('a8c13e9e-662c-4252-8b40-c6d6e7f866da', $c$酸素濃度が、人体が正常な機能を維持し得る下限値の16％より低下すると、酸素欠乏の症状が現れる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7b948025-baeb-42e8-86eb-2e2c763e4a2a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる空気圧縮機等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7b948025-baeb-42e8-86eb-2e2c763e4a2a', $c$オイルフリースクリュー型圧縮機は、大気中の油分を分離除去するオイルレスタイプの空気圧縮機である。$c$, true, 1),
  ('7b948025-baeb-42e8-86eb-2e2c763e4a2a', $c$クーリングタワーは、空気圧縮機及びアフタークーラの循環水を冷却するための設備である。$c$, false, 2),
  ('7b948025-baeb-42e8-86eb-2e2c763e4a2a', $c$アフタークーラは、200℃近くまで上昇した空気圧縮機からの吐出空気を冷却水により冷却する装置である。$c$, false, 3),
  ('7b948025-baeb-42e8-86eb-2e2c763e4a2a', $c$異常温度自動警報装置は、圧縮空気が異常温度となったとき、自動的に警報ブザー、警報ランプなどで危険を知らせるものである。$c$, false, 4),
  ('7b948025-baeb-42e8-86eb-2e2c763e4a2a', $c$レシーバータンクは、送気管に流れる圧縮空気の脈動を緩和し、空気使用量の変動を吸収し、さらに、除去しきれなかった沈殿物を分離する設備である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '15a776b3-2a57-45c7-95c5-8f81e062b1f1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に用いる送排気管に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('15a776b3-2a57-45c7-95c5-8f81e062b1f1', $c$送気本管は、空気圧縮機と圧力調整装置の間に敷設する送気幹線の設備である。$c$, false, 1),
  ('15a776b3-2a57-45c7-95c5-8f81e062b1f1', $c$送気本管の断面は、一般に、直径150mmである。$c$, false, 2),
  ('15a776b3-2a57-45c7-95c5-8f81e062b1f1', $c$排気管の直径は、通常、100mm又は125mmである。$c$, false, 3),
  ('15a776b3-2a57-45c7-95c5-8f81e062b1f1', $c$送気管の破損時に作業室内の空気が逆流しないように、送気管路の途中の必要な箇所にフラッパーバルブを設ける。$c$, true, 4),
  ('15a776b3-2a57-45c7-95c5-8f81e062b1f1', $c$排気管には、作業室側にグランドコックを取り付ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3e327230-0aed-4f34-aca8-ada9a5082132',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソンの送排気に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3e327230-0aed-4f34-aca8-ada9a5082132', $c$通常掘削時には、作業室送気管のバルブを開け，ロック送気管のバルブを閉じた状態の函内送気とし、バック圧をロック送気管からとる。$c$, false, 1),
  ('3e327230-0aed-4f34-aca8-ada9a5082132', $c$中埋めコンクリート施工中には、作業室内の気圧が増大するので、排気を行ってこれを一定に調整する作業をブローパイプバルブ調整という。$c$, false, 2),
  ('3e327230-0aed-4f34-aca8-ada9a5082132', $c$作業室への送気を断つと、ケーソンの沈下不能や、傾斜、移動等の悪影響を及ぼす要因となる。$c$, false, 3),
  ('3e327230-0aed-4f34-aca8-ada9a5082132', $c$作業室において、排気管の吸込み口は、送気管の吹出し口と同じ側に設け、効率よく換気するようにする。$c$, true, 4),
  ('3e327230-0aed-4f34-aca8-ada9a5082132', $c$作業室内を換気するときは、室内圧の低下を最小限に保ちながら、排気バルブを所定の時間、開けておく。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '492ceeed-abce-497d-aabe-dd93c6ce1876',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素減圧等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('492ceeed-abce-497d-aabe-dd93c6ce1876', $c$純酸素を吸入すると、肺胞周囲血中の窒素分圧と肺胞内の窒素分圧との差が小さくなり、血中の窒素の呼気への排出量が減少する。$c$, true, 1),
  ('492ceeed-abce-497d-aabe-dd93c6ce1876', $c$酸素減圧を行うときは、酸素、炭酸ガスなどの濃度の監視のためにガス濃度測定機器を設備し、測定値をマンロック内に表示する。$c$, false, 2),
  ('492ceeed-abce-497d-aabe-dd93c6ce1876', $c$酸素減圧を行うときは、マンロック内の酸素濃度が常に23％以下となるように換気を行う。$c$, false, 3),
  ('492ceeed-abce-497d-aabe-dd93c6ce1876', $c$通常の酸素減圧では、酸素濃度100％の医療用酸素を用いる。$c$, false, 4),
  ('492ceeed-abce-497d-aabe-dd93c6ce1876', $c$酸素減圧では、酸素マスクによる酸素呼吸とマンロック内の高圧空気の呼吸(エアブレイク)を繰り返しつつ減圧する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'abf242ec-cc39-4f23-b437-99107f923639',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$混合ガス呼吸、混合ガス設備等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('abf242ec-cc39-4f23-b437-99107f923639', $c$混合ガス呼吸とは、作業気圧0.4ＭPa以上の圧気作業において、窒素の代わりにヘリウムに置き換えた混合ガスを送気本管を経由して作業室に送気することによって、作業者に呼吸させる方法である。$c$, true, 1),
  ('abf242ec-cc39-4f23-b437-99107f923639', $c$混合ガスの呼吸方法は、加圧開始後、0.3ＭPaに到達した時点で混合ガス呼吸を始め、また減圧時には、0.3ＭPaに到達すると混合ガス呼吸を終了するのが一般的である。$c$, false, 2),
  ('abf242ec-cc39-4f23-b437-99107f923639', $c$艤装設備の上端に設置するヘリウムロックの基本構造は、マンロックと同様である。$c$, false, 3),
  ('abf242ec-cc39-4f23-b437-99107f923639', $c$トライミックスは、ヘリウム、窒素及び酸素の混合ガスで、大深度の圧気土木で汎用的に用いられている。$c$, false, 4),
  ('abf242ec-cc39-4f23-b437-99107f923639', $c$ヘリウム混合ガスカードルは、１本当たり７ｍ³の高圧ボンベを25本集合させたものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ニューマチックケーソン工事に関する設備及び機器に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39', $c$天井走行式ケーソンショベルは、掘削地山に水があっても掘削作業が可能である。$c$, false, 1),
  ('bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39', $c$電動式バックホウは、クローラ式の掘削機で、一般に掘削地点とアースバケットの積み込み地点の距離が短いケーソンなどで使用される。$c$, false, 2),
  ('bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39', $c$高圧下での空気呼吸器としては、ゲージ圧力0.1～0.25ＭPaまで30分使用できるものと、0.1～0.4ＭPaまで45分使用できるものがある。$c$, true, 3),
  ('bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39', $c$作業室内に設置する消火器は、強化液型で、吐出圧力が0.7～0.98ＭPaのものがある。$c$, false, 4),
  ('bd2b4d19-e9f0-4d7c-8a9d-51bd6634ae39', $c$一酸化炭素用防毒マスクは、ホプカライトを使用し、触媒作用により一酸化炭素を無害化している。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '85482694-e35e-4649-ab3a-390fa502db8f',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$再圧室での再圧に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('85482694-e35e-4649-ab3a-390fa502db8f', $c$複室式の再圧室では、出入りに必要な場合を除いて主室と副室の内部圧力を等しく保っておく。$c$, false, 1),
  ('85482694-e35e-4649-ab3a-390fa502db8f', $c$酸素再圧では、再圧室の換気はできるだけ控えるようにする。$c$, true, 2),
  ('85482694-e35e-4649-ab3a-390fa502db8f', $c$酸素再圧は、空気再圧に比べばく露圧力が低く、所要時間を少なくすることができる。$c$, false, 3),
  ('85482694-e35e-4649-ab3a-390fa502db8f', $c$酸素再圧は、医師の監視の下で実施する。$c$, false, 4),
  ('85482694-e35e-4649-ab3a-390fa502db8f', $c$空気再圧でも、高圧下では、着火温度が低下したり、燃焼速度が増大する等、火災の危険が高まる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd9689639-b410-4c45-ba4b-08aa9206b7bd',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ビュールマンのＺＨ-Ｌ16モデルにおける半飽和時間、半飽和組織等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d9689639-b410-4c45-ba4b-08aa9206b7bd', $c$不活性ガスの半飽和時間が短い組織は血流が乏しく、半飽和時間が長い組織は血流が豊富である。$c$, true, 1),
  ('d9689639-b410-4c45-ba4b-08aa9206b7bd', $c$各半飽和組織の半飽和時間は、窒素よりヘリウムの方が短い。$c$, false, 2),
  ('d9689639-b410-4c45-ba4b-08aa9206b7bd', $c$Ｍ値は、半飽和時間が長い組織ほど小さい。$c$, false, 3),
  ('d9689639-b410-4c45-ba4b-08aa9206b7bd', $c$半飽和組織は、理論上の概念として考える生体の構成要素であり、特定の個々の組織を示すものではない。$c$, false, 4),
  ('d9689639-b410-4c45-ba4b-08aa9206b7bd', $c$実際の施工では、Ｍ値として、1.0より大きな安全率を見込んだ、より小さい換算Ｍ値を用いて減圧時間を算出する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e0601343-ceb9-4345-834e-122b568ee258',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$空気をゲージ圧力0.3ＭPaに加圧したとき、酸素の分圧(絶対圧力)に最も近いものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e0601343-ceb9-4345-834e-122b568ee258', $c$約0.063ＭPa$c$, false, 1),
  ('e0601343-ceb9-4345-834e-122b568ee258', $c$約0.084ＭPa$c$, true, 2),
  ('e0601343-ceb9-4345-834e-122b568ee258', $c$約0.163ＭPa$c$, false, 3),
  ('e0601343-ceb9-4345-834e-122b568ee258', $c$約0.234ＭPa$c$, false, 4),
  ('e0601343-ceb9-4345-834e-122b568ee258', $c$約0.312ＭPa$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b2d950f6-bcde-4955-8859-16ff6a9b9c37',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$流体の性質、気圧、温度等に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b2d950f6-bcde-4955-8859-16ff6a9b9c37', $c$１気圧は、約101.3kPaである。$c$, false, 1),
  ('b2d950f6-bcde-4955-8859-16ff6a9b9c37', $c$体積分率１％の炭酸ガスは、1000ppmである。$c$, true, 2),
  ('b2d950f6-bcde-4955-8859-16ff6a9b9c37', $c$絶対温度288Ｋは、約15℃である。$c$, false, 3),
  ('b2d950f6-bcde-4955-8859-16ff6a9b9c37', $c$圧力が一定の場合、気体の体積は絶対温度に比例する。$c$, false, 4),
  ('b2d950f6-bcde-4955-8859-16ff6a9b9c37', $c$相対湿度とは、空気中の水蒸気分圧とその温度における飽和水蒸気圧との比を百分率で示したものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '819c1db1-a399-412d-bfea-70fc61e90ae7',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$酸素ばく露量及び酸素中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('819c1db1-a399-412d-bfea-70fc61e90ae7', $c$肺型酸素中毒では、前胸部の痛みや空咳などが見られ、進行すると肺、気管支などの炎症により呼吸困難を生じ、しばしば致命的になる。$c$, true, 1),
  ('819c1db1-a399-412d-bfea-70fc61e90ae7', $c$中枢神経型酸素中毒は急性型であり、肺型酸素中毒は慢性型である。$c$, false, 2),
  ('819c1db1-a399-412d-bfea-70fc61e90ae7', $c$長時間高気圧下にいなければならないときは、吸気の酸素分圧を0.03ＭPa程度とする。$c$, false, 3),
  ('819c1db1-a399-412d-bfea-70fc61e90ae7', $c$１日当たりの酸素の許容最大ばく露量は、600ＵＰＴＤである。$c$, false, 4),
  ('819c1db1-a399-412d-bfea-70fc61e90ae7', $c$１週間当たりの酸素の許容最大ばく露量は、2500ＣＰＴＤである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1da2b09e-34d5-44c9-8bab-d4834a63e1cc',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$二酸化炭素及び二酸化炭素中毒に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1da2b09e-34d5-44c9-8bab-d4834a63e1cc', $c$二酸化炭素は、無色、無臭の気体で、自然界の空気中に 300 ～ 400ppm存在する。$c$, false, 1),
  ('1da2b09e-34d5-44c9-8bab-d4834a63e1cc', $c$吸入空気中の二酸化炭素の量が多くなり、体内に蓄積が起こると、呼吸中枢が刺激され、呼吸が速く深くなる。$c$, false, 2),
  ('1da2b09e-34d5-44c9-8bab-d4834a63e1cc', $c$地上における人間の呼気中には、二酸化炭素が約４％含まれている。$c$, false, 3),
  ('1da2b09e-34d5-44c9-8bab-d4834a63e1cc', $c$作業圧力が 0.3ＭPa(ゲージ圧力)以上になると、肺の換気が不十分となり、体内に二酸化炭素の蓄積を起こすおそれがある。$c$, false, 4),
  ('1da2b09e-34d5-44c9-8bab-d4834a63e1cc', $c$二酸化炭素は、空気より軽いので拡散しやすい。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '96986fcf-3f8b-455c-b6d8-a916d824e58c',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$窒素及び窒素酔いに関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('96986fcf-3f8b-455c-b6d8-a916d824e58c', $c$窒素は、常温・常圧では、化学的に安定した不活性の気体で麻酔作用もない。$c$, false, 1),
  ('96986fcf-3f8b-455c-b6d8-a916d824e58c', $c$0.3 ＭPa(ゲージ圧力)以上の圧気作業では、窒素酔いの症状が圧力の増大に伴い急速に出現する。$c$, false, 2),
  ('96986fcf-3f8b-455c-b6d8-a916d824e58c', $c$一般に、窒素酔いは慣れの効果があるので、同じ圧力下にしばらくいると窒素酔いが和らぐことが多い。$c$, true, 3),
  ('96986fcf-3f8b-455c-b6d8-a916d824e58c', $c$窒素による麻酔効果と窒素ガスの脂肪組織への溶解には正の相関関係が存在する。$c$, false, 4),
  ('96986fcf-3f8b-455c-b6d8-a916d824e58c', $c$疲労、過重な作業量、不安などは窒素酔いの作用を強くする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '52c9acd1-fbbe-4be4-bae3-e54263174906',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧症に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('52c9acd1-fbbe-4be4-bae3-e54263174906', $c$心臓の左右の心房の間が卵円孔開存で通じていると、減圧障害を引き起こすおそれがある。$c$, false, 1),
  ('52c9acd1-fbbe-4be4-bae3-e54263174906', $c$減圧症は、高齢者、最近外傷を受けた人、脱水症状の人などが罹患しやすい。$c$, false, 2),
  ('52c9acd1-fbbe-4be4-bae3-e54263174906', $c$減圧症による四肢や関節の痛みを、一般にベンズという。$c$, false, 3),
  ('52c9acd1-fbbe-4be4-bae3-e54263174906', $c$減圧症は、作業圧力が比較的低い0.1ＭPa(ゲージ圧力)以下の場合でもしばしば発生する。$c$, true, 4),
  ('52c9acd1-fbbe-4be4-bae3-e54263174906', $c$減圧症にかかった作業者にみられる無菌性骨壊死は、骨幹部に発症した場合は大きな障害はないが、肩関節や股関節に発症した場合は痛みや運動機能障害を起こす。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1fad2162-6ebe-4b70-b88c-e7c88e7811dc',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$圧外傷に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1fad2162-6ebe-4b70-b88c-e7c88e7811dc', $c$圧外傷は、圧力が身体に不均等に作用することにより生じる。$c$, false, 1),
  ('1fad2162-6ebe-4b70-b88c-e7c88e7811dc', $c$中耳腔内外の圧力差が0.03ＭPaになると、多くの人は鼓膜に痛みを感じるようになる。$c$, false, 2),
  ('1fad2162-6ebe-4b70-b88c-e7c88e7811dc', $c$チョークスは、減圧により血液中に発生した多数の気泡が肺毛細血管の塞栓を起こす圧外傷の一種である。$c$, true, 3),
  ('1fad2162-6ebe-4b70-b88c-e7c88e7811dc', $c$中耳腔の陰圧が持続すると、中耳腔内に液体成分が貯留し滲出性中耳炎を生じる。$c$, false, 4),
  ('1fad2162-6ebe-4b70-b88c-e7c88e7811dc', $c$虫歯の処置後に再び虫歯になって内部に密閉された空洞ができた場合、その部分で圧外傷が生じることがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$肺の破裂及びその合併症に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4', $c$肺胞が破れることにより肺の毛細血管に侵入した空気が気泡状になり、血流によって全身に運ばれ、塞栓となって末梢血管を閉塞して生じる疾患を空気塞栓症(エア・エンボリズム)という。$c$, false, 1),
  ('17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4', $c$肺の圧外傷は、0.03ＭPa(ゲージ圧力)程度の低い環境圧からの減圧でも発症することがある。$c$, false, 2),
  ('17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4', $c$破れた肺胞から漏れた空気が胸膜腔と通じると、肺は膨張してしまい換気できなくなる。$c$, true, 3),
  ('17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4', $c$予防法としては、減圧速度は速すぎないようにするとともに、減圧中は息を止めないようにする。$c$, false, 4),
  ('17bfc60b-9eaf-413a-b4c0-8bb245b6e1f4', $c$肺胞から漏れた空気が胸部中央の縦隔洞や頸部にまで入り込み、縦隔気腫や皮下気腫となることがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$高気圧作業における作業環境及び高気圧が人体に与える影響に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7', $c$スクイーズによる障害は加圧の際に、リバーススクイーズによる障害は減圧の際に、それぞれ発生する圧外傷である。$c$, false, 1),
  ('bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7', $c$加圧時の圧外傷は、加圧による圧力変化のために体腔の容積が増えることで生じ、中耳腔、副鼻腔などで生じる。$c$, true, 2),
  ('bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7', $c$高気圧下の作業を終え、マンロックで減圧するときは気温が低下する。$c$, false, 3),
  ('bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7', $c$体組織の窒素分圧が空気の窒素分圧より高いときは、体組織→静脈→肺という経路で、体組織の窒素が排出される。$c$, false, 4),
  ('bed9c7c4-d6b8-4c2a-83ff-a4697037a9d7', $c$体内の組織に溶解する窒素の量は、温度が一定であれば、0.3ＭPa(ゲージ圧力)の空気中では大気圧下の４倍となる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '69251600-3cc3-437f-ab30-576ab5cf8d9a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$一次救命処置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('69251600-3cc3-437f-ab30-576ab5cf8d9a', $c$傷病者に反応がある場合は、回復体位をとらせて安静にして、経過を観察する。$c$, false, 1),
  ('69251600-3cc3-437f-ab30-576ab5cf8d9a', $c$傷病者に反応がなく、周囲に協力者がいる場合は、119番通報やＡＥＤ(自動体外式除細動器)の手配を依頼する。$c$, false, 2),
  ('69251600-3cc3-437f-ab30-576ab5cf8d9a', $c$傷病者の胸と腹部の動きを観察し、胸と腹部が上下に動いていない場合やよくわからない場合には、心停止とみなし、心肺蘇生を開始する。$c$, false, 3),
  ('69251600-3cc3-437f-ab30-576ab5cf8d9a', $c$胸骨圧迫は、胸が約５cm沈む強さで胸骨の上半分を圧迫し、１分間に少なくとも100～120回のテンポで行う。$c$, true, 4),
  ('69251600-3cc3-437f-ab30-576ab5cf8d9a', $c$ＡＥＤを用いた場合、電気ショックを行った後や電気ショックは不要と判断されたときには、音声メッセージに従い、胸骨圧迫を再開し心肺蘇生を続ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3e2de051-7563-4f2b-b53b-d431c0eb5e60',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の設備等に関する次の措置のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3e2de051-7563-4f2b-b53b-d431c0eb5e60', $c$気こう室の気積を、現に当該気こう室において加圧又は減圧を受ける高圧室内作業者１人について、0.6ｍ³以上としなければならない。$c$, false, 1),
  ('3e2de051-7563-4f2b-b53b-d431c0eb5e60', $c$潜函の気こう室内の高圧室内作業者に減圧を行うための排気管は、内径53mm以下のものとしなければならない。$c$, false, 2),
  ('3e2de051-7563-4f2b-b53b-d431c0eb5e60', $c$気こう室の床面積を、現に当該気こう室において加圧又は減圧を受ける高圧室内作業者１人について、0.3ｍ²以上としなければならない。$c$, false, 3),
  ('3e2de051-7563-4f2b-b53b-d431c0eb5e60', $c$圧力0.1ＭPa(ゲージ圧力)以上の気圧下における高圧室内業務を行うときは、気こう室に、自記記録圧力計を設けなければならない。$c$, false, 4),
  ('3e2de051-7563-4f2b-b53b-d431c0eb5e60', $c$労働者を作業室において高圧室内業務に従事させるときは、作業室の気積を、現に当該作業室において高圧室内業務に従事している労働者１人について、３ｍ³以上としなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '10a58bbc-291f-4103-bc16-f596df7a9c04',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務に用いる圧力計に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('10a58bbc-291f-4103-bc16-f596df7a9c04', $c$高圧室内作業者に加圧又は減圧を行うために、送気又は排気の調節を行うバルブ又はコックの操作を行う場所を気こう室の外部に設けたときは、当該場所に、気こう室内のゲージ圧力を表示する圧力計を設けなければならない。$c$, false, 1),
  ('10a58bbc-291f-4103-bc16-f596df7a9c04', $c$作業室への送気の調節を行うためのバルブ又はコックの操作を行う場所を潜函等の外部に設けたときは、当該場所に、作業室内のゲージ圧力を表示する圧力計を設けなければならない。$c$, false, 2),
  ('10a58bbc-291f-4103-bc16-f596df7a9c04', $c$作業室への送気の調節を行うためのバルブ又はコックの操作を行う場所を潜函等の内部に設けたときは、当該バルブ又はコックを操作する業務を行う者に、携帯式の圧力計を携行させなければならない。$c$, false, 3),
  ('10a58bbc-291f-4103-bc16-f596df7a9c04', $c$作業室内のゲージ圧力を表示する圧力計は、その１目盛りが200kPa以下のものでなければならない。$c$, true, 4),
  ('10a58bbc-291f-4103-bc16-f596df7a9c04', $c$高圧室内業務に用いる圧力計は、１か月ごとに１回以上点検しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '58dcafce-57e9-457c-a3e4-f726e11e8980',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内作業主任者の免許及び選任に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('58dcafce-57e9-457c-a3e4-f726e11e8980', $c$満20歳に満たない者は、免許を受けることができない。$c$, false, 1),
  ('58dcafce-57e9-457c-a3e4-f726e11e8980', $c$労働安全衛生法違反の事由により免許の取消しの処分を受けた者は、取消しの日から１年間は、免許を受けることができない。$c$, false, 2),
  ('58dcafce-57e9-457c-a3e4-f726e11e8980', $c$同一の場所で行う高圧室内作業において、作業主任者を２人以上選任したときは、それぞれの作業主任者の職務の分担を定めなければならない。$c$, false, 3),
  ('58dcafce-57e9-457c-a3e4-f726e11e8980', $c$作業主任者を選任したときは、作業主任者の氏名及びその者に行わせる事項を作業場の見やすい箇所に掲示する等により関係労働者に周知させなければならない。$c$, false, 4),
  ('58dcafce-57e9-457c-a3e4-f726e11e8980', $c$高圧室内作業主任者を選任したときは、その氏名を所轄労働基準監督署長に報告しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '118ab76e-7c65-448f-9e0c-3caac351a5b1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内作業に関し、労働者を次の業務に就かせるときに、法令上、特別の教育が義務付けられていないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('118ab76e-7c65-448f-9e0c-3caac351a5b1', $c$作業室及び気こう室へ送気するための空気圧縮機を点検する業務$c$, true, 1),
  ('118ab76e-7c65-448f-9e0c-3caac351a5b1', $c$作業室への送気の調節を行うためのバルブ又はコックを操作する業務$c$, false, 2),
  ('118ab76e-7c65-448f-9e0c-3caac351a5b1', $c$気こう室への送気又は気こう室からの排気の調節を行うためのバルブ又はコックを操作する業務$c$, false, 3),
  ('118ab76e-7c65-448f-9e0c-3caac351a5b1', $c$再圧室を操作する業務$c$, false, 4),
  ('118ab76e-7c65-448f-9e0c-3caac351a5b1', $c$高圧室内業務$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の管理に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d', $c$減圧を終了した高圧室内作業者には、当該減圧を終了した時から14時間は、重激な業務に従事させてはならない。$c$, false, 1),
  ('fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d', $c$高圧室内業務を行うときは、空気圧縮機の付近に、高圧室内作業者及び空気圧縮機の運転を行う者との連絡等の措置を講ずるための連絡員を、常時配置しなければならない。$c$, true, 2),
  ('fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d', $c$作業室内において発破を行ったときは、高圧室内業務従事者が作業室内の空気が発破前の状態に復する前に入室することを禁止しなければならない。$c$, false, 3),
  ('fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d', $c$必要のある者以外の者が再圧室を設置した場所及び当該再圧室を操作する場所に立ち入ることを禁止しなければならない。$c$, false, 4),
  ('fc355fbf-3b2f-4a7a-a1e2-e10b06fadc5d', $c$作業の性質上やむを得ない場合には、ゲージ圧力0.1ＭPa未満の気圧下であれば潜函内で溶接等の作業を行うことができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f259a2e3-32a1-4a95-bdd9-02942d73cc59',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務に係る作業室又は気こう室におけるガス分圧に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f259a2e3-32a1-4a95-bdd9-02942d73cc59', $c$窒素の分圧は、400kPaを超えてはならない。$c$, false, 1),
  ('f259a2e3-32a1-4a95-bdd9-02942d73cc59', $c$炭酸ガスの分圧は、５kPaを超えてはならない。$c$, true, 2),
  ('f259a2e3-32a1-4a95-bdd9-02942d73cc59', $c$ヘリウムの分圧についての制限は定められていない。$c$, false, 3),
  ('f259a2e3-32a1-4a95-bdd9-02942d73cc59', $c$気こう室において減圧を行う場合を除き、酸素の分圧は18kPa以上160kPa以下でなければならない。$c$, false, 4),
  ('f259a2e3-32a1-4a95-bdd9-02942d73cc59', $c$気こう室において減圧を行う場合は、酸素の分圧は18kPa以上220kPa以下でなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e163b66f-d67d-481a-95ac-317fcaab0f6f',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$気こう室における加圧又は減圧時に行う措置に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e163b66f-d67d-481a-95ac-317fcaab0f6f', $c$気こう室において高圧室内業務従事者に加圧を行うときは、毎分0.08ＭPa以下の速度で行わなければならない。$c$, false, 1),
  ('e163b66f-d67d-481a-95ac-317fcaab0f6f', $c$気こう室の照明の照度を20ルーメン以上としなければならない。$c$, true, 2),
  ('e163b66f-d67d-481a-95ac-317fcaab0f6f', $c$気こう室において高圧室内業務従事者に減圧を行うときは、あらかじめ、当該減圧に要する時間を当該高圧室内業務従事者に周知させなければならない。$c$, false, 3),
  ('e163b66f-d67d-481a-95ac-317fcaab0f6f', $c$気こう室において高圧室内業務従事者に減圧を行うときは、減圧の速度は、原則として、毎分0.08ＭPa以下としなければならない。$c$, false, 4),
  ('e163b66f-d67d-481a-95ac-317fcaab0f6f', $c$健康に異常を生じた高圧室内業務従事者を救出するときは、必要な限度において、法令に規定する減圧の速度を速めることができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8ce47bd8-0c83-48dd-bc80-c340533d4d89',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務において、法令上、特定の設備については一定期間ごとに１回以上点検しなければならないが、次の設備とその期間との組合せのうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8ce47bd8-0c83-48dd-bc80-c340533d4d89', $c$空気清浄装置 …………………… １か月$c$, false, 1),
  ('8ce47bd8-0c83-48dd-bc80-c340533d4d89', $c$空気圧縮機 ……………………… １日$c$, true, 2),
  ('8ce47bd8-0c83-48dd-bc80-c340533d4d89', $c$避難用具 ………………………… １日$c$, false, 3),
  ('8ce47bd8-0c83-48dd-bc80-c340533d4d89', $c$異常温度の自動警報装置 ……… １週$c$, false, 4),
  ('8ce47bd8-0c83-48dd-bc80-c340533d4d89', $c$潜函に設けられた電路 ………… １か月$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'eeb35d8e-ea2f-4a99-86b1-68a249063a54',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高気圧業務健康診断(以下「健康診断」という。)に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('eeb35d8e-ea2f-4a99-86b1-68a249063a54', $c$健康診断は、雇入れの際、高圧室内業務への配置替えの際及び高圧室内業務に就いた後６か月以内ごとに１回、定期に行わなければならない。$c$, false, 1),
  ('eeb35d8e-ea2f-4a99-86b1-68a249063a54', $c$事業場において実施した健康診断の結果、異常の所見があると診断された労働者については、健康診断が行われた日から３か月以内に、医師の意見を聴かなければならない。$c$, false, 2),
  ('eeb35d8e-ea2f-4a99-86b1-68a249063a54', $c$健康診断を受けた労働者に対し、健康診断が行われた日から３か月以内に、当該健康診断の結果を通知しなければならない。$c$, true, 3),
  ('eeb35d8e-ea2f-4a99-86b1-68a249063a54', $c$定期の健康診断を行ったときは、遅滞なく、高気圧業務健康診断結果報告書を所轄労働基準監督署長に提出しなければならない。$c$, false, 4),
  ('eeb35d8e-ea2f-4a99-86b1-68a249063a54', $c$健康診断の結果に基づき、高気圧業務健康診断個人票を作成し、これを５年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3c188be5-df95-4ed5-a8e8-c95cc9c50cf1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$圧気工事における安全衛生管理体制に関する次の記述のうち、法令上、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 高圧室内作業主任者試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3c188be5-df95-4ed5-a8e8-c95cc9c50cf1', $c$一の場所において行う圧気工法による作業を行う仕事の一部を請負人に請け負わせる特定元方事業者は、その場所において、その労働者及び関係請負人の労働者の数が常時30人以上で作業を行うときは、統括安全衛生責任者を選任しなければならない。$c$, false, 1),
  ('3c188be5-df95-4ed5-a8e8-c95cc9c50cf1', $c$元方安全衛生管理者を選任すべき事業者は、選任した元方安全衛生管理者が事故によって職務を行うことができないときは、代理者を選任しなければならない。$c$, false, 2),
  ('3c188be5-df95-4ed5-a8e8-c95cc9c50cf1', $c$元方事業者は、一の場所において、圧気工法による作業を行う仕事であって、当該場所における元方事業者の労働者及び関係請負人の労働者の数が常時20人以上30人未満であるものに係る作業を行うときは、当該場所において行われる仕事に係る請負契約を締結している事業場ごとに、店社安全衛生管理者を選任しなければならない。$c$, false, 3),
  ('3c188be5-df95-4ed5-a8e8-c95cc9c50cf1', $c$安全衛生責任者を選任しなければならない請負人は、安全衛生責任者を選任したときは、同一の場所において作業を行う統括安全衛生責任者を選任しなければならない事業者に対し、遅滞なく、その旨を通報しなければならない。$c$, false, 4),
  ('3c188be5-df95-4ed5-a8e8-c95cc9c50cf1', $c$都道府県労働局長は、労働災害を防止するため必要があると認めるときは、事業者に対し、統括安全衛生責任者の解任を命ずることができる。$c$, true, 5);

do $$
declare
  pressure_chamber_2025_10 int;
begin
  select count(*) into pressure_chamber_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 高圧室内作業主任者試験%';

  if pressure_chamber_2025_10 <> 40 then
    raise exception 'pressure_chamber 2025-10 sitting must be 40 questions (got %)', pressure_chamber_2025_10;
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
  '高圧室内作業主任者模擬試験(令和7年10月)',
  240,
  40,
  '令和7年10月公表 高圧室内作業主任者試験'
from exam_types
where exam_types.exam_id = 'pressure_chamber'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'pressure_chamber'
      and source_filter = '令和7年10月公表 高圧室内作業主任者試験'
      and category_scope is null
  );
