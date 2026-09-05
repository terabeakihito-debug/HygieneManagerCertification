-- mobile_crane オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1bb6a93e-6736-4048-8ab0-31958054d561',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの種類と型式に関する記述として、適切なものはどれか。$q$,
  $e$トラッククレーンには、専用の下部走行体にクレーン装置を搭載し、走行用とクレーン操作用の運転室を別に備える型式がある。クローラクレーンは履帯式であり、ラフテレーンクレーンは一般に一つの運転室で走行とクレーン操作を行う。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1bb6a93e-6736-4048-8ab0-31958054d561'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1bb6a93e-6736-4048-8ab0-31958054d561'::uuid, $c$クローラクレーンは、一般にタイヤ式の走行装置を備え、公道を高速で走行することを主目的としている。$c$, false, 1),
  ('1bb6a93e-6736-4048-8ab0-31958054d561'::uuid, $c$トラッククレーンは、クレーン装置を搭載する専用の下部走行体を備え、運転室が走行用とクレーン操作用に分かれているものがある。$c$, true, 2),
  ('1bb6a93e-6736-4048-8ab0-31958054d561'::uuid, $c$ラフテレーンクレーンは、すべての機種で走行用運転室とクレーン操作用運転室が別々に設けられている。$c$, false, 3),
  ('1bb6a93e-6736-4048-8ab0-31958054d561'::uuid, $c$オールテレーンクレーンは、クローラによって軟弱地を走行する移動式クレーンである。$c$, false, 4),
  ('1bb6a93e-6736-4048-8ab0-31958054d561'::uuid, $c$積載形トラッククレーンは、荷台を持たず、つり上げ作業だけを目的とする専用車両である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7500a9be-dfd0-4566-8b51-f79152099655',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンに関する用語の説明として、適切なものはどれか。$q$,
  $e$ジブの傾斜角は、ジブの中心線と水平面との角度である。作業半径は旋回中心からつり具中心までの水平距離、揚程はフックなどを上下させることのできる垂直方向の範囲をいう。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7500a9be-dfd0-4566-8b51-f79152099655'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7500a9be-dfd0-4566-8b51-f79152099655'::uuid, $c$作業半径とは、ジブの長さそのものをいう。$c$, false, 1),
  ('7500a9be-dfd0-4566-8b51-f79152099655'::uuid, $c$揚程とは、旋回中心からフック中心までの水平距離をいう。$c$, false, 2),
  ('7500a9be-dfd0-4566-8b51-f79152099655'::uuid, $c$ジブの傾斜角とは、ジブの中心線と水平面とのなす角をいう。$c$, true, 3),
  ('7500a9be-dfd0-4566-8b51-f79152099655'::uuid, $c$定格総荷重とは、クレーン本体の全質量をいう。$c$, false, 4),
  ('7500a9be-dfd0-4566-8b51-f79152099655'::uuid, $c$旋回半径とは、アウトリガーの左右方向の張出し幅をいう。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd0aa16d4-610d-4b16-88b0-4d596f549ec0',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$クローラクレーンの下部走行体に関する記述として、適切なものはどれか。$q$,
  $e$クローラ式は履帯によって広い接地面積を確保できるため、接地圧を小さくしやすく、不整地や比較的軟弱な地盤での走行に適する。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd0aa16d4-610d-4b16-88b0-4d596f549ec0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d0aa16d4-610d-4b16-88b0-4d596f549ec0'::uuid, $c$クローラベルトの張りが過大でも、走行抵抗や部品の摩耗には影響しない。$c$, false, 1),
  ('d0aa16d4-610d-4b16-88b0-4d596f549ec0'::uuid, $c$左右のクローラを同じ方向へ同じ速度で駆動すると、通常、その場旋回する。$c$, false, 2),
  ('d0aa16d4-610d-4b16-88b0-4d596f549ec0'::uuid, $c$クローラ式走行装置は、接地面積が比較的大きく、接地圧を小さくしやすい。$c$, true, 3),
  ('d0aa16d4-610d-4b16-88b0-4d596f549ec0'::uuid, $c$クローラ式走行装置は、タイヤ式走行装置より一般に公道での高速走行に適している。$c$, false, 4),
  ('d0aa16d4-610d-4b16-88b0-4d596f549ec0'::uuid, $c$走行減速機は、上部旋回体の旋回速度だけを調整する装置である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '71d9a8a5-023b-414e-910e-248b9acfe20e',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$上部旋回体及び旋回装置に関する記述として、適切なものはどれか。$q$,
  $e$旋回ベアリングは上部旋回体を回転可能に支持するとともに、上部旋回体からの荷重やモーメントを下部走行体へ伝える。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '71d9a8a5-023b-414e-910e-248b9acfe20e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('71d9a8a5-023b-414e-910e-248b9acfe20e'::uuid, $c$旋回ベアリングは、上部旋回体を下部走行体に対して回転可能に支持し、鉛直荷重や転倒モーメントなどを伝える。$c$, true, 1),
  ('71d9a8a5-023b-414e-910e-248b9acfe20e'::uuid, $c$旋回減速機は、エンジンの回転速度を増加させるだけで、旋回トルクには影響しない。$c$, false, 2),
  ('71d9a8a5-023b-414e-910e-248b9acfe20e'::uuid, $c$カウンタウエイトは、つり荷側の転倒モーメントを増加させる目的で設けられる。$c$, false, 3),
  ('71d9a8a5-023b-414e-910e-248b9acfe20e'::uuid, $c$旋回ブレーキは、巻上用ワイヤロープの繰出しだけを停止させる装置である。$c$, false, 4),
  ('71d9a8a5-023b-414e-910e-248b9acfe20e'::uuid, $c$旋回装置のピニオンと旋回輪の歯車には、給脂を行う必要がない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bd3639dd-dd63-4c26-b51e-25cdda4f960f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$巻上装置のクラッチ及びブレーキに関する記述として、適切なものはどれか。$q$,
  $e$巻上ブレーキの制動力が不足すると、ドラムを保持できず、つり荷が意図せず降下するおそれがある。クラッチは主に動力の伝達・遮断を行い、ブレーキは回転の停止や保持を行う。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bd3639dd-dd63-4c26-b51e-25cdda4f960f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bd3639dd-dd63-4c26-b51e-25cdda4f960f'::uuid, $c$クラッチは、巻上ドラムの回転を確実に停止状態に保持することだけを目的とする。$c$, false, 1),
  ('bd3639dd-dd63-4c26-b51e-25cdda4f960f'::uuid, $c$ブレーキは、動力の伝達と遮断を切り替えることだけを目的とする。$c$, false, 2),
  ('bd3639dd-dd63-4c26-b51e-25cdda4f960f'::uuid, $c$巻上ブレーキの制動力が不足すると、操作を中立に戻してもつり荷が降下するおそれがある。$c$, true, 3),
  ('bd3639dd-dd63-4c26-b51e-25cdda4f960f'::uuid, $c$摩擦式クラッチに油脂が付着すると、摩擦力が増加して動力伝達が確実になる。$c$, false, 4),
  ('bd3639dd-dd63-4c26-b51e-25cdda4f960f'::uuid, $c$ブレーキライニングが摩耗するほど、一般に制動性能は向上する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1e725c90-2462-438c-afa7-b540dcb9637a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$ジブの構造に関する記述として、適切なものはどれか。$q$,
  $e$箱形ジブは、鋼板などを溶接して閉断面にした構造で、油圧式の伸縮ジブに広く用いられる。ラチスジブは複数の鋼管や形鋼を格子状に組み合わせた構造である。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1e725c90-2462-438c-afa7-b540dcb9637a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1e725c90-2462-438c-afa7-b540dcb9637a'::uuid, $c$箱形ジブは、薄い鋼板などを閉断面に構成したもので、伸縮式ジブに用いられることが多い。$c$, true, 1),
  ('1e725c90-2462-438c-afa7-b540dcb9637a'::uuid, $c$ラチスジブは、一本の中実鋼棒だけで構成され、部材間に空間を持たない。$c$, false, 2),
  ('1e725c90-2462-438c-afa7-b540dcb9637a'::uuid, $c$伸縮式ジブでは、各段のジブが伸びても断面の重なり長さを確保する必要はない。$c$, false, 3),
  ('1e725c90-2462-438c-afa7-b540dcb9637a'::uuid, $c$ジブ先端のシーブは、旋回輪を駆動するために設けられる。$c$, false, 4),
  ('1e725c90-2462-438c-afa7-b540dcb9637a'::uuid, $c$ジブに局部的な曲がりが生じても、塗装に損傷がなければ強度への影響はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9b1b2a94-6a07-4d54-8cef-fba99f0e2945',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$ワイヤロープのより方及び点検に関する記述として、適切なものはどれか。$q$,
  $e$ワイヤロープは、素線切れだけでなく、直径の減少、摩耗、腐食、キンク、つぶれなどの形崩れ及び端末部の異常を点検する。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '9b1b2a94-6a07-4d54-8cef-fba99f0e2945'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9b1b2a94-6a07-4d54-8cef-fba99f0e2945'::uuid, $c$普通よりのワイヤロープは、ストランドのより方向とロープのより方向が同じである。$c$, false, 1),
  ('9b1b2a94-6a07-4d54-8cef-fba99f0e2945'::uuid, $c$ラングよりのワイヤロープは、一般に普通よりに比べてキンクや形崩れを生じにくい。$c$, false, 2),
  ('9b1b2a94-6a07-4d54-8cef-fba99f0e2945'::uuid, $c$交差よりとは、ロープの左右半分でより方向を逆にしたものをいう。$c$, false, 3),
  ('9b1b2a94-6a07-4d54-8cef-fba99f0e2945'::uuid, $c$ワイヤロープの点検では、素線切れ、摩耗、腐食、形崩れ、端末部の異常などを確認する。$c$, true, 4),
  ('9b1b2a94-6a07-4d54-8cef-fba99f0e2945'::uuid, $c$ワイヤロープ内部の腐食は外観に現れる場合がないため、点検の対象にする必要はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f5c03d95-5e27-45cd-be71-d81aa63555f5',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの安全装置に関する記述として、適切なものはどれか。$q$,
  $e$巻過防止装置は、フックブロックなどの巻上げ過ぎによるジブ先端部との衝突やワイヤロープの破断を防ぐ。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f5c03d95-5e27-45cd-be71-d81aa63555f5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f5c03d95-5e27-45cd-be71-d81aa63555f5'::uuid, $c$過負荷防止装置は、つり荷が地面に接触したことだけを検出する装置である。$c$, false, 1),
  ('f5c03d95-5e27-45cd-be71-d81aa63555f5'::uuid, $c$巻過防止装置は、フックブロックなどがジブ先端へ過度に接近することによる巻過ぎを防止する。$c$, true, 2),
  ('f5c03d95-5e27-45cd-be71-d81aa63555f5'::uuid, $c$過負荷防止装置が作動した場合は、安全側への操作を含むすべての動作が永久に不能となる。$c$, false, 3),
  ('f5c03d95-5e27-45cd-be71-d81aa63555f5'::uuid, $c$巻過防止装置が正常なら、運転者はフック位置を目視する必要がない。$c$, false, 4),
  ('f5c03d95-5e27-45cd-be71-d81aa63555f5'::uuid, $c$安全装置は、定格荷重を増加させる装置である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '594ace54-6bef-4033-a80d-5668b48bce32',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$ある移動式クレーンの定格総荷重表の一部が次のとおりである。ジブ長さ18m、作業半径10mで作業するとき、つり具の質量が0.35tである場合、つり上げられる荷の最大質量はどれか。
作業半径  ジブ長さ12m  ジブ長さ18m
6m    6.20t    4.80t  
8m    4.70t    3.65t  
10m   3.60t    2.85t  
12m   2.75t    2.20t  $q$,
  $e$定格総荷重にはつり具の質量が含まれるため、最大質量は、2.85－0.35＝2.50tである。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '594ace54-6bef-4033-a80d-5668b48bce32'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('594ace54-6bef-4033-a80d-5668b48bce32'::uuid, $c$2.20t$c$, false, 1),
  ('594ace54-6bef-4033-a80d-5668b48bce32'::uuid, $c$2.50t$c$, true, 2),
  ('594ace54-6bef-4033-a80d-5668b48bce32'::uuid, $c$2.85t$c$, false, 3),
  ('594ace54-6bef-4033-a80d-5668b48bce32'::uuid, $c$3.20t$c$, false, 4),
  ('594ace54-6bef-4033-a80d-5668b48bce32'::uuid, $c$3.60t$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1859fc5e-7260-4c06-ab98-a432c7b44a79',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの作業領域と安定性に関する記述として、適切なものはどれか。$q$,
  $e$作業方向やアウトリガーの張出し状態によって能力が異なる場合は、実際の状態に対応した定格総荷重表を使用する。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1859fc5e-7260-4c06-ab98-a432c7b44a79'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1859fc5e-7260-4c06-ab98-a432c7b44a79'::uuid, $c$同じ質量の荷をつる場合、作業半径が大きくなるほど転倒モーメントは小さくなる。$c$, false, 1),
  ('1859fc5e-7260-4c06-ab98-a432c7b44a79'::uuid, $c$アウトリガーを左右で異なる長さに張り出しても、全周にわたり最大張出し時と同じ定格総荷重を使用できる。$c$, false, 2),
  ('1859fc5e-7260-4c06-ab98-a432c7b44a79'::uuid, $c$地盤が沈下して機体が傾いても、荷が定格総荷重以下なら安定性は変化しない。$c$, false, 3),
  ('1859fc5e-7260-4c06-ab98-a432c7b44a79'::uuid, $c$作業方向によって能力が異なる機種では、その方向に対応する定格総荷重表を使用する。$c$, true, 4),
  ('1859fc5e-7260-4c06-ab98-a432c7b44a79'::uuid, $c$カウンタウエイトは、指定範囲を超えて取り付けるほど常に安全になる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ebe49b80-7f0e-43e9-a844-710ab80a4951',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$ディーゼルエンジンの特徴に関する記述として、適切なものはどれか。$q$,
  $e$ディーゼルエンジンは、吸入した空気を高圧縮して高温にし、そこへ燃料を噴射して自己着火させる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ebe49b80-7f0e-43e9-a844-710ab80a4951'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ebe49b80-7f0e-43e9-a844-710ab80a4951'::uuid, $c$混合気を点火プラグの火花で着火させる。$c$, false, 1),
  ('ebe49b80-7f0e-43e9-a844-710ab80a4951'::uuid, $c$圧縮され高温となった空気中へ燃料を噴射し、自己着火させる。$c$, true, 2),
  ('ebe49b80-7f0e-43e9-a844-710ab80a4951'::uuid, $c$ガソリンエンジンより一般に圧縮比が低い。$c$, false, 3),
  ('ebe49b80-7f0e-43e9-a844-710ab80a4951'::uuid, $c$燃料噴射ポンプは潤滑油をクランク軸へ供給する装置である。$c$, false, 4),
  ('ebe49b80-7f0e-43e9-a844-710ab80a4951'::uuid, $c$吸気行程では燃料だけを吸入する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '84f8e990-dc35-47b6-a569-86a93baa9336',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$エンジンの電装品に関する記述として、適切なものはどれか。$q$,
  $e$スタータモータはバッテリから電力を受け、始動に必要な回転をクランク軸に与える。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '84f8e990-dc35-47b6-a569-86a93baa9336'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('84f8e990-dc35-47b6-a569-86a93baa9336'::uuid, $c$スタータモータは、エンジン始動時にクランク軸を回転させる。$c$, true, 1),
  ('84f8e990-dc35-47b6-a569-86a93baa9336'::uuid, $c$オルタネータは燃料を噴射する装置である。$c$, false, 2),
  ('84f8e990-dc35-47b6-a569-86a93baa9336'::uuid, $c$バッテリは機械的動力を直接発生させる。$c$, false, 3),
  ('84f8e990-dc35-47b6-a569-86a93baa9336'::uuid, $c$レギュレータは冷却水の流量だけを調節する。$c$, false, 4),
  ('84f8e990-dc35-47b6-a569-86a93baa9336'::uuid, $c$グロープラグはクランク軸の回転速度を検出する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bc1f7763-e9f0-4cdd-ab8a-b7c781140021',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$小ピストンの断面積が20cm²、大ピストンの断面積が300cm²である。小ピストンに600Nを加えたとき、大ピストンに生じる理論上の力はどれか。$q$,
  $e$パスカルの原理により、F₂＝F₁×A₂/A₁＝600×300/20＝9,000Nとなる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bc1f7763-e9f0-4cdd-ab8a-b7c781140021'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bc1f7763-e9f0-4cdd-ab8a-b7c781140021'::uuid, $c$40N$c$, false, 1),
  ('bc1f7763-e9f0-4cdd-ab8a-b7c781140021'::uuid, $c$900N$c$, false, 2),
  ('bc1f7763-e9f0-4cdd-ab8a-b7c781140021'::uuid, $c$4,000N$c$, false, 3),
  ('bc1f7763-e9f0-4cdd-ab8a-b7c781140021'::uuid, $c$9,000N$c$, true, 4),
  ('bc1f7763-e9f0-4cdd-ab8a-b7c781140021'::uuid, $c$90,000N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a6bc1887-7456-40e3-8960-c59bf0a4ee77',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧の基礎に関する記述として、適切なものはどれか。$q$,
  $e$圧力はP＝F/Aで表される。シリンダの力はF＝PA、速度はv＝Q/Aである。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a6bc1887-7456-40e3-8960-c59bf0a4ee77'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a6bc1887-7456-40e3-8960-c59bf0a4ee77'::uuid, $c$圧力は単位面積当たりに作用する力として表される。$c$, true, 1),
  ('a6bc1887-7456-40e3-8960-c59bf0a4ee77'::uuid, $c$油圧ポンプは負荷に関係なく一定圧力を直接発生させ続ける。$c$, false, 2),
  ('a6bc1887-7456-40e3-8960-c59bf0a4ee77'::uuid, $c$同じ流量ならピストン面積が大きいほど速度は速い。$c$, false, 3),
  ('a6bc1887-7456-40e3-8960-c59bf0a4ee77'::uuid, $c$圧力を2倍にすると、同じ面積で得られる力は半分になる。$c$, false, 4),
  ('a6bc1887-7456-40e3-8960-c59bf0a4ee77'::uuid, $c$加えた圧力は一方向にだけ伝わる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '922fad30-0cf3-442f-b681-e45057aad8e4',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧シリンダ及び油圧モータに関する記述として、適切なものはどれか。$q$,
  $e$油圧シリンダは油圧エネルギーを直線運動へ、油圧モータは回転運動へ変換する。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '922fad30-0cf3-442f-b681-e45057aad8e4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('922fad30-0cf3-442f-b681-e45057aad8e4'::uuid, $c$油圧シリンダは油圧エネルギーを主に往復直線運動へ変換する。$c$, true, 1),
  ('922fad30-0cf3-442f-b681-e45057aad8e4'::uuid, $c$油圧モータは回転運動を作動油の流れへ変換することだけを目的とする。$c$, false, 2),
  ('922fad30-0cf3-442f-b681-e45057aad8e4'::uuid, $c$複動形シリンダはピストンの片側にだけ圧油を供給できる。$c$, false, 3),
  ('922fad30-0cf3-442f-b681-e45057aad8e4'::uuid, $c$油圧モータの回転方向は油の流れを変えても変化しない。$c$, false, 4),
  ('922fad30-0cf3-442f-b681-e45057aad8e4'::uuid, $c$シリンダの発生力は圧力や受圧面積に関係しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a5847860-0460-40e9-9f7d-2468859e32a7',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧制御弁に関する記述として、適切なものはどれか。$q$,
  $e$方向制御弁は流路を切り替える。シーケンス弁は、圧力が設定値に達すると次の回路へ油を送り、所定の順序で作動させる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a5847860-0460-40e9-9f7d-2468859e32a7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a5847860-0460-40e9-9f7d-2468859e32a7'::uuid, $c$方向制御弁は作動油の流れる方向を切り替える。$c$, true, 1),
  ('a5847860-0460-40e9-9f7d-2468859e32a7'::uuid, $c$流量制御弁は最高圧力だけを制限する。$c$, false, 2),
  ('a5847860-0460-40e9-9f7d-2468859e32a7'::uuid, $c$リリーフ弁は回転方向だけを切り替える。$c$, false, 3),
  ('a5847860-0460-40e9-9f7d-2468859e32a7'::uuid, $c$逆止め弁は常に両方向へ自由に流す。$c$, false, 4),
  ('a5847860-0460-40e9-9f7d-2468859e32a7'::uuid, $c$シーケンス弁は油温の順番で冷却器を作動させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧装置の付属機器に関する記述として、適切なものはどれか。$q$,
  $e$オイルフィルタはごみや摩耗粉などを除去する。アキュムレータは圧力エネルギーの蓄積や脈動の吸収などに用いられる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'::uuid, $c$オイルフィルタは作動油中の異物を除去する。$c$, true, 1),
  ('74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'::uuid, $c$オイルクーラは作動油に水分を加える。$c$, false, 2),
  ('74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'::uuid, $c$アキュムレータは異物だけを沈殿させる。$c$, false, 3),
  ('74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'::uuid, $c$作動油タンクは作動油を燃焼させる。$c$, false, 4),
  ('74ae6195-4ed8-4ffc-8ce0-8e5a07df1bca'::uuid, $c$圧力計は汚染度だけを測定する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5c59a298-9fb2-4caa-809d-ad9b9c1a0d23',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧装置の保守及び作動油に関する記述として、適切なものはどれか。$q$,
  $e$作動油の過度な温度上昇は粘度や潤滑性の低下、シール類の劣化などにつながる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'::uuid, $c$異なる作動油は性状を確認せず混合してよい。$c$, false, 1),
  ('5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'::uuid, $c$作動油の過度な温度上昇は、粘度低下や油の劣化を招くことがある。$c$, true, 2),
  ('5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'::uuid, $c$気泡が混入すると作動は常に滑らかになる。$c$, false, 3),
  ('5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'::uuid, $c$フィルタの目詰まりは圧力損失の原因にならない。$c$, false, 4),
  ('5c59a298-9fb2-4caa-809d-ad9b9c1a0d23'::uuid, $c$高圧油の漏れは手で直接探してよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '85e97184-b35c-42c6-a724-30f15ceb3091',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気の基礎に関する記述として、適切なものはどれか。$q$,
  $e$変圧器は電磁誘導を利用して交流電圧を昇圧又は降圧する。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '85e97184-b35c-42c6-a724-30f15ceb3091'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('85e97184-b35c-42c6-a724-30f15ceb3091'::uuid, $c$直流は電流の向きが周期的に反転する。$c$, false, 1),
  ('85e97184-b35c-42c6-a724-30f15ceb3091'::uuid, $c$交流は常に一定の大きさと向きで流れる。$c$, false, 2),
  ('85e97184-b35c-42c6-a724-30f15ceb3091'::uuid, $c$変圧器は一般に電磁誘導を利用して交流電圧を変える。$c$, true, 3),
  ('85e97184-b35c-42c6-a724-30f15ceb3091'::uuid, $c$送電電圧を低くするほど、同じ電力で電流と損失を小さくできる。$c$, false, 4),
  ('85e97184-b35c-42c6-a724-30f15ceb3091'::uuid, $c$三相交流は位相がすべて同じ三つの交流である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '63553cb0-c316-4883-96d6-09f31cac0d5f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電の防止に関する記述として、適切なものはどれか。$q$,
  $e$感電防止には、漏電遮断器、適切な接地、絶縁の維持、ぬれた状態での操作回避などが重要である。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '63553cb0-c316-4883-96d6-09f31cac0d5f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('63553cb0-c316-4883-96d6-09f31cac0d5f'::uuid, $c$絶縁が損傷していても乾燥した場所なら使用できる。$c$, false, 1),
  ('63553cb0-c316-4883-96d6-09f31cac0d5f'::uuid, $c$ぬれた手では人体抵抗が増加して感電しにくくなる。$c$, false, 2),
  ('63553cb0-c316-4883-96d6-09f31cac0d5f'::uuid, $c$漏電遮断器は漏電を検出して回路を遮断し、感電防止に役立つ。$c$, true, 3),
  ('63553cb0-c316-4883-96d6-09f31cac0d5f'::uuid, $c$金属製外箱を接地すると危険が増加する。$c$, false, 4),
  ('63553cb0-c316-4883-96d6-09f31cac0d5f'::uuid, $c$感電者は電源を切らず素手で引き離す。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '128457f2-eb57-4765-8725-8d70732f6cf3',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重3tの移動式クレーンについて、検査証の有効期間満了後も使用する場合の手続として適切なものはどれか。$q$,
  $e$検査証の有効期間を更新するには性能検査を受ける。根拠はクレーン等安全規則第81条・第84条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '128457f2-eb57-4765-8725-8d70732f6cf3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('128457f2-eb57-4765-8725-8d70732f6cf3'::uuid, $c$作業開始前点検だけで使用できる。$c$, false, 1),
  ('128457f2-eb57-4765-8725-8d70732f6cf3'::uuid, $c$有効期間満了前に性能検査を受け、検査証の有効期間の更新を受ける。$c$, true, 2),
  ('128457f2-eb57-4765-8725-8d70732f6cf3'::uuid, $c$月例自主検査を行えば更新不要である。$c$, false, 3),
  ('128457f2-eb57-4765-8725-8d70732f6cf3'::uuid, $c$警察署へ使用継続届を提出する。$c$, false, 4),
  ('128457f2-eb57-4765-8725-8d70732f6cf3'::uuid, $c$自動車検査証が有効なら性能検査は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '19dd7d7d-f631-4cef-b0b5-0229301a1ed8',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーン検査証に関する記述として、適切なものはどれか。$q$,
  $e$有効期間は原則2年で、作業時には検査証を移動式クレーンに備え付ける。根拠はクレーン等安全規則第60条・第63条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '19dd7d7d-f631-4cef-b0b5-0229301a1ed8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('19dd7d7d-f631-4cef-b0b5-0229301a1ed8'::uuid, $c$有効期間は原則6か月である。$c$, false, 1),
  ('19dd7d7d-f631-4cef-b0b5-0229301a1ed8'::uuid, $c$有効期間は原則1年である。$c$, false, 2),
  ('19dd7d7d-f631-4cef-b0b5-0229301a1ed8'::uuid, $c$有効期間は原則2年であり、作業時には当該移動式クレーンに備え付ける。$c$, true, 3),
  ('19dd7d7d-f631-4cef-b0b5-0229301a1ed8'::uuid, $c$有効期間は原則3年で、本社に保管すればよい。$c$, false, 4),
  ('19dd7d7d-f631-4cef-b0b5-0229301a1ed8'::uuid, $c$有効期間はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '45f7977f-2c97-4b07-bea5-ebd3b89f6c2a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$運転及び玉掛け資格に関する記述として、適切なものはどれか。$q$,
  $e$運転は5t以上が免許、1t以上5t未満が技能講習、1t未満が特別教育。玉掛けはつり上げ荷重1t以上で技能講習等が必要。根拠は労働安全衛生法第61条、同法施行令第20条、クレーン等安全規則第68条・第221条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'::uuid, $c$つり上げ荷重4tは特別教育だけで運転できる。$c$, false, 1),
  ('45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'::uuid, $c$つり上げ荷重8tは小型移動式クレーン運転技能講習だけで運転できる。$c$, false, 2),
  ('45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'::uuid, $c$つり上げ荷重0.8tでも必ず運転士免許が必要である。$c$, false, 3),
  ('45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'::uuid, $c$揚貨装置で玉掛けを行う場合は資格不要である。$c$, false, 4),
  ('45f7977f-2c97-4b07-bea5-ebd3b89f6c2a'::uuid, $c$つり上げ荷重6tの運転には運転士免許が必要で、1t以上のクレーン等での玉掛けには原則として玉掛け技能講習修了などが必要である。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a43b87fa-2df7-4cd9-b937-a7d53002aa50',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの使用制限に関する記述として、適切なものはどれか。$q$,
  $e$原則として定格荷重を超える荷重をかけて使用してはならない。根拠はクレーン等安全規則第64条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a43b87fa-2df7-4cd9-b937-a7d53002aa50'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a43b87fa-2df7-4cd9-b937-a7d53002aa50'::uuid, $c$安全装置が作動しなければ定格荷重を10％超えてよい。$c$, false, 1),
  ('a43b87fa-2df7-4cd9-b937-a7d53002aa50'::uuid, $c$強いロープを使えば定格荷重を超えてよい。$c$, false, 2),
  ('a43b87fa-2df7-4cd9-b937-a7d53002aa50'::uuid, $c$熟練者が低速操作するなら超えてよい。$c$, false, 3),
  ('a43b87fa-2df7-4cd9-b937-a7d53002aa50'::uuid, $c$原則として定格荷重を超える荷重をかけて使用してはならない。$c$, true, 4),
  ('a43b87fa-2df7-4cd9-b937-a7d53002aa50'::uuid, $c$アウトリガー最大張出しなら荷重表を超えてよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$巻過防止装置を、つり具上面とジブ先端のシーブ等との間隔で調整する場合の最小間隔として適切な組合せはどれか。$q$,
  $e$通常は0.25m以上、直働式は0.05m以上。根拠はクレーン等安全規則第65条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'::uuid, $c$通常0.05m、直働式0.01m$c$, false, 1),
  ('3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'::uuid, $c$通常0.10m、直働式0.03m$c$, false, 2),
  ('3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'::uuid, $c$通常0.20m、直働式0.10m$c$, false, 3),
  ('3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'::uuid, $c$通常0.25m、直働式0.05m$c$, true, 4),
  ('3d0bf3f2-ee7a-4b73-87c4-ab37ac198a36'::uuid, $c$通常0.50m、直働式0.25m$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b007ad90-4273-43c4-8eb7-e35f8f4bf0a0',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$公称径20mmの玉掛用ワイヤロープが摩耗して18.4mmになった。法令上適切な取扱いはどれか。$q$,
  $e$(20－18.4)÷20×100＝8％。公称径の7％を超えて減少したものは使用禁止。根拠はクレーン等安全規則第215条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'::uuid, $c$減少率4％なので使用できる。$c$, false, 1),
  ('b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'::uuid, $c$減少率7％なので低荷重に限り使える。$c$, false, 2),
  ('b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'::uuid, $c$減少率8％で、公称径の7％を超えて減少しているため使用禁止である。$c$, true, 3),
  ('b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'::uuid, $c$減少率16％で、20％以下なので使える。$c$, false, 4),
  ('b007ad90-4273-43c4-8eb7-e35f8f4bf0a0'::uuid, $c$素線切れがなければ使用できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '89314365-d4d8-4e6a-98b2-141ea00ab831',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの定期自主検査に関する記述として、適切なものはどれか。$q$,
  $e$根拠はクレーン等安全規則第76条・第77条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '89314365-d4d8-4e6a-98b2-141ea00ab831'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('89314365-d4d8-4e6a-98b2-141ea00ab831'::uuid, $c$5年以内ごとに1回でよい。$c$, false, 1),
  ('89314365-d4d8-4e6a-98b2-141ea00ab831'::uuid, $c$年次は1年以内ごとに1回、月例は1月以内ごとに1回行う。$c$, true, 2),
  ('89314365-d4d8-4e6a-98b2-141ea00ab831'::uuid, $c$年次検査を行えば以後の月例検査は不要である。$c$, false, 3),
  ('89314365-d4d8-4e6a-98b2-141ea00ab831'::uuid, $c$1月を超えて使用しない期間にも必ず毎月検査する。$c$, false, 4),
  ('89314365-d4d8-4e6a-98b2-141ea00ab831'::uuid, $c$検査証のない機械だけが対象である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '139c2bbd-4a3c-4476-bff8-29232bbaf667',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$作業開始前の点検事項として法令上定められているものはどれか。$q$,
  $e$根拠はクレーン等安全規則第78条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '139c2bbd-4a3c-4476-bff8-29232bbaf667'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('139c2bbd-4a3c-4476-bff8-29232bbaf667'::uuid, $c$エンジンオイルの化学成分と燃料の発火点$c$, false, 1),
  ('139c2bbd-4a3c-4476-bff8-29232bbaf667'::uuid, $c$タイヤの製造年月と塗装の厚さ$c$, false, 2),
  ('139c2bbd-4a3c-4476-bff8-29232bbaf667'::uuid, $c$巻過防止装置、過負荷警報装置その他の警報装置、ブレーキ、クラッチ及びコントローラーの機能$c$, true, 3),
  ('139c2bbd-4a3c-4476-bff8-29232bbaf667'::uuid, $c$全ワイヤロープの実荷重による破断試験$c$, false, 4),
  ('139c2bbd-4a3c-4476-bff8-29232bbaf667'::uuid, $c$運転者の視力と聴力の毎日測定$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8c30839d-184c-4584-b995-531758cf1844',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$免許を必要とする運転業務に従事するときの免許証の取扱いとして適切なものはどれか。$q$,
  $e$根拠は労働安全衛生法第61条第3項。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8c30839d-184c-4584-b995-531758cf1844'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8c30839d-184c-4584-b995-531758cf1844'::uuid, $c$自宅に保管すればよい。$c$, false, 1),
  ('8c30839d-184c-4584-b995-531758cf1844'::uuid, $c$写しを掲示すれば原本は不要である。$c$, false, 2),
  ('8c30839d-184c-4584-b995-531758cf1844'::uuid, $c$事業者が金庫に保管する。$c$, false, 3),
  ('8c30839d-184c-4584-b995-531758cf1844'::uuid, $c$当該業務に従事するときは免許証を携帯する。$c$, true, 4),
  ('8c30839d-184c-4584-b995-531758cf1844'::uuid, $c$一度提示すれば以後は携帯不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd728116d-0d95-4b02-af34-8ff66e724d8d',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり荷がある状態での運転位置からの離脱について、適切なものはどれか。$q$,
  $e$根拠はクレーン等安全規則第73条。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd728116d-0d95-4b02-af34-8ff66e724d8d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d728116d-0d95-4b02-af34-8ff66e724d8d'::uuid, $c$定格荷重の半分以下なら離れてよい。$c$, false, 1),
  ('d728116d-0d95-4b02-af34-8ff66e724d8d'::uuid, $c$地上10cm以内なら離れてよい。$c$, false, 2),
  ('d728116d-0d95-4b02-af34-8ff66e724d8d'::uuid, $c$ブレーキをかければ離れてよい。$c$, false, 3),
  ('d728116d-0d95-4b02-af34-8ff66e724d8d'::uuid, $c$合図者が監視すれば離れてよい。$c$, false, 4),
  ('d728116d-0d95-4b02-af34-8ff66e724d8d'::uuid, $c$運転者は荷をつったまま運転位置を離れてはならない。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '541470b8-8551-4636-b97a-c16822ede324',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$500Nの力が水平面に対して60°上向きに作用する。水平分力と鉛直分力の組合せはどれか。cos60°＝0.50、sin60°＝0.866とする。$q$,
  $e$水平分力＝500×0.50＝250N、鉛直分力＝500×0.866＝433N。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '541470b8-8551-4636-b97a-c16822ede324'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('541470b8-8551-4636-b97a-c16822ede324'::uuid, $c$250N、433N$c$, true, 1),
  ('541470b8-8551-4636-b97a-c16822ede324'::uuid, $c$433N、250N$c$, false, 2),
  ('541470b8-8551-4636-b97a-c16822ede324'::uuid, $c$500N、250N$c$, false, 3),
  ('541470b8-8551-4636-b97a-c16822ede324'::uuid, $c$250N、500N$c$, false, 4),
  ('541470b8-8551-4636-b97a-c16822ede324'::uuid, $c$433N、500N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2416d4e1-4980-48ea-9d3c-cbcbe7039fd0',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$支点から水平方向に2.4m離れた位置に鉛直下向きの1.5kNが作用する。モーメントはどれか。$q$,
  $e$M＝1.5×2.4＝3.6kN・m。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'::uuid, $c$0.625kN・m$c$, false, 1),
  ('2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'::uuid, $c$1.6kN・m$c$, false, 2),
  ('2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'::uuid, $c$2.4kN・m$c$, false, 3),
  ('2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'::uuid, $c$3.6kN・m$c$, true, 4),
  ('2416d4e1-4980-48ea-9d3c-cbcbe7039fd0'::uuid, $c$36kN・m$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b1d117b5-b718-4b03-aa4e-7d7f118589d4',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$質量240kgの荷を天びん棒の支点から左1.2mにつるした。右0.8mでつり合わせる荷の質量はどれか。$q$,
  $e$240×1.2＝m×0.8より、m＝360kg。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b1d117b5-b718-4b03-aa4e-7d7f118589d4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b1d117b5-b718-4b03-aa4e-7d7f118589d4'::uuid, $c$120kg$c$, false, 1),
  ('b1d117b5-b718-4b03-aa4e-7d7f118589d4'::uuid, $c$160kg$c$, false, 2),
  ('b1d117b5-b718-4b03-aa4e-7d7f118589d4'::uuid, $c$240kg$c$, false, 3),
  ('b1d117b5-b718-4b03-aa4e-7d7f118589d4'::uuid, $c$360kg$c$, true, 4),
  ('b1d117b5-b718-4b03-aa4e-7d7f118589d4'::uuid, $c$480kg$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '046c1831-bf8d-4a75-8745-f6bd86a51947',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$密度7.8t/m³、体積0.025m³の鋼材の質量はどれか。$q$,
  $e$7.8×0.025＝0.195t＝195kg。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '046c1831-bf8d-4a75-8745-f6bd86a51947'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('046c1831-bf8d-4a75-8745-f6bd86a51947'::uuid, $c$19.5kg$c$, false, 1),
  ('046c1831-bf8d-4a75-8745-f6bd86a51947'::uuid, $c$31.2kg$c$, false, 2),
  ('046c1831-bf8d-4a75-8745-f6bd86a51947'::uuid, $c$78kg$c$, false, 3),
  ('046c1831-bf8d-4a75-8745-f6bd86a51947'::uuid, $c$195kg$c$, true, 4),
  ('046c1831-bf8d-4a75-8745-f6bd86a51947'::uuid, $c$312kg$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'fbac6fc2-f372-45c0-9430-7c553d2fabac',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$水平面上の物体を徐々に傾けたときの重心と安定に関する記述として、適切なものはどれか。$q$,
  $e$重力の作用線が支持面の端を越えると、重力によるモーメントが転倒方向に働く。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'fbac6fc2-f372-45c0-9430-7c553d2fabac'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('fbac6fc2-f372-45c0-9430-7c553d2fabac'::uuid, $c$重心からの鉛直線が支持面内なら必ず転倒する。$c$, false, 1),
  ('fbac6fc2-f372-45c0-9430-7c553d2fabac'::uuid, $c$重心からの鉛直線が支持面の端を越えると転倒しやすくなる。$c$, true, 2),
  ('fbac6fc2-f372-45c0-9430-7c553d2fabac'::uuid, $c$重心が高いほど安定性は高い。$c$, false, 3),
  ('fbac6fc2-f372-45c0-9430-7c553d2fabac'::uuid, $c$支持面が狭いほど安定性は高い。$c$, false, 4),
  ('fbac6fc2-f372-45c0-9430-7c553d2fabac'::uuid, $c$傾けても重力の作用線と支持面の位置関係は変わらない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd52071de-c73f-4c57-a6a5-8ac62dd9e78a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体の速度が4秒間に1.2m/sから3.6m/sまで一定の割合で増加した。加速度はどれか。$q$,
  $e$a＝(3.6－1.2)÷4＝0.6m/s²。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd52071de-c73f-4c57-a6a5-8ac62dd9e78a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d52071de-c73f-4c57-a6a5-8ac62dd9e78a'::uuid, $c$0.3m/s²$c$, false, 1),
  ('d52071de-c73f-4c57-a6a5-8ac62dd9e78a'::uuid, $c$0.6m/s²$c$, true, 2),
  ('d52071de-c73f-4c57-a6a5-8ac62dd9e78a'::uuid, $c$1.2m/s²$c$, false, 3),
  ('d52071de-c73f-4c57-a6a5-8ac62dd9e78a'::uuid, $c$2.4m/s²$c$, false, 4),
  ('d52071de-c73f-4c57-a6a5-8ac62dd9e78a'::uuid, $c$4.8m/s²$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9c7f68eb-ddd6-4cb5-bc80-0f998e758af2',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体が床を垂直に12kNで押し、静止摩擦係数が0.25である。最大静止摩擦力はどれか。$q$,
  $e$F＝μN＝0.25×12＝3.0kN。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'::uuid, $c$0.48kN$c$, false, 1),
  ('9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'::uuid, $c$3.0kN$c$, true, 2),
  ('9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'::uuid, $c$4.8kN$c$, false, 3),
  ('9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'::uuid, $c$12kN$c$, false, 4),
  ('9c7f68eb-ddd6-4cb5-bc80-0f998e758af2'::uuid, $c$48kN$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ddbf0cfc-ceed-4ecc-99cf-0efc48cad313',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$移動式クレーンに作用する荷重に関する記述として、適切なものはどれか。$q$,
  $e$急な巻上げ、停止、旋回では慣性力による動的荷重が生じる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'::uuid, $c$静荷重は急激な制動による慣性力を含む。$c$, false, 1),
  ('ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'::uuid, $c$動荷重は巻上げ開始時や急停止時などの慣性力の影響を受ける。$c$, true, 2),
  ('ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'::uuid, $c$風荷重は常に鉛直下向きだけに作用する。$c$, false, 3),
  ('ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'::uuid, $c$遠心力は旋回中心へ向かう。$c$, false, 4),
  ('ddbf0cfc-ceed-4ecc-99cf-0efc48cad313'::uuid, $c$衝撃荷重は荷を静止保持しているときだけ生じる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$質量2,000kgの荷を左右対称の2本のロープでつる。ロープ間角度60°のとき、1本の張力に最も近いものはどれか。重力加速度9.8m/s²とする。$q$,
  $e$W＝2,000×9.8＝19.6kN。各ロープは鉛直から30°なので、2Tcos30°＝19.6より、T＝19.6÷(2×0.866)≒11.3kN。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'::uuid, $c$5.66kN$c$, false, 1),
  ('bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'::uuid, $c$9.80kN$c$, false, 2),
  ('bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'::uuid, $c$11.3kN$c$, true, 3),
  ('bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'::uuid, $c$17.0kN$c$, false, 4),
  ('bf1bd7e3-82a4-4d72-bbbe-8d9215e552b3'::uuid, $c$19.6kN$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5e57b6ad-8711-4672-a364-80573c3ef59f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$動滑車を支えるロープ部分が4本ある理想的な滑車装置で、12kNの荷をつり上げるためのロープ引張力はどれか。$q$,
  $e$T＝12÷4＝3kN。実際は摩擦があるため、必要な引張力はこれより大きくなる。$e$,
  'original',
  '移動式クレーン運転士 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5e57b6ad-8711-4672-a364-80573c3ef59f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5e57b6ad-8711-4672-a364-80573c3ef59f'::uuid, $c$2kN$c$, false, 1),
  ('5e57b6ad-8711-4672-a364-80573c3ef59f'::uuid, $c$3kN$c$, true, 2),
  ('5e57b6ad-8711-4672-a364-80573c3ef59f'::uuid, $c$4kN$c$, false, 3),
  ('5e57b6ad-8711-4672-a364-80573c3ef59f'::uuid, $c$6kN$c$, false, 4),
  ('5e57b6ad-8711-4672-a364-80573c3ef59f'::uuid, $c$12kN$c$, false, 5)
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
  WHERE exam_id = 'mobile_crane'
    AND source_type = 'original'
    AND source_note LIKE '移動式クレーン運転士 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'mobile_crane original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'mobile_crane', exam_types.id,
  '移動式クレーン運転士模擬試験A', 150, 40,
  '移動式クレーン運転士 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'mobile_crane'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'mobile_crane'
      AND name = '移動式クレーン運転士模擬試験A'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'mobile_crane', exam_types.id,
  '移動式クレーン運転士模擬試験A【力学免除】', 120, 30,
  '移動式クレーン運転士 オリジナル問題',
  ARRAY['移動式クレーンに関する知識', '原動機及び電気に関する知識', '関係法令']
FROM exam_types
WHERE exam_types.exam_id = 'mobile_crane'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'mobile_crane'
      AND name = '移動式クレーン運転士模擬試験A【力学免除】'
  );
