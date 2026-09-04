-- boiler2 オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9c860c9a-f24f-4be7-a0cf-9e8ba2689b88',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ある圧力計が示すゲージ圧力が0.42 MPaで、その場所の大気圧が0.10 MPaである。このとき、ボイラー内部の絶対圧力として正しいものはどれか。$q$,
  $e$絶対圧力は、ゲージ圧力に大気圧を加えて求める。
絶対圧力＝0.42＋0.10＝0.52 MPa$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'::uuid, $c$0.32 MPa$c$, false, 1),
  ('9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'::uuid, $c$0.42 MPa$c$, false, 2),
  ('9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'::uuid, $c$0.52 MPa$c$, true, 3),
  ('9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'::uuid, $c$4.2 MPa$c$, false, 4),
  ('9c860c9a-f24f-4be7-a0cf-9e8ba2689b88'::uuid, $c$5.2 MPa$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1f011437-6384-4ad7-8289-6007a593d046',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーにおける自然循環の説明として、適切なものはどれか。$q$,
  $e$加熱されて気泡を含んだ上昇管内の気水混合物は、比較的低温の水が流れる下降管内より密度が小さくなる。この密度差が自然循環の駆動力となる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '1f011437-6384-4ad7-8289-6007a593d046'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1f011437-6384-4ad7-8289-6007a593d046'::uuid, $c$下降管内の水と上昇管内の気水混合物との密度差によって循環が生じる。$c$, true, 1),
  ('1f011437-6384-4ad7-8289-6007a593d046'::uuid, $c$蒸気圧力が大気圧より低い場合に限り、循環が生じる。$c$, false, 2),
  ('1f011437-6384-4ad7-8289-6007a593d046'::uuid, $c$水面から発生した蒸気が給水管を逆流することで循環が生じる。$c$, false, 3),
  ('1f011437-6384-4ad7-8289-6007a593d046'::uuid, $c$水管の内径をすべて同じにすると、密度差がなくても循環が生じる。$c$, false, 4),
  ('1f011437-6384-4ad7-8289-6007a593d046'::uuid, $c$燃焼ガスが水管内へ入り、水を押し上げることで循環が生じる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd94d1f34-d84b-4c42-a3d3-97d79a15ed7b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの伝熱面、燃焼室及び燃焼装置に関する説明として、適切なものはどれか。$q$,
  $e$燃焼室は、燃料を燃焼させ、発生した熱を放射や対流などによって伝熱面へ伝える空間である。燃焼装置は燃料と空気を適切に供給する装置であり、伝熱面積は一般に大きいほど伝熱に有利となる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'd94d1f34-d84b-4c42-a3d3-97d79a15ed7b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d94d1f34-d84b-4c42-a3d3-97d79a15ed7b'::uuid, $c$伝熱面とは、燃料と燃焼用空気が混合する空間だけをいう。$c$, false, 1),
  ('d94d1f34-d84b-4c42-a3d3-97d79a15ed7b'::uuid, $c$燃焼室は、燃料を燃焼させるとともに、発生した熱を周囲の伝熱面へ伝える空間である。$c$, true, 2),
  ('d94d1f34-d84b-4c42-a3d3-97d79a15ed7b'::uuid, $c$燃焼装置は、給水中の溶存酸素を除去するための装置である。$c$, false, 3),
  ('d94d1f34-d84b-4c42-a3d3-97d79a15ed7b'::uuid, $c$伝熱面積を増やすと、ほかの条件が同じでも熱の移動量は必ず減少する。$c$, false, 4),
  ('d94d1f34-d84b-4c42-a3d3-97d79a15ed7b'::uuid, $c$燃焼室の容積は、燃料が完全燃焼するために必要な時間とは関係しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '19156c5c-3c5f-4bec-b373-32da658fcf59',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$炉筒煙管ボイラーの構造に関する説明として、適切なものはどれか。$q$,
  $e$炉筒煙管ボイラーでは、胴内に炉筒と煙管が設けられる。炉筒内で燃焼し、その燃焼ガスが煙管内を流れることで、炉筒及び煙管の周囲にある水が加熱される。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '19156c5c-3c5f-4bec-b373-32da658fcf59'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('19156c5c-3c5f-4bec-b373-32da658fcf59'::uuid, $c$水管の内部を水が流れ、その外側を燃焼ガスが流れる構造だけで構成される。$c$, false, 1),
  ('19156c5c-3c5f-4bec-b373-32da658fcf59'::uuid, $c$炉筒内で燃焼が行われ、燃焼ガスが煙管内を通過して周囲の水を加熱する。$c$, true, 2),
  ('19156c5c-3c5f-4bec-b373-32da658fcf59'::uuid, $c$蒸気ドラムを持たず、給水が管内を一方向に流れることだけで蒸気を発生させる。$c$, false, 3),
  ('19156c5c-3c5f-4bec-b373-32da658fcf59'::uuid, $c$鋳鉄製のセクションを多数連結することによって、炉筒を形成する。$c$, false, 4),
  ('19156c5c-3c5f-4bec-b373-32da658fcf59'::uuid, $c$燃焼ガスは胴内の水中を直接通過し、水と混合して熱を伝える。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ddda67c0-aa1e-405f-b3e1-5171aae2f368',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$水管ボイラーの構造上の特徴として、適切なものはどれか。$q$,
  $e$水管ボイラーは、水管内を水又は気水混合物が流れ、水管の外側を高温の燃焼ガスが流れる構造である。比較的小径の水管を使用するため耐圧上有利であり、高圧・大容量化に適している。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'ddda67c0-aa1e-405f-b3e1-5171aae2f368'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ddda67c0-aa1e-405f-b3e1-5171aae2f368'::uuid, $c$水管の内部を水又は気水混合物が流れ、その外側を燃焼ガスが流れる。$c$, true, 1),
  ('ddda67c0-aa1e-405f-b3e1-5171aae2f368'::uuid, $c$炉筒及び煙管の内部に水を満たし、その外側へ燃焼ガスを流す。$c$, false, 2),
  ('ddda67c0-aa1e-405f-b3e1-5171aae2f368'::uuid, $c$胴の内部に燃焼ガスを蓄え、胴の外面だけを水で冷却する。$c$, false, 3),
  ('ddda67c0-aa1e-405f-b3e1-5171aae2f368'::uuid, $c$鋳鉄製セクションの継手を溶接して、高圧用の蒸気ドラムを形成する。$c$, false, 4),
  ('ddda67c0-aa1e-405f-b3e1-5171aae2f368'::uuid, $c$水管内には燃焼ガスだけを通し、水はボイラーの外部で加熱する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7d281bed-0d6c-4222-938b-753a4c0d530c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$貫流ボイラーの一般的な構造及び作動に関する説明として、適切なものはどれか。$q$,
  $e$貫流ボイラーでは、給水が管系の入口から出口へ向かって流れる間に、予熱、蒸発及び必要に応じた過熱が行われる。一般に蒸気ドラムを必要としない。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '7d281bed-0d6c-4222-938b-753a4c0d530c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7d281bed-0d6c-4222-938b-753a4c0d530c'::uuid, $c$給水は管系を一方向に流れ、加熱されて蒸発し、蒸気として取り出される。$c$, true, 1),
  ('7d281bed-0d6c-4222-938b-753a4c0d530c'::uuid, $c$多数の鋳鉄製セクション内で水を循環させ、発生した蒸気を炉筒へ送る。$c$, false, 2),
  ('7d281bed-0d6c-4222-938b-753a4c0d530c'::uuid, $c$必ず大容量の蒸気ドラムを備え、ドラム内でのみ水を蒸発させる。$c$, false, 3),
  ('7d281bed-0d6c-4222-938b-753a4c0d530c'::uuid, $c$煙管内の水を往復させることにより、燃焼ガスを循環させる。$c$, false, 4),
  ('7d281bed-0d6c-4222-938b-753a4c0d530c'::uuid, $c$水を循環させず、燃焼ガスを給水管の内部へ直接導入する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '32fa978b-f857-46aa-90e9-755dfd7bb1a9',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$鋳鉄製ボイラー及びハートフォード式連結法に関する説明として、適切なものはどれか。$q$,
  $e$鋳鉄製ボイラーは、鋳鉄製のセクションをニップルなどで連結して構成される。ハートフォード式連結法は、低圧蒸気暖房ボイラーなどの還水管に用いられ、還水管の破損時などにボイラー水が大量に流出するのを抑えるための接続法である。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '32fa978b-f857-46aa-90e9-755dfd7bb1a9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('32fa978b-f857-46aa-90e9-755dfd7bb1a9'::uuid, $c$鋳鉄製ボイラーは、複数の鋳鉄製セクションを連結して構成できる。$c$, true, 1),
  ('32fa978b-f857-46aa-90e9-755dfd7bb1a9'::uuid, $c$鋳鉄製ボイラーは、一般に高圧・大容量の発電用ボイラーとして使用される。$c$, false, 2),
  ('32fa978b-f857-46aa-90e9-755dfd7bb1a9'::uuid, $c$ハートフォード式連結法は、煙突の通風力を増すための煙道接続法である。$c$, false, 3),
  ('32fa978b-f857-46aa-90e9-755dfd7bb1a9'::uuid, $c$ハートフォード式連結法は、蒸気主管内の凝縮水を外部へ排出する方法である。$c$, false, 4),
  ('32fa978b-f857-46aa-90e9-755dfd7bb1a9'::uuid, $c$ハートフォード式連結法は、燃料配管が破損した際の漏油を防ぐ接続法である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c7e16ff3-c90b-4ee2-976d-c63bd062cbd1',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーのマンホール、水高計、逃がし管及び逃がし弁に関する説明として、適切なものはどれか。$q$,
  $e$マンホールは、内部の検査、清掃及び修繕などのため、人が出入りできるように設ける開口部である。水高計は温水ボイラーの水頭を示す計器である。逃がし弁又は所定の逃がし管は、温水ボイラー内の圧力が異常に上昇することを防止するために設けられる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'::uuid, $c$マンホールは、ボイラー内部の点検や清掃などのために人が出入りできるよう設ける。$c$, true, 1),
  ('c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'::uuid, $c$水高計は、蒸気ボイラーの燃焼ガス温度だけを測定する計器である。$c$, false, 2),
  ('c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'::uuid, $c$逃がし管には、通常運転中に自由に閉止できる止め弁を必ず設ける。$c$, false, 3),
  ('c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'::uuid, $c$逃がし弁は、ボイラー水の硬度を自動的に調整するために設ける。$c$, false, 4),
  ('c7e16ff3-c90b-4ee2-976d-c63bd062cbd1'::uuid, $c$マンホールは、燃焼用空気を炉内へ供給するための開口部である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '86adfdf9-6c4b-4cb2-8845-4260c0b5702b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$蒸気トラップの種類と作動原理の組合せとして、適切なものはどれか。$q$,
  $e$フロート式蒸気トラップは、流入した凝縮水によるフロートの浮力を利用して弁を開閉する。ほかの選択肢は、それぞれのトラップの作動原理と一致しない。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '86adfdf9-6c4b-4cb2-8845-4260c0b5702b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('86adfdf9-6c4b-4cb2-8845-4260c0b5702b'::uuid, $c$フロート式――凝縮水によるフロートの浮力を利用して弁を作動させる。$c$, true, 1),
  ('86adfdf9-6c4b-4cb2-8845-4260c0b5702b'::uuid, $c$バケット式――蒸気と凝縮水の電気抵抗の差だけを利用して弁を作動させる。$c$, false, 2),
  ('86adfdf9-6c4b-4cb2-8845-4260c0b5702b'::uuid, $c$バイメタル式――凝縮水の重量でフロートを沈めて弁を作動させる。$c$, false, 3),
  ('86adfdf9-6c4b-4cb2-8845-4260c0b5702b'::uuid, $c$ディスク式――燃焼ガス中の酸素濃度によって弁を作動させる。$c$, false, 4),
  ('86adfdf9-6c4b-4cb2-8845-4260c0b5702b'::uuid, $c$ベローズ式――ボイラー水の硬度変化によって弁を作動させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '74f741c6-6a5c-49ab-9dfb-2280ae6df951',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$オンオフ式温度調節器の作動に関する説明として、適切なものはどれか。$q$,
  $e$オンオフ式温度調節器は、検出温度が所定の値に達したときに燃焼装置を停止し、温度が所定の値まで低下すると再び始動させる。通常は頻繁な発停を防ぐため、作動温度と復帰温度の間に一定の差を設ける。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '74f741c6-6a5c-49ab-9dfb-2280ae6df951'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('74f741c6-6a5c-49ab-9dfb-2280ae6df951'::uuid, $c$検出温度に応じて燃料流量を常に連続的かつ比例的に変化させる。$c$, false, 1),
  ('74f741c6-6a5c-49ab-9dfb-2280ae6df951'::uuid, $c$設定温度を基準として燃焼装置を始動又は停止させ、温度を一定範囲に保つ。$c$, true, 2),
  ('74f741c6-6a5c-49ab-9dfb-2280ae6df951'::uuid, $c$設定温度に達した後も燃焼装置を停止させず、送風量だけをゼロにする。$c$, false, 3),
  ('74f741c6-6a5c-49ab-9dfb-2280ae6df951'::uuid, $c$ボイラー水位だけを検出し、給水ポンプの回転速度を連続的に調整する。$c$, false, 4),
  ('74f741c6-6a5c-49ab-9dfb-2280ae6df951'::uuid, $c$蒸気圧力だけを検出し、逃がし弁を手動で開閉する時期を表示する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9c6f8933-61a0-4ec2-b63c-09211980c052',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$油だきボイラーの点火時に生じる逆火の原因と、その防止方法に関する説明として、適切なものはどれか。$q$,
  $e$炉内に滞留した未燃燃料へ点火すると、急激な燃焼による逆火や炉内爆発のおそれがある。点火前及び失火後の再点火前には、燃料供給を止め、炉内と煙道を十分に換気する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '9c6f8933-61a0-4ec2-b63c-09211980c052'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9c6f8933-61a0-4ec2-b63c-09211980c052'::uuid, $c$炉内に未燃燃料が滞留している状態で点火すると逆火のおそれがあるため、点火前に炉内及び煙道を十分に換気する。$c$, true, 1),
  ('9c6f8933-61a0-4ec2-b63c-09211980c052'::uuid, $c$点火前に燃料を長時間噴射し、炉内の燃料濃度を高めてから着火する。$c$, false, 2),
  ('9c6f8933-61a0-4ec2-b63c-09211980c052'::uuid, $c$点火前の換気では燃料蒸気が増加するため、ダンパーを全閉にする。$c$, false, 3),
  ('9c6f8933-61a0-4ec2-b63c-09211980c052'::uuid, $c$逆火を防止するため、最初から燃料供給量を最大にして点火する。$c$, false, 4),
  ('9c6f8933-61a0-4ec2-b63c-09211980c052'::uuid, $c$一度着火に失敗した場合は、換気せず直ちに再点火する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '80a2242c-5cdb-416a-8206-41ea28959a25',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$蒸気ボイラーのたき始めにおける弁及びコックの状態として、適切なものはどれか。$q$,
  $e$たき始めには、蒸気が発生して所定の状態になるまで主蒸気弁を閉じ、ボイラー内の空気を排出するため空気抜き弁を開いておく。吹出し弁は閉じておく。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '80a2242c-5cdb-416a-8206-41ea28959a25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('80a2242c-5cdb-416a-8206-41ea28959a25'::uuid, $c$主蒸気弁を全開、空気抜き弁を閉、吹出し弁を開とする。$c$, false, 1),
  ('80a2242c-5cdb-416a-8206-41ea28959a25'::uuid, $c$主蒸気弁を閉、空気抜き弁を開、吹出し弁を閉とする。$c$, true, 2),
  ('80a2242c-5cdb-416a-8206-41ea28959a25'::uuid, $c$主蒸気弁を閉、空気抜き弁を閉、吹出し弁を開とする。$c$, false, 3),
  ('80a2242c-5cdb-416a-8206-41ea28959a25'::uuid, $c$主蒸気弁を全開、空気抜き弁を開、吹出し弁を開とする。$c$, false, 4),
  ('80a2242c-5cdb-416a-8206-41ea28959a25'::uuid, $c$主蒸気弁を全開、空気抜き弁を閉、吹出し弁を閉とする。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '15a77881-323f-43a0-87ae-3e6be51e77d0',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$油だきボイラーの燃焼を維持・調節する方法として、適切なものはどれか。$q$,
  $e$燃焼量を増加するときは、空気不足を避けるため空気量を先に増やしてから燃料量を増やす。減少時は、未燃燃料を生じさせないよう燃料量を先に減らしてから空気量を減らす。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '15a77881-323f-43a0-87ae-3e6be51e77d0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('15a77881-323f-43a0-87ae-3e6be51e77d0'::uuid, $c$燃料量を増加させるときは、燃焼用空気を先に増加させてから燃料を増加させる。$c$, true, 1),
  ('15a77881-323f-43a0-87ae-3e6be51e77d0'::uuid, $c$燃料量を増加させるときは、燃料を先に増加させ、黒煙が出てから空気を増加させる。$c$, false, 2),
  ('15a77881-323f-43a0-87ae-3e6be51e77d0'::uuid, $c$燃焼量を減少させるときは、空気を先に大幅に減少させてから燃料を減少させる。$c$, false, 3),
  ('15a77881-323f-43a0-87ae-3e6be51e77d0'::uuid, $c$負荷が変化しても、燃料量と空気量は変更しない。$c$, false, 4),
  ('15a77881-323f-43a0-87ae-3e6be51e77d0'::uuid, $c$炉内が正圧になるよう、常に燃焼用空気を過剰に供給する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3db17523-78ab-4e82-9039-e1dd6f9eb38e',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$蒸気ボイラーでキャリオーバが発生する原因と対処に関する説明として、適切なものはどれか。$q$,
  $e$キャリオーバは、高水位、ボイラー水の過度な濃縮、油脂などによる泡立ち、急激な負荷上昇などで発生しやすい。負荷を抑え、水位や水質を確認し、必要に応じて吹出しを行う。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '3db17523-78ab-4e82-9039-e1dd6f9eb38e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3db17523-78ab-4e82-9039-e1dd6f9eb38e'::uuid, $c$ボイラー水の濃縮度が高く水位も高い場合に発生しやすいため、負荷を抑え、適切な吹出しと水位調整を行う。$c$, true, 1),
  ('3db17523-78ab-4e82-9039-e1dd6f9eb38e'::uuid, $c$ボイラー水の濃縮度が低いほど発生しやすいため、吹出しを停止して濃縮させる。$c$, false, 2),
  ('3db17523-78ab-4e82-9039-e1dd6f9eb38e'::uuid, $c$蒸気負荷が一定で水位が適正な場合にのみ発生するため、負荷を急増させる。$c$, false, 3),
  ('3db17523-78ab-4e82-9039-e1dd6f9eb38e'::uuid, $c$給水温度が高いことだけが原因であるため、給水を常に冷却する。$c$, false, 4),
  ('3db17523-78ab-4e82-9039-e1dd6f9eb38e'::uuid, $c$煙道内の通風不足が唯一の原因であるため、ボイラー水の状態は確認しなくてよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '29e7d0b7-4dd9-42f2-90f5-5758514c749a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$運転中の蒸気ボイラーで著しい低水位が確認された場合の措置として、適切なものはどれか。$q$,
  $e$著しい低水位が確認された場合は、直ちに燃料供給を遮断して燃焼を停止し、ボイラーを安全に冷却する。過熱している可能性があるボイラーへ直ちに給水してはならず、冷却後に低水位となった原因と損傷の有無を調査する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '29e7d0b7-4dd9-42f2-90f5-5758514c749a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('29e7d0b7-4dd9-42f2-90f5-5758514c749a'::uuid, $c$直ちに燃焼を停止し、ボイラーを冷却させ、原因を調査する。$c$, true, 1),
  ('29e7d0b7-4dd9-42f2-90f5-5758514c749a'::uuid, $c$燃焼を続けたまま、大量の冷水を急速に給水する。$c$, false, 2),
  ('29e7d0b7-4dd9-42f2-90f5-5758514c749a'::uuid, $c$安全弁を閉じて蒸気圧力を維持しながら給水する。$c$, false, 3),
  ('29e7d0b7-4dd9-42f2-90f5-5758514c749a'::uuid, $c$主蒸気弁をさらに開き、蒸発量を増加させる。$c$, false, 4),
  ('29e7d0b7-4dd9-42f2-90f5-5758514c749a'::uuid, $c$水面計を確認せず、燃料量だけを減少させて運転を続ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b7d8b1d6-820c-4faf-978f-2cb9b3dedcce',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$三コック式ガラス水面計の機能試験における操作として、適切なものはどれか。$q$,
  $e$排水コックを使用して水面計内部を吹き抜き、蒸気側及び水側の連絡部の通りをそれぞれ確認する。試験終了後は、蒸気側コックと水側コックを開き、排水コックを閉じた通常状態へ戻す。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'::uuid, $c$排水コックを開き、蒸気側コック及び水側コックを順次個別に操作して、蒸気側・水側それぞれの連絡部の通りを確認する。$c$, true, 1),
  ('b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'::uuid, $c$蒸気側コックと水側コックを同時に閉じたまま、ガラス管内の水位変化だけを観察する。$c$, false, 2),
  ('b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'::uuid, $c$排水コックを閉じたまま、蒸気側コックだけを繰り返し開閉する。$c$, false, 3),
  ('b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'::uuid, $c$水側コックを閉じた状態を通常運転状態として試験を終了する。$c$, false, 4),
  ('b7d8b1d6-820c-4faf-978f-2cb9b3dedcce'::uuid, $c$試験後は蒸気側コックを閉じ、水側コックと排水コックを開いた状態にする。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e91940b2-74e6-4931-9561-f9757cba154b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ばね安全弁の弁座付近から蒸気が漏れる原因として、適切なものはどれか。$q$,
  $e$安全弁の蒸気漏れは、弁体と弁座の間への異物のかみ込み、当たり面の損傷、弁棒の曲がりなどにより、弁が完全に閉じない場合に生じる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'e91940b2-74e6-4931-9561-f9757cba154b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e91940b2-74e6-4931-9561-f9757cba154b'::uuid, $c$弁体と弁座の間への異物のかみ込み又は当たり面の損傷$c$, true, 1),
  ('e91940b2-74e6-4931-9561-f9757cba154b'::uuid, $c$ボイラー水の残留硬度がゼロになったこと$c$, false, 2),
  ('e91940b2-74e6-4931-9561-f9757cba154b'::uuid, $c$水面計の水側コックが全開になっていること$c$, false, 3),
  ('e91940b2-74e6-4931-9561-f9757cba154b'::uuid, $c$給水ポンプの吸込側にストレーナが設置されていること$c$, false, 4),
  ('e91940b2-74e6-4931-9561-f9757cba154b'::uuid, $c$煙道のダンパーを開いて通風を行ったこと$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b6bdc11b-bc7b-4643-9004-da7358c0b19e',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーを満水保存する場合の方法として、適切なものはどれか。$q$,
  $e$満水保存法では、適切に処理した水をボイラー内部に満たし、空気をできるだけ排除して密閉する。一般に比較的短期間の休止に用い、保存中は漏れや水質を定期的に確認する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'b6bdc11b-bc7b-4643-9004-da7358c0b19e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b6bdc11b-bc7b-4643-9004-da7358c0b19e'::uuid, $c$内部を処理水で満たし、できるだけ空気を排除した状態で密閉する。$c$, true, 1),
  ('b6bdc11b-bc7b-4643-9004-da7358c0b19e'::uuid, $c$内部の水を半分だけ残し、広い気相部を設けて密閉する。$c$, false, 2),
  ('b6bdc11b-bc7b-4643-9004-da7358c0b19e'::uuid, $c$ボイラー水を排出した後、内部を湿ったまま開放する。$c$, false, 3),
  ('b6bdc11b-bc7b-4643-9004-da7358c0b19e'::uuid, $c$未処理の原水を満たし、マンホールを開放したまま保存する。$c$, false, 4),
  ('b6bdc11b-bc7b-4643-9004-da7358c0b19e'::uuid, $c$燃料油を水側へ注入し、伝熱面を油膜で覆う。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '860a386b-d8bd-43e7-85af-0ffd03fcfdbc',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラー水中の不純物によって伝熱面にスケールが付着した場合に生じやすい現象として、適切なものはどれか。$q$,
  $e$スケールは熱を伝えにくいため、伝熱を妨げる。その結果、同じ蒸発量を得るための燃料消費が増え、伝熱面金属が過熱して膨出や破損を起こすおそれがある。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '860a386b-d8bd-43e7-85af-0ffd03fcfdbc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('860a386b-d8bd-43e7-85af-0ffd03fcfdbc'::uuid, $c$熱伝導が妨げられ、伝熱面金属の過熱や燃料消費量の増加を招く。$c$, true, 1),
  ('860a386b-d8bd-43e7-85af-0ffd03fcfdbc'::uuid, $c$熱伝導が良くなり、伝熱面金属の温度が必ず低下する。$c$, false, 2),
  ('860a386b-d8bd-43e7-85af-0ffd03fcfdbc'::uuid, $c$水中の溶存酸素が完全に除去され、腐食が起こらなくなる。$c$, false, 3),
  ('860a386b-d8bd-43e7-85af-0ffd03fcfdbc'::uuid, $c$ボイラー水の濃縮が自動的に解消され、吹出しが不要になる。$c$, false, 4),
  ('860a386b-d8bd-43e7-85af-0ffd03fcfdbc'::uuid, $c$燃焼ガス中の窒素酸化物だけが除去される。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd122cab3-0e8b-4a5d-92e7-4e307045ef07',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$単純軟化装置に充填されたイオン交換樹脂の有効交換容量が樹脂1 L当たり60 g（CaCO₃換算）で、樹脂量が20 Lである。原水硬度150 mg/Lを残留硬度30 mg/Lまで低下させる場合、再生までに処理できる水量として正しいものはどれか。ただし、交換容量はすべて有効に使用できるものとする。$q$,
  $e$除去する硬度は150－30＝120 mg/Lである。総有効交換容量は60×20＝1,200 g＝1,200,000 mgとなる。
処理水量＝1,200,000÷120＝10,000 L＝10 m³$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'd122cab3-0e8b-4a5d-92e7-4e307045ef07'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d122cab3-0e8b-4a5d-92e7-4e307045ef07'::uuid, $c$1 m³$c$, false, 1),
  ('d122cab3-0e8b-4a5d-92e7-4e307045ef07'::uuid, $c$8 m³$c$, false, 2),
  ('d122cab3-0e8b-4a5d-92e7-4e307045ef07'::uuid, $c$10 m³$c$, true, 3),
  ('d122cab3-0e8b-4a5d-92e7-4e307045ef07'::uuid, $c$12 m³$c$, false, 4),
  ('d122cab3-0e8b-4a5d-92e7-4e307045ef07'::uuid, $c$100 m³$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd615f9d0-c59d-471a-83f1-17d0b4cb05c8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$液体燃料の引火点と着火温度に関する説明として、適切なものはどれか。$q$,
  $e$引火点は、液体燃料から発生した蒸気が外部の火源によって一時的に燃える最低温度である。着火温度は、外部火源がなくても燃料が自ら燃焼を開始する最低温度である。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'd615f9d0-c59d-471a-83f1-17d0b4cb05c8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d615f9d0-c59d-471a-83f1-17d0b4cb05c8'::uuid, $c$引火点は外部の火源によって一時的に燃焼し得る蒸気を発生する最低温度で、着火温度は火源がなくても自ら燃焼を開始する最低温度である。$c$, true, 1),
  ('d615f9d0-c59d-471a-83f1-17d0b4cb05c8'::uuid, $c$引火点は、燃料が火源なしで自ら燃焼する最低温度である。$c$, false, 2),
  ('d615f9d0-c59d-471a-83f1-17d0b4cb05c8'::uuid, $c$着火温度は、燃料が凝固を始める最高温度である。$c$, false, 3),
  ('d615f9d0-c59d-471a-83f1-17d0b4cb05c8'::uuid, $c$引火点と着火温度は、すべての燃料で必ず同じ温度である。$c$, false, 4),
  ('d615f9d0-c59d-471a-83f1-17d0b4cb05c8'::uuid, $c$引火点は、灰が溶融する温度を表す。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3f3351bb-861a-4e8a-9d7c-7eff2704a071',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$重油中に混入した水分及びスラッジによって生じる障害として、適切なものはどれか。$q$,
  $e$重油中の水分は、着火不良、燃焼の脈動、不安定燃焼及び失火などの原因になる。スラッジは貯蔵槽や配管に沈積し、ストレーナ、ポンプ、バーナノズルなどを閉塞させる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '3f3351bb-861a-4e8a-9d7c-7eff2704a071'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3f3351bb-861a-4e8a-9d7c-7eff2704a071'::uuid, $c$水分は燃焼の不安定や失火を招き、スラッジはストレーナやバーナノズルの閉塞原因となる。$c$, true, 1),
  ('3f3351bb-861a-4e8a-9d7c-7eff2704a071'::uuid, $c$水分は重油の発熱量を増加させ、スラッジは霧化を促進する。$c$, false, 2),
  ('3f3351bb-861a-4e8a-9d7c-7eff2704a071'::uuid, $c$水分は必ず重油の粘度をゼロにし、スラッジは燃焼空気量を自動調整する。$c$, false, 3),
  ('3f3351bb-861a-4e8a-9d7c-7eff2704a071'::uuid, $c$水分とスラッジはいずれも燃焼には影響せず、煙突の腐食だけを防止する。$c$, false, 4),
  ('3f3351bb-861a-4e8a-9d7c-7eff2704a071'::uuid, $c$スラッジは安全弁の吹出し量を増加させるために添加される。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1be4bd7d-3c24-420e-bf15-d3501bc35951',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ある燃焼装置で、理論空気量が燃料1 kg当たり11 m³、実際空気量が燃料1 kg当たり14.3 m³であった。このときの空気比として正しいものはどれか。$q$,
  $e$空気比は、実際空気量を理論空気量で割って求める。
空気比＝14.3÷11＝1.30$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '1be4bd7d-3c24-420e-bf15-d3501bc35951'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1be4bd7d-3c24-420e-bf15-d3501bc35951'::uuid, $c$0.77$c$, false, 1),
  ('1be4bd7d-3c24-420e-bf15-d3501bc35951'::uuid, $c$1.10$c$, false, 2),
  ('1be4bd7d-3c24-420e-bf15-d3501bc35951'::uuid, $c$1.30$c$, true, 3),
  ('1be4bd7d-3c24-420e-bf15-d3501bc35951'::uuid, $c$3.30$c$, false, 4),
  ('1be4bd7d-3c24-420e-bf15-d3501bc35951'::uuid, $c$25.3$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '809b6717-c6ba-466b-bbc7-731d59cf26fc',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$重油の加熱及び燃焼装置に関する説明として、適切なものはどれか。$q$,
  $e$重油は温度が上がると粘度が低下するため、配管内の流動、ポンプによる輸送及びバーナでの霧化が容易になる。ただし、過度に加熱すると軽質分の気化、ベーパロック、油の劣化や炭化などを招くため、油種及び使用するバーナに応じた適正温度に管理する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '809b6717-c6ba-466b-bbc7-731d59cf26fc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('809b6717-c6ba-466b-bbc7-731d59cf26fc'::uuid, $c$重油を適切に加熱すると粘度が低下し、ポンプによる輸送やバーナでの霧化が容易になる。$c$, true, 1),
  ('809b6717-c6ba-466b-bbc7-731d59cf26fc'::uuid, $c$重油を加熱すると必ず粘度が増加し、ノズルから噴出しにくくなる。$c$, false, 2),
  ('809b6717-c6ba-466b-bbc7-731d59cf26fc'::uuid, $c$重油加熱器は、燃焼用空気の酸素濃度だけを高める装置である。$c$, false, 3),
  ('809b6717-c6ba-466b-bbc7-731d59cf26fc'::uuid, $c$重油の加熱温度は高いほどよく、燃料の気化や炭化を考慮する必要はない。$c$, false, 4),
  ('809b6717-c6ba-466b-bbc7-731d59cf26fc'::uuid, $c$重油は加熱せず、固体のまま火格子上で燃焼させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '24b5c0e7-2ad6-454a-a6b1-960f72d88dd4',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$液体燃料の供給装置におけるストレーナの役割として、適切なものはどれか。$q$,
  $e$ストレーナは、燃料油中のごみ、さび、スラッジなどを除去し、燃料ポンプやバーナノズルの閉塞・摩耗を防止する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'::uuid, $c$燃料中の異物を除去し、ポンプやバーナノズルの閉塞及び損傷を防ぐ。$c$, true, 1),
  ('24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'::uuid, $c$燃料中へ空気を送り込み、貯蔵槽内で燃焼させる。$c$, false, 2),
  ('24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'::uuid, $c$燃料の発熱量を化学的に増加させる。$c$, false, 3),
  ('24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'::uuid, $c$燃焼ガス中のすすを捕集して燃料タンクへ戻す。$c$, false, 4),
  ('24b5c0e7-2ad6-454a-a6b1-960f72d88dd4'::uuid, $c$ボイラー水の硬度成分をイオン交換によって除去する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '63254f66-3074-40e4-ba42-9d8564046db5',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$油バーナと霧化方法の組合せとして、適切なものはどれか。$q$,
  $e$蒸気噴霧式バーナは蒸気の運動エネルギーを利用して燃料油を霧化する。空気噴霧式は空気を、圧力噴霧式は加圧した燃料油自体の圧力を利用する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '63254f66-3074-40e4-ba42-9d8564046db5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('63254f66-3074-40e4-ba42-9d8564046db5'::uuid, $c$蒸気噴霧式バーナ――蒸気を霧化媒体として燃料油を微粒化する。$c$, true, 1),
  ('63254f66-3074-40e4-ba42-9d8564046db5'::uuid, $c$圧力噴霧式バーナ――水面計内の蒸気圧力で燃料油を微粒化する。$c$, false, 2),
  ('63254f66-3074-40e4-ba42-9d8564046db5'::uuid, $c$空気噴霧式バーナ――燃料油を火格子上で自然蒸発させる。$c$, false, 3),
  ('63254f66-3074-40e4-ba42-9d8564046db5'::uuid, $c$回転式バーナ――固定したノズル内のイオン交換樹脂で燃料油を微粒化する。$c$, false, 4),
  ('63254f66-3074-40e4-ba42-9d8564046db5'::uuid, $c$蒸気噴霧式バーナ――燃料油を加圧せず、重力だけで必ず完全燃焼させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '02edad9a-f1fd-4be1-b56a-23e45b9e3519',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$気体燃料の拡散燃焼方式と予混合燃焼方式に関する説明として、適切なものはどれか。$q$,
  $e$拡散燃焼では燃料ガスと空気が燃焼しながら混合する。予混合燃焼では、点火前に燃料ガスと空気の全部又は一部を混合してから燃焼させる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '02edad9a-f1fd-4be1-b56a-23e45b9e3519'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('02edad9a-f1fd-4be1-b56a-23e45b9e3519'::uuid, $c$拡散燃焼では燃料ガスと空気を燃焼域で混合し、予混合燃焼では点火前に両者の全部又は一部を混合する。$c$, true, 1),
  ('02edad9a-f1fd-4be1-b56a-23e45b9e3519'::uuid, $c$拡散燃焼では燃料ガスと空気を燃焼前に完全に混合しなければならない。$c$, false, 2),
  ('02edad9a-f1fd-4be1-b56a-23e45b9e3519'::uuid, $c$予混合燃焼では燃焼用空気を一切使用しない。$c$, false, 3),
  ('02edad9a-f1fd-4be1-b56a-23e45b9e3519'::uuid, $c$拡散燃焼は固体燃料にだけ用いられ、気体燃料には用いられない。$c$, false, 4),
  ('02edad9a-f1fd-4be1-b56a-23e45b9e3519'::uuid, $c$両方式の違いは燃料供給ポンプの回転方向だけである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7f105a18-b26c-4f38-bbeb-0e095f057fa5',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$燃焼によって発生する窒素酸化物（NOx）を抑制する方法として、適切なものはどれか。$q$,
  $e$NOxの抑制には、二段燃焼、低NOxバーナ、排ガス再循環などが用いられる。これらは火炎温度や高温域での酸素濃度を抑え、NOxの生成を減らす。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '7f105a18-b26c-4f38-bbeb-0e095f057fa5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7f105a18-b26c-4f38-bbeb-0e095f057fa5'::uuid, $c$二段燃焼や排ガス再循環などによって、火炎の局部的な高温化を抑える。$c$, true, 1),
  ('7f105a18-b26c-4f38-bbeb-0e095f057fa5'::uuid, $c$燃焼温度を可能な限り高くし、高温域での滞留時間を長くする。$c$, false, 2),
  ('7f105a18-b26c-4f38-bbeb-0e095f057fa5'::uuid, $c$燃焼用空気を大幅に過剰供給し、酸素濃度を常に最大にする。$c$, false, 3),
  ('7f105a18-b26c-4f38-bbeb-0e095f057fa5'::uuid, $c$重油中のスラッジ量を増加させ、ノズルを部分的に閉塞させる。$c$, false, 4),
  ('7f105a18-b26c-4f38-bbeb-0e095f057fa5'::uuid, $c$給水中の硬度成分を増加させ、火炎温度を調節する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '94c4e12d-bf71-4374-9a62-efdf5fe8b762',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$固体燃料の燃焼に用いる一次空気と二次空気に関する説明として、適切なものはどれか。$q$,
  $e$一次空気は主として火格子下から燃料層へ供給される。二次空気は火格子上方へ供給され、燃料層から発生した可燃性ガスと混合して完全燃焼を促す。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '94c4e12d-bf71-4374-9a62-efdf5fe8b762'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('94c4e12d-bf71-4374-9a62-efdf5fe8b762'::uuid, $c$一次空気は主として火格子下から供給され、二次空気は火格子上方から供給されて可燃性ガスの燃焼を助ける。$c$, true, 1),
  ('94c4e12d-bf71-4374-9a62-efdf5fe8b762'::uuid, $c$一次空気は煙突頂部からだけ供給され、二次空気は給水管内へ供給される。$c$, false, 2),
  ('94c4e12d-bf71-4374-9a62-efdf5fe8b762'::uuid, $c$一次空気は燃焼ガスを冷却する水であり、二次空気は燃料油である。$c$, false, 3),
  ('94c4e12d-bf71-4374-9a62-efdf5fe8b762'::uuid, $c$一次空気と二次空気は、いずれもボイラー水中へ吹き込まれる。$c$, false, 4),
  ('94c4e12d-bf71-4374-9a62-efdf5fe8b762'::uuid, $c$二次空気は灰を湿らせる目的だけで供給される。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3b632a28-a3ca-4328-973e-ce7108250f21',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの通風装置に使用されるファンに関する説明として、適切なものはどれか。$q$,
  $e$遠心式ファンでは、軸方向から吸い込まれた空気が羽根車の遠心作用により外周方向へ送り出される。軸流式では、空気はおおむね回転軸方向へ流れる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '3b632a28-a3ca-4328-973e-ce7108250f21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3b632a28-a3ca-4328-973e-ce7108250f21'::uuid, $c$遠心式ファンでは、羽根車に入った空気が遠心作用によって外周方向へ送り出される。$c$, true, 1),
  ('3b632a28-a3ca-4328-973e-ce7108250f21'::uuid, $c$軸流式ファンでは、空気が羽根車の回転軸に対して常に直角方向へ流れる。$c$, false, 2),
  ('3b632a28-a3ca-4328-973e-ce7108250f21'::uuid, $c$押込通風機は、煙道から燃焼ガスを吸い出す位置だけに設置される。$c$, false, 3),
  ('3b632a28-a3ca-4328-973e-ce7108250f21'::uuid, $c$誘引通風機は、燃焼用空気を炉内へ押し込む目的だけで使用される。$c$, false, 4),
  ('3b632a28-a3ca-4328-973e-ce7108250f21'::uuid, $c$通風機の役割は、ボイラー水の硬度を低下させることである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1d5ddf90-f613-4f6e-b43f-184cc56eb4d9',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$最大電力設備容量が180 kWの電気ボイラーについて、法令上の伝熱面積として正しいものはどれか。$q$,
  $e$電気ボイラーは、最大電力設備容量60 kWを伝熱面積1 m²とみなす。
伝熱面積＝180÷60＝3 m²$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'::uuid, $c$1 m²$c$, false, 1),
  ('1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'::uuid, $c$3 m²$c$, true, 2),
  ('1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'::uuid, $c$6 m²$c$, false, 3),
  ('1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'::uuid, $c$9 m²$c$, false, 4),
  ('1d5ddf90-f613-4f6e-b43f-184cc56eb4d9'::uuid, $c$180 m²$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e7548dd2-2d13-4200-aede-c857b85ce049',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの溶接検査、構造検査及び使用検査に関する説明として、適切なものはどれか。$q$,
  $e$溶接によるボイラーは、原則として溶接検査に合格した後に構造検査を受ける。使用検査は、輸入したボイラーや、構造検査後一定期間設置されなかったボイラーなどが対象となる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'e7548dd2-2d13-4200-aede-c857b85ce049'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e7548dd2-2d13-4200-aede-c857b85ce049'::uuid, $c$溶接によるボイラーは、原則として溶接検査に合格した後でなければ構造検査を受けることができない。$c$, true, 1),
  ('e7548dd2-2d13-4200-aede-c857b85ce049'::uuid, $c$構造検査は、ボイラーを10年以上使用した後に初めて行う検査である。$c$, false, 2),
  ('e7548dd2-2d13-4200-aede-c857b85ce049'::uuid, $c$使用検査は、国内で製造され、構造検査直後に通常どおり設置される全ボイラーに必ず重ねて行う。$c$, false, 3),
  ('e7548dd2-2d13-4200-aede-c857b85ce049'::uuid, $c$輸入したボイラーには、いかなる検査も必要ない。$c$, false, 4),
  ('e7548dd2-2d13-4200-aede-c857b85ce049'::uuid, $c$構造検査に合格していないボイラーでも、先に落成検査を受けることができる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの最上部から、その上方にある天井、配管その他の構造物までの法定距離として、原則正しいものはどれか。$q$,
  $e$原則として、ボイラーの最上部から上方の構造物まで1.2 m以上の距離を確保する。ただし、附属品の検査及び取扱いに支障がない場合には例外がある。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'::uuid, $c$0.15 m以上$c$, false, 1),
  ('2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'::uuid, $c$0.30 m以上$c$, false, 2),
  ('2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'::uuid, $c$0.45 m以上$c$, false, 3),
  ('2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'::uuid, $c$1.20 m以上$c$, true, 4),
  ('2fe3d36a-f1d3-4776-8ead-f8f3ccbdff70'::uuid, $c$2.00 m以上$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー取扱業務の就業制限に関する説明として、適切なものはどれか。$q$,
  $e$原則として、規制対象となる一般のボイラー取扱業務にはボイラー技士を就かせる必要がある。ただし、法令で定める一部のボイラーについては、ボイラー取扱技能講習修了者も取り扱うことができる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'::uuid, $c$法令上の例外に該当しない一般のボイラー取扱業務には、特級、一級又は二級ボイラー技士免許を受けた者を就かせなければならない。$c$, true, 1),
  ('e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'::uuid, $c$すべてのボイラーは、無資格者が単独で取り扱うことができる。$c$, false, 2),
  ('e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'::uuid, $c$二級ボイラー技士免許では、いかなるボイラー取扱業務にも就くことができない。$c$, false, 3),
  ('e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'::uuid, $c$ボイラー整備士免許があれば、ボイラー技士免許が必要な取扱業務へ無条件で就くことができる。$c$, false, 4),
  ('e5c6dc6f-2969-47ec-a22b-fb1c1a865c2d'::uuid, $c$ボイラー取扱作業主任者を選任すれば、実際の取扱者には一切の資格が不要になる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '73b06ef4-8721-4ee2-9972-f23fdc3f1f3c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの定期自主検査に関する説明として、適切なものはどれか。$q$,
  $e$定期自主検査は原則として1か月以内ごとに1回行い、その結果を3年間保存する。ボイラー本体、燃焼装置、自動制御装置、附属装置及び附属品などが検査対象となる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'::uuid, $c$使用開始後、原則として1か月以内ごとに1回実施し、その結果を3年間保存する。$c$, true, 1),
  ('73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'::uuid, $c$使用開始後、原則として6か月以内ごとに1回実施し、その結果を1年間保存する。$c$, false, 2),
  ('73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'::uuid, $c$使用開始後、原則として1年以内ごとに1回実施し、記録は保存しなくてよい。$c$, false, 3),
  ('73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'::uuid, $c$ボイラー本体だけを検査し、燃焼装置や自動制御装置は対象としない。$c$, false, 4),
  ('73b06ef4-8721-4ee2-9972-f23fdc3f1f3c'::uuid, $c$異常が認められても、次回の性能検査まで補修してはならない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '30b813be-d2a0-480d-92bc-963efb12b30d',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$設置済みボイラーの変更に関する説明として、適切なものはどれか。$q$,
  $e$胴、炉筒、火室、鏡板、管板、管寄せ、ステー、附属設備、燃焼装置、据付基礎など、法令で定める部分又は設備を変更した場合は、原則として変更検査が必要になる。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '30b813be-d2a0-480d-92bc-963efb12b30d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('30b813be-d2a0-480d-92bc-963efb12b30d'::uuid, $c$炉筒や燃焼装置など法令で定める部分・設備に変更を加えた場合は、原則として変更検査を受ける。$c$, true, 1),
  ('30b813be-d2a0-480d-92bc-963efb12b30d'::uuid, $c$ボイラー室の床を清掃しただけで、必ず変更検査を受ける。$c$, false, 2),
  ('30b813be-d2a0-480d-92bc-963efb12b30d'::uuid, $c$ボイラー本体の塗装色を変えただけで、必ず変更検査を受ける。$c$, false, 3),
  ('30b813be-d2a0-480d-92bc-963efb12b30d'::uuid, $c$水面計のガラスを同等品へ交換するたびに、必ず変更検査を受ける。$c$, false, 4),
  ('30b813be-d2a0-480d-92bc-963efb12b30d'::uuid, $c$変更検査はボイラーの使用を廃止した後にだけ行われる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0f0a50b9-c186-4e26-a1f8-9b00f7b1befa',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー検査証の有効期間及び事業者変更時の手続に関する説明として、適切なものはどれか。$q$,
  $e$ボイラー検査証の有効期間は原則1年である。設置されたボイラーについて事業者が変わった場合、変更後の事業者は変更後10日以内に書替えを申請する。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'::uuid, $c$有効期間は原則1年で、設置されたボイラーの事業者が変わった場合、変更後の事業者は10日以内に書替えを申請する。$c$, true, 1),
  ('0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'::uuid, $c$有効期間は原則6か月で、事業者変更時の書替え期限は30日以内である。$c$, false, 2),
  ('0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'::uuid, $c$有効期間は原則3年で、事業者が変わっても書替えは不要である。$c$, false, 3),
  ('0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'::uuid, $c$有効期間は無期限で、性能検査を受ける必要はない。$c$, false, 4),
  ('0f0a50b9-c186-4e26-a1f8-9b00f7b1befa'::uuid, $c$有効期間は原則10年で、書替えは登録性能検査機関だけに申請する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1fe68ffc-ef1a-4799-836f-fdad9f456d10',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$鋳鉄製温水ボイラーの附属品に関する説明として、適切なものはどれか。$q$,
  $e$鋳鉄製温水ボイラーには温水出口付近の温度を表示する温度計が必要である。また、水高計は圧力計で代替でき、暖房用温水ボイラーには原則として逃がし弁などが必要である。鋳鉄製温水ボイラーは温水温度120℃を超えて使用する構造にはできない。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '1fe68ffc-ef1a-4799-836f-fdad9f456d10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1fe68ffc-ef1a-4799-836f-fdad9f456d10'::uuid, $c$温水の出口付近の温度を表示する温度計を取り付ける。$c$, true, 1),
  ('1fe68ffc-ef1a-4799-836f-fdad9f456d10'::uuid, $c$温水ボイラーには圧力又は水頭を確認する計器を取り付けてはならない。$c$, false, 2),
  ('1fe68ffc-ef1a-4799-836f-fdad9f456d10'::uuid, $c$暖房用温水ボイラーでは、内部圧力の上昇を防ぐ装置は不要である。$c$, false, 3),
  ('1fe68ffc-ef1a-4799-836f-fdad9f456d10'::uuid, $c$水高計の代わりに圧力計を取り付けることは認められない。$c$, false, 4),
  ('1fe68ffc-ef1a-4799-836f-fdad9f456d10'::uuid, $c$温水の温度が120℃を超える鋳鉄製温水ボイラーを標準構造として製造できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c50d6f57-3b80-4402-ba57-d949664bb3ef',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$貫流ボイラーの附属品に関する説明として、適切なものはどれか。$q$,
  $e$貫流ボイラーには、水不足時に燃料供給を自動的に遮断する装置又は代替安全装置が必要である。ガラス水面計については、多管式を除く貫流ボイラーは一般の蒸気ボイラーに対する設置規定から除かれている。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  'c50d6f57-3b80-4402-ba57-d949664bb3ef'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c50d6f57-3b80-4402-ba57-d949664bb3ef'::uuid, $c$起動時又は運転時にボイラー水が不足した場合、燃料供給を自動的に遮断する装置又はこれに代わる安全装置を設ける。$c$, true, 1),
  ('c50d6f57-3b80-4402-ba57-d949664bb3ef'::uuid, $c$貫流ボイラーには、水不足を検出する安全装置を設けてはならない。$c$, false, 2),
  ('c50d6f57-3b80-4402-ba57-d949664bb3ef'::uuid, $c$すべての貫流ボイラーに、常に2個以上のガラス水面計を設ける。$c$, false, 3),
  ('c50d6f57-3b80-4402-ba57-d949664bb3ef'::uuid, $c$貫流ボイラーの給水管には、給水弁を取り付けてはならない。$c$, false, 4),
  ('c50d6f57-3b80-4402-ba57-d949664bb3ef'::uuid, $c$燃焼用空気が停止しても燃料供給を継続する装置を設ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '02225b59-ccf5-49e5-871d-b8b35f78b868',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー設置場所に燃料を貯蔵する場合の距離に関する説明として、原則正しいものはどれか。$q$,
  $e$原則として、燃料はボイラー外側から2 m以上、固体燃料は1.2 m以上離して貯蔵する。ただし、ボイラーとの間に適切な障壁を設けるなど、防火措置を講じた場合には例外がある。$e$,
  'original',
  '二級ボイラー技士 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id =
  '02225b59-ccf5-49e5-871d-b8b35f78b868'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('02225b59-ccf5-49e5-871d-b8b35f78b868'::uuid, $c$液体燃料はボイラー外側から2 m以上、固体燃料は1.2 m以上離す。$c$, true, 1),
  ('02225b59-ccf5-49e5-871d-b8b35f78b868'::uuid, $c$液体燃料は0.15 m以上、固体燃料は0.30 m以上離す。$c$, false, 2),
  ('02225b59-ccf5-49e5-871d-b8b35f78b868'::uuid, $c$液体燃料は0.45 m以上、固体燃料は2 m以上離す。$c$, false, 3),
  ('02225b59-ccf5-49e5-871d-b8b35f78b868'::uuid, $c$液体燃料と固体燃料はいずれも0.45 m以上離す。$c$, false, 4),
  ('02225b59-ccf5-49e5-871d-b8b35f78b868'::uuid, $c$液体燃料と固体燃料はいずれも10 m以上離す。$c$, false, 5)
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
  WHERE exam_id = 'boiler2'
    AND source_type = 'original'
    AND source_note LIKE '二級ボイラー技士 オリジナル問題%';

  IF original_count <> 40 THEN
    RAISE EXCEPTION 'boiler2 original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
SELECT
  'boiler2',
  exam_types.id,
  '二級ボイラー技士模擬試験A',
  180,
  40,
  '二級ボイラー技士 オリジナル問題'
FROM exam_types
WHERE exam_types.exam_id = 'boiler2'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM mock_exams
    WHERE exam_id = 'boiler2'
      AND source_filter = '二級ボイラー技士 オリジナル問題'
  );
