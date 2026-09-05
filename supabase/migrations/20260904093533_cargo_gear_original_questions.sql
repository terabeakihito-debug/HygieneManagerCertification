-- cargo_gear オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a2ffface-6b3a-4126-bc4d-0b9cd37a297f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置の種類と構造に関する次の記述のうち、適切なものはどれか。$q$,
  $e$デリックは、マストなどに取り付けたブームを起伏または旋回させ、巻上げ用ワイヤロープによって荷を取り扱う装置である。走行装置を必須とするものではない。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a2ffface-6b3a-4126-bc4d-0b9cd37a297f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a2ffface-6b3a-4126-bc4d-0b9cd37a297f'::uuid, $c$デリックは、旋回体に運転室を備え、必ず走行レール上を移動する構造である。$c$, false, 1),
  ('a2ffface-6b3a-4126-bc4d-0b9cd37a297f'::uuid, $c$デリックは、マストまたはこれに相当する構造物とブームを組み合わせ、ワイヤロープなどによって荷をつり上げる装置である。$c$, true, 2),
  ('a2ffface-6b3a-4126-bc4d-0b9cd37a297f'::uuid, $c$ジブクレーンは、ジブの先端を船体に固定したまま荷を水平移動させる装置である。$c$, false, 3),
  ('a2ffface-6b3a-4126-bc4d-0b9cd37a297f'::uuid, $c$揚貨装置のブームは、荷をつった状態でのみ起伏できる構造になっている。$c$, false, 4),
  ('a2ffface-6b3a-4126-bc4d-0b9cd37a297f'::uuid, $c$すべての揚貨装置は、荷を鉛直方向に移動させる機能だけを備え、水平方向には移動できない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7f9e2431-faa7-455c-b094-2a96daee0fb7',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$2本のデリックブームを用いるけんか巻き荷役方式に関する次の記述のうち、適切なものはどれか。$q$,
  $e$けんか巻き荷役方式では、2本のブームのカーゴフォールを共通のつり具に連結し、両者を協調操作して荷を水平方向にも移動させる。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7f9e2431-faa7-455c-b094-2a96daee0fb7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7f9e2431-faa7-455c-b094-2a96daee0fb7'::uuid, $c$2本のカーゴフォールを1個のつり具に連結し、両方のロープを交互に巻き取り、または繰り出して荷を移動させる。$c$, true, 1),
  ('7f9e2431-faa7-455c-b094-2a96daee0fb7'::uuid, $c$1本のブームだけを使用し、船体を移動させることによって荷を水平方向へ運ぶ。$c$, false, 2),
  ('7f9e2431-faa7-455c-b094-2a96daee0fb7'::uuid, $c$2本のブームを互いに平行に倒し、それぞれ別の荷を同時につり上げる。$c$, false, 3),
  ('7f9e2431-faa7-455c-b094-2a96daee0fb7'::uuid, $c$一方のカーゴフォールを固定し、他方だけを操作して荷を常に鉛直方向へ移動させる。$c$, false, 4),
  ('7f9e2431-faa7-455c-b094-2a96daee0fb7'::uuid, $c$荷を一方のフックから他方のフックへ空中で掛け替えて移動させる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f313dd30-18fd-4bf4-b7b4-783ee25e92b8',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$ワイヤロープの端末をワイヤロープクリップによって固定する方法として、適切なものはどれか。$q$,
  $e$サドルを荷重がかかる本体側に、Uボルトを折返し側に当て、すべて同じ向きに取り付ける。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f313dd30-18fd-4bf4-b7b4-783ee25e92b8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f313dd30-18fd-4bf4-b7b4-783ee25e92b8'::uuid, $c$クリップのUボルト側を、すべてロープの本体側に当てる。$c$, false, 1),
  ('f313dd30-18fd-4bf4-b7b4-783ee25e92b8'::uuid, $c$クリップのサドル側を、すべてロープの折返し側に当てる。$c$, false, 2),
  ('f313dd30-18fd-4bf4-b7b4-783ee25e92b8'::uuid, $c$クリップの向きを1個ごとに交互に変えて取り付ける。$c$, false, 3),
  ('f313dd30-18fd-4bf4-b7b4-783ee25e92b8'::uuid, $c$クリップのサドル側をロープの本体側に、Uボルト側を折返し側に当てる。$c$, true, 4),
  ('f313dd30-18fd-4bf4-b7b4-783ee25e92b8'::uuid, $c$端末に近いクリップ1個だけを強く締め、残りは緩く取り付ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '542f3f51-5483-4921-8638-0623cd1453cf',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$荷役用スリングの特徴に関する次の記述のうち、適切なものはどれか。$q$,
  $e$ベルトスリングは摩耗、切り傷、縫製部のほつれ、熱や薬品による損傷などを確認する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '542f3f51-5483-4921-8638-0623cd1453cf'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('542f3f51-5483-4921-8638-0623cd1453cf'::uuid, $c$チェーンスリングは、リンクの伸びや亀裂が生じても外観検査では確認できない。$c$, false, 1),
  ('542f3f51-5483-4921-8638-0623cd1453cf'::uuid, $c$繊維スリングは、鋭い角を持つ荷に保護具を使用せず直接掛けるのに適している。$c$, false, 2),
  ('542f3f51-5483-4921-8638-0623cd1453cf'::uuid, $c$ワイヤロープスリングは、キンクや著しい形崩れがあっても素線切れがなければ使用できる。$c$, false, 3),
  ('542f3f51-5483-4921-8638-0623cd1453cf'::uuid, $c$ベルトスリングは、表面の損傷や縫製部の異常などを使用前に確認する必要がある。$c$, true, 4),
  ('542f3f51-5483-4921-8638-0623cd1453cf'::uuid, $c$スリングの選定では、荷の質量だけを考慮すればよく、つり角度や荷の形状は考慮しなくてよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '460a275e-85c9-48d2-83be-dc3d35e1afeb',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$つり具およびフックの取扱いに関する次の記述のうち、適切なものはどれか。$q$,
  $e$玉掛用具はフックの奥に正しく掛け、外れ止め装置が有効に働くことを確認する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '460a275e-85c9-48d2-83be-dc3d35e1afeb'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('460a275e-85c9-48d2-83be-dc3d35e1afeb'::uuid, $c$フックの先端に荷重を掛けると、フックの奥に掛けるより安定する。$c$, false, 1),
  ('460a275e-85c9-48d2-83be-dc3d35e1afeb'::uuid, $c$外れ止め装置を備えたフックでは、玉掛用具が外れ止め装置を確実に越えてフックの奥に納まっていることを確認する。$c$, true, 2),
  ('460a275e-85c9-48d2-83be-dc3d35e1afeb'::uuid, $c$フックの開口部が変形して広がっていても、定格荷重以内であれば使用できる。$c$, false, 3),
  ('460a275e-85c9-48d2-83be-dc3d35e1afeb'::uuid, $c$両フック形のフックでは、荷重を常に片側だけに掛ける。$c$, false, 4),
  ('460a275e-85c9-48d2-83be-dc3d35e1afeb'::uuid, $c$フックに生じた亀裂は、現場で溶接補修すれば直ちに再使用できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0eff7bf6-4c7a-4629-bfa3-4ef2529360dc',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$シャックルおよびロープの使用方法に関する次の記述のうち、適切なものはどれか。$q$,
  $e$シャックルは適合するピンを確実に取り付け、横荷重やピンの曲げを避けて使用する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'::uuid, $c$シャックルのピンには、曲げ荷重が加わるように玉掛用具を掛ける。$c$, false, 1),
  ('0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'::uuid, $c$シャックル本体の両側を内側に押し縮める方向に使用する。$c$, false, 2),
  ('0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'::uuid, $c$シャックルは、ピンが確実に取り付けられ、荷重が本体とピンに適切に作用する向きで使用する。$c$, true, 3),
  ('0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'::uuid, $c$シャックルのピン径が合わない場合は、細い棒を代用してよい。$c$, false, 4),
  ('0eff7bf6-4c7a-4629-bfa3-4ef2529360dc'::uuid, $c$繊維ロープは、油が付着するほど摩擦が増加するため、保持力が必ず高くなる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '94e027ba-d508-4be1-beb9-7e9fa45010ad',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$歯数20枚の小歯車Aが歯数80枚の大歯車Bとかみ合っている。Aが毎分240回転するとき、Bの回転速度はどれか。損失と滑りはないものとする。$q$,
  $e$回転速度は歯数に反比例する。240×20=nB×80より、nB=240×20÷80=60回転/分。回転方向はAと反対である。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '94e027ba-d508-4be1-beb9-7e9fa45010ad'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('94e027ba-d508-4be1-beb9-7e9fa45010ad'::uuid, $c$毎分30回転$c$, false, 1),
  ('94e027ba-d508-4be1-beb9-7e9fa45010ad'::uuid, $c$毎分60回転$c$, true, 2),
  ('94e027ba-d508-4be1-beb9-7e9fa45010ad'::uuid, $c$毎分120回転$c$, false, 3),
  ('94e027ba-d508-4be1-beb9-7e9fa45010ad'::uuid, $c$毎分480回転$c$, false, 4),
  ('94e027ba-d508-4be1-beb9-7e9fa45010ad'::uuid, $c$毎分960回転$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '93675c7f-2b41-4111-b3f3-694dc2dec253',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$油圧駆動式ジブクレーンの操作に関する次の記述のうち、適切なものはどれか。$q$,
  $e$始業時に作動油量、配管の漏れ、異常音などを確認し、急激な起動・停止を避ける。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '93675c7f-2b41-4111-b3f3-694dc2dec253'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('93675c7f-2b41-4111-b3f3-694dc2dec253'::uuid, $c$作動油が低温のときは、始動直後から最高速度・最大荷重で操作する。$c$, false, 1),
  ('93675c7f-2b41-4111-b3f3-694dc2dec253'::uuid, $c$荷を急停止させる場合は、操作レバーを反対方向へ急激に倒す。$c$, false, 2),
  ('93675c7f-2b41-4111-b3f3-694dc2dec253'::uuid, $c$リリーフ弁が頻繁に作動するときは、設定圧力を任意に高くする。$c$, false, 3),
  ('93675c7f-2b41-4111-b3f3-694dc2dec253'::uuid, $c$運転開始前に油量、油漏れ、異常音などを確認し、操作レバーは滑らかに動かす。$c$, true, 4),
  ('93675c7f-2b41-4111-b3f3-694dc2dec253'::uuid, $c$荷をつったまま長時間停止するときは、操作レバーを巻上げ側に保持し続ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e92933c5-9b1e-4d24-96db-6680dc41df80',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置に表示された制限荷重および制限角度に関する次の記述のうち、適切なものはどれか。$q$,
  $e$制限荷重と制限角度は、強度や安定性などを踏まえて定められた使用限界である。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e92933c5-9b1e-4d24-96db-6680dc41df80'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e92933c5-9b1e-4d24-96db-6680dc41df80'::uuid, $c$制限荷重はつり荷だけの質量を示し、つり具の質量は常に無視できる。$c$, false, 1),
  ('e92933c5-9b1e-4d24-96db-6680dc41df80'::uuid, $c$ブームの角度が変化しても、許容される荷重は常に一定である。$c$, false, 2),
  ('e92933c5-9b1e-4d24-96db-6680dc41df80'::uuid, $c$制限角度の範囲外でも、無負荷ならそのまま荷役を開始できる。$c$, false, 3),
  ('e92933c5-9b1e-4d24-96db-6680dc41df80'::uuid, $c$制限荷重および制限角度は安全な使用範囲を示し、その範囲を超えて運転してはならない。$c$, true, 4),
  ('e92933c5-9b1e-4d24-96db-6680dc41df80'::uuid, $c$制限荷重は、ワイヤロープが破断するときの荷重と同じである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd6e062ee-c5d6-4700-bb72-6cb3f04ca185',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$デリックの型式と構造に関する次の記述のうち、適切なものはどれか。$q$,
  $e$ガイデリックはマスト上部をガイロープで支持する。スチフレッグデリックは剛性のあるステーや脚で支持する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd6e062ee-c5d6-4700-bb72-6cb3f04ca185'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d6e062ee-c5d6-4700-bb72-6cb3f04ca185'::uuid, $c$ガイデリックは、マスト上部を複数のガイロープで支持する。$c$, true, 1),
  ('d6e062ee-c5d6-4700-bb72-6cb3f04ca185'::uuid, $c$スチフレッグデリックは、剛性のある脚を持たない。$c$, false, 2),
  ('d6e062ee-c5d6-4700-bb72-6cb3f04ca185'::uuid, $c$ジンポールデリックは、水平なブームを2本のマスト間で走行させる。$c$, false, 3),
  ('d6e062ee-c5d6-4700-bb72-6cb3f04ca185'::uuid, $c$すべてのデリックは、ブームを360度自由に旋回できる。$c$, false, 4),
  ('d6e062ee-c5d6-4700-bb72-6cb3f04ca185'::uuid, $c$デリックのマストには引張力だけが作用する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'db1162ea-9c55-430d-937b-85054e1295fc',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の運転・玉掛けに必要な資格等の組合せとして正しいものはどれか。$q$,
  $e$5t以上の運転には揚貨装置運転士免許、5t未満の運転には特別教育が必要。1t以上の玉掛けは玉掛け技能講習修了者等に限られる。根拠: 労働安全衛生法第59条第3項・第61条、同法施行令第20条第2号・第16号、労働安全衛生規則第36条第6号。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'db1162ea-9c55-430d-937b-85054e1295fc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('db1162ea-9c55-430d-937b-85054e1295fc'::uuid, $c$制限荷重6tの運転―クレーン・デリック運転士免許／制限荷重2tの玉掛け―特別教育$c$, false, 1),
  ('db1162ea-9c55-430d-937b-85054e1295fc'::uuid, $c$制限荷重6tの運転―移動式クレーン運転士免許／制限荷重2tの玉掛け―玉掛け技能講習$c$, false, 2),
  ('db1162ea-9c55-430d-937b-85054e1295fc'::uuid, $c$制限荷重6tの運転―揚貨装置運転士免許／制限荷重2tの玉掛け―玉掛け技能講習$c$, true, 3),
  ('db1162ea-9c55-430d-937b-85054e1295fc'::uuid, $c$制限荷重4tの運転―揚貨装置運転士免許だけ／制限荷重0.8tの玉掛け―技能講習だけ$c$, false, 4),
  ('db1162ea-9c55-430d-937b-85054e1295fc'::uuid, $c$制限荷重4tの運転―教育不要／制限荷重2tの玉掛け―資格不要$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '307037e0-baad-4405-b9c3-d2b4784999db',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$玉掛け用ワイヤロープに最大40kNの荷重がかかる場合、必要な最小切断荷重はどれか。$q$,
  $e$安全係数は6以上。40×6=240kN。根拠: 労働安全衛生規則第469条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '307037e0-baad-4405-b9c3-d2b4784999db'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('307037e0-baad-4405-b9c3-d2b4784999db'::uuid, $c$80kN$c$, false, 1),
  ('307037e0-baad-4405-b9c3-d2b4784999db'::uuid, $c$120kN$c$, false, 2),
  ('307037e0-baad-4405-b9c3-d2b4784999db'::uuid, $c$160kN$c$, false, 3),
  ('307037e0-baad-4405-b9c3-d2b4784999db'::uuid, $c$200kN$c$, false, 4),
  ('307037e0-baad-4405-b9c3-d2b4784999db'::uuid, $c$240kN$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7bb456a1-06bf-4cb7-be68-45c8a9c288a3',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業の危険防止措置として正しいものはどれか。$q$,
  $e$船倉内、ばく露甲板上または岸壁上の荷を事前調査する。根拠: 労働安全衛生規則第455条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7bb456a1-06bf-4cb7-be68-45c8a9c288a3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7bb456a1-06bf-4cb7-be68-45c8a9c288a3'::uuid, $c$危険物の有無は荷役終了後に調査する。$c$, false, 1),
  ('7bb456a1-06bf-4cb7-be68-45c8a9c288a3'::uuid, $c$取扱方法は管理者だけに知らせればよい。$c$, false, 2),
  ('7bb456a1-06bf-4cb7-be68-45c8a9c288a3'::uuid, $c$漏えい時の処置は事故後に定める。$c$, false, 3),
  ('7bb456a1-06bf-4cb7-be68-45c8a9c288a3'::uuid, $c$作業開始前に危険物等の有無を調べ、存在するときは安全な取扱方法と飛散・漏えい時の処置を定め、作業者に周知する。$c$, true, 4),
  ('7bb456a1-06bf-4cb7-be68-45c8a9c288a3'::uuid, $c$調査対象は船倉内だけである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業の立入り禁止措置として正しいものはどれか。$q$,
  $e$見やすい表示その他の方法により立入りを禁止する。根拠: 労働安全衛生規則第453条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'::uuid, $c$無荷重でのブーム起伏時は立入り禁止不要である。$c$, false, 1),
  ('5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'::uuid, $c$ハッチビーム取外し中、落下で危険を及ぼすおそれのある下方への立入りを禁止する。$c$, true, 2),
  ('5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'::uuid, $c$口頭で一度伝えれば表示等は不要である。$c$, false, 3),
  ('5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'::uuid, $c$巻出索で荷を引くときは索の外角側だけを立入り禁止にする。$c$, false, 4),
  ('5a92a8ec-15a4-463e-9caf-8d8dc6d4ff84'::uuid, $c$立入り禁止の対象は荷役と無関係な者だけである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b4eeb11d-1755-49fd-830d-7a3917d2dae7',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置に使用するスリングの点検について正しいものはどれか。$q$,
  $e$フック付き、もっこ、ワイヤ等のスリングが対象。根拠: 労働安全衛生規則第476条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b4eeb11d-1755-49fd-830d-7a3917d2dae7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b4eeb11d-1755-49fd-830d-7a3917d2dae7'::uuid, $c$1か月ごとに点検する。$c$, false, 1),
  ('b4eeb11d-1755-49fd-830d-7a3917d2dae7'::uuid, $c$1週間ごとに点検する。$c$, false, 2),
  ('b4eeb11d-1755-49fd-830d-7a3917d2dae7'::uuid, $c$その日の作業開始前に点検し、異常時は直ちに補修または交換する。$c$, true, 3),
  ('b4eeb11d-1755-49fd-830d-7a3917d2dae7'::uuid, $c$荷崩れ発生時だけ点検する。$c$, false, 4),
  ('b4eeb11d-1755-49fd-830d-7a3917d2dae7'::uuid, $c$ワイヤスリングだけが対象である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '00a8b2c6-15ee-459b-9ba8-3f189da536ab',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$船内荷役作業主任者について正しいものはどれか。$q$,
  $e$職務には直接指揮、設備等の点検整備・監視、連絡調整が含まれる。根拠: 労働安全衛生規則第450条・第451条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '00a8b2c6-15ee-459b-9ba8-3f189da536ab'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('00a8b2c6-15ee-459b-9ba8-3f189da536ab'::uuid, $c$揚貨装置運転士免許所持者から選任する。$c$, false, 1),
  ('00a8b2c6-15ee-459b-9ba8-3f189da536ab'::uuid, $c$玉掛け技能講習修了者なら専用技能講習は不要である。$c$, false, 2),
  ('00a8b2c6-15ee-459b-9ba8-3f189da536ab'::uuid, $c$職務は終了後の報告書作成だけである。$c$, false, 3),
  ('00a8b2c6-15ee-459b-9ba8-3f189da536ab'::uuid, $c$対象作業では船内荷役作業主任者技能講習修了者から選任し、作業方法の決定・直接指揮等を行わせる。$c$, true, 4),
  ('00a8b2c6-15ee-459b-9ba8-3f189da536ab'::uuid, $c$通行設備や保護具等の点検は職務に含まれない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '27d942e3-03ea-40b1-9bcc-9a38c64ae299',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役で玉掛けに用いる用具のうち、法令上まだ使用できるものはどれか。$q$,
  $e$ワイヤロープは、一よりの間で素線（フィラ線を除く）の10％以上が切断したもの、公称径より7％を超えて直径が減ったもの、キンクしたものなどは使用禁止である。鎖は、製造時より5％を超えて伸びたもの、リンク断面が製造時より10％を超えて減ったものが禁止である。直径減少6％のワイヤロープは、7％超の禁止基準に達していない。根拠: 労働安全衛生規則第471条・第472条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '27d942e3-03ea-40b1-9bcc-9a38c64ae299'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('27d942e3-03ea-40b1-9bcc-9a38c64ae299'::uuid, $c$著しく形崩れしたワイヤロープ$c$, false, 1),
  ('27d942e3-03ea-40b1-9bcc-9a38c64ae299'::uuid, $c$直径減少が公称径の6％のワイヤロープ$c$, true, 2),
  ('27d942e3-03ea-40b1-9bcc-9a38c64ae299'::uuid, $c$製造時より6％伸びた鎖$c$, false, 3),
  ('27d942e3-03ea-40b1-9bcc-9a38c64ae299'::uuid, $c$リンク断面直径が製造時より12％減少した鎖$c$, false, 4),
  ('27d942e3-03ea-40b1-9bcc-9a38c64ae299'::uuid, $c$キンクしたワイヤロープ$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '82563177-f2e9-4bd5-bf45-cb3c642e3461',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の運転の合図について正しいものはどれか。$q$,
  $e$指名された者が合図を行い、作業者はその合図に従う。根拠: 労働安全衛生規則第467条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '82563177-f2e9-4bd5-bf45-cb3c642e3461'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('82563177-f2e9-4bd5-bf45-cb3c642e3461'::uuid, $c$合図者が作業ごとに自由に変更する。$c$, false, 1),
  ('82563177-f2e9-4bd5-bf45-cb3c642e3461'::uuid, $c$複数装置でも合図者は作業場全体で1人とする。$c$, false, 2),
  ('82563177-f2e9-4bd5-bf45-cb3c642e3461'::uuid, $c$運転者が荷を目視できれば合図を定めなくてよい。$c$, false, 3),
  ('82563177-f2e9-4bd5-bf45-cb3c642e3461'::uuid, $c$一定の合図を定め、揚貨装置ごとに合図者を指名する。$c$, true, 4),
  ('82563177-f2e9-4bd5-bf45-cb3c642e3461'::uuid, $c$作業者は合図より自己判断を優先する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '68174af3-ee09-4e56-a1af-bd038883ff84',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の取扱いについて正しいものはどれか。$q$,
  $e$制限荷重超過と、荷をつったままの離脱も禁止。根拠: 労働安全衛生規則第465条・第466条・第468条。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '68174af3-ee09-4e56-a1af-bd038883ff84'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('68174af3-ee09-4e56-a1af-bd038883ff84'::uuid, $c$制限荷重の10％超過まで使用できる。$c$, false, 1),
  ('68174af3-ee09-4e56-a1af-bd038883ff84'::uuid, $c$荷が静止していれば、つったまま作業位置を離れられる。$c$, false, 2),
  ('68174af3-ee09-4e56-a1af-bd038883ff84'::uuid, $c$巻上げ・巻卸し開始前に作動状態を点検し、異常がないことを確認する。$c$, true, 3),
  ('68174af3-ee09-4e56-a1af-bd038883ff84'::uuid, $c$異常があっても低速なら使用できる。$c$, false, 4),
  ('68174af3-ee09-4e56-a1af-bd038883ff84'::uuid, $c$無負荷試験が正常なら制限荷重を超えてよい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b1896349-39f2-4918-b780-d309896f5198',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$免許証の取扱いについて正しいものはどれか。$q$,
  $e$根拠: 労働安全衛生法第61条第3項、労働安全衛生規則第66条第2号。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b1896349-39f2-4918-b780-d309896f5198'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b1896349-39f2-4918-b780-d309896f5198'::uuid, $c$事務所保管とし写しを携帯すればよい。$c$, false, 1),
  ('b1896349-39f2-4918-b780-d309896f5198'::uuid, $c$同僚には貸与できる。$c$, false, 2),
  ('b1896349-39f2-4918-b780-d309896f5198'::uuid, $c$紛失時は口頭申告で従事できる。$c$, false, 3),
  ('b1896349-39f2-4918-b780-d309896f5198'::uuid, $c$就業制限業務では資格を証する書面を携帯し、免許証を譲渡・貸与してはならない。$c$, true, 4),
  ('b1896349-39f2-4918-b780-d309896f5198'::uuid, $c$氏名変更時も手続は一切不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cc950425-30bd-4d38-94d9-eddb9b1a8cd5',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$直流、交流および脈流について正しいものはどれか。$q$,
  $e$交流は大きさと向きが周期的に変化し、脈流は向きが一定で大きさが変動する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cc950425-30bd-4d38-94d9-eddb9b1a8cd5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cc950425-30bd-4d38-94d9-eddb9b1a8cd5'::uuid, $c$直流は一定周期で向きが反転する。$c$, false, 1),
  ('cc950425-30bd-4d38-94d9-eddb9b1a8cd5'::uuid, $c$交流の向きは変化しない。$c$, false, 2),
  ('cc950425-30bd-4d38-94d9-eddb9b1a8cd5'::uuid, $c$脈流は向きが一定で、大きさが周期的に変化する。$c$, true, 3),
  ('cc950425-30bd-4d38-94d9-eddb9b1a8cd5'::uuid, $c$直流は変圧器に直接加えて変圧できる。$c$, false, 4),
  ('cc950425-30bd-4d38-94d9-eddb9b1a8cd5'::uuid, $c$交流に周波数はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2a43d2de-2c77-4b31-aab4-c22330043fa6',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$抵抗20Ωの電熱器に10Aを5秒間流したときのジュール熱はどれか。$q$,
  $e$Q=I²Rt=10²×20×5=10,000J。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2a43d2de-2c77-4b31-aab4-c22330043fa6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2a43d2de-2c77-4b31-aab4-c22330043fa6'::uuid, $c$1,000J$c$, false, 1),
  ('2a43d2de-2c77-4b31-aab4-c22330043fa6'::uuid, $c$2,500J$c$, false, 2),
  ('2a43d2de-2c77-4b31-aab4-c22330043fa6'::uuid, $c$5,000J$c$, false, 3),
  ('2a43d2de-2c77-4b31-aab4-c22330043fa6'::uuid, $c$10,000J$c$, true, 4),
  ('2a43d2de-2c77-4b31-aab4-c22330043fa6'::uuid, $c$20,000J$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '471591aa-0dbd-4654-860c-411c230228ed',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$6Ωと3Ωの抵抗を並列接続したときの合成抵抗はどれか。$q$,
  $e$1/R=1/6+1/3=1/2より、R=2Ω。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '471591aa-0dbd-4654-860c-411c230228ed'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('471591aa-0dbd-4654-860c-411c230228ed'::uuid, $c$1Ω$c$, false, 1),
  ('471591aa-0dbd-4654-860c-411c230228ed'::uuid, $c$2Ω$c$, true, 2),
  ('471591aa-0dbd-4654-860c-411c230228ed'::uuid, $c$3Ω$c$, false, 3),
  ('471591aa-0dbd-4654-860c-411c230228ed'::uuid, $c$6Ω$c$, false, 4),
  ('471591aa-0dbd-4654-860c-411c230228ed'::uuid, $c$9Ω$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'aa5c8e12-4aef-4462-b8bd-24f13803b1f8',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$導体と絶縁体について正しいものはどれか。$q$,
  $e$絶縁物は湿気、汚損、熱、経年劣化などで性能が低下する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'aa5c8e12-4aef-4462-b8bd-24f13803b1f8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('aa5c8e12-4aef-4462-b8bd-24f13803b1f8'::uuid, $c$銅は抵抗が大きく電線に使われない。$c$, false, 1),
  ('aa5c8e12-4aef-4462-b8bd-24f13803b1f8'::uuid, $c$ゴムは導体である。$c$, false, 2),
  ('aa5c8e12-4aef-4462-b8bd-24f13803b1f8'::uuid, $c$絶縁性能は温湿度に左右されない。$c$, false, 3),
  ('aa5c8e12-4aef-4462-b8bd-24f13803b1f8'::uuid, $c$アルミニウムは導体として電線等に使われる。$c$, true, 4),
  ('aa5c8e12-4aef-4462-b8bd-24f13803b1f8'::uuid, $c$絶縁物が濡れても漏れ電流は生じない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8b422c25-6bb7-4b57-857c-6d702b6b599b',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気計器の使用方法として正しいものはどれか。$q$,
  $e$測定値が不明な場合は、大きい測定範囲から測定する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8b422c25-6bb7-4b57-857c-6d702b6b599b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8b422c25-6bb7-4b57-857c-6d702b6b599b'::uuid, $c$電圧計は直列接続する。$c$, false, 1),
  ('8b422c25-6bb7-4b57-857c-6d702b6b599b'::uuid, $c$電流計は並列接続する。$c$, false, 2),
  ('8b422c25-6bb7-4b57-857c-6d702b6b599b'::uuid, $c$電流計を電源両端に直接接続する。$c$, false, 3),
  ('8b422c25-6bb7-4b57-857c-6d702b6b599b'::uuid, $c$不明時は最小レンジから測る。$c$, false, 4),
  ('8b422c25-6bb7-4b57-857c-6d702b6b599b'::uuid, $c$電圧計は並列、電流計は直列に接続する。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '18b34dbf-53a2-4fdb-b332-e4c4007969e3',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電防止について正しいものはどれか。$q$,
  $e$濡れた状態では人体の接触抵抗が下がり、危険が増す。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '18b34dbf-53a2-4fdb-b332-e4c4007969e3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('18b34dbf-53a2-4fdb-b332-e4c4007969e3'::uuid, $c$濡れた手は接触抵抗を大きくする。$c$, false, 1),
  ('18b34dbf-53a2-4fdb-b332-e4c4007969e3'::uuid, $c$金属製外箱への適切な接地は漏電時の感電防止に有効である。$c$, true, 2),
  ('18b34dbf-53a2-4fdb-b332-e4c4007969e3'::uuid, $c$漏電遮断器は感電防止に役立たない。$c$, false, 3),
  ('18b34dbf-53a2-4fdb-b332-e4c4007969e3'::uuid, $c$低電圧なら危険はない。$c$, false, 4),
  ('18b34dbf-53a2-4fdb-b332-e4c4007969e3'::uuid, $c$絶縁被覆の損傷は補修不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '690d60ca-c459-4d51-978d-5a7f4f9eae43',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧駆動モータについて正しいものはどれか。$q$,
  $e$油圧モータは油圧エネルギーを回転運動に変換する。トルクは主に圧力差と押しのけ容積による。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '690d60ca-c459-4d51-978d-5a7f4f9eae43'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('690d60ca-c459-4d51-978d-5a7f4f9eae43'::uuid, $c$回転運動を油圧に変換する装置である。$c$, false, 1),
  ('690d60ca-c459-4d51-978d-5a7f4f9eae43'::uuid, $c$回転速度は主として供給される作動油の流量で変化する。$c$, true, 2),
  ('690d60ca-c459-4d51-978d-5a7f4f9eae43'::uuid, $c$トルクは油温だけで決まる。$c$, false, 3),
  ('690d60ca-c459-4d51-978d-5a7f4f9eae43'::uuid, $c$空気混入で作動が滑らかになる。$c$, false, 4),
  ('690d60ca-c459-4d51-978d-5a7f4f9eae43'::uuid, $c$油の流れを逆にしても回転方向は変わらない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '12e64ecb-d8cb-44a7-b84b-92de10f9c493',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機について正しいものはどれか。$q$,
  $e$かご形三相誘導電動機は構造が簡単で、保守も比較的容易である。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '12e64ecb-d8cb-44a7-b84b-92de10f9c493'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('12e64ecb-d8cb-44a7-b84b-92de10f9c493'::uuid, $c$三相誘導電動機は回転子へ外部から交流を直接供給する。$c$, false, 1),
  ('12e64ecb-d8cb-44a7-b84b-92de10f9c493'::uuid, $c$かご形三相誘導電動機は構造が比較的簡単で堅ろうである。$c$, true, 2),
  ('12e64ecb-d8cb-44a7-b84b-92de10f9c493'::uuid, $c$直流電動機に整流子やブラシを備える形式はない。$c$, false, 3),
  ('12e64ecb-d8cb-44a7-b84b-92de10f9c493'::uuid, $c$同期電動機の速度は負荷増加で必ず半分になる。$c$, false, 4),
  ('12e64ecb-d8cb-44a7-b84b-92de10f9c493'::uuid, $c$単相誘導電動機は常に大容量設備向きである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2c83a60c-2550-4352-b28a-e2bf926dc9e0',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$三相誘導電動機の回転方向を反転させる一般的な方法はどれか。$q$,
  $e$任意の2相を入れ替えると相順が逆になり、回転磁界と回転方向が反転する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2c83a60c-2550-4352-b28a-e2bf926dc9e0'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2c83a60c-2550-4352-b28a-e2bf926dc9e0'::uuid, $c$3本すべてを同時に入れ替える。$c$, false, 1),
  ('2c83a60c-2550-4352-b28a-e2bf926dc9e0'::uuid, $c$任意の2相を入れ替える。$c$, true, 2),
  ('2c83a60c-2550-4352-b28a-e2bf926dc9e0'::uuid, $c$接地線を外す。$c$, false, 3),
  ('2c83a60c-2550-4352-b28a-e2bf926dc9e0'::uuid, $c$周波数を0Hzにする。$c$, false, 4),
  ('2c83a60c-2550-4352-b28a-e2bf926dc9e0'::uuid, $c$3相を同じ1相に接続する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b07c175c-2cd4-4167-8827-fe2f9e9f1ba9',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機・油圧装置の保守について正しいものはどれか。$q$,
  $e$異常振動、過熱、油漏れ等を認めた場合は安全に停止して原因を確認する。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'::uuid, $c$異常振動時も定格電流以下なら継続する。$c$, false, 1),
  ('b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'::uuid, $c$運転中に素手で油漏れを探す。$c$, false, 2),
  ('b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'::uuid, $c$過熱時は保護装置を無効にする。$c$, false, 3),
  ('b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'::uuid, $c$作動油への異物混入は弁やポンプ等の摩耗・作動不良の原因になる。$c$, true, 4),
  ('b07c175c-2cd4-4167-8827-fe2f9e9f1ba9'::uuid, $c$絶縁抵抗は運転中の導通試験だけで確認する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0d9ae2f5-b5b5-4ad0-a877-09aea3826624',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$力の三要素として正しいものはどれか。$q$,
  $e$力の作用は、大きさ、向きおよび作用点によって決まる。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0d9ae2f5-b5b5-4ad0-a877-09aea3826624'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0d9ae2f5-b5b5-4ad0-a877-09aea3826624'::uuid, $c$質量・速度・加速度$c$, false, 1),
  ('0d9ae2f5-b5b5-4ad0-a877-09aea3826624'::uuid, $c$大きさ・向き・作用点$c$, true, 2),
  ('0d9ae2f5-b5b5-4ad0-a877-09aea3826624'::uuid, $c$長さ・面積・体積$c$, false, 3),
  ('0d9ae2f5-b5b5-4ad0-a877-09aea3826624'::uuid, $c$荷重・応力・ひずみ$c$, false, 4),
  ('0d9ae2f5-b5b5-4ad0-a877-09aea3826624'::uuid, $c$仕事・動力・効率$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '42d2e69b-469a-4116-967a-4e4135205c35',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$質量2,500kgの荷に作用する重力はどれか。重力加速度は9.8m/s²とする。$q$,
  $e$W=mg=2,500×9.8=24,500N=24.5kN。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '42d2e69b-469a-4116-967a-4e4135205c35'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('42d2e69b-469a-4116-967a-4e4135205c35'::uuid, $c$2.45kN$c$, false, 1),
  ('42d2e69b-469a-4116-967a-4e4135205c35'::uuid, $c$9.80kN$c$, false, 2),
  ('42d2e69b-469a-4116-967a-4e4135205c35'::uuid, $c$19.6kN$c$, false, 3),
  ('42d2e69b-469a-4116-967a-4e4135205c35'::uuid, $c$24.5kN$c$, true, 4),
  ('42d2e69b-469a-4116-967a-4e4135205c35'::uuid, $c$245kN$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '3e8ce884-953b-408d-a53e-3c774b7bea57',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$支点から2.5m離れた位置に鉛直下向き12kNの力が作用する。モーメントはどれか。$q$,
  $e$M=F×L=12×2.5=30kN・m。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '3e8ce884-953b-408d-a53e-3c774b7bea57'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('3e8ce884-953b-408d-a53e-3c774b7bea57'::uuid, $c$4.8kN・m$c$, false, 1),
  ('3e8ce884-953b-408d-a53e-3c774b7bea57'::uuid, $c$9.5kN・m$c$, false, 2),
  ('3e8ce884-953b-408d-a53e-3c774b7bea57'::uuid, $c$14.5kN・m$c$, false, 3),
  ('3e8ce884-953b-408d-a53e-3c774b7bea57'::uuid, $c$30kN・m$c$, true, 4),
  ('3e8ce884-953b-408d-a53e-3c774b7bea57'::uuid, $c$120kN・m$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1e0f9982-b69d-457c-90b4-844334ae79ce',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$材質と形状が一様な直方体の重心について正しいものはどれか。$q$,
  $e$一様な直方体の重心は幾何学的中心にあり、姿勢を変えても物体に対する重心位置は変わらない。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1e0f9982-b69d-457c-90b4-844334ae79ce'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1e0f9982-b69d-457c-90b4-844334ae79ce'::uuid, $c$上面にある。$c$, false, 1),
  ('1e0f9982-b69d-457c-90b4-844334ae79ce'::uuid, $c$幾何学的中心にある。$c$, true, 2),
  ('1e0f9982-b69d-457c-90b4-844334ae79ce'::uuid, $c$最長辺の端にある。$c$, false, 3),
  ('1e0f9982-b69d-457c-90b4-844334ae79ce'::uuid, $c$傾けると物体内部で移動する。$c$, false, 4),
  ('1e0f9982-b69d-457c-90b4-844334ae79ce'::uuid, $c$つり上げ速度で決まる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '39d16910-ce60-4de9-bab9-a1c3c4f352c7',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$静止した荷を一定加速度で4秒間加速し、速度が0.8m/sになった。加速度はどれか。$q$,
  $e$a=(0.8-0)÷4=0.2m/s²。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '39d16910-ce60-4de9-bab9-a1c3c4f352c7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('39d16910-ce60-4de9-bab9-a1c3c4f352c7'::uuid, $c$0.1m/s²$c$, false, 1),
  ('39d16910-ce60-4de9-bab9-a1c3c4f352c7'::uuid, $c$0.2m/s²$c$, true, 2),
  ('39d16910-ce60-4de9-bab9-a1c3c4f352c7'::uuid, $c$0.4m/s²$c$, false, 3),
  ('39d16910-ce60-4de9-bab9-a1c3c4f352c7'::uuid, $c$2.0m/s²$c$, false, 4),
  ('39d16910-ce60-4de9-bab9-a1c3c4f352c7'::uuid, $c$3.2m/s²$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '71d0c2a8-38fe-4f00-ab14-44276dfb586f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$荷が水平面を400Nで押し、静止摩擦係数が0.30である。最大静止摩擦力はどれか。$q$,
  $e$F=μN=0.30×400=120N。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '71d0c2a8-38fe-4f00-ab14-44276dfb586f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('71d0c2a8-38fe-4f00-ab14-44276dfb586f'::uuid, $c$30N$c$, false, 1),
  ('71d0c2a8-38fe-4f00-ab14-44276dfb586f'::uuid, $c$70N$c$, false, 2),
  ('71d0c2a8-38fe-4f00-ab14-44276dfb586f'::uuid, $c$120N$c$, true, 3),
  ('71d0c2a8-38fe-4f00-ab14-44276dfb586f'::uuid, $c$400N$c$, false, 4),
  ('71d0c2a8-38fe-4f00-ab14-44276dfb586f'::uuid, $c$1,200N$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a7512910-d857-4f02-b325-75212e02f449',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$重量12kNの荷を左右対称な2本のスリングでつる。各スリングと鉛直線の角度が60°のとき、各スリングの張力はどれか。$q$,
  $e$2T cos60°=12より、T=12kN。スリングが水平に近づくほど張力は増す。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a7512910-d857-4f02-b325-75212e02f449'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a7512910-d857-4f02-b325-75212e02f449'::uuid, $c$3kN$c$, false, 1),
  ('a7512910-d857-4f02-b325-75212e02f449'::uuid, $c$6kN$c$, false, 2),
  ('a7512910-d857-4f02-b325-75212e02f449'::uuid, $c$12kN$c$, true, 3),
  ('a7512910-d857-4f02-b325-75212e02f449'::uuid, $c$18kN$c$, false, 4),
  ('a7512910-d857-4f02-b325-75212e02f449'::uuid, $c$24kN$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'de0df83d-745b-48e5-bf55-dfd088e6e625',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$荷重の種類について正しいものはどれか。$q$,
  $e$急な巻上げ、急停止、落下の受止め等では大きな動的・衝撃荷重が生じる。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'de0df83d-745b-48e5-bf55-dfd088e6e625'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('de0df83d-745b-48e5-bf55-dfd088e6e625'::uuid, $c$静荷重は大きさや方向が激しく変化する。$c$, false, 1),
  ('de0df83d-745b-48e5-bf55-dfd088e6e625'::uuid, $c$繰返し荷重は一度だけ作用する。$c$, false, 2),
  ('de0df83d-745b-48e5-bf55-dfd088e6e625'::uuid, $c$衝撃荷重は急停止時等に生じ、同じ荷による静荷重より大きくなることがある。$c$, true, 3),
  ('de0df83d-745b-48e5-bf55-dfd088e6e625'::uuid, $c$引張荷重は部材を押し縮める。$c$, false, 4),
  ('de0df83d-745b-48e5-bf55-dfd088e6e625'::uuid, $c$圧縮荷重は部材をねじる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd755d0d0-c777-402c-8286-a1f86f46d8f4',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$断面積500mm²の棒材に100kNの引張荷重が作用する。引張応力はどれか。$q$,
  $e$100kN=100,000N、σ=F/A=100,000÷500=200N/mm²。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd755d0d0-c777-402c-8286-a1f86f46d8f4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d755d0d0-c777-402c-8286-a1f86f46d8f4'::uuid, $c$20N/mm²$c$, false, 1),
  ('d755d0d0-c777-402c-8286-a1f86f46d8f4'::uuid, $c$50N/mm²$c$, false, 2),
  ('d755d0d0-c777-402c-8286-a1f86f46d8f4'::uuid, $c$100N/mm²$c$, false, 3),
  ('d755d0d0-c777-402c-8286-a1f86f46d8f4'::uuid, $c$200N/mm²$c$, true, 4),
  ('d755d0d0-c777-402c-8286-a1f86f46d8f4'::uuid, $c$500N/mm²$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '64643ac1-0bc5-42f5-a33c-6668a3270827',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$動滑車を支えるロープ部分が2本の理想的な装置で、重量18kNの荷を一定速度で上げる。自由端を引く力はどれか。$q$,
  $e$2T=18より、T=9kN。力は半分になるが、荷を1m上げるには自由端を2m引く。$e$,
  'original',
  '揚貨装置運転士 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '64643ac1-0bc5-42f5-a33c-6668a3270827'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('64643ac1-0bc5-42f5-a33c-6668a3270827'::uuid, $c$4.5kN$c$, false, 1),
  ('64643ac1-0bc5-42f5-a33c-6668a3270827'::uuid, $c$6kN$c$, false, 2),
  ('64643ac1-0bc5-42f5-a33c-6668a3270827'::uuid, $c$9kN$c$, true, 3),
  ('64643ac1-0bc5-42f5-a33c-6668a3270827'::uuid, $c$18kN$c$, false, 4),
  ('64643ac1-0bc5-42f5-a33c-6668a3270827'::uuid, $c$36kN$c$, false, 5)
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
  WHERE exam_id = 'cargo_gear'
    AND source_type = 'original'
    AND source_note LIKE '揚貨装置運転士 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'cargo_gear original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'cargo_gear', exam_types.id,
  '揚貨装置運転士模擬試験A', 150, 40,
  '揚貨装置運転士 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'cargo_gear'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'cargo_gear'
      AND name = '揚貨装置運転士模擬試験A'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'cargo_gear', exam_types.id,
  '揚貨装置運転士模擬試験A【原動機電気・力学免除】', 75, 20,
  '揚貨装置運転士 オリジナル問題',
  ARRAY['揚貨装置に関する知識', '関係法令']
FROM exam_types
WHERE exam_types.exam_id = 'cargo_gear'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'cargo_gear'
      AND name = '揚貨装置運転士模擬試験A【原動機電気・力学免除】'
  );
