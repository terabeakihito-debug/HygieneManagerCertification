-- crane_all オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd3aa4c2a-268b-4bd3-8431-f325eed59b6b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$天井クレーンの構造と運動に関する記述として、正しいものはどれか。$q$,
  $e$クラブトロリ式天井クレーンでは、巻上げ装置などを備えたクラブがクレーンガーダ上を横行する。クレーン全体の移動が走行、つり具の上下運動が巻上げ・巻下げである。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd3aa4c2a-268b-4bd3-8431-f325eed59b6b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d3aa4c2a-268b-4bd3-8431-f325eed59b6b'::uuid, $c$クレーンガーダは、建物の床面に固定され、運転中は移動しない。$c$, false, 1),
  ('d3aa4c2a-268b-4bd3-8431-f325eed59b6b'::uuid, $c$クラブトロリ式天井クレーンでは、クラブがクレーンガーダ上を横行する。$c$, true, 2),
  ('d3aa4c2a-268b-4bd3-8431-f325eed59b6b'::uuid, $c$クレーンの走行とは、つり具を鉛直方向に移動させる運動をいう。$c$, false, 3),
  ('d3aa4c2a-268b-4bd3-8431-f325eed59b6b'::uuid, $c$クレーンの横行とは、クレーン全体が走行レールに沿って移動する運動をいう。$c$, false, 4),
  ('d3aa4c2a-268b-4bd3-8431-f325eed59b6b'::uuid, $c$巻上げ装置は、クレーンガーダを建物の走行レールに沿って移動させる装置である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd4649c43-ebfa-452f-8917-d8ff5f8f1d98',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ガイデリックの構造に関する記述として、正しいものはどれか。$q$,
  $e$ガイデリックは、直立したマストの上部を複数のガイロープで支持し、マスト下部付近に取り付けたブームを旋回・起伏させるデリックである。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd4649c43-ebfa-452f-8917-d8ff5f8f1d98'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d4649c43-ebfa-452f-8917-d8ff5f8f1d98'::uuid, $c$マスト上部を複数のガイロープで支持し、マスト下部付近を中心としてブームを旋回させる。$c$, true, 1),
  ('d4649c43-ebfa-452f-8917-d8ff5f8f1d98'::uuid, $c$マストを建物の壁面だけで支持し、ガイロープを使用しない。$c$, false, 2),
  ('d4649c43-ebfa-452f-8917-d8ff5f8f1d98'::uuid, $c$水平な橋形ガーダ上をトロリが横行する構造である。$c$, false, 3),
  ('d4649c43-ebfa-452f-8917-d8ff5f8f1d98'::uuid, $c$ブームを用いず、マスト自体の伸縮だけで荷を移動させる。$c$, false, 4),
  ('d4649c43-ebfa-452f-8917-d8ff5f8f1d98'::uuid, $c$マストとブームを一体化し、走行台車上でのみ使用する構造である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2004c658-4a0c-44a1-a29a-7b0d60ea1c6e',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ワイヤロープの構造と性質に関する記述として、正しいものはどれか。$q$,
  $e$心綱はロープ中心部でストランドを支え、ロープの形状保持や柔軟性の確保などに役立つ。ラングよりは素線とストランドのより方向が同じで、交差よりは反対である。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'::uuid, $c$同じロープ径であれば、素線数が多いロープほど一般に曲げにくくなる。$c$, false, 1),
  ('2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'::uuid, $c$ストランドは、複数のワイヤロープを束ねたものである。$c$, false, 2),
  ('2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'::uuid, $c$心綱は、ストランドを支えるとともに、ロープの形状保持などに役立つ。$c$, true, 3),
  ('2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'::uuid, $c$ラングよりは、素線とストランドのより方向が互いに反対である。$c$, false, 4),
  ('2004c658-4a0c-44a1-a29a-7b0d60ea1c6e'::uuid, $c$交差よりのワイヤロープは、ラングよりに比べて必ず摩耗寿命が長い。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '47799376-567a-4f0a-b2de-35ff0ca6d7df',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ワイヤロープの日常点検で、局部的な押しつぶれとストランドの乱れが発見された場合の対応として、最も適切なものはどれか。$q$,
  $e$押しつぶれやストランドの乱れは、内部損傷や強度低下を伴う可能性がある。外観だけで使用可能と判断せず、使用を止めて詳細に点検し、必要に応じて交換する。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '47799376-567a-4f0a-b2de-35ff0ca6d7df'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('47799376-567a-4f0a-b2de-35ff0ca6d7df'::uuid, $c$外側の素線が切れていなければ、そのまま使用する。$c$, false, 1),
  ('47799376-567a-4f0a-b2de-35ff0ca6d7df'::uuid, $c$ハンマーでたたいて円形に戻してから使用する。$c$, false, 2),
  ('47799376-567a-4f0a-b2de-35ff0ca6d7df'::uuid, $c$潤滑油を多量に塗れば強度が回復するため、使用を継続する。$c$, false, 3),
  ('47799376-567a-4f0a-b2de-35ff0ca6d7df'::uuid, $c$荷重を軽くすれば問題がないため、定格荷重の半分まで使用する。$c$, false, 4),
  ('47799376-567a-4f0a-b2de-35ff0ca6d7df'::uuid, $c$使用を止め、変形の程度や内部損傷を点検し、必要に応じて交換する。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c5641f84-4df4-435d-b744-60638a1f2dfc',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$フックおよびつり具の取扱いに関する記述として、正しいものはどれか。$q$,
  $e$フックには、荷重が湾曲部の中央に正しく作用するようにつり具を掛ける。先端荷重や横荷重はフックに不適切な応力を生じさせる。外れ止め装置は荷重を支える部品ではない。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c5641f84-4df4-435d-b744-60638a1f2dfc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c5641f84-4df4-435d-b744-60638a1f2dfc'::uuid, $c$フックには、先端部に荷重が集中するようにつり具を掛ける。$c$, false, 1),
  ('c5641f84-4df4-435d-b744-60638a1f2dfc'::uuid, $c$外れ止め装置が閉じていれば、フック先端に荷重を掛けてもよい。$c$, false, 2),
  ('c5641f84-4df4-435d-b744-60638a1f2dfc'::uuid, $c$フックにねじれが生じても、加熱して現場で修正すれば再使用できる。$c$, false, 3),
  ('c5641f84-4df4-435d-b744-60638a1f2dfc'::uuid, $c$フックには、荷重がフックの湾曲部中央に作用するようにつり具を掛ける。$c$, true, 4),
  ('c5641f84-4df4-435d-b744-60638a1f2dfc'::uuid, $c$シャックルのピンは、手で回る程度に緩めた状態で使用する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6d361954-3edf-4d22-96d0-6aa5e8342ce0',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$電動式巻上げ装置に用いられるブレーキに関する記述として、正しいものはどれか。$q$,
  $e$巻上げ装置では、ばね力によってブレーキを作動させ、通電時の電磁力などで解除する方式が一般的である。この方式では、停電時にもブレーキが作動して荷の落下を防止する。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6d361954-3edf-4d22-96d0-6aa5e8342ce0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6d361954-3edf-4d22-96d0-6aa5e8342ce0'::uuid, $c$停電時には自動的にブレーキを開放し、荷を速やかに地上へ下ろす構造が一般的である。$c$, false, 1),
  ('6d361954-3edf-4d22-96d0-6aa5e8342ce0'::uuid, $c$ばねで制動し、電磁力などによって制動を解除する構造が一般的である。$c$, true, 2),
  ('6d361954-3edf-4d22-96d0-6aa5e8342ce0'::uuid, $c$ブレーキは荷の停止だけに使用され、停止後の荷の保持には関係しない。$c$, false, 3),
  ('6d361954-3edf-4d22-96d0-6aa5e8342ce0'::uuid, $c$ブレーキライニングに油が付着すると、摩擦係数が増して制動力が強くなる。$c$, false, 4),
  ('6d361954-3edf-4d22-96d0-6aa5e8342ce0'::uuid, $c$ブレーキの制動力は、つり荷の質量にかかわらず運転者が毎回手動で発生させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '83a41d6f-23d9-4a63-aff9-1691ff5b8f0b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの給油・給脂および日常点検に関する記述として、適切なものはどれか。$q$,
  $e$油漏れを放置すると、潤滑不足による発熱、摩耗、焼付きなどにつながる。漏れ箇所と油量を確認し、補給だけでなく漏れの原因に対する処置を行う。異種油の安易な混合や過剰給脂も適切ではない。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'::uuid, $c$減速機の潤滑油は、種類が異なっても粘度が近ければ自由に混合してよい。$c$, false, 1),
  ('83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'::uuid, $c$軸受への給脂量は、多いほど発熱を防止できる。$c$, false, 2),
  ('83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'::uuid, $c$給油口の周囲に付着した砂や粉じんは、そのまま油と一緒に内部へ押し込む。$c$, false, 3),
  ('83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'::uuid, $c$油漏れを発見した場合は、漏れ箇所と油量を確認し、必要な処置を行う。$c$, true, 4),
  ('83a41d6f-23d9-4a63-aff9-1691ff5b8f0b'::uuid, $c$ワイヤロープの潤滑状態は内部摩耗に影響しないため、点検する必要はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b1313913-33a7-45c7-8bc5-56083af00141',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$移動式クレーンの転倒防止に関する記述として、正しいものはどれか。$q$,
  $e$急旋回では、荷の振れや慣性力によって転倒方向のモーメントが増加することがある。転倒防止には、作業半径、地盤支持力、機体の水平、アウトリガーの張出し状態などを適切に管理する必要がある。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b1313913-33a7-45c7-8bc5-56083af00141'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b1313913-33a7-45c7-8bc5-56083af00141'::uuid, $c$同じ質量の荷であれば、作業半径を大きくするほど転倒モーメントは小さくなる。$c$, false, 1),
  ('b1313913-33a7-45c7-8bc5-56083af00141'::uuid, $c$アウトリガーは、地盤の状態に関係なく最大限に張り出せば安全である。$c$, false, 2),
  ('b1313913-33a7-45c7-8bc5-56083af00141'::uuid, $c$荷をつったまま急旋回すると、動的な影響によって安定性が低下することがある。$c$, true, 3),
  ('b1313913-33a7-45c7-8bc5-56083af00141'::uuid, $c$地盤が軟弱でも、車体が水平であれば敷板などは必要ない。$c$, false, 4),
  ('b1313913-33a7-45c7-8bc5-56083af00141'::uuid, $c$ブームを長くすれば、つり上げ能力は常に増加する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3e236fff-f299-4cab-867a-08658606ca89',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの走行・旋回・起伏装置に関する記述として、正しいものはどれか。$q$,
  $e$起伏装置はブームやジブの角度を変え、作業半径を変化させる装置である。走行車輪のフランジは脱輪防止や案内に関係し、速度調整を主目的とするものではない。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3e236fff-f299-4cab-867a-08658606ca89'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3e236fff-f299-4cab-867a-08658606ca89'::uuid, $c$走行車輪のフランジは、主としてクレーンの走行速度を調整する。$c$, false, 1),
  ('3e236fff-f299-4cab-867a-08658606ca89'::uuid, $c$旋回装置は、つり具を鉛直方向に移動させる。$c$, false, 2),
  ('3e236fff-f299-4cab-867a-08658606ca89'::uuid, $c$起伏装置は、ブームの角度を変化させて作業半径を変える。$c$, true, 3),
  ('3e236fff-f299-4cab-867a-08658606ca89'::uuid, $c$横行装置は、ジブクレーンのブームを上下させる。$c$, false, 4),
  ('3e236fff-f299-4cab-867a-08658606ca89'::uuid, $c$走行用レールの継目に段差があっても、低速なら点検や補修は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '559a6eb3-6541-41a6-bdeb-b8860b15beee',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーン運転中に、巻上げ用電動機から異常音が発生し、同時に焦げたような臭いを感じた場合の対応として、最も適切なものはどれか。$q$,
  $e$異常音や焦げた臭いは、軸受の損傷、ブレーキの引きずり、巻線の過熱などの兆候である可能性がある。周囲とつり荷の安全を確保して運転を停止し、電源を遮断して点検を受ける。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '559a6eb3-6541-41a6-bdeb-b8860b15beee'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('559a6eb3-6541-41a6-bdeb-b8860b15beee'::uuid, $c$定格荷重以内であれば、その日の作業終了まで運転を継続する。$c$, false, 1),
  ('559a6eb3-6541-41a6-bdeb-b8860b15beee'::uuid, $c$異常音を打ち消すため、電動機の回転速度を上げる。$c$, false, 2),
  ('559a6eb3-6541-41a6-bdeb-b8860b15beee'::uuid, $c$荷をつった状態のまま運転場所を離れ、修理担当者を呼びに行く。$c$, false, 3),
  ('559a6eb3-6541-41a6-bdeb-b8860b15beee'::uuid, $c$安全を確保して運転を停止し、電源を遮断した上で点検を依頼する。$c$, true, 4),
  ('559a6eb3-6541-41a6-bdeb-b8860b15beee'::uuid, $c$電動機に水をかけて冷却し、臭いが消えたら運転を再開する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3b374e0b-e662-4879-b59e-3f033cffe9f9',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーン等安全規則の適用に関する記述として、正しいものはどれか。$q$,
  $e$つり上げ荷重が0.5t未満のクレーン、移動式クレーンおよびデリックは、クレーン等安全規則の適用対象から除外される。根拠はクレーン等安全規則第2条第1号（適用の除外）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3b374e0b-e662-4879-b59e-3f033cffe9f9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3b374e0b-e662-4879-b59e-3f033cffe9f9'::uuid, $c$つり上げ荷重が0.1t未満のクレーンに限り、同規則が適用されない。$c$, false, 1),
  ('3b374e0b-e662-4879-b59e-3f033cffe9f9'::uuid, $c$つり上げ荷重が0.25t未満のクレーンには、同規則が適用されない。$c$, false, 2),
  ('3b374e0b-e662-4879-b59e-3f033cffe9f9'::uuid, $c$つり上げ荷重が0.5t未満のクレーン、移動式クレーンおよびデリックには、同規則が適用されない。$c$, true, 3),
  ('3b374e0b-e662-4879-b59e-3f033cffe9f9'::uuid, $c$つり上げ荷重が1t未満のクレーンには、同規則が適用されない。$c$, false, 4),
  ('3b374e0b-e662-4879-b59e-3f033cffe9f9'::uuid, $c$つり上げ荷重が3t未満のクレーンには、同規則が適用されない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8815bb58-ed0f-4406-98e2-bd266b5748ab',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$事業者が、つり上げ荷重8tの天井クレーンを新たに設置しようとする場合の手続として、正しいものはどれか。$q$,
  $e$つり上げ荷重3t以上のクレーンを設置するときは、原則として設置工事開始日の30日前までにクレーン設置届を所轄労働基準監督署長へ提出する。根拠は労働安全衛生法第88条第1項およびクレーン等安全規則第5条（設置届）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8815bb58-ed0f-4406-98e2-bd266b5748ab'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8815bb58-ed0f-4406-98e2-bd266b5748ab'::uuid, $c$設置後30日以内に、都道府県知事へ設置報告書を提出する。$c$, false, 1),
  ('8815bb58-ed0f-4406-98e2-bd266b5748ab'::uuid, $c$設置工事開始日の14日前までに、労働基準監督署長へ性能検査申請書を提出する。$c$, false, 2),
  ('8815bb58-ed0f-4406-98e2-bd266b5748ab'::uuid, $c$設置工事開始日の30日前までに、所轄労働基準監督署長へクレーン設置届を提出する。$c$, true, 3),
  ('8815bb58-ed0f-4406-98e2-bd266b5748ab'::uuid, $c$設置工事開始日の60日前までに、厚生労働大臣へクレーン検査証を提出する。$c$, false, 4),
  ('8815bb58-ed0f-4406-98e2-bd266b5748ab'::uuid, $c$設置前の届出は不要であり、作業開始前点検の記録だけを保存する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd47807b3-9616-4f5e-a135-47b1e7b347ad',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$スタッカー式クレーンを除くクレーンの設置手続に関する記述として、正しいものはどれか。$q$,
  $e$スタッカー式クレーンを除き、つり上げ荷重0.5t以上3t未満のクレーンを設置するときは、あらかじめクレーン設置報告書を所轄労働基準監督署長へ提出する。根拠はクレーン等安全規則第11条（設置報告書）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd47807b3-9616-4f5e-a135-47b1e7b347ad'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d47807b3-9616-4f5e-a135-47b1e7b347ad'::uuid, $c$つり上げ荷重0.4tのクレーンを設置するときは、クレーン設置報告書を提出しなければならない。$c$, false, 1),
  ('d47807b3-9616-4f5e-a135-47b1e7b347ad'::uuid, $c$つり上げ荷重0.8tのクレーンを設置するときは、あらかじめクレーン設置報告書を所轄労働基準監督署長へ提出する。$c$, true, 2),
  ('d47807b3-9616-4f5e-a135-47b1e7b347ad'::uuid, $c$つり上げ荷重2tのクレーンには、つり上げ荷重3t以上のクレーンと同じクレーン設置届が必ず必要である。$c$, false, 3),
  ('d47807b3-9616-4f5e-a135-47b1e7b347ad'::uuid, $c$つり上げ荷重2.5tのクレーンは、設置に関する報告の対象にならない。$c$, false, 4),
  ('d47807b3-9616-4f5e-a135-47b1e7b347ad'::uuid, $c$つり上げ荷重0.5t以上3t未満のクレーンの設置報告書は、都道府県知事へ提出する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '08429959-8245-4b3a-afb5-edf950f330b0',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$転倒するおそれのない天井クレーンの落成検査に関する記述として、正しいものはどれか。$q$,
  $e$落成検査では原則として荷重試験と安定度試験を行うが、天井クレーンや橋形クレーンなど、転倒するおそれのないクレーンでは荷重試験に限られる。根拠はクレーン等安全規則第6条第2項（落成検査）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '08429959-8245-4b3a-afb5-edf950f330b0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('08429959-8245-4b3a-afb5-edf950f330b0'::uuid, $c$荷重試験と安定度試験の両方を必ず行う。$c$, false, 1),
  ('08429959-8245-4b3a-afb5-edf950f330b0'::uuid, $c$安定度試験だけを行い、荷重試験は行わない。$c$, false, 2),
  ('08429959-8245-4b3a-afb5-edf950f330b0'::uuid, $c$荷重試験に限られ、安定度試験は行われない。$c$, true, 3),
  ('08429959-8245-4b3a-afb5-edf950f330b0'::uuid, $c$外観検査だけを行い、荷重を掛ける試験は行わない。$c$, false, 4),
  ('08429959-8245-4b3a-afb5-edf950f330b0'::uuid, $c$定格荷重の50％の荷を静止させる試験だけを行う。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '70c95e75-c853-4c86-9df7-6be4bcdfd7be',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの性能検査に関する記述として、正しいものはどれか。$q$,
  $e$性能検査では、クレーン各部分の構造および機能を点検するほか、荷重試験を行う。合格したクレーンについては検査証の有効期間が更新される。根拠はクレーン等安全規則第40条（性能検査）および第43条（検査証の有効期間の更新）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '70c95e75-c853-4c86-9df7-6be4bcdfd7be'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('70c95e75-c853-4c86-9df7-6be4bcdfd7be'::uuid, $c$性能検査では、クレーン各部分の構造および機能の点検に加えて荷重試験を行う。$c$, true, 1),
  ('70c95e75-c853-4c86-9df7-6be4bcdfd7be'::uuid, $c$性能検査では、書類の確認だけを行い、実機の点検は行わない。$c$, false, 2),
  ('70c95e75-c853-4c86-9df7-6be4bcdfd7be'::uuid, $c$性能検査では、必ず定格荷重の2倍の荷による安定度試験を行う。$c$, false, 3),
  ('70c95e75-c853-4c86-9df7-6be4bcdfd7be'::uuid, $c$性能検査は、クレーン運転士本人が実施して検査証へ記入する。$c$, false, 4),
  ('70c95e75-c853-4c86-9df7-6be4bcdfd7be'::uuid, $c$性能検査に合格しても、クレーン検査証の有効期間は更新されない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '27e7e583-ba55-4ef7-9504-c2a528cde356',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーン検査証に関する記述として、正しいものはどれか。$q$,
  $e$クレーン検査証の有効期間は原則2年である。ただし、落成検査の結果によって2年未満とされることがある。また、クレーンを用いる作業場所には検査証を備え付けなければならない。根拠はクレーン等安全規則第10条（検査証の有効期間）および第16条（検査証の備付け）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '27e7e583-ba55-4ef7-9504-c2a528cde356'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('27e7e583-ba55-4ef7-9504-c2a528cde356'::uuid, $c$落成検査に合格したクレーンの検査証の有効期間は、原則として6か月である。$c$, false, 1),
  ('27e7e583-ba55-4ef7-9504-c2a528cde356'::uuid, $c$落成検査に合格したクレーンの検査証の有効期間は、原則として1年である。$c$, false, 2),
  ('27e7e583-ba55-4ef7-9504-c2a528cde356'::uuid, $c$落成検査に合格したクレーンの検査証の有効期間は、原則として2年である。$c$, true, 3),
  ('27e7e583-ba55-4ef7-9504-c2a528cde356'::uuid, $c$クレーン検査証は、本社に保管すれば作業場所に備え付ける必要はない。$c$, false, 4),
  ('27e7e583-ba55-4ef7-9504-c2a528cde356'::uuid, $c$クレーン検査証を損傷しても、口頭で届け出ればそのまま使用できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '014ffd9f-fb00-408a-a9db-df3dac32ef84',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの運転資格に関する記述として、正しいものはどれか。$q$,
  $e$つり上げ荷重5t未満のクレーンおよびつり上げ荷重5t以上の跨線テルハの運転業務には、特別教育が必要である。一般のつり上げ荷重5t以上のクレーンは免許が基本であり、床上操作式クレーンについては技能講習修了者を就かせることができる。根拠はクレーン等安全規則第21条（特別の教育）および第22条（就業制限）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '014ffd9f-fb00-408a-a9db-df3dac32ef84'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('014ffd9f-fb00-408a-a9db-df3dac32ef84'::uuid, $c$つり上げ荷重5t以上のすべてのクレーンは、特別教育だけで運転できる。$c$, false, 1),
  ('014ffd9f-fb00-408a-a9db-df3dac32ef84'::uuid, $c$つり上げ荷重5t未満のクレーンの運転には、必ずクレーン・デリック運転士免許が必要である。$c$, false, 2),
  ('014ffd9f-fb00-408a-a9db-df3dac32ef84'::uuid, $c$つり上げ荷重5t以上の跨線テルハは、特別教育を受けた者が運転業務に就くことができる。$c$, true, 3),
  ('014ffd9f-fb00-408a-a9db-df3dac32ef84'::uuid, $c$床上操作式クレーン運転技能講習を修了すれば、あらゆる方式のつり上げ荷重5t以上のクレーンを運転できる。$c$, false, 4),
  ('014ffd9f-fb00-408a-a9db-df3dac32ef84'::uuid, $c$玉掛け技能講習を修了すれば、つり上げ荷重5t以上のクレーンを運転できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '038921ae-12ff-4a86-a82b-42dcec2c5718',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの定期自主検査に関する記述として、正しいものはどれか。$q$,
  $e$クレーンについては、1年以内ごとに1回および1か月以内ごとに1回、それぞれ所定の自主検査を行う。自主検査等の記録は原則として3年間保存する。根拠はクレーン等安全規則第34条、第35条および第38条。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '038921ae-12ff-4a86-a82b-42dcec2c5718'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('038921ae-12ff-4a86-a82b-42dcec2c5718'::uuid, $c$年次の定期自主検査は、3年以内ごとに1回行えばよい。$c$, false, 1),
  ('038921ae-12ff-4a86-a82b-42dcec2c5718'::uuid, $c$月次の定期自主検査は、3か月以内ごとに1回行えばよい。$c$, false, 2),
  ('038921ae-12ff-4a86-a82b-42dcec2c5718'::uuid, $c$年次の定期自主検査は1年以内ごとに1回、月次の定期自主検査は1か月以内ごとに1回行う。$c$, true, 3),
  ('038921ae-12ff-4a86-a82b-42dcec2c5718'::uuid, $c$定期自主検査の結果は、異常があった場合に限り1年間保存する。$c$, false, 4),
  ('038921ae-12ff-4a86-a82b-42dcec2c5718'::uuid, $c$1か月を超えて使用しなかったクレーンは、使用再開時の月次相当の自主検査が不要になる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ffb56083-7d1c-43c0-99d3-92ce158b4a40',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重1.5tのクレーンで玉掛け作業を行う者の資格として、法令上適切なものはどれか。$q$,
  $e$つり上げ荷重1t以上のクレーン、移動式クレーンまたはデリックの玉掛け業務には、原則として玉掛け技能講習修了者など、法令で定められた資格者を就かせる必要がある。1t未満の場合は玉掛け業務の特別教育の対象となる。根拠は労働安全衛生法施行令第20条第16号ならびにクレーン等安全規則第221条および第222条。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ffb56083-7d1c-43c0-99d3-92ce158b4a40'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ffb56083-7d1c-43c0-99d3-92ce158b4a40'::uuid, $c$クレーン運転業務の特別教育だけを修了した者$c$, false, 1),
  ('ffb56083-7d1c-43c0-99d3-92ce158b4a40'::uuid, $c$玉掛け業務の特別教育だけを修了した者$c$, false, 2),
  ('ffb56083-7d1c-43c0-99d3-92ce158b4a40'::uuid, $c$玉掛け技能講習を修了した者$c$, true, 3),
  ('ffb56083-7d1c-43c0-99d3-92ce158b4a40'::uuid, $c$フォークリフト運転技能講習だけを修了した者$c$, false, 4),
  ('ffb56083-7d1c-43c0-99d3-92ce158b4a40'::uuid, $c$安全衛生推進者として選任された者$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b87ea6bd-32a4-4af0-be26-17bb34d1b0a0',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの使用禁止または報告義務に関する記述として、正しいものはどれか。$q$,
  $e$検査証の有効期間を超えてクレーンを休止しようとする場合、原則として有効期間中に所轄労働基準監督署長へ報告する。なお、キンクや著しい腐食などがある玉掛け用ワイヤロープは使用禁止であり、クレーンを廃止した場合は検査証を遅滞なく返還する。根拠はクレーン等安全規則第48条（休止の報告）、第52条（検査証の返還）および第215条（不適格なワイヤロープの使用禁止）。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'::uuid, $c$クレーン検査証の有効期間を超えて使用を休止する予定でも、報告は不要である。$c$, false, 1),
  ('b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'::uuid, $c$クレーン検査証の有効期間を超えて使用を休止しようとするときは、その有効期間中に所轄労働基準監督署長へ報告する。$c$, true, 2),
  ('b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'::uuid, $c$キンクした玉掛け用ワイヤロープは、定格荷重の半分以下なら使用できる。$c$, false, 3),
  ('b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'::uuid, $c$著しい腐食のある玉掛け用ワイヤロープは、潤滑油を塗布すれば使用できる。$c$, false, 4),
  ('b87ea6bd-32a4-4af0-be26-17bb34d1b0a0'::uuid, $c$使用を廃止したクレーンの検査証は、事業者が永久に保管する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$周波数50Hzの交流について、0.20秒間に繰り返される周期の回数として、正しいものはどれか。$q$,
  $e$周波数は1秒間の周期数を表す。したがって、周期数は 50Hz×0.20s=10回 となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'::uuid, $c$2回$c$, false, 1),
  ('cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'::uuid, $c$5回$c$, false, 2),
  ('cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'::uuid, $c$10回$c$, true, 3),
  ('cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'::uuid, $c$20回$c$, false, 4),
  ('cc22f3a3-51cc-4ed1-a71c-c20f9d22d25f'::uuid, $c$250回$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'dc8000cf-bd90-4b13-a14a-0262af38c64c',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$正弦波交流の実効値が200Vであるとき、その最大値として最も近いものはどれか。$q$,
  $e$正弦波交流では、最大値は実効値の√2倍である。したがって、200×√2≒200×1.414=282.8V より、約283Vとなる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'dc8000cf-bd90-4b13-a14a-0262af38c64c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('dc8000cf-bd90-4b13-a14a-0262af38c64c'::uuid, $c$100V$c$, false, 1),
  ('dc8000cf-bd90-4b13-a14a-0262af38c64c'::uuid, $c$141V$c$, false, 2),
  ('dc8000cf-bd90-4b13-a14a-0262af38c64c'::uuid, $c$200V$c$, false, 3),
  ('dc8000cf-bd90-4b13-a14a-0262af38c64c'::uuid, $c$283V$c$, true, 4),
  ('dc8000cf-bd90-4b13-a14a-0262af38c64c'::uuid, $c$400V$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9e6d940c-d7ae-47b2-8131-c050f8fcc796',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンに使用される電動機の種類と特性に関する記述として、正しいものはどれか。$q$,
  $e$三相誘導電動機では、三相交流によって固定子に回転磁界が生じ、その磁界によって回転子に誘導電流とトルクが発生する。通常、回転子の速度は回転磁界の同期速度よりわずかに低い。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '9e6d940c-d7ae-47b2-8131-c050f8fcc796'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9e6d940c-d7ae-47b2-8131-c050f8fcc796'::uuid, $c$三相誘導電動機は、固定子がつくる回転磁界によって回転子にトルクを発生させる。$c$, true, 1),
  ('9e6d940c-d7ae-47b2-8131-c050f8fcc796'::uuid, $c$三相誘導電動機の回転子は、常に回転磁界より速く回転する。$c$, false, 2),
  ('9e6d940c-d7ae-47b2-8131-c050f8fcc796'::uuid, $c$直流直巻電動機は始動トルクが小さく、巻上げ装置には全く適さない。$c$, false, 3),
  ('9e6d940c-d7ae-47b2-8131-c050f8fcc796'::uuid, $c$かご形三相誘導電動機には、回転子へ電流を供給するための整流子が必ず必要である。$c$, false, 4),
  ('9e6d940c-d7ae-47b2-8131-c050f8fcc796'::uuid, $c$電動機の定格出力は、電源から取り入れる入力電力と常に等しい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの制御器およびスイッチに関する記述として、正しいものはどれか。$q$,
  $e$電磁接触器は、電磁石の働きによって接点を開閉し、電動機などの主回路を制御する。リミットスイッチは、機械が所定の位置に達したことを検出して回路を切り替える装置である。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'::uuid, $c$リミットスイッチは、電動機の絶縁抵抗を連続測定する装置である。$c$, false, 1),
  ('2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'::uuid, $c$電磁接触器は、電磁力によって主回路などの接点を開閉する。$c$, true, 2),
  ('2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'::uuid, $c$ヒューズは、過電流が流れても溶断せず、回路を自動的に再投入する。$c$, false, 3),
  ('2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'::uuid, $c$非常停止スイッチは、通常運転時の速度を段階的に調整するためだけに使用する。$c$, false, 4),
  ('2ed31ed9-a7fe-4389-ba88-7c5b9b9deb72'::uuid, $c$コントローラーを中立位置に戻すと、必ず主電源そのものが遮断される。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ae5f5da6-0855-4ad3-926e-505766ecafc2',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$24Vの直流電源に、抵抗4Ωと8Ωを直列に接続した。この回路を流れる電流として、正しいものはどれか。$q$,
  $e$直列回路の合成抵抗は 4+8=12Ω である。オームの法則より、I=V÷R=24÷12=2A となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ae5f5da6-0855-4ad3-926e-505766ecafc2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ae5f5da6-0855-4ad3-926e-505766ecafc2'::uuid, $c$0.5A$c$, false, 1),
  ('ae5f5da6-0855-4ad3-926e-505766ecafc2'::uuid, $c$2A$c$, true, 2),
  ('ae5f5da6-0855-4ad3-926e-505766ecafc2'::uuid, $c$3A$c$, false, 3),
  ('ae5f5da6-0855-4ad3-926e-505766ecafc2'::uuid, $c$6A$c$, false, 4),
  ('ae5f5da6-0855-4ad3-926e-505766ecafc2'::uuid, $c$12A$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'dbe0a47c-247e-41b0-9e84-46896a62cfc2',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電および漏電の防止に関する記述として、適切なものはどれか。$q$,
  $e$電気機器の点検や修理では、電源を遮断し、施錠や表示などによって第三者による誤投入を防止することが重要である。ぬれた状態では人体抵抗が低下し、感電の危険が増す。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'dbe0a47c-247e-41b0-9e84-46896a62cfc2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('dbe0a47c-247e-41b0-9e84-46896a62cfc2'::uuid, $c$ぬれた手で電気機器を操作すると、人体の抵抗が増加して感電しにくくなる。$c$, false, 1),
  ('dbe0a47c-247e-41b0-9e84-46896a62cfc2'::uuid, $c$漏電遮断器を設ければ、充電部分へ直接触れても必ず感電を防止できる。$c$, false, 2),
  ('dbe0a47c-247e-41b0-9e84-46896a62cfc2'::uuid, $c$電気機器の点検では、可能な限り電源を遮断し、誤投入を防止する措置を講じる。$c$, true, 3),
  ('dbe0a47c-247e-41b0-9e84-46896a62cfc2'::uuid, $c$絶縁被覆が損傷した電線は、導体が完全に切断するまで使用できる。$c$, false, 4),
  ('dbe0a47c-247e-41b0-9e84-46896a62cfc2'::uuid, $c$感電者を救助するときは、最初に素手で身体を電路から引き離す。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3d9cba06-9868-4d01-8f4c-9d41e8e870ac',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気機器の絶縁および接地に関する記述として、正しいものはどれか。$q$,
  $e$接地は、絶縁不良によって金属製外箱などに漏電した場合、電流を大地へ流し、感電の危険を低減するために行う。水分や汚れは一般に絶縁抵抗を低下させる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3d9cba06-9868-4d01-8f4c-9d41e8e870ac'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3d9cba06-9868-4d01-8f4c-9d41e8e870ac'::uuid, $c$絶縁抵抗が低下するほど、漏れ電流は小さくなる。$c$, false, 1),
  ('3d9cba06-9868-4d01-8f4c-9d41e8e870ac'::uuid, $c$接地は、絶縁が損なわれた際に金属製外箱などが危険な電位になることを防ぐために行う。$c$, true, 2),
  ('3d9cba06-9868-4d01-8f4c-9d41e8e870ac'::uuid, $c$接地線は、通常の運転電流を常時流すことを主目的とする。$c$, false, 3),
  ('3d9cba06-9868-4d01-8f4c-9d41e8e870ac'::uuid, $c$電気機器の外箱が塗装されていれば、接地はどのような場合も不要である。$c$, false, 4),
  ('3d9cba06-9868-4d01-8f4c-9d41e8e870ac'::uuid, $c$絶縁材料に水分が付着すると、一般に絶縁抵抗は高くなる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '36075b2a-f186-4de0-a238-133ccb9235c1',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$起電力12V、容量40Ahの同一仕様の蓄電池2個を直列に接続した。この組合せの公称電圧と容量として、正しいものはどれか。$q$,
  $e$同一仕様の蓄電池を直列接続すると、電圧は加算されるが容量は変わらない。したがって、電圧は 12+12=24V、容量は40Ahとなる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '36075b2a-f186-4de0-a238-133ccb9235c1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('36075b2a-f186-4de0-a238-133ccb9235c1'::uuid, $c$12V、20Ah$c$, false, 1),
  ('36075b2a-f186-4de0-a238-133ccb9235c1'::uuid, $c$12V、40Ah$c$, false, 2),
  ('36075b2a-f186-4de0-a238-133ccb9235c1'::uuid, $c$12V、80Ah$c$, false, 3),
  ('36075b2a-f186-4de0-a238-133ccb9235c1'::uuid, $c$24V、40Ah$c$, true, 4),
  ('36075b2a-f186-4de0-a238-133ccb9235c1'::uuid, $c$24V、80Ah$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '4f0aa93b-79a1-4881-9ace-c9bdb4025766',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$ディーゼル機関に関する記述として、正しいものはどれか。$q$,
  $e$ディーゼル機関は、シリンダ内で空気を高圧に圧縮し、圧縮によって高温となった空気中へ燃料を噴射して自己着火させる内燃機関である。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '4f0aa93b-79a1-4881-9ace-c9bdb4025766'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('4f0aa93b-79a1-4881-9ace-c9bdb4025766'::uuid, $c$シリンダ内へ吸入した空気を圧縮し、その高温の空気中へ燃料を噴射して燃焼させる。$c$, true, 1),
  ('4f0aa93b-79a1-4881-9ace-c9bdb4025766'::uuid, $c$燃料と空気の混合気を、必ず点火プラグの火花で着火させる。$c$, false, 2),
  ('4f0aa93b-79a1-4881-9ace-c9bdb4025766'::uuid, $c$燃料として水だけを使用し、水蒸気の膨張によってピストンを動かす。$c$, false, 3),
  ('4f0aa93b-79a1-4881-9ace-c9bdb4025766'::uuid, $c$燃焼を行わず、外部から供給される圧縮空気だけで連続運転する。$c$, false, 4),
  ('4f0aa93b-79a1-4881-9ace-c9bdb4025766'::uuid, $c$クランク軸の回転運動を、発電機を介さず直接電気に変換する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$歯車式減速装置について、入力軸の回転速度が毎分1,200回転、減速比が4であるとき、損失を無視した出力軸の回転速度とトルクの関係として、正しいものはどれか。$q$,
  $e$出力回転速度は 1,200÷4=300回転/分 である。損失を無視すれば動力は一定なので、回転速度が4分の1になるとトルクは4倍になる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'::uuid, $c$出力軸は毎分300回転となり、そのトルクは入力軸の4倍となる。$c$, true, 1),
  ('dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'::uuid, $c$出力軸は毎分300回転となり、そのトルクは入力軸の4分の1となる。$c$, false, 2),
  ('dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'::uuid, $c$出力軸は毎分4,800回転となり、そのトルクは入力軸の4倍となる。$c$, false, 3),
  ('dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'::uuid, $c$出力軸は毎分4,800回転となり、そのトルクは入力軸の4分の1となる。$c$, false, 4),
  ('dcc7ad6e-d7b7-455a-9f80-aefaa4a172f5'::uuid, $c$出力軸は毎分1,200回転のままで、そのトルクだけが4倍となる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8f308324-f738-421d-a296-0692393876ea',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$同一点に、互いに直角な方向へ大きさ6kNと8kNの力が作用している。この2力の合力の大きさとして、正しいものはどれか。$q$,
  $e$2力は直角なので、三平方の定理により、合力は √(6²+8²)=√100=10kN となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8f308324-f738-421d-a296-0692393876ea'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8f308324-f738-421d-a296-0692393876ea'::uuid, $c$2kN$c$, false, 1),
  ('8f308324-f738-421d-a296-0692393876ea'::uuid, $c$7kN$c$, false, 2),
  ('8f308324-f738-421d-a296-0692393876ea'::uuid, $c$10kN$c$, true, 3),
  ('8f308324-f738-421d-a296-0692393876ea'::uuid, $c$14kN$c$, false, 4),
  ('8f308324-f738-421d-a296-0692393876ea'::uuid, $c$48kN$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '05658d83-00ea-4413-b3f3-6b97fb2a4a27',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$水平面に対して30°上向きの方向に1,000Nの力が作用している。この力の鉛直成分として、正しいものはどれか。$q$,
  $e$鉛直成分は 1,000×sin30°=1,000×0.5=500N となる。なお、水平成分は 1,000×cos30°≒866N である。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '05658d83-00ea-4413-b3f3-6b97fb2a4a27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('05658d83-00ea-4413-b3f3-6b97fb2a4a27'::uuid, $c$250N$c$, false, 1),
  ('05658d83-00ea-4413-b3f3-6b97fb2a4a27'::uuid, $c$500N$c$, true, 2),
  ('05658d83-00ea-4413-b3f3-6b97fb2a4a27'::uuid, $c$707N$c$, false, 3),
  ('05658d83-00ea-4413-b3f3-6b97fb2a4a27'::uuid, $c$866N$c$, false, 4),
  ('05658d83-00ea-4413-b3f3-6b97fb2a4a27'::uuid, $c$1,000N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6416f608-2503-41ff-80a5-0cd49b776312',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$ある支点の右側3mの位置に、鉛直下向きに4kNの力が作用している。この力によるモーメントとつり合わせるため、支点の左側に鉛直下向きの6kNの力を作用させる。必要な支点からの距離として、正しいものはどれか。$q$,
  $e$右側のモーメントは 4kN×3m=12kN・m である。左側の距離をLとすると、6kN×L=12kN・m より、L=12÷6=2m となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6416f608-2503-41ff-80a5-0cd49b776312'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6416f608-2503-41ff-80a5-0cd49b776312'::uuid, $c$0.5m$c$, false, 1),
  ('6416f608-2503-41ff-80a5-0cd49b776312'::uuid, $c$1m$c$, false, 2),
  ('6416f608-2503-41ff-80a5-0cd49b776312'::uuid, $c$2m$c$, true, 3),
  ('6416f608-2503-41ff-80a5-0cd49b776312'::uuid, $c$4.5m$c$, false, 4),
  ('6416f608-2503-41ff-80a5-0cd49b776312'::uuid, $c$8m$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0b034dc8-d868-402e-8a8d-4e9b07126959',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$物体の重心と安定に関する記述として、正しいものはどれか。$q$,
  $e$重心から下ろした鉛直線が支持面内にあれば物体は安定しやすいが、その鉛直線が支持面外へ出ると転倒モーメントが生じる。一般に、重心が低く支持面が広いほど安定性は高い。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0b034dc8-d868-402e-8a8d-4e9b07126959'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0b034dc8-d868-402e-8a8d-4e9b07126959'::uuid, $c$重心が高いほど、一般に物体は転倒しにくい。$c$, false, 1),
  ('0b034dc8-d868-402e-8a8d-4e9b07126959'::uuid, $c$支持面が狭いほど、一般に物体は安定する。$c$, false, 2),
  ('0b034dc8-d868-402e-8a8d-4e9b07126959'::uuid, $c$重心から下ろした鉛直線が支持面の外側に出ると、物体は転倒する方向へ回転しやすくなる。$c$, true, 3),
  ('0b034dc8-d868-402e-8a8d-4e9b07126959'::uuid, $c$物体の質量が同じであれば、重心の位置は安定性に影響しない。$c$, false, 4),
  ('0b034dc8-d868-402e-8a8d-4e9b07126959'::uuid, $c$つり荷の重心がつり点より高いほど、つり荷の姿勢は安定する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$水平な床の上に置かれた物体に4,000Nの垂直抗力が作用している。物体と床との静止摩擦係数が0.30であるとき、最大静止摩擦力として、正しいものはどれか。$q$,
  $e$最大静止摩擦力は F=μN で求める。したがって、F=0.30×4,000=1,200N となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'::uuid, $c$120N$c$, false, 1),
  ('f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'::uuid, $c$400N$c$, false, 2),
  ('f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'::uuid, $c$1,200N$c$, true, 3),
  ('f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'::uuid, $c$4,000N$c$, false, 4),
  ('f1470b1c-6c6f-43e1-a1ed-d4a1cddffa60'::uuid, $c$13,333N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '35573941-0732-4b83-8f1f-16aa1a9abfee',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$摩擦および滑車の質量を無視できる理想的な動滑車装置で、質量600kgの荷を4本のロープ部分で均等に支えている。この荷をつり上げるために必要なロープ張力として、正しいものはどれか。ただし、重力加速度は9.8m/s²とする。$q$,
  $e$荷の重量は W=mg=600×9.8=5,880N である。4本のロープ部分で支えるので、必要な張力は F=W÷n=5,880÷4=1,470N となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '35573941-0732-4b83-8f1f-16aa1a9abfee'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('35573941-0732-4b83-8f1f-16aa1a9abfee'::uuid, $c$147N$c$, false, 1),
  ('35573941-0732-4b83-8f1f-16aa1a9abfee'::uuid, $c$600N$c$, false, 2),
  ('35573941-0732-4b83-8f1f-16aa1a9abfee'::uuid, $c$1,470N$c$, true, 3),
  ('35573941-0732-4b83-8f1f-16aa1a9abfee'::uuid, $c$2,450N$c$, false, 4),
  ('35573941-0732-4b83-8f1f-16aa1a9abfee'::uuid, $c$5,880N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '33d27da6-613e-47bf-a4a8-35698df3e336',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$支点から0.80m離れた位置に300Nの力を加えるてこがある。支点から0.20m離れた位置にある荷とつり合わせることができる荷重として、正しいものはどれか。ただし、てこの質量は無視する。$q$,
  $e$モーメントのつり合いより、300N×0.80m=W×0.20m である。したがって、W=(300×0.80)÷0.20=1,200N となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '33d27da6-613e-47bf-a4a8-35698df3e336'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('33d27da6-613e-47bf-a4a8-35698df3e336'::uuid, $c$75N$c$, false, 1),
  ('33d27da6-613e-47bf-a4a8-35698df3e336'::uuid, $c$120N$c$, false, 2),
  ('33d27da6-613e-47bf-a4a8-35698df3e336'::uuid, $c$300N$c$, false, 3),
  ('33d27da6-613e-47bf-a4a8-35698df3e336'::uuid, $c$1,200N$c$, true, 4),
  ('33d27da6-613e-47bf-a4a8-35698df3e336'::uuid, $c$4,800N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e3943d64-2055-4d3a-a660-7a24d017b6ad',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$荷重の種類とクレーンに作用する力に関する記述として、正しいものはどれか。$q$,
  $e$荷を急に加速したり停止したりすると、慣性による動的な力が加わり、静止状態より大きな荷重がクレーンに作用することがある。急操作や荷振れは構造部分への負担を増加させる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e3943d64-2055-4d3a-a660-7a24d017b6ad'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e3943d64-2055-4d3a-a660-7a24d017b6ad'::uuid, $c$静止した荷による荷重には、荷の重量が含まれない。$c$, false, 1),
  ('e3943d64-2055-4d3a-a660-7a24d017b6ad'::uuid, $c$荷を急激に巻き上げると、慣性の影響により静止時より大きな力が機械に作用することがある。$c$, true, 2),
  ('e3943d64-2055-4d3a-a660-7a24d017b6ad'::uuid, $c$衝撃荷重は、常に静荷重より小さい。$c$, false, 3),
  ('e3943d64-2055-4d3a-a660-7a24d017b6ad'::uuid, $c$遠心力は、つり荷を旋回させる速度に関係しない。$c$, false, 4),
  ('e3943d64-2055-4d3a-a660-7a24d017b6ad'::uuid, $c$荷振れが生じても、クレーンには水平方向の力が作用しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6b4abb81-d1d4-497c-bd3c-84ebad402ebd',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$断面積600mm²の棒材に、軸方向へ18kNの引張荷重を加えた。この棒材に生じる引張応力として、正しいものはどれか。$q$,
  $e$引張荷重18kNは18,000Nである。応力は σ=F÷A=18,000÷600=30N/mm² となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6b4abb81-d1d4-497c-bd3c-84ebad402ebd'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6b4abb81-d1d4-497c-bd3c-84ebad402ebd'::uuid, $c$3N/mm²$c$, false, 1),
  ('6b4abb81-d1d4-497c-bd3c-84ebad402ebd'::uuid, $c$30N/mm²$c$, true, 2),
  ('6b4abb81-d1d4-497c-bd3c-84ebad402ebd'::uuid, $c$108N/mm²$c$, false, 3),
  ('6b4abb81-d1d4-497c-bd3c-84ebad402ebd'::uuid, $c$300N/mm²$c$, false, 4),
  ('6b4abb81-d1d4-497c-bd3c-84ebad402ebd'::uuid, $c$10,800N/mm²$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e00c6c85-e25e-4111-abcc-59451255f75f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$つり荷の上昇速度が、一定の加速度で3秒間に0.2m/sから1.4m/sまで増加した。この間の加速度として、正しいものはどれか。$q$,
  $e$加速度は速度の変化量を時間で除して求める。したがって、a=(1.4-0.2)÷3=1.2÷3=0.4m/s² となる。$e$,
  'original',
  'クレーン・デリック運転士 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e00c6c85-e25e-4111-abcc-59451255f75f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e00c6c85-e25e-4111-abcc-59451255f75f'::uuid, $c$0.2m/s²$c$, false, 1),
  ('e00c6c85-e25e-4111-abcc-59451255f75f'::uuid, $c$0.4m/s²$c$, true, 2),
  ('e00c6c85-e25e-4111-abcc-59451255f75f'::uuid, $c$0.6m/s²$c$, false, 3),
  ('e00c6c85-e25e-4111-abcc-59451255f75f'::uuid, $c$1.2m/s²$c$, false, 4),
  ('e00c6c85-e25e-4111-abcc-59451255f75f'::uuid, $c$4.8m/s²$c$, false, 5)
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
  WHERE exam_id = 'crane_all'
    AND source_type = 'original'
    AND source_note LIKE 'クレーン・デリック運転士 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'crane_all original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'crane_all', exam_types.id,
  'クレーン・デリック運転士模擬試験A', 150, 40,
  'クレーン・デリック運転士 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'crane_all'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'crane_all'
      AND name = 'クレーン・デリック運転士模擬試験A'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'crane_all', exam_types.id,
  'クレーン・デリック運転士模擬試験A【力学免除】', 120, 30,
  'クレーン・デリック運転士 オリジナル問題',
  ARRAY['クレーン及びデリックに関する知識', '関係法令', '原動機及び電気に関する知識']
FROM exam_types
WHERE exam_types.exam_id = 'crane_all'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'crane_all'
      AND name = 'クレーン・デリック運転士模擬試験A【力学免除】'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'crane_all', exam_types.id,
  'クレーン・デリック運転士模擬試験A【原動機電気・力学免除】', 75, 20,
  'クレーン・デリック運転士 オリジナル問題',
  ARRAY['クレーン及びデリックに関する知識', '関係法令']
FROM exam_types
WHERE exam_types.exam_id = 'crane_all'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'crane_all'
      AND name = 'クレーン・デリック運転士模擬試験A【原動機電気・力学免除】'
  );
