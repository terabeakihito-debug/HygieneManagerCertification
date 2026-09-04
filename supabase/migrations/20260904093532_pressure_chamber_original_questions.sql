-- pressure_chamber オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7225a3a4-fcd3-4621-a778-0b916bf79554',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソン工法の基本原理に関する記述として、正しいものはどれか。$q$,
  $e$ニューマチックケーソン工法は、躯体下部の気密な作業室に圧縮空気を送り、地下水の浸入を防いで作業室内を掘削し、躯体を沈設する工法である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7225a3a4-fcd3-4621-a778-0b916bf79554'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7225a3a4-fcd3-4621-a778-0b916bf79554'::uuid, $c$ケーソン周囲の地下水を完全に揚水し、作業室内を真空にして掘削する。$c$, false, 1),
  ('7225a3a4-fcd3-4621-a778-0b916bf79554'::uuid, $c$ケーソン下部の気密な作業室に圧縮空気を送り、地下水の浸入を抑えながら掘削・沈設する。$c$, true, 2),
  ('7225a3a4-fcd3-4621-a778-0b916bf79554'::uuid, $c$ケーソン内部を水で満たし、水圧によって刃口下の地盤を破砕する。$c$, false, 3),
  ('7225a3a4-fcd3-4621-a778-0b916bf79554'::uuid, $c$ケーソン底部を密閉したまま、地上から杭を打ち込んで沈下させる。$c$, false, 4),
  ('7225a3a4-fcd3-4621-a778-0b916bf79554'::uuid, $c$ケーソン全体を地中で組み立て、完成後に作業室の空気を排出する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c3a285e9-401c-4b1a-bd40-0e010809297d',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ケーソンの種類とその特徴に関する記述として、誤っているものはどれか。$q$,
  $e$底部に気密作業室を設け、圧縮空気で地下水の浸入を抑えるのはニューマチックケーソンである。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c3a285e9-401c-4b1a-bd40-0e010809297d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c3a285e9-401c-4b1a-bd40-0e010809297d'::uuid, $c$オープンケーソンは、底部を開放した躯体の内部を掘削しながら沈設する方式である。$c$, false, 1),
  ('c3a285e9-401c-4b1a-bd40-0e010809297d'::uuid, $c$ニューマチックケーソンは、底部に気密な作業室を設けて圧縮空気を供給する方式である。$c$, false, 2),
  ('c3a285e9-401c-4b1a-bd40-0e010809297d'::uuid, $c$ボックスケーソンは、あらかじめ製作した箱状構造物を所定位置に据え付ける方式である。$c$, false, 3),
  ('c3a285e9-401c-4b1a-bd40-0e010809297d'::uuid, $c$フローティングケーソンは、浮力を利用して製作場所から据付場所まで運搬できる。$c$, false, 4),
  ('c3a285e9-401c-4b1a-bd40-0e010809297d'::uuid, $c$オープンケーソンでは、底部の作業室を常に地下水圧以上の圧縮空気で加圧する。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b70fb77e-3cb4-4d91-bae6-2074e7191b31',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの施工におけるセントルに関する記述として、正しいものはどれか。$q$,
  $e$セントルは、作業室天井などの構築時に型枠やコンクリート荷重を支持する仮設構造である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b70fb77e-3cb4-4d91-bae6-2074e7191b31'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b70fb77e-3cb4-4d91-bae6-2074e7191b31'::uuid, $c$掘削土を地上へ搬出する垂直コンベヤである。$c$, false, 1),
  ('b70fb77e-3cb4-4d91-bae6-2074e7191b31'::uuid, $c$ケーソン周囲の地下水をくみ上げる集水井である。$c$, false, 2),
  ('b70fb77e-3cb4-4d91-bae6-2074e7191b31'::uuid, $c$作業室天井などを構築する際に、型枠や鉄筋、コンクリートなどを支持する仮設構造である。$c$, true, 3),
  ('b70fb77e-3cb4-4d91-bae6-2074e7191b31'::uuid, $c$作業室内の気圧を自動調整する圧力制御弁である。$c$, false, 4),
  ('b70fb77e-3cb4-4d91-bae6-2074e7191b31'::uuid, $c$ケーソンの周面摩擦抵抗を測定する装置である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2c48cb0c-a609-4cfa-9c41-3ce400de89b9',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気トンネル工法とシールド工法に関する記述として、正しいものはどれか。$q$,
  $e$シールド工法は、シールド機で地山を保持しながら掘進し、後方でセグメントなどの覆工を組み立てる。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2c48cb0c-a609-4cfa-9c41-3ce400de89b9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2c48cb0c-a609-4cfa-9c41-3ce400de89b9'::uuid, $c$圧気工法では坑内気圧を地下水圧より必ず低くする。$c$, false, 1),
  ('2c48cb0c-a609-4cfa-9c41-3ce400de89b9'::uuid, $c$シールド工法では、シールド機の外殻で地山を支えながら掘進し、後方で覆工を構築する。$c$, true, 2),
  ('2c48cb0c-a609-4cfa-9c41-3ce400de89b9'::uuid, $c$圧気工法を採用すれば、土質に関係なく漏気や噴発は発生しない。$c$, false, 3),
  ('2c48cb0c-a609-4cfa-9c41-3ce400de89b9'::uuid, $c$密閉型シールドでは土圧や泥水圧を利用しない。$c$, false, 4),
  ('2c48cb0c-a609-4cfa-9c41-3ce400de89b9'::uuid, $c$圧気トンネルでは隔壁やロック設備は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '196c4a96-ac08-4857-9e08-f9deee3ee9af',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$作業気圧を P=0.01m(H+1.0) で求める。Pはゲージ圧力（MPa）、Hは地下水面から刃先先端までの深さ（m）、mは土質係数である。H=17 m、m=0.80のとき、作業気圧はいくらか。$q$,
  $e$P=0.01×0.80×(17+1.0)=0.144 MPa。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '196c4a96-ac08-4857-9e08-f9deee3ee9af'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('196c4a96-ac08-4857-9e08-f9deee3ee9af'::uuid, $c$0.0144 MPa$c$, false, 1),
  ('196c4a96-ac08-4857-9e08-f9deee3ee9af'::uuid, $c$0.136 MPa$c$, false, 2),
  ('196c4a96-ac08-4857-9e08-f9deee3ee9af'::uuid, $c$0.144 MPa$c$, true, 3),
  ('196c4a96-ac08-4857-9e08-f9deee3ee9af'::uuid, $c$0.180 MPa$c$, false, 4),
  ('196c4a96-ac08-4857-9e08-f9deee3ee9af'::uuid, $c$1.44 MPa$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2e2a85d3-c883-46ef-a406-bb7d3be28e3a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$作業室内の換気に必要な空気量が作業室状態で90 m³/minである。ゲージ圧力0.18 MPa、大気圧0.10 MPa、温度変化なし、漏気量は大気圧換算28 m³/minとする。圧縮機の必要送気量を大気圧換算するといくらか。$q$,
  $e$絶対圧力は 0.18+0.10=0.28 MPa。換気量は 90×0.28/0.10=252 m³/min、漏気分を加えて 252+28=280 m³/min。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2e2a85d3-c883-46ef-a406-bb7d3be28e3a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2e2a85d3-c883-46ef-a406-bb7d3be28e3a'::uuid, $c$196 m³/min$c$, false, 1),
  ('2e2a85d3-c883-46ef-a406-bb7d3be28e3a'::uuid, $c$252 m³/min$c$, false, 2),
  ('2e2a85d3-c883-46ef-a406-bb7d3be28e3a'::uuid, $c$270 m³/min$c$, false, 3),
  ('2e2a85d3-c883-46ef-a406-bb7d3be28e3a'::uuid, $c$280 m³/min$c$, true, 4),
  ('2e2a85d3-c883-46ef-a406-bb7d3be28e3a'::uuid, $c$532 m³/min$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '804ace03-66e4-4b4c-ad9d-fdb5c7b86277',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$ニューマチックケーソンの沈下掘削方法として、最も適切なものはどれか。$q$,
  $e$沈下量、傾斜、地盤反力を確認し、支持土の残し方や掘削位置を調整する。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '804ace03-66e4-4b4c-ad9d-fdb5c7b86277'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('804ace03-66e4-4b4c-ad9d-fdb5c7b86277'::uuid, $c$刃口下を全周にわたって一度に完全に掘り取る。$c$, false, 1),
  ('804ace03-66e4-4b4c-ad9d-fdb5c7b86277'::uuid, $c$傾斜を計測せず、中央部だけを深く掘り続ける。$c$, false, 2),
  ('804ace03-66e4-4b4c-ad9d-fdb5c7b86277'::uuid, $c$地盤反力と姿勢を確認し、必要な支持土を残しながら段階的に掘削する。$c$, true, 3),
  ('804ace03-66e4-4b4c-ad9d-fdb5c7b86277'::uuid, $c$沈下停止時は作業気圧を直ちにゼロにする。$c$, false, 4),
  ('804ace03-66e4-4b4c-ad9d-fdb5c7b86277'::uuid, $c$漏水時は送気を停止して掘削範囲を拡大する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7c25cdf2-6313-4378-870a-296e2bfb42d4',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$作業気圧と送気量の管理に関する記述として、正しいものはどれか。$q$,
  $e$過大な作業気圧は漏気、噴気、地盤の乾燥や噴発などの原因となる。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7c25cdf2-6313-4378-870a-296e2bfb42d4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7c25cdf2-6313-4378-870a-296e2bfb42d4'::uuid, $c$地下水位や深度が変化しても気圧を一定にする。$c$, false, 1),
  ('7c25cdf2-6313-4378-870a-296e2bfb42d4'::uuid, $c$送気量が十分なら圧力測定は不要である。$c$, false, 2),
  ('7c25cdf2-6313-4378-870a-296e2bfb42d4'::uuid, $c$作業気圧を必要以上に高くすると、地表への漏気や地盤の噴発を招くことがある。$c$, true, 3),
  ('7c25cdf2-6313-4378-870a-296e2bfb42d4'::uuid, $c$送気量の急増は漏気の増加と無関係である。$c$, false, 4),
  ('7c25cdf2-6313-4378-870a-296e2bfb42d4'::uuid, $c$圧力低下時は原因を調べず吐出圧力だけを急上昇させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e080822c-70cd-46c9-b9be-f702e99cba5b',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$圧気工事における有害ガス等の管理に関する記述として、正しいものはどれか。$q$,
  $e$事前調査、適切な換気、酸素・二酸化炭素・有害ガスの継続的な測定が必要である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e080822c-70cd-46c9-b9be-f702e99cba5b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e080822c-70cd-46c9-b9be-f702e99cba5b'::uuid, $c$圧縮空気を送れば有害ガスは流入しない。$c$, false, 1),
  ('e080822c-70cd-46c9-b9be-f702e99cba5b'::uuid, $c$一酸化炭素は臭いで確実に検知できる。$c$, false, 2),
  ('e080822c-70cd-46c9-b9be-f702e99cba5b'::uuid, $c$硫化水素は常に空気より軽いので下部測定は不要である。$c$, false, 3),
  ('e080822c-70cd-46c9-b9be-f702e99cba5b'::uuid, $c$地層や埋設物などからの発生を考慮し、酸素、二酸化炭素その他必要なガスを測定する。$c$, true, 4),
  ('e080822c-70cd-46c9-b9be-f702e99cba5b'::uuid, $c$メタンには燃焼・爆発の危険がない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6f08ebaf-4464-406a-965b-e39f6cef41fe',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '圧気工法'),
  $q$躯体重量48 MN、載荷荷重9 MN、作業室面積200 m²、作業気圧0.16 MPa、周面摩擦抵抗13 MN、刃口抵抗7 MNである。その他の力を無視すると、鉛直方向の力の状態はどれか。$q$,
  $e$下向きは 48+9=57 MN。揚圧力は 0.16×200=32 MN、上向き総抵抗は 32+13+7=52 MN。差は 57−52=5 MNで下向きが大きい。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6f08ebaf-4464-406a-965b-e39f6cef41fe'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6f08ebaf-4464-406a-965b-e39f6cef41fe'::uuid, $c$上向きが5 MN大きい。$c$, false, 1),
  ('6f08ebaf-4464-406a-965b-e39f6cef41fe'::uuid, $c$上向きが12 MN大きい。$c$, false, 2),
  ('6f08ebaf-4464-406a-965b-e39f6cef41fe'::uuid, $c$つり合っている。$c$, false, 3),
  ('6f08ebaf-4464-406a-965b-e39f6cef41fe'::uuid, $c$下向きが5 MN大きい。$c$, true, 4),
  ('6f08ebaf-4464-406a-965b-e39f6cef41fe'::uuid, $c$下向きが25 MN大きい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1fb01812-35f8-49c6-9877-e937d42faac9',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ケーソン工事の作業室内で使用する電気設備の管理として、正しいものはどれか。$q$,
  $e$湿潤環境での感電を防ぐため、接地、漏電保護、絶縁および配線防護が重要である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1fb01812-35f8-49c6-9877-e937d42faac9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1fb01812-35f8-49c6-9877-e937d42faac9'::uuid, $c$接地は省略できる。$c$, false, 1),
  ('1fb01812-35f8-49c6-9877-e937d42faac9'::uuid, $c$移動電線は通路上に無防護で置く。$c$, false, 2),
  ('1fb01812-35f8-49c6-9877-e937d42faac9'::uuid, $c$接地、漏電保護、絶縁状態の点検などを行う。$c$, true, 3),
  ('1fb01812-35f8-49c6-9877-e937d42faac9'::uuid, $c$可燃性ガスのおそれがあっても通常の開閉器を使う。$c$, false, 4),
  ('1fb01812-35f8-49c6-9877-e937d42faac9'::uuid, $c$通電したまま水分を拭き取る。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '02af2ac4-42ca-4729-b7c6-11caf99f8dae',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素欠乏状態の発生と防止に関する記述として、正しいものはどれか。$q$,
  $e$酸素消費や他のガスによる置換で酸素濃度が低下するため、換気と測定が必要である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '02af2ac4-42ca-4729-b7c6-11caf99f8dae'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('02af2ac4-42ca-4729-b7c6-11caf99f8dae'::uuid, $c$圧縮空気を送る場所では発生しない。$c$, false, 1),
  ('02af2ac4-42ca-4729-b7c6-11caf99f8dae'::uuid, $c$金属の酸化や有機物の腐敗により酸素が消費されることがある。$c$, true, 2),
  ('02af2ac4-42ca-4729-b7c6-11caf99f8dae'::uuid, $c$窒素や二酸化炭素の流入は酸素濃度に影響しない。$c$, false, 3),
  ('02af2ac4-42ca-4729-b7c6-11caf99f8dae'::uuid, $c$呼吸感覚だけで確実に判定できる。$c$, false, 4),
  ('02af2ac4-42ca-4729-b7c6-11caf99f8dae'::uuid, $c$純酸素を作業室へ直接放出して防止する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c338edac-ab0a-42ee-9294-394c8102f0b0',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$多段往復空気圧縮機に関する記述として、正しいものはどれか。$q$,
  $e$段間冷却により次段の圧縮仕事と吐出温度を抑える。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c338edac-ab0a-42ee-9294-394c8102f0b0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c338edac-ab0a-42ee-9294-394c8102f0b0'::uuid, $c$段間冷却器は空気を加熱する。$c$, false, 1),
  ('c338edac-ab0a-42ee-9294-394c8102f0b0'::uuid, $c$吸込弁と吐出弁は常時開放される。$c$, false, 2),
  ('c338edac-ab0a-42ee-9294-394c8102f0b0'::uuid, $c$多段圧縮と段間冷却により、効率向上と吐出温度抑制を図る。$c$, true, 3),
  ('c338edac-ab0a-42ee-9294-394c8102f0b0'::uuid, $c$空気槽は圧力脈動を大きくする。$c$, false, 4),
  ('c338edac-ab0a-42ee-9294-394c8102f0b0'::uuid, $c$潤滑油の混入は呼吸用空気に影響しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '649ad4f0-c21b-4a44-901d-10568543dd66',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$送気管および排気管の管理として、適切なものはどれか。$q$,
  $e$配管には十分な強度・気密性を持たせ、識別、漏れ、損傷、凝縮水、逆流を管理する。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '649ad4f0-c21b-4a44-901d-10568543dd66'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('649ad4f0-c21b-4a44-901d-10568543dd66'::uuid, $c$使用圧力未満の強度でよい。$c$, false, 1),
  ('649ad4f0-c21b-4a44-901d-10568543dd66'::uuid, $c$誤操作防止のため表示や識別を行う。$c$, true, 2),
  ('649ad4f0-c21b-4a44-901d-10568543dd66'::uuid, $c$凝縮水は作業室へ送る。$c$, false, 3),
  ('649ad4f0-c21b-4a44-901d-10568543dd66'::uuid, $c$接続部を点検不能な場所に集中させる。$c$, false, 4),
  ('649ad4f0-c21b-4a44-901d-10568543dd66'::uuid, $c$逆流防止装置は設けない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '860d22b8-ee3b-4db4-aa6f-eea593e2718a',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ケーソンの送排気操作として、最も適切なものはどれか。$q$,
  $e$急激な圧力変化を避け、圧力、送気量、漏気および室内状態を監視する。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '860d22b8-ee3b-4db4-aa6f-eea593e2718a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('860d22b8-ee3b-4db4-aa6f-eea593e2718a'::uuid, $c$送気弁を直ちに全開にする。$c$, false, 1),
  ('860d22b8-ee3b-4db4-aa6f-eea593e2718a'::uuid, $c$排気弁を全開にしたまま大量送気する。$c$, false, 2),
  ('860d22b8-ee3b-4db4-aa6f-eea593e2718a'::uuid, $c$圧力計と室内状態を監視し、連絡を取りながら徐々に調整する。$c$, true, 3),
  ('860d22b8-ee3b-4db4-aa6f-eea593e2718a'::uuid, $c$圧力計異常時も送気音だけで続行する。$c$, false, 4),
  ('860d22b8-ee3b-4db4-aa6f-eea593e2718a'::uuid, $c$圧力異常時は全弁を無条件に全開にする。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1b9801cf-7610-4b02-807d-59cd96edad23',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$酸素減圧に関する記述として、正しいものはどれか。$q$,
  $e$酸素呼吸により肺胞内の不活性ガス分圧を下げ、その排出を促進する。酸素中毒と火災に注意し、計画に従う。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1b9801cf-7610-4b02-807d-59cd96edad23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1b9801cf-7610-4b02-807d-59cd96edad23'::uuid, $c$体内への窒素取り込みを促進する。$c$, false, 1),
  ('1b9801cf-7610-4b02-807d-59cd96edad23'::uuid, $c$気こう室全体を純酸素で満たす。$c$, false, 2),
  ('1b9801cf-7610-4b02-807d-59cd96edad23'::uuid, $c$吸入ガス中の不活性ガス分圧を下げ、体内からの排出を促進する。$c$, true, 3),
  ('1b9801cf-7610-4b02-807d-59cd96edad23'::uuid, $c$火災危険が低下する。$c$, false, 4),
  ('1b9801cf-7610-4b02-807d-59cd96edad23'::uuid, $c$作業者が任意に開始できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a80dfb94-b794-4832-a960-c5a6f168c61c',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ヘリウムを含む混合ガス呼吸に関する記述として、正しいものはどれか。$q$,
  $e$ヘリウムは窒素より麻酔作用と密度が小さいが、酸素分圧と混合組成の管理は必要である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a80dfb94-b794-4832-a960-c5a6f168c61c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a80dfb94-b794-4832-a960-c5a6f168c61c'::uuid, $c$ヘリウムは窒素より麻酔作用が強い。$c$, false, 1),
  ('a80dfb94-b794-4832-a960-c5a6f168c61c'::uuid, $c$酸素濃度は周囲圧力に関係なく常に21%にする。$c$, false, 2),
  ('a80dfb94-b794-4832-a960-c5a6f168c61c'::uuid, $c$窒素の一部をヘリウムで置換し、窒素酔いや高密度ガスによる呼吸負担の軽減を図る。$c$, true, 3),
  ('a80dfb94-b794-4832-a960-c5a6f168c61c'::uuid, $c$ヘリウムを加えれば酸素分圧管理は不要になる。$c$, false, 4),
  ('a80dfb94-b794-4832-a960-c5a6f168c61c'::uuid, $c$混合後の組成分析は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0d340661-322c-42a5-a5e2-b826c47f1e9c',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ケーソン工事の設備に関する記述として、正しいものはどれか。$q$,
  $e$マンロックは人員、マテリアルロックは主として資材や掘削土の出入りに用いる。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0d340661-322c-42a5-a5e2-b826c47f1e9c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0d340661-322c-42a5-a5e2-b826c47f1e9c'::uuid, $c$マンロックは主として作業者を加圧・減圧しながら出入りさせる。$c$, true, 1),
  ('0d340661-322c-42a5-a5e2-b826c47f1e9c'::uuid, $c$マテリアルロックは作業者専用である。$c$, false, 2),
  ('0d340661-322c-42a5-a5e2-b826c47f1e9c'::uuid, $c$エアシャフトは水力だけで排土する装置である。$c$, false, 3),
  ('0d340661-322c-42a5-a5e2-b826c47f1e9c'::uuid, $c$空気槽は圧力変動を拡大する。$c$, false, 4),
  ('0d340661-322c-42a5-a5e2-b826c47f1e9c'::uuid, $c$圧力計は地上に一つだけでよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$減圧症が疑われる作業者に対する再圧室の使用として、最も適切なものはどれか。$q$,
  $e$再圧は定められた手順と医療上の指示・連携の下で実施し、自己判断で中断しない。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'::uuid, $c$本人だけで操作する。$c$, false, 1),
  ('fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'::uuid, $c$周囲圧力を高めて気泡を縮小させ、適切な呼吸用ガスで酸素供給と不活性ガス排出を図る。$c$, true, 2),
  ('fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'::uuid, $c$直ちに最高使用圧力まで加圧する。$c$, false, 3),
  ('fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'::uuid, $c$症状消失時に自己判断で中断する。$c$, false, 4),
  ('fa5b5ecc-67ee-4d0c-8a24-41ec6f7a0ff6'::uuid, $c$全員に同一方法を無条件で適用する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a8340780-c04c-466d-a47a-b46bf81b726d',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '送気及び排気'),
  $q$ビュールマンZH-L16モデルに関する記述として、正しいものはどれか。$q$,
  $e$ZH-L16は、ガス交換速度の異なる16個の理論的組織区画を用いる溶解ガス型モデルである。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a8340780-c04c-466d-a47a-b46bf81b726d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a8340780-c04c-466d-a47a-b46bf81b726d'::uuid, $c$人体を一つの均一な組織とする。$c$, false, 1),
  ('a8340780-c04c-466d-a47a-b46bf81b726d'::uuid, $c$16個の理論的組織区画に異なる半飽和時間と許容過飽和圧を設定する。$c$, true, 2),
  ('a8340780-c04c-466d-a47a-b46bf81b726d'::uuid, $c$窒素やヘリウムの分圧を考慮しない。$c$, false, 3),
  ('a8340780-c04c-466d-a47a-b46bf81b726d'::uuid, $c$最速区画だけで全減圧を決める。$c$, false, 4),
  ('a8340780-c04c-466d-a47a-b46bf81b726d'::uuid, $c$気泡画像だけから停止時間を求める。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1936630c-5be9-44ac-9b77-dfc525552dd0',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$絶対圧力0.36 MPaで酸素濃度25%の混合ガスを呼吸するとき、酸素分圧はいくらか。$q$,
  $e$0.36×25/100=0.090 MPa。分圧計算には絶対圧力を用いる。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1936630c-5be9-44ac-9b77-dfc525552dd0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1936630c-5be9-44ac-9b77-dfc525552dd0'::uuid, $c$0.025 MPa$c$, false, 1),
  ('1936630c-5be9-44ac-9b77-dfc525552dd0'::uuid, $c$0.072 MPa$c$, false, 2),
  ('1936630c-5be9-44ac-9b77-dfc525552dd0'::uuid, $c$0.090 MPa$c$, true, 3),
  ('1936630c-5be9-44ac-9b77-dfc525552dd0'::uuid, $c$0.144 MPa$c$, false, 4),
  ('1936630c-5be9-44ac-9b77-dfc525552dd0'::uuid, $c$0.250 MPa$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2a748c50-ae86-481e-9fcd-3cf897418f59',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$温度一定で、絶対圧力0.30 MPaの場所で3 Lの密閉気体を0.10 MPaの場所へ移した。体積はいくらか。$q$,
  $e$ボイルの法則から V₂=(0.30×3)/0.10=9 L。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2a748c50-ae86-481e-9fcd-3cf897418f59'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2a748c50-ae86-481e-9fcd-3cf897418f59'::uuid, $c$1 L$c$, false, 1),
  ('2a748c50-ae86-481e-9fcd-3cf897418f59'::uuid, $c$3 L$c$, false, 2),
  ('2a748c50-ae86-481e-9fcd-3cf897418f59'::uuid, $c$6 L$c$, false, 3),
  ('2a748c50-ae86-481e-9fcd-3cf897418f59'::uuid, $c$9 L$c$, true, 4),
  ('2a748c50-ae86-481e-9fcd-3cf897418f59'::uuid, $c$12 L$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'dc8e9070-c14c-4248-ab85-a5499282d150',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$酸素中毒とUPTD・CPTDに関する記述として、正しいものはどれか。$q$,
  $e$肺酸素毒性の累積的負荷を評価する指標だが、個人差や中枢神経系酸素中毒を完全には予測しない。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'dc8e9070-c14c-4248-ab85-a5499282d150'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('dc8e9070-c14c-4248-ab85-a5499282d150'::uuid, $c$窒素酔いの指標である。$c$, false, 1),
  ('dc8e9070-c14c-4248-ab85-a5499282d150'::uuid, $c$二酸化炭素吸入量だけの指標である。$c$, false, 2),
  ('dc8e9070-c14c-4248-ab85-a5499282d150'::uuid, $c$酸素分圧とばく露時間を考慮して肺酸素毒性の累積負荷を評価する指標である。$c$, true, 3),
  ('dc8e9070-c14c-4248-ab85-a5499282d150'::uuid, $c$同じ値なら中枢神経系酸素中毒は絶対に起こらない。$c$, false, 4),
  ('dc8e9070-c14c-4248-ab85-a5499282d150'::uuid, $c$酸素濃度21%なら圧力に関係なく酸素中毒は起こらない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '64565a57-39be-4831-81b3-108ccf99c241',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$二酸化炭素中毒に関する記述として、正しいものはどれか。$q$,
  $e$二酸化炭素蓄積は呼吸促進、頭痛、判断力低下、意識障害などを生じ得るため、換気と測定が必要である。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '64565a57-39be-4831-81b3-108ccf99c241'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('64565a57-39be-4831-81b3-108ccf99c241'::uuid, $c$二酸化炭素は人体内で生成されない。$c$, false, 1),
  ('64565a57-39be-4831-81b3-108ccf99c241'::uuid, $c$蓄積すると頭痛、息苦しさ、判断力低下などが現れることがある。$c$, true, 2),
  ('64565a57-39be-4831-81b3-108ccf99c241'::uuid, $c$臭いで危険濃度を確実に判定できる。$c$, false, 3),
  ('64565a57-39be-4831-81b3-108ccf99c241'::uuid, $c$絶対圧力が上がっても分圧は変化しない。$c$, false, 4),
  ('64565a57-39be-4831-81b3-108ccf99c241'::uuid, $c$呼吸回数を減らせば改善する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9d46fe70-e308-41db-995d-e7b33d3a4f7c',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$窒素酔いに関する記述として、正しいものはどれか。$q$,
  $e$窒素酔いは高い窒素分圧による可逆的な麻酔作用で、判断力や協調運動を低下させる。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '9d46fe70-e308-41db-995d-e7b33d3a4f7c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9d46fe70-e308-41db-995d-e7b33d3a4f7c'::uuid, $c$高い窒素分圧により判断力低下や多幸感などが生じることがある。$c$, true, 1),
  ('9d46fe70-e308-41db-995d-e7b33d3a4f7c'::uuid, $c$窒素気泡による血管閉塞だけをいう。$c$, false, 2),
  ('9d46fe70-e308-41db-995d-e7b33d3a4f7c'::uuid, $c$窒素分圧が高いほど軽くなる。$c$, false, 3),
  ('9d46fe70-e308-41db-995d-e7b33d3a4f7c'::uuid, $c$事故発生率に影響しない。$c$, false, 4),
  ('9d46fe70-e308-41db-995d-e7b33d3a4f7c'::uuid, $c$ヘリウム置換で強くなる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧症の発生機序として、正しいものはどれか。$q$,
  $e$形成された気泡により、関節、皮膚、神経、呼吸器などに症状が生じ得る。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'::uuid, $c$加圧時に不活性ガスが瞬時に排出される。$c$, false, 1),
  ('cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'::uuid, $c$体内に溶解した不活性ガスが減圧時に過飽和となり、気泡を形成する。$c$, true, 2),
  ('cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'::uuid, $c$酸素分圧低下だけで発生する。$c$, false, 3),
  ('cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'::uuid, $c$減圧直後に無症状なら後から発症しない。$c$, false, 4),
  ('cd7b7bdf-dd1a-4b40-8599-ccca95ad3da1'::uuid, $c$症状は関節痛だけである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '08e5a585-bc75-4cde-a368-9ea809456ee1',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$耳の圧外傷に関する記述として、正しいものはどれか。$q$,
  $e$圧平衡ができない場合は加圧を止めるか戻し、無理な加圧を避ける。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '08e5a585-bc75-4cde-a368-9ea809456ee1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('08e5a585-bc75-4cde-a368-9ea809456ee1'::uuid, $c$加圧時は鼓膜が外側へ押される。$c$, false, 1),
  ('08e5a585-bc75-4cde-a368-9ea809456ee1'::uuid, $c$耳管による圧平衡が不十分だと、耳痛や鼓膜損傷を生じることがある。$c$, true, 2),
  ('08e5a585-bc75-4cde-a368-9ea809456ee1'::uuid, $c$耳痛時はさらに急速に加圧する。$c$, false, 3),
  ('08e5a585-bc75-4cde-a368-9ea809456ee1'::uuid, $c$鼻づまりは耳管通気を良くする。$c$, false, 4),
  ('08e5a585-bc75-4cde-a368-9ea809456ee1'::uuid, $c$耳抜きは減圧症の治療法である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7345812d-2765-4994-a8b5-0e46faba4041',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧時の肺過膨張と合併症に関する記述として、正しいものはどれか。$q$,
  $e$気胸、縦隔気腫、皮下気腫、動脈ガス塞栓症などを起こすことがある。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7345812d-2765-4994-a8b5-0e46faba4041'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7345812d-2765-4994-a8b5-0e46faba4041'::uuid, $c$呼吸を止めても肺内気体の体積は変わらない。$c$, false, 1),
  ('7345812d-2765-4994-a8b5-0e46faba4041'::uuid, $c$気体を排出できないと、膨張した気体で肺組織が損傷することがある。$c$, true, 2),
  ('7345812d-2765-4994-a8b5-0e46faba4041'::uuid, $c$気体が動脈内へ入ることはない。$c$, false, 3),
  ('7345812d-2765-4994-a8b5-0e46faba4041'::uuid, $c$加圧中だけに発生する。$c$, false, 4),
  ('7345812d-2765-4994-a8b5-0e46faba4041'::uuid, $c$合併症は関節痛だけである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '4ad873cd-9319-4ada-a6b3-76092757de3f',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$高気圧環境の人体影響として、正しいものはどれか。$q$,
  $e$不活性ガスの取り込みは分圧、ばく露時間、組織のガス交換速度などに左右される。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '4ad873cd-9319-4ada-a6b3-76092757de3f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('4ad873cd-9319-4ada-a6b3-76092757de3f'::uuid, $c$呼吸ガス密度は変化しない。$c$, false, 1),
  ('4ad873cd-9319-4ada-a6b3-76092757de3f'::uuid, $c$呼吸ガス密度が増し、呼吸抵抗や呼吸仕事量が増えることがある。$c$, true, 2),
  ('4ad873cd-9319-4ada-a6b3-76092757de3f'::uuid, $c$体内に溶ける不活性ガス量は必ず減少する。$c$, false, 3),
  ('4ad873cd-9319-4ada-a6b3-76092757de3f'::uuid, $c$加減圧速度は人体影響と無関係である。$c$, false, 4),
  ('4ad873cd-9319-4ada-a6b3-76092757de3f'::uuid, $c$作業時間は不活性ガス取り込み量に影響しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e30e567a-b8b2-4861-aaa3-54c7899e44df',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$作業者に反応がなく、普段どおりの呼吸をしていない場合の一次救命処置として、最も適切なものはどれか。$q$,
  $e$心停止時の一次救命処置を遅らせず、AED到着後は音声指示に従う。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e30e567a-b8b2-4861-aaa3-54c7899e44df'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e30e567a-b8b2-4861-aaa3-54c7899e44df'::uuid, $c$座位で経過観察する。$c$, false, 1),
  ('e30e567a-b8b2-4861-aaa3-54c7899e44df'::uuid, $c$水を飲ませる。$c$, false, 2),
  ('e30e567a-b8b2-4861-aaa3-54c7899e44df'::uuid, $c$救急通報とAEDの手配を行い、胸骨圧迫を開始し、AEDの音声指示に従う。$c$, true, 3),
  ('e30e567a-b8b2-4861-aaa3-54c7899e44df'::uuid, $c$減圧症の可能性があれば胸骨圧迫しない。$c$, false, 4),
  ('e30e567a-b8b2-4861-aaa3-54c7899e44df'::uuid, $c$AEDは医師到着まで使用しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f9ab69dd-2f02-4534-81bc-d0246f5de8d6',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$気こう室の床面積および気積について、作業者1人当たりの最低基準として正しいものはどれか。$q$,
  $e$1人について床面積0.3 m²以上、気積0.6 m³以上。根拠: 高気圧作業安全衛生規則第3条。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f9ab69dd-2f02-4534-81bc-d0246f5de8d6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f9ab69dd-2f02-4534-81bc-d0246f5de8d6'::uuid, $c$0.2 m²以上、0.4 m³以上$c$, false, 1),
  ('f9ab69dd-2f02-4534-81bc-d0246f5de8d6'::uuid, $c$0.3 m²以上、0.6 m³以上$c$, true, 2),
  ('f9ab69dd-2f02-4534-81bc-d0246f5de8d6'::uuid, $c$0.4 m²以上、0.8 m³以上$c$, false, 3),
  ('f9ab69dd-2f02-4534-81bc-d0246f5de8d6'::uuid, $c$0.6 m²以上、1.2 m³以上$c$, false, 4),
  ('f9ab69dd-2f02-4534-81bc-d0246f5de8d6'::uuid, $c$1.0 m²以上、2.0 m³以上$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7be59b38-8c01-4483-a3d2-adedcf334af3',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の圧力計に関する記述として、正しいものはどれか。$q$,
  $e$圧力計の一目盛りは0.02 MPa以下。圧力0.1 MPa以上では気こう室に自記記録圧力計を設ける。根拠: 同規則第7条第5項・第6項。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7be59b38-8c01-4483-a3d2-adedcf334af3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7be59b38-8c01-4483-a3d2-adedcf334af3'::uuid, $c$一目盛りは0.05 MPa以下である。$c$, false, 1),
  ('7be59b38-8c01-4483-a3d2-adedcf334af3'::uuid, $c$一目盛りは0.10 MPa以下である。$c$, false, 2),
  ('7be59b38-8c01-4483-a3d2-adedcf334af3'::uuid, $c$圧力0.05 MPa以上で自記記録圧力計が必要である。$c$, false, 3),
  ('7be59b38-8c01-4483-a3d2-adedcf334af3'::uuid, $c$圧力0.1 MPa以上の業務では、気こう室に自記記録圧力計を設ける。$c$, true, 4),
  ('7be59b38-8c01-4483-a3d2-adedcf334af3'::uuid, $c$気こう室内のバルブ操作者に携帯式圧力計は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ab384952-dd14-4cc4-be0c-969c6de67884',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内作業主任者の選任について、正しいものはどれか。$q$,
  $e$高圧室内作業主任者免許を受けた者のうちから、作業室ごとに選任する。根拠: 同規則第10条第1項。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ab384952-dd14-4cc4-be0c-969c6de67884'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ab384952-dd14-4cc4-be0c-969c6de67884'::uuid, $c$潜水士免許所持者なら選任できる。$c$, false, 1),
  ('ab384952-dd14-4cc4-be0c-969c6de67884'::uuid, $c$特別教育修了者なら選任できる。$c$, false, 2),
  ('ab384952-dd14-4cc4-be0c-969c6de67884'::uuid, $c$高圧室内作業主任者免許を受けた者から、作業室ごとに選任する。$c$, true, 3),
  ('ab384952-dd14-4cc4-be0c-969c6de67884'::uuid, $c$工事現場全体で1人ならよい。$c$, false, 4),
  ('ab384952-dd14-4cc4-be0c-969c6de67884'::uuid, $c$圧縮機運転経験3年以上なら選任できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2270aad9-a18a-4a66-a065-1d0056bf5507',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$特別教育が必要な業務に該当しないものはどれか。$q$,
  $e$（１）〜（４）および高圧室内業務などは特別教育の対象。根拠: 同規則第11条。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2270aad9-a18a-4a66-a065-1d0056bf5507'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2270aad9-a18a-4a66-a065-1d0056bf5507'::uuid, $c$作業室・気こう室へ送気する空気圧縮機の運転$c$, false, 1),
  ('2270aad9-a18a-4a66-a065-1d0056bf5507'::uuid, $c$作業室への送気調節$c$, false, 2),
  ('2270aad9-a18a-4a66-a065-1d0056bf5507'::uuid, $c$気こう室への送気・気こう室からの排気調節$c$, false, 3),
  ('2270aad9-a18a-4a66-a065-1d0056bf5507'::uuid, $c$再圧室の操作$c$, false, 4),
  ('2270aad9-a18a-4a66-a065-1d0056bf5507'::uuid, $c$高圧室内業務と無関係な地上事務所での一般事務$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd11da945-0f21-4b75-b8df-5cfd50510d62',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高圧室内業務の作業計画に示す事項として、定められていないものはどれか。$q$,
  $e$減圧停止圧力・停止時間も計画事項となる。根拠: 同規則第12条の2。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd11da945-0f21-4b75-b8df-5cfd50510d62'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d11da945-0f21-4b75-b8df-5cfd50510d62'::uuid, $c$送気する気体の成分組成$c$, false, 1),
  ('d11da945-0f21-4b75-b8df-5cfd50510d62'::uuid, $c$加圧開始から減圧開始までの時間$c$, false, 2),
  ('d11da945-0f21-4b75-b8df-5cfd50510d62'::uuid, $c$最高の圧力$c$, false, 3),
  ('d11da945-0f21-4b75-b8df-5cfd50510d62'::uuid, $c$加圧および減圧の速度$c$, false, 4),
  ('d11da945-0f21-4b75-b8df-5cfd50510d62'::uuid, $c$作業者全員の年間所得額$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ebe85baa-13ac-4bc1-a42c-5605605e3c03',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ガス分圧の規制値として正しい組合せはどれか。ただし気こう室での減圧中の酸素上限の例外は除く。$q$,
  $e$減圧中の気こう室では酸素上限が220 kPaとなる例外がある。根拠: 同規則第15条第1項。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ebe85baa-13ac-4bc1-a42c-5605605e3c03'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ebe85baa-13ac-4bc1-a42c-5605605e3c03'::uuid, $c$酸素15～140 kPa、窒素300 kPa以下、炭酸ガス1.0 kPa以下$c$, false, 1),
  ('ebe85baa-13ac-4bc1-a42c-5605605e3c03'::uuid, $c$酸素18～160 kPa、窒素400 kPa以下、炭酸ガス0.5 kPa以下$c$, true, 2),
  ('ebe85baa-13ac-4bc1-a42c-5605605e3c03'::uuid, $c$酸素20～220 kPa、窒素500 kPa以下、炭酸ガス0.8 kPa以下$c$, false, 3),
  ('ebe85baa-13ac-4bc1-a42c-5605605e3c03'::uuid, $c$酸素18～220 kPa、窒素600 kPa以下、炭酸ガス0.5 kPa以下$c$, false, 4),
  ('ebe85baa-13ac-4bc1-a42c-5605605e3c03'::uuid, $c$酸素25～160 kPa、窒素400 kPa以下、炭酸ガス1.5 kPa以下$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2829ceb9-a837-4d60-b2a2-781ca8bd4ce7',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$気こう室における加圧・減圧速度について、正しいものはどれか。$q$,
  $e$加圧・減圧はいずれも毎分0.08 MPa以下。減圧停止の条件も守る。根拠: 同規則第14条、第18条。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'::uuid, $c$加圧0.04、減圧0.12 MPa/min以下$c$, false, 1),
  ('2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'::uuid, $c$いずれも0.08 MPa/min以下$c$, true, 2),
  ('2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'::uuid, $c$加圧0.10 MPa/min以下、減圧は上限なし$c$, false, 3),
  ('2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'::uuid, $c$加圧は上限なし、減圧0.08 MPa/min以下$c$, false, 4),
  ('2829ceb9-a837-4d60-b2a2-781ca8bd4ce7'::uuid, $c$本人同意で上限は適用されない$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$設備の点検周期として正しい組合せはどれか。$q$,
  $e$点検・修理等の概要はその都度記録し、3年間保存する。根拠: 同規則第22条。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'::uuid, $c$送気管―1日、空気圧縮機―1週、圧力計―1月$c$, true, 1),
  ('f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'::uuid, $c$送気管―1週、空気圧縮機―1月、圧力計―6月$c$, false, 2),
  ('f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'::uuid, $c$送気管―1月、空気圧縮機―1日、圧力計―1週$c$, false, 3),
  ('f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'::uuid, $c$送気管―1日、空気圧縮機―1月、圧力計―1年$c$, false, 4),
  ('f1eb0a64-d4e1-4cd7-83e9-1e3406bfddc4'::uuid, $c$送気管―1年、空気圧縮機―6月、圧力計―1月$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cf9dc411-ff89-4ffb-b286-4cd5207910ba',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高気圧業務健康診断について、正しいものはどれか。$q$,
  $e$常時従事する労働者が対象で、個人票は5年間保存する。根拠: 同規則第38条、第39条。$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cf9dc411-ff89-4ffb-b286-4cd5207910ba'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cf9dc411-ff89-4ffb-b286-4cd5207910ba'::uuid, $c$3年以内ごとに1回でよい。$c$, false, 1),
  ('cf9dc411-ff89-4ffb-b286-4cd5207910ba'::uuid, $c$1年以内ごとに1回でよい。$c$, false, 2),
  ('cf9dc411-ff89-4ffb-b286-4cd5207910ba'::uuid, $c$雇入れ時、配置替え時およびその後6月以内ごとに1回行う。$c$, true, 3),
  ('cf9dc411-ff89-4ffb-b286-4cd5207910ba'::uuid, $c$個人票は1年間保存する。$c$, false, 4),
  ('cf9dc411-ff89-4ffb-b286-4cd5207910ba'::uuid, $c$鼓膜・聴力検査は含まれない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '06c48e9f-9d73-484e-a4d5-e26ce99e1607',
  'pressure_chamber',
  (SELECT id FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'pressure_chamber' AND e.code = 'common' AND c.name = '関係法令'),
  $q$圧気工事の安全衛生管理として、正しいものはどれか。$q$,
  $e$作業主任者は作業方法の決定、直接指揮、測定器具点検、人数確認、送排気担当者との連絡、健康異常時の措置などを行う。事故のおそれがある場合、事業者は従事者を退避させる。根拠: 同規則第10条、第23条。


- 高気圧作業安全衛生規則（昭和47年労働省令第40号）
- 高気圧作業安全衛生規則第8条第2項等の規定に基づく厚生労働大臣が定める方法等
- 一般的な圧気工法、高気圧生理および一次救命処置の教科書的知識$e$,
  'original',
  '高圧室内作業主任者 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '06c48e9f-9d73-484e-a4d5-e26ce99e1607'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('06c48e9f-9d73-484e-a4d5-e26ce99e1607'::uuid, $c$作業主任者は作業者を直接指揮しなくてよい。$c$, false, 1),
  ('06c48e9f-9d73-484e-a4d5-e26ce99e1607'::uuid, $c$入退室人数は送気設備運転者だけが確認する。$c$, false, 2),
  ('06c48e9f-9d73-484e-a4d5-e26ce99e1607'::uuid, $c$送気設備故障や出水のおそれがあっても作業を続ける。$c$, false, 3),
  ('06c48e9f-9d73-484e-a4d5-e26ce99e1607'::uuid, $c$作業主任者は送排気担当者と連絡し、圧力や加圧・減圧が規定に適合するよう措置する。$c$, true, 4),
  ('06c48e9f-9d73-484e-a4d5-e26ce99e1607'::uuid, $c$健康異常時も減圧完了まで措置しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

DO $$
DECLARE
  original_count int;
BEGIN
  SELECT count(*) INTO original_count
  FROM questions
  WHERE exam_id = 'pressure_chamber'
    AND source_type = 'original'
    AND source_note LIKE '高圧室内作業主任者 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'pressure_chamber original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'pressure_chamber', exam_types.id,
  '高圧室内作業主任者模擬試験A', 240, 40,
  '高圧室内作業主任者 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'pressure_chamber'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'pressure_chamber'
      AND name = '高圧室内作業主任者模擬試験A'
  );
