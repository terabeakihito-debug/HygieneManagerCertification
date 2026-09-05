-- diver オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'abcc20a4-4132-4f8a-adec-17c7005173c7',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水面上の大気圧を0.10 MPa、水深10 m増すごとに水圧が0.10 MPa増加するものとする。水深20 mで空気を呼吸しているときの圧力に関する記述として、正しいものはどれか。ただし、空気中の酸素濃度は21％とする。$q$,
  $e$水深20 mでのゲージ圧力は0.20 MPa、絶対圧力は0.10＋0.20＝0.30 MPaである。酸素分圧は、0.30×0.21＝0.063 MPaとなる。$e$,
  'original',
  '潜水士 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'abcc20a4-4132-4f8a-adec-17c7005173c7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('abcc20a4-4132-4f8a-adec-17c7005173c7'::uuid, $c$絶対圧力は0.20 MPaで、酸素分圧は0.042 MPaである。$c$, false, 1),
  ('abcc20a4-4132-4f8a-adec-17c7005173c7'::uuid, $c$絶対圧力は0.30 MPaで、酸素分圧は0.063 MPaである。$c$, true, 2),
  ('abcc20a4-4132-4f8a-adec-17c7005173c7'::uuid, $c$ゲージ圧力は0.30 MPaで、酸素分圧は0.030 MPaである。$c$, false, 3),
  ('abcc20a4-4132-4f8a-adec-17c7005173c7'::uuid, $c$絶対圧力は0.40 MPaで、酸素分圧は0.084 MPaである。$c$, false, 4),
  ('abcc20a4-4132-4f8a-adec-17c7005173c7'::uuid, $c$ゲージ圧力は0.10 MPaで、酸素分圧は0.021 MPaである。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0a6858e7-68db-401f-9fd1-f907ffe45384',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水面上で体積12 Lの気体を、温度を一定に保ったまま水深20 mまで沈めた。水面上の絶対圧力を1気圧、水深10 m増すごとに絶対圧力が1気圧増すものとすると、水深20 mでの気体の体積はいくらか。$q$,
  $e$ボイルの法則 \(P_1V_1=P_2V_2\) を用いる。水面では1気圧、水深20 mでは3気圧なので、\(1\times12=3\times V_2\)。したがって、\(V_2=12÷3=4\ \mathrm{L}\)である。$e$,
  'original',
  '潜水士 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0a6858e7-68db-401f-9fd1-f907ffe45384'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0a6858e7-68db-401f-9fd1-f907ffe45384'::uuid, $c$2 L$c$, false, 1),
  ('0a6858e7-68db-401f-9fd1-f907ffe45384'::uuid, $c$3 L$c$, false, 2),
  ('0a6858e7-68db-401f-9fd1-f907ffe45384'::uuid, $c$4 L$c$, true, 3),
  ('0a6858e7-68db-401f-9fd1-f907ffe45384'::uuid, $c$6 L$c$, false, 4),
  ('0a6858e7-68db-401f-9fd1-f907ffe45384'::uuid, $c$36 L$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2aebb7f8-4623-445f-b4cb-88b1adf44a1a',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水で使用又は問題となる気体の性質に関する記述として、正しいものはどれか。$q$,
  $e$ヘリウムは窒素より密度が小さく、窒素に比べ麻酔作用も小さいため、混合ガス潜水に利用される。酸素は高分圧で毒性を示し、一酸化炭素はヘモグロビンと強く結合する。$e$,
  'original',
  '潜水士 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2aebb7f8-4623-445f-b4cb-88b1adf44a1a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2aebb7f8-4623-445f-b4cb-88b1adf44a1a'::uuid, $c$窒素は、水深が増すほど麻酔作用が弱くなる。$c$, false, 1),
  ('2aebb7f8-4623-445f-b4cb-88b1adf44a1a'::uuid, $c$ヘリウムは、窒素より密度が小さく、深い潜水で呼吸抵抗を抑えるのに有利である。$c$, true, 2),
  ('2aebb7f8-4623-445f-b4cb-88b1adf44a1a'::uuid, $c$酸素は不活性ガスであり、高分圧でも人体に作用しない。$c$, false, 3),
  ('2aebb7f8-4623-445f-b4cb-88b1adf44a1a'::uuid, $c$二酸化炭素は無臭であるため、少量でも直ちに意識を失わせる。$c$, false, 4),
  ('2aebb7f8-4623-445f-b4cb-88b1adf44a1a'::uuid, $c$一酸化炭素は血液中のヘモグロビンとほとんど結合しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '34428661-6a6c-417e-86b3-51eaf6eb084f',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$一定温度における気体の液体への溶解について、ヘンリーの法則を正しく表しているものはどれか。$q$,
  $e$温度が一定なら、液体に溶解する気体の量は、その気体の分圧にほぼ比例する。溶解の程度は気体や液体の種類、温度によっても異なる。$e$,
  'original',
  '潜水士 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '34428661-6a6c-417e-86b3-51eaf6eb084f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('34428661-6a6c-417e-86b3-51eaf6eb084f'::uuid, $c$液体に溶解する気体の量は、その気体の分圧にほぼ比例する。$c$, true, 1),
  ('34428661-6a6c-417e-86b3-51eaf6eb084f'::uuid, $c$液体に溶解する気体の量は、その気体の分圧に反比例する。$c$, false, 2),
  ('34428661-6a6c-417e-86b3-51eaf6eb084f'::uuid, $c$液体に溶解する気体の量は、液体に加わる圧力と無関係である。$c$, false, 3),
  ('34428661-6a6c-417e-86b3-51eaf6eb084f'::uuid, $c$圧力が高くなると、液体中の気体はすべて直ちに気泡になる。$c$, false, 4),
  ('34428661-6a6c-417e-86b3-51eaf6eb084f'::uuid, $c$異なる種類の気体であっても、同じ分圧なら溶解量は常に等しい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '544b2a1b-51e9-4ad8-9e40-11769074b66d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水中における光及び音の性質に関する記述として、正しいものはどれか。$q$,
  $e$水中の音速は空気中より大きく、音源方向の判別が難しくなる。光は水中で吸収・散乱され、一般に長波長側の赤色から減衰しやすい。また、マスク越しでは屈折によって物体が大きく、近く見える。$e$,
  'original',
  '潜水士 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '544b2a1b-51e9-4ad8-9e40-11769074b66d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('544b2a1b-51e9-4ad8-9e40-11769074b66d'::uuid, $c$赤色の光は青色の光より水中の遠方まで届きやすい。$c$, false, 1),
  ('544b2a1b-51e9-4ad8-9e40-11769074b66d'::uuid, $c$水中では空気中より音速が遅くなる。$c$, false, 2),
  ('544b2a1b-51e9-4ad8-9e40-11769074b66d'::uuid, $c$水中では光の吸収や散乱が起こらないため、距離が増しても明るさは変わらない。$c$, false, 3),
  ('544b2a1b-51e9-4ad8-9e40-11769074b66d'::uuid, $c$水中では音が空気中より速く伝わり、両耳への到達時間差が小さくなるため、音源方向を判断しにくい。$c$, true, 4),
  ('544b2a1b-51e9-4ad8-9e40-11769074b66d'::uuid, $c$水中では物体からの光が屈折しないため、マスク越しでも実際の大きさと距離に見える。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '55e04372-12e9-4f64-b7f8-e6bfa2cf0f15',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水方式の特徴に関する記述として、正しいものはどれか。$q$,
  $e$ヘルメット式潜水は、一般に水上から送気を受ける方式であり、送気ホースや通信設備などを使用する。スクーバ式では潜水者が呼吸用ガス容器を携行する。$e$,
  'original',
  '潜水士 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'::uuid, $c$スクーバ式潜水では、呼吸用ガスはすべて水上からホースで供給される。$c$, false, 1),
  ('55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'::uuid, $c$全面マスク式潜水では、マスク内が浸水しても口だけで呼吸を続けることが常にできる。$c$, false, 2),
  ('55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'::uuid, $c$ヘルメット式潜水では、一般に水上から送気を受け、通信や送気ホースを含む潜水装具を使用する。$c$, true, 3),
  ('55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'::uuid, $c$スクーバ式潜水では、潜水者が携行するボンベの残圧を確認する必要はない。$c$, false, 4),
  ('55e04372-12e9-4f64-b7f8-e6bfa2cf0f15'::uuid, $c$全面マスク式潜水は顔全体を覆わないため、通常のマウスピースより顔面を保護しにくい。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0d47c1b0-9a81-48fa-be85-4ae85c58c6d6',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$海上で行う潜水業務の危険防止に関する記述として、最も適切なものはどれか。$q$,
  $e$船舶との接触、潮流による流失、命綱の絡まり、危険な海洋生物との接触を防ぐには、事前調査と水上との連絡・監視が重要である。国際信号旗A旗は「潜水作業中で、低速で十分避けること」を示す。$e$,
  'original',
  '潜水士 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'::uuid, $c$海洋生物による危険は水深1 m未満に限られるため、浅所では周囲を確認しなくてよい。$c$, false, 1),
  ('0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'::uuid, $c$命綱は潜水者の自由を妨げるので、流れの速い場所ほど長くたるませる。$c$, false, 2),
  ('0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'::uuid, $c$国際信号旗A旗が掲げられていても、付近を航行する船舶に特別な注意は求められない。$c$, false, 3),
  ('0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'::uuid, $c$毒や刺傷の危険がある生物を発見した場合は、種類を確認するため素手で捕まえる。$c$, false, 4),
  ('0d47c1b0-9a81-48fa-be85-4ae85c58c6d6'::uuid, $c$作業場所周辺の船舶、潮流及び危険な生物を事前に確認し、命綱などを作業条件に応じて管理する。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '4ca4b2d3-4b39-42fe-9420-ff90906eb13e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水中の潜水墜落及び吹き上げに関する記述として、正しいものはどれか。$q$,
  $e$潜水墜落は浮力不足などによる制御不能な沈降、吹き上げは過大な浮力などによる制御不能な浮上である。急浮上は減圧障害や肺の圧外傷を招くおそれがある。$e$,
  'original',
  '潜水士 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '4ca4b2d3-4b39-42fe-9420-ff90906eb13e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('4ca4b2d3-4b39-42fe-9420-ff90906eb13e'::uuid, $c$潜水墜落とは、浮力の過大な増加によって制御不能の浮上をすることである。$c$, false, 1),
  ('4ca4b2d3-4b39-42fe-9420-ff90906eb13e'::uuid, $c$吹き上げが始まったときは、浮力調整装置にさらに空気を加える。$c$, false, 2),
  ('4ca4b2d3-4b39-42fe-9420-ff90906eb13e'::uuid, $c$ヘルメット式潜水では、ヘルメット内の空気量は浮力に影響しない。$c$, false, 3),
  ('4ca4b2d3-4b39-42fe-9420-ff90906eb13e'::uuid, $c$潜水墜落は浮力不足などによる制御できない沈降、吹き上げは浮力増大などによる制御できない浮上をいう。$c$, true, 4),
  ('4ca4b2d3-4b39-42fe-9420-ff90906eb13e'::uuid, $c$吹き上げによる急浮上は、減圧症や肺の圧外傷とは関係しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ccfb6e5a-cd3a-4338-a165-568e85e7bde9',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$漁網、ロープ、構造物などによる水中拘束と溺れを予防する措置として、最も適切なものはどれか。$q$,
  $e$拘束防止には、事前の危険確認、ホースや命綱の適切な整理、切断具の携行、水上との連絡が重要である。拘束時は呼吸を保ち、状況を連絡して落ち着いて対処する。$e$,
  'original',
  '潜水士 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ccfb6e5a-cd3a-4338-a165-568e85e7bde9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ccfb6e5a-cd3a-4338-a165-568e85e7bde9'::uuid, $c$絡まりを防ぐため、残圧計やホース類は身体から大きく垂らしておく。$c$, false, 1),
  ('ccfb6e5a-cd3a-4338-a165-568e85e7bde9'::uuid, $c$拘束されたときは、呼吸を止めて直ちに装備をすべて外す。$c$, false, 2),
  ('ccfb6e5a-cd3a-4338-a165-568e85e7bde9'::uuid, $c$作業前に拘束要因と退避経路を確認し、ホース類を整理するとともに、必要な切断具を使用可能な位置に備える。$c$, true, 3),
  ('ccfb6e5a-cd3a-4338-a165-568e85e7bde9'::uuid, $c$水中で拘束された場合は、位置を知らせず単独で脱出を続ける。$c$, false, 4),
  ('ccfb6e5a-cd3a-4338-a165-568e85e7bde9'::uuid, $c$呼吸用ガスが残っている場合でも、絡まったロープを外す前に急浮上する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ad6bae78-8c69-4dbb-9474-cf2053edc93a',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$暗渠、流れのある河川又は標高の高い場所での潜水に関する記述として、最も適切なものはどれか。$q$,
  $e$暗渠などの閉鎖環境では、緊急時にも真上へ直接浮上できない。河川では流れや水中障害物、高所潜水では水面上の大気圧が低いことを考慮した計画が必要である。$e$,
  'original',
  '潜水士 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ad6bae78-8c69-4dbb-9474-cf2053edc93a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ad6bae78-8c69-4dbb-9474-cf2053edc93a'::uuid, $c$暗渠内では常に真上へ浮上できるため、進入経路を示す索は必要ない。$c$, false, 1),
  ('ad6bae78-8c69-4dbb-9474-cf2053edc93a'::uuid, $c$河川では流れの強さや障害物の位置が変化しないため、作業直前の確認は不要である。$c$, false, 2),
  ('ad6bae78-8c69-4dbb-9474-cf2053edc93a'::uuid, $c$標高の高い場所では大気圧が低いが、浮上後の減圧条件には影響しない。$c$, false, 3),
  ('ad6bae78-8c69-4dbb-9474-cf2053edc93a'::uuid, $c$暗渠など頭上が閉鎖された場所では直接浮上できないため、進入距離、退避経路、通信及び呼吸用ガスの余裕を慎重に計画する。$c$, true, 4),
  ('ad6bae78-8c69-4dbb-9474-cf2053edc93a'::uuid, $c$河川潜水では流れに逆らいやすくするため、潜水者の浮力をできるだけ大きくする。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f3fb755b-b2d8-41ed-ac9b-d91bcfadc695',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に使用する空気圧縮機（コンプレッサー）に関する記述として、正しいものはどれか。$q$,
  $e$往復動式圧縮機は、ピストンの往復運動によって空気を吸入・圧縮・吐出する。多段圧縮では中間冷却を行い、吸気口は排気ガスなどで汚染されない場所に設ける。$e$,
  'original',
  '潜水士 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'::uuid, $c$往復動式圧縮機は、ピストンをシリンダー内で往復させて空気を圧縮する。$c$, true, 1),
  ('f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'::uuid, $c$往復動式圧縮機には、吸気弁及び吐出し弁は必要ない。$c$, false, 2),
  ('f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'::uuid, $c$多段圧縮機では、各段の間で空気を加熱するほど圧縮効率が高くなる。$c$, false, 3),
  ('f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'::uuid, $c$潤滑油を使用する圧縮機では、油分が送気に混入しても問題にならない。$c$, false, 4),
  ('f3fb755b-b2d8-41ed-ac9b-d91bcfadc695'::uuid, $c$圧縮機の吸気口は、排気ガスを取り込みやすい場所に設ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b017def1-fc1a-4800-8f7a-959681778488',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$内容積12 Lの空気ボンベに、ゲージ圧力18 MPaで空気が充塡されている。残圧5 MPaを残すものとし、水深20 mで毎分20 Lの水面換算空気を消費する潜水者が使用するとき、潜水可能時間として最も近いものはどれか。ただし、大気圧を0.10 MPa、水深10 mごとに周囲絶対圧力が0.10 MPa増加するものとし、その他の損失は考えない。$q$,
  $e$使用可能な圧力差は、\(18-5=13\ \mathrm{MPa}\)。使用可能空気量は、\(12\times(13÷0.10)=1,560\ \mathrm{L}\)。水深20 mの絶対圧力は水面の3倍なので、空気消費量は、\(20\times3=60\ \mathrm{L/min}\)。したがって、潜水可能時間は、\(1,560÷60=26\)分となる。$e$,
  'original',
  '潜水士 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b017def1-fc1a-4800-8f7a-959681778488'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b017def1-fc1a-4800-8f7a-959681778488'::uuid, $c$13分$c$, false, 1),
  ('b017def1-fc1a-4800-8f7a-959681778488'::uuid, $c$20分$c$, false, 2),
  ('b017def1-fc1a-4800-8f7a-959681778488'::uuid, $c$26分$c$, true, 3),
  ('b017def1-fc1a-4800-8f7a-959681778488'::uuid, $c$39分$c$, false, 4),
  ('b017def1-fc1a-4800-8f7a-959681778488'::uuid, $c$78分$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '72866b19-172a-4ea7-bbef-4ecdaa36b60b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$送気式潜水に用いる空気槽の機能に関する記述として、最も適切なものはどれか。$q$,
  $e$空気槽は圧縮空気を一時的に蓄え、圧縮機から吐き出される空気の脈動や圧力変動を緩和する。水分や油分の分離にも役立つが、それだけで呼吸用空気の安全性が保証されるわけではない。$e$,
  'original',
  '潜水士 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '72866b19-172a-4ea7-bbef-4ecdaa36b60b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('72866b19-172a-4ea7-bbef-4ecdaa36b60b'::uuid, $c$送気中の酸素濃度を自動的に高める。$c$, false, 1),
  ('72866b19-172a-4ea7-bbef-4ecdaa36b60b'::uuid, $c$圧縮空気の圧力変動を緩和し、比較的安定した送気を行うために使用する。$c$, true, 2),
  ('72866b19-172a-4ea7-bbef-4ecdaa36b60b'::uuid, $c$潜水者から排出された呼気をすべて回収して再使用する。$c$, false, 3),
  ('72866b19-172a-4ea7-bbef-4ecdaa36b60b'::uuid, $c$空気中の窒素を完全に除去する。$c$, false, 4),
  ('72866b19-172a-4ea7-bbef-4ecdaa36b60b'::uuid, $c$送気管が閉塞したとき、自動的に海水を送る。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1f6fe3a5-6aa7-409f-8e50-84040966b062',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水における通常の潜降方法として、最も適切なものはどれか。$q$,
  $e$潜降は索などを利用して速度を制御し、耳や副鼻腔の圧平衡を早めに行う。痛みが生じたときは潜降を止め、必要に応じて少し浮上して圧平衡を試みる。$e$,
  'original',
  '潜水士 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1f6fe3a5-6aa7-409f-8e50-84040966b062'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1f6fe3a5-6aa7-409f-8e50-84040966b062'::uuid, $c$呼吸を止め、浮力調整装置内の空気を一度にすべて排出する。$c$, false, 1),
  ('1f6fe3a5-6aa7-409f-8e50-84040966b062'::uuid, $c$潜降索などを利用し、耳抜きを早めに行いながら、浮力を調整して速度を制御する。$c$, true, 2),
  ('1f6fe3a5-6aa7-409f-8e50-84040966b062'::uuid, $c$耳に痛みを感じた場合は、さらに速く潜降して痛みが消えるか確認する。$c$, false, 3),
  ('1f6fe3a5-6aa7-409f-8e50-84040966b062'::uuid, $c$潜降中はボンベ残圧及び潜水仲間の位置を確認しない。$c$, false, 4),
  ('1f6fe3a5-6aa7-409f-8e50-84040966b062'::uuid, $c$水底へ早く到達するため、過大なウエイトを装着して自由落下する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ef3731c7-7c70-4802-976f-3ee9fa4978f5',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$ヘルメット式潜水における浮上方法として、最も適切なものはどれか。$q$,
  $e$ヘルメット式潜水では、水上側と連携して送気ホースや命綱の絡まりを防ぎ、浮上速度を管理する。急激な浮力増加は吹き上げにつながるため、排気を適切に調整する。$e$,
  'original',
  '潜水士 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ef3731c7-7c70-4802-976f-3ee9fa4978f5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ef3731c7-7c70-4802-976f-3ee9fa4978f5'::uuid, $c$浮上開始時にウエイトをすべて投棄し、できるだけ速く水面へ出る。$c$, false, 1),
  ('ef3731c7-7c70-4802-976f-3ee9fa4978f5'::uuid, $c$潜水者が送気ホースを強く引き、水上設備ごと引き寄せながら浮上する。$c$, false, 2),
  ('ef3731c7-7c70-4802-976f-3ee9fa4978f5'::uuid, $c$水上との連絡を保ち、送気ホースや命綱の状態を確認しながら、定められた速度及び減圧手順で浮上する。$c$, true, 3),
  ('ef3731c7-7c70-4802-976f-3ee9fa4978f5'::uuid, $c$浮上中はヘルメット内の排気を止め、浮力を最大限に増加させる。$c$, false, 4),
  ('ef3731c7-7c70-4802-976f-3ee9fa4978f5'::uuid, $c$潜水深度にかかわらず、浮上途中で停止する必要はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '87ffe7c2-21c9-4ac4-953b-57dc7fcc763d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$減圧理論におけるビュールマンモデル及びM値に関する記述として、正しいものはどれか。$q$,
  $e$減圧モデルでは、異なる半飽和時間を持つ複数の理論組織を想定する。M値は、所定の周囲圧力に対して許容される組織内不活性ガス圧の上限を示す概念であり、これを超える状態は減圧症の危険を高める。$e$,
  'original',
  '潜水士 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'::uuid, $c$ビュールマンモデルでは、人体の全組織が同じ速さで不活性ガスを吸収すると仮定する。$c$, false, 1),
  ('87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'::uuid, $c$M値は、ある周囲圧力において許容される組織内不活性ガス圧の上限を表す考え方である。$c$, true, 2),
  ('87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'::uuid, $c$M値を超えるほど、減圧症の危険性は低くなる。$c$, false, 3),
  ('87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'::uuid, $c$半飽和時間が短い組織ほど、常に不活性ガスの吸収と排出が遅い。$c$, false, 4),
  ('87ffe7c2-21c9-4ac4-953b-57dc7fcc763d'::uuid, $c$ビュールマンモデルでは、潜水深度だけを用い、潜水時間は考慮しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '88617985-15d9-411b-81bc-2b26e6a5f941',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$ヘルメット式潜水器の構造及び機能に関する記述として、正しいものはどれか。$q$,
  $e$逆止弁は、送気圧力が低下した場合などに、ヘルメット内の空気が送気ホース側へ逆流するのを防止する。排気弁は内部の余分な空気を排出し、内圧や浮力の調整に関係する。$e$,
  'original',
  '潜水士 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '88617985-15d9-411b-81bc-2b26e6a5f941'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('88617985-15d9-411b-81bc-2b26e6a5f941'::uuid, $c$逆止弁は、送気が停止したときにヘルメット内の空気が送気管側へ逆流することを防ぐ。$c$, true, 1),
  ('88617985-15d9-411b-81bc-2b26e6a5f941'::uuid, $c$排気弁は、ヘルメット内へ海水を積極的に取り入れるために設ける。$c$, false, 2),
  ('88617985-15d9-411b-81bc-2b26e6a5f941'::uuid, $c$送気弁は、ヘルメット内の空気をすべて水中へ排出するためだけに使用する。$c$, false, 3),
  ('88617985-15d9-411b-81bc-2b26e6a5f941'::uuid, $c$ヘルメットの窓は、内部と外部の圧力差を常に大きくする働きを持つ。$c$, false, 4),
  ('88617985-15d9-411b-81bc-2b26e6a5f941'::uuid, $c$首部のシールは、潜水者と水上との音声通信だけを目的とする。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '19fa780e-881c-45a8-8698-7c7dc8fe4c83',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水に用いるボンベ及び圧力調整器に関する記述として、正しいものはどれか。$q$,
  $e$一般的な圧力調整器では、第一段でボンベの高圧ガスを中間圧力まで減圧し、第二段で潜水者の吸気に応じて周囲圧力に近いガスを供給する。深くなるほど空気消費量は増加する。$e$,
  'original',
  '潜水士 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '19fa780e-881c-45a8-8698-7c7dc8fe4c83'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('19fa780e-881c-45a8-8698-7c7dc8fe4c83'::uuid, $c$第一段減圧部は、ボンベ内の高圧ガスを周囲圧力よりわずかに高い中間圧力まで減圧する。$c$, true, 1),
  ('19fa780e-881c-45a8-8698-7c7dc8fe4c83'::uuid, $c$第二段減圧部は、呼吸ガスをボンベ内圧まで再び加圧する。$c$, false, 2),
  ('19fa780e-881c-45a8-8698-7c7dc8fe4c83'::uuid, $c$残圧計は、浮力調整装置内の空気量だけを示す。$c$, false, 3),
  ('19fa780e-881c-45a8-8698-7c7dc8fe4c83'::uuid, $c$ボンベの使用可能時間は、水深が深くなるほど長くなる。$c$, false, 4),
  ('19fa780e-881c-45a8-8698-7c7dc8fe4c83'::uuid, $c$圧力調整器が正常であれば、予備の呼吸ガス供給手段は必要ない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ef0375ae-00ef-4184-933c-78265dc4a60d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$全面マスク式潜水の装備に関する記述として、最も適切なものはどれか。$q$,
  $e$全面マスクは目、鼻及び口を覆い、顔面保護や通信装置の使用に適している。一方、マスク内への浸水やガス供給停止に備え、緊急時の対応手順を習得しておく必要がある。$e$,
  'original',
  '潜水士 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ef0375ae-00ef-4184-933c-78265dc4a60d'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ef0375ae-00ef-4184-933c-78265dc4a60d'::uuid, $c$全面マスクは目と鼻を覆わず、口だけを保護する。$c$, false, 1),
  ('ef0375ae-00ef-4184-933c-78265dc4a60d'::uuid, $c$全面マスクは顔全体を覆うため、通常のマウスピース式より顔面の保護や水中通話設備の組込みに適している。$c$, true, 2),
  ('ef0375ae-00ef-4184-933c-78265dc4a60d'::uuid, $c$全面マスクでは鼻を利用した圧平衡を行う必要がない。$c$, false, 3),
  ('ef0375ae-00ef-4184-933c-78265dc4a60d'::uuid, $c$全面マスクは、固定具が外れても顔面から脱落することがない。$c$, false, 4),
  ('ef0375ae-00ef-4184-933c-78265dc4a60d'::uuid, $c$全面マスクを使用すれば、呼吸用ガスの供給が停止しても呼吸を続けられる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ba11997e-893d-4efa-82d9-a4456bbcdfb1',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に使用する装備・器具の取扱いとして、最も適切なものはどれか。$q$,
  $e$潜水前には、呼吸用ガス供給装置、圧力計、通信装置、浮力調整装置、ホース類などを確認する。潜水服は種類や深度によって浮力が変化するため、適切なウエイト調整が必要である。$e$,
  'original',
  '潜水士 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ba11997e-893d-4efa-82d9-a4456bbcdfb1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ba11997e-893d-4efa-82d9-a4456bbcdfb1'::uuid, $c$潜水前には、呼吸用ガス供給系統、通信装置、残圧計、浮力調整装置などの作動状態を確認する。$c$, true, 1),
  ('ba11997e-893d-4efa-82d9-a4456bbcdfb1'::uuid, $c$切断具は水中拘束時の危険を増すため、潜水者から届かない位置に取り付ける。$c$, false, 2),
  ('ba11997e-893d-4efa-82d9-a4456bbcdfb1'::uuid, $c$保温用潜水服は浮力に影響しないため、ウエイト調整時に考慮しなくてよい。$c$, false, 3),
  ('ba11997e-893d-4efa-82d9-a4456bbcdfb1'::uuid, $c$送気ホースに外観上の損傷があっても、空気が漏れていなければ継続して使用する。$c$, false, 4),
  ('ba11997e-893d-4efa-82d9-a4456bbcdfb1'::uuid, $c$通信装置が故障した場合は、代替の連絡方法を設けずに潜水を開始する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b52f8b71-e532-44e6-b242-aed0aaf6e526',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$呼吸器系の構造及び潜水による障害に関する記述として、正しいものはどれか。$q$,
  $e$肺胞は毛細血管に囲まれ、酸素と二酸化炭素の交換を行う。浮上中は周囲圧力の低下により肺内の気体が膨張するため、呼吸を止めると肺の圧外傷を生じる危険がある。$e$,
  'original',
  '潜水士 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b52f8b71-e532-44e6-b242-aed0aaf6e526'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b52f8b71-e532-44e6-b242-aed0aaf6e526'::uuid, $c$肺胞は、主として食物から栄養を吸収する器官である。$c$, false, 1),
  ('b52f8b71-e532-44e6-b242-aed0aaf6e526'::uuid, $c$気管は左右の肺動脈に分かれ、直接肺胞へ血液を送る。$c$, false, 2),
  ('b52f8b71-e532-44e6-b242-aed0aaf6e526'::uuid, $c$肺胞では、肺胞内の空気と毛細血管内の血液との間でガス交換が行われる。$c$, true, 3),
  ('b52f8b71-e532-44e6-b242-aed0aaf6e526'::uuid, $c$浮上中に呼吸を止めれば、肺内の気体は周囲圧力の低下に伴って収縮する。$c$, false, 4),
  ('b52f8b71-e532-44e6-b242-aed0aaf6e526'::uuid, $c$肺の過膨張による障害は、水深が深いほど発生せず、水面付近だけでも発生しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '8bbe4d5a-4318-4b0b-8a06-7684bbce74b6',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$心臓及び血液循環に関する記述として、正しいものはどれか。$q$,
  $e$肺で酸素化された血液は肺静脈から左心房へ戻り、左心室から大動脈を通って全身へ送られる。右心室からは肺動脈を通って肺へ血液が送られる。$e$,
  'original',
  '潜水士 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'::uuid, $c$右心室から送り出された血液は、大動脈を通って全身へ向かう。$c$, false, 1),
  ('8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'::uuid, $c$左心室から送り出された血液は、肺動脈を通って肺へ向かう。$c$, false, 2),
  ('8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'::uuid, $c$肺で酸素を受け取った血液は、肺静脈を通って左心房へ戻る。$c$, true, 3),
  ('8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'::uuid, $c$静脈には、動脈よりも常に酸素濃度の高い血液が流れている。$c$, false, 4),
  ('8bbe4d5a-4318-4b0b-8a06-7684bbce74b6'::uuid, $c$赤血球は、主として血液凝固を担当する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cc8a510d-f9b8-445b-a7f3-230981a73c0b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$神経系の構造及び機能に関する記述として、正しいものはどれか。$q$,
  $e$神経系は、脳と脊髄からなる中枢神経系及びそこから全身に分布する末梢神経系に大別される。減圧症では、脳や脊髄などに関係する神経症状が現れることがある。$e$,
  'original',
  '潜水士 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cc8a510d-f9b8-445b-a7f3-230981a73c0b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cc8a510d-f9b8-445b-a7f3-230981a73c0b'::uuid, $c$中枢神経系は、脳と脊髄から構成される。$c$, true, 1),
  ('cc8a510d-f9b8-445b-a7f3-230981a73c0b'::uuid, $c$末梢神経系は、脳だけから構成される。$c$, false, 2),
  ('cc8a510d-f9b8-445b-a7f3-230981a73c0b'::uuid, $c$小脳は、主として赤血球を産生する。$c$, false, 3),
  ('cc8a510d-f9b8-445b-a7f3-230981a73c0b'::uuid, $c$脊髄は、呼吸用ガスを肺へ送る管である。$c$, false, 4),
  ('cc8a510d-f9b8-445b-a7f3-230981a73c0b'::uuid, $c$自律神経系は、心拍や血管の調節には関与しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '2f084624-ae8e-43f4-9e37-025e2f3addf4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水中の体温低下及び低体温症に関する記述として、最も適切なものはどれか。$q$,
  $e$水中では体熱が奪われやすく、低体温症の初期には震えなどが現れる。進行すると判断力低下、動作の不正確化、意識障害などを生じ得るため、適切な保温と潜水中止が必要である。$e$,
  'original',
  '潜水士 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '2f084624-ae8e-43f4-9e37-025e2f3addf4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('2f084624-ae8e-43f4-9e37-025e2f3addf4'::uuid, $c$水中では空気中より熱を失いにくいため、保温装備は必要ない。$c$, false, 1),
  ('2f084624-ae8e-43f4-9e37-025e2f3addf4'::uuid, $c$震えは体温低下の初期にみられることがあり、進行すると判断力や運動能力が低下する。$c$, true, 2),
  ('2f084624-ae8e-43f4-9e37-025e2f3addf4'::uuid, $c$重度の低体温症では、激しく運動させるほど安全に回復する。$c$, false, 3),
  ('2f084624-ae8e-43f4-9e37-025e2f3addf4'::uuid, $c$アルコールには体熱の放散を防ぐ作用があるため、潜水前の飲酒が有効である。$c$, false, 4),
  ('2f084624-ae8e-43f4-9e37-025e2f3addf4'::uuid, $c$低体温症は温水中だけで発生し、冷水中では発生しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bc110a01-2148-4b44-b21a-46dabbccfdd6',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水時の圧外傷に関する記述として、正しいものはどれか。$q$,
  $e$潜降時に中耳、マスク内などの含気腔の圧力調整ができないと、周囲圧力との差によってスクィーズが生じる。リバースブロックは、浮上時に含気腔内の膨張した気体が排出されない状態である。$e$,
  'original',
  '潜水士 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bc110a01-2148-4b44-b21a-46dabbccfdd6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bc110a01-2148-4b44-b21a-46dabbccfdd6'::uuid, $c$スクィーズは、潜降時に閉鎖された空間内の圧力が周囲圧力より低くなることで生じることがある。$c$, true, 1),
  ('bc110a01-2148-4b44-b21a-46dabbccfdd6'::uuid, $c$スクィーズは、浮上時に肺内の空気が必ず収縮することで生じる。$c$, false, 2),
  ('bc110a01-2148-4b44-b21a-46dabbccfdd6'::uuid, $c$リバースブロックは、潜降中に外耳道へ海水が入ることだけをいう。$c$, false, 3),
  ('bc110a01-2148-4b44-b21a-46dabbccfdd6'::uuid, $c$マスクスクィーズは、潜降中にマスク内へ鼻から空気を補うほど悪化する。$c$, false, 4),
  ('bc110a01-2148-4b44-b21a-46dabbccfdd6'::uuid, $c$圧外傷による痛みが生じた場合は、圧力差を大きくするため潜降又は浮上を加速する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cd55c0bc-32ec-463c-bda3-a24eb0c1db51',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$耳及び副鼻腔の潜水障害に関する記述として、最も適切なものはどれか。$q$,
  $e$鼻づまりや炎症があると、耳管や副鼻腔の通路が狭くなり、圧平衡が困難になる。耳痛などが生じたときは潜降を止め、少し浅い位置へ戻って無理のない圧平衡を試みる。$e$,
  'original',
  '潜水士 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cd55c0bc-32ec-463c-bda3-a24eb0c1db51'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cd55c0bc-32ec-463c-bda3-a24eb0c1db51'::uuid, $c$耳抜きは、強い痛みが生じるまで行わない。$c$, false, 1),
  ('cd55c0bc-32ec-463c-bda3-a24eb0c1db51'::uuid, $c$急性上気道感染や鼻づまりがあると、耳管や副鼻腔の圧平衡が困難になることがある。$c$, true, 2),
  ('cd55c0bc-32ec-463c-bda3-a24eb0c1db51'::uuid, $c$鼓膜の両側に圧力差が生じても、耳に障害が起こることはない。$c$, false, 3),
  ('cd55c0bc-32ec-463c-bda3-a24eb0c1db51'::uuid, $c$潜降中に耳痛が生じたら、さらに深く潜って圧力差を解消する。$c$, false, 4),
  ('cd55c0bc-32ec-463c-bda3-a24eb0c1db51'::uuid, $c$副鼻腔は空気を含まない充実性の器官なので、圧外傷は生じない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '28700f69-a844-4ab4-9b80-498e4e744cca',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$二酸化炭素中毒及び酸素中毒に関する記述として、正しいものはどれか。$q$,
  $e$二酸化炭素の蓄積は、頭痛、呼吸困難感、混乱や意識障害などを招く。高い酸素分圧へのばく露では、中枢神経系酸素中毒によるけいれんなどが起こり得る。スキップ呼吸は二酸化炭素蓄積の原因となる。$e$,
  'original',
  '潜水士 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '28700f69-a844-4ab4-9b80-498e4e744cca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('28700f69-a844-4ab4-9b80-498e4e744cca'::uuid, $c$二酸化炭素が体内に蓄積すると、頭痛、息苦しさ、判断力低下などが生じることがある。$c$, true, 1),
  ('28700f69-a844-4ab4-9b80-498e4e744cca'::uuid, $c$二酸化炭素濃度の上昇は呼吸を抑え、呼吸数を必ずゼロにする。$c$, false, 2),
  ('28700f69-a844-4ab4-9b80-498e4e744cca'::uuid, $c$酸素は生命維持に必要なので、吸入分圧がどれほど高くても有害作用を示さない。$c$, false, 3),
  ('28700f69-a844-4ab4-9b80-498e4e744cca'::uuid, $c$中枢神経系酸素中毒では、けいれんが起こる可能性はない。$c$, false, 4),
  ('28700f69-a844-4ab4-9b80-498e4e744cca'::uuid, $c$呼吸の深さを意図的に小さくするスキップ呼吸は、二酸化炭素排出を促進する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f04a9d75-0ca8-4164-9a8e-f4a662ac98a5',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧症に関する記述として、正しいものはどれか。$q$,
  $e$減圧症では、関節痛、しびれ、筋力低下、歩行障害、めまい、呼吸器症状など多様な症状が現れ得る。疑われる場合は救急要請を行い、可能なら高濃度酸素を投与して専門医療機関へ搬送する。安易な水中再圧は行わない。$e$,
  'original',
  '潜水士 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'::uuid, $c$減圧症は、潜水中に体内へ溶解した不活性ガスが、不適切な浮上などによって気泡を形成することなどにより発生する。$c$, true, 1),
  ('f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'::uuid, $c$減圧症は、海水を飲み込むことだけが原因で発生する。$c$, false, 2),
  ('f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'::uuid, $c$関節痛だけが症状であり、神経症状や呼吸器症状は生じない。$c$, false, 3),
  ('f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'::uuid, $c$潜水終了後に症状がなければ、その後に発症する可能性はない。$c$, false, 4),
  ('f04a9d75-0ca8-4164-9a8e-f4a662ac98a5'::uuid, $c$減圧症が疑われる場合は、本人を直ちに再潜水させることが一般的な一次対応である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$高気圧業務への就業禁止に関する記述として、正しいものはどれか。$q$,
  $e$高気圧作業安全衛生規則第41条（病者の就業禁止）は、減圧症等、呼吸器系、血液・循環器系、精神神経系、耳、運動器などの所定の疾病にかかっている労働者について、医師が必要と認める期間の就業禁止を定めている。$e$,
  'original',
  '潜水士 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'::uuid, $c$急性上気道感染にかかっている労働者でも、本人が希望すれば必ず潜水業務に従事させる。$c$, false, 1),
  ('62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'::uuid, $c$減圧症の後遺症があっても、潜水深度を浅くすれば就業禁止の対象にならない。$c$, false, 2),
  ('62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'::uuid, $c$中耳炎その他耳管狭さくを伴う耳の疾病は、就業禁止の対象となる疾病に含まれない。$c$, false, 3),
  ('62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'::uuid, $c$規則に掲げる疾病にかかっている労働者については、医師が必要と認める期間、高気圧業務への就業を禁止しなければならない。$c$, true, 4),
  ('62d0a7bd-50d1-4fd5-97ad-48247fa5ee2f'::uuid, $c$高気圧業務への就業禁止期間は、疾病の種類にかかわらず一律30日である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '424484ed-493b-4555-bc39-5c8d646582d8',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$成人の潜水者を水上へ救出した後の一次救命処置として、最も適切なものはどれか。$q$,
  $e$まず救助者自身の安全を確保する。傷病者に反応がなく、普段どおりの呼吸がない又は判断できない場合は、119番通報とAEDの手配を行い、成人では毎分100～120回を目安に胸骨圧迫を開始する。$e$,
  'original',
  '潜水士 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '424484ed-493b-4555-bc39-5c8d646582d8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('424484ed-493b-4555-bc39-5c8d646582d8'::uuid, $c$反応がなく、普段どおりの呼吸もない場合は、救急要請とAEDの手配を行い、胸骨圧迫を開始する。$c$, true, 1),
  ('424484ed-493b-4555-bc39-5c8d646582d8'::uuid, $c$反応がない場合は、呼吸の有無を確認せず30分間経過を観察する。$c$, false, 2),
  ('424484ed-493b-4555-bc39-5c8d646582d8'::uuid, $c$胸骨圧迫は、成人では1分間に約20回の速さで行う。$c$, false, 3),
  ('424484ed-493b-4555-bc39-5c8d646582d8'::uuid, $c$AEDは医師以外使用できないため、現場にあっても使用しない。$c$, false, 4),
  ('424484ed-493b-4555-bc39-5c8d646582d8'::uuid, $c$救助者の安全確認より先に、装備を着けず直ちに水中へ飛び込む。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '68095589-d2f8-4f01-977c-ce477d25dd8b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$空気圧縮機で送気する潜水で、予備空気槽を設けないことができる場合として、法令上正しいものはどれか。$q$,
  $e$省略できるのは次のいずれかである。送気を調節する空気槽が予備空気槽の内容積等の基準に適合するとき。または、その基準に適合する予備ボンベを潜水業務従事者に携行させるとき。圧力を最高深度の1.5倍以上に保つことは、予備空気槽を設ける場合の下限であり、省略の条件ではない。根拠: 高気圧作業安全衛生規則第8条。$e$,
  'original',
  '潜水士 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '68095589-d2f8-4f01-977c-ce477d25dd8b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('68095589-d2f8-4f01-977c-ce477d25dd8b'::uuid, $c$事業場に送気調節用の空気槽が1基あれば、従事者の人数に関係なく予備空気槽は不要である。$c$, false, 1),
  ('68095589-d2f8-4f01-977c-ce477d25dd8b'::uuid, $c$予備空気槽内の圧力を最高潜水深度の圧力の1.2倍以上に保てば、予備空気槽自体を設けなくてよい。$c$, false, 2),
  ('68095589-d2f8-4f01-977c-ce477d25dd8b'::uuid, $c$通話装置があるときは、予備空気槽を省略できる。$c$, false, 3),
  ('68095589-d2f8-4f01-977c-ce477d25dd8b'::uuid, $c$予備空気槽の内容積等の基準に適合する予備ボンベを、潜水業務従事者に携行させるとき。$c$, true, 4),
  ('68095589-d2f8-4f01-977c-ce477d25dd8b'::uuid, $c$最高潜水深度の圧力以上であれば、倍数を問わず予備空気槽を省略できる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6c7e7171-6498-4f39-b6b0-bf3410c0c6ac',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高気圧作業安全衛生規則に基づく特別の教育に関する記述として、正しいものはどれか。$q$,
  $e$潜水作業者への送気調節用バルブ又はコックを操作する業務は、特別の教育の対象である。教育事項には潜水業務、送気、高気圧障害、関係法令及び送気調節の実技が含まれる。再圧室を操作する業務も対象である。根拠: 高気圧作業安全衛生規則第11条。$e$,
  'original',
  '潜水士 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'::uuid, $c$潜水作業者への送気を調節するバルブ又はコックを操作する業務は、特別の教育の対象である。$c$, true, 1),
  ('6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'::uuid, $c$潜水士免許を取得するための学科試験そのものが、事業者の行う特別の教育である。$c$, false, 2),
  ('6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'::uuid, $c$潜水業務の連絡員は、同規則第11条により一律に特別の教育の対象とされている。$c$, false, 3),
  ('6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'::uuid, $c$特別の教育では、実技を行うことが禁止されている。$c$, false, 4),
  ('6c7e7171-6498-4f39-b6b0-bf3410c0c6ac'::uuid, $c$再圧室を操作する業務は、特別の教育の対象ではない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '1ce601b3-74b7-428f-bffb-6230dfd84e05',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$圧力調整器を用いず、水深25 mで潜水業務従事者1人へ空気圧縮機から送気する。法定の最低送気量を満たすために必要な、空気圧縮機の水面換算送気能力は毎分何 Lか。ただし、水面の絶対圧力を1気圧、水深10 m増すごとに絶対圧力が1気圧増すものとする。$q$,
  $e$圧力調整器を使用しない場合、その水深の圧力下で1人につき毎分60 L以上が必要である。水深25 mの絶対圧力は3.5気圧なので、水面換算では \(60\times(25+10)÷10=210\ \mathrm{L/min}\) 以上となる。根拠: 高気圧作業安全衛生規則第28条第1項。$e$,
  'original',
  '潜水士 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '1ce601b3-74b7-428f-bffb-6230dfd84e05'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('1ce601b3-74b7-428f-bffb-6230dfd84e05'::uuid, $c$150 L$c$, false, 1),
  ('1ce601b3-74b7-428f-bffb-6230dfd84e05'::uuid, $c$180 L$c$, false, 2),
  ('1ce601b3-74b7-428f-bffb-6230dfd84e05'::uuid, $c$210 L$c$, true, 3),
  ('1ce601b3-74b7-428f-bffb-6230dfd84e05'::uuid, $c$240 L$c$, false, 4),
  ('1ce601b3-74b7-428f-bffb-6230dfd84e05'::uuid, $c$300 L$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6202a741-ad6c-48c8-98c4-3fbb3109e060',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務に使用する設備・器具の点検周期に関する組合せとして、正しいものはどれか。$q$,
  $e$点検周期は、空気圧縮機又は手押ポンプが1週、空気清浄装置及び水深計が1月、水中時計が3月、流量計及びボンベが6月ごとに1回以上である。また、潜水器具は潜水前に点検する。点検・修理等の概要は3年間保存する。根拠: 高気圧作業安全衛生規則第34条。$e$,
  'original',
  '潜水士 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6202a741-ad6c-48c8-98c4-3fbb3109e060'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6202a741-ad6c-48c8-98c4-3fbb3109e060'::uuid, $c$空気圧縮機――1月ごと、水深計――3月ごと$c$, false, 1),
  ('6202a741-ad6c-48c8-98c4-3fbb3109e060'::uuid, $c$空気清浄装置――1週ごと、水中時計――6月ごと$c$, false, 2),
  ('6202a741-ad6c-48c8-98c4-3fbb3109e060'::uuid, $c$水深計――1月ごと、水中時計――3月ごと$c$, true, 3),
  ('6202a741-ad6c-48c8-98c4-3fbb3109e060'::uuid, $c$流量計――3月ごと、ボンベ――1年ごと$c$, false, 4),
  ('6202a741-ad6c-48c8-98c4-3fbb3109e060'::uuid, $c$空気圧縮機――6月ごと、ボンベ――1週ごと$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7864ad3e-048a-402e-ab04-1bf54d3dbf0e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$送気式潜水業務に配置する連絡員に関する記述として、正しいものはどれか。$q$,
  $e$送気式潜水などでは、潜水業務従事者2人以下ごとに連絡員1人を置く。連絡員は潜降・浮上の連絡、送気調節担当者との連絡、事故時の警告などを行う。ヘルメット式では、潜降直前にヘルメットがかぶと台に結合されているか確認する。根拠: 高気圧作業安全衛生規則第36条。$e$,
  'original',
  '潜水士 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7864ad3e-048a-402e-ab04-1bf54d3dbf0e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7864ad3e-048a-402e-ab04-1bf54d3dbf0e'::uuid, $c$連絡員は、潜水業務従事者5人以下ごとに1人置けばよい。$c$, false, 1),
  ('7864ad3e-048a-402e-ab04-1bf54d3dbf0e'::uuid, $c$連絡員は、潜水業務従事者2人以下ごとに1人置かなければならない。$c$, true, 2),
  ('7864ad3e-048a-402e-ab04-1bf54d3dbf0e'::uuid, $c$連絡員の業務は、潜水終了後の器具洗浄だけである。$c$, false, 3),
  ('7864ad3e-048a-402e-ab04-1bf54d3dbf0e'::uuid, $c$送気設備に故障が発生しても、連絡員は潜水業務従事者へ知らせてはならない。$c$, false, 4),
  ('7864ad3e-048a-402e-ab04-1bf54d3dbf0e'::uuid, $c$ヘルメット式潜水では、連絡員による潜降直前の結合確認は不要である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e89d1e71-9917-402e-817a-f23e92a4b408',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水作業者が携行するボンベから給気を受けるとき、法令上、必要とされていないものはどれか。$q$,
  $e$この方式では、水中時計、水深計及び鋭利な刃物の携行と、救命胴衣又は浮力調整具の着用が必要である。コンパスは、この方式の必要品には含まれない。根拠: 高気圧作業安全衛生規則第37条第3項。$e$,
  'original',
  '潜水士 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e89d1e71-9917-402e-817a-f23e92a4b408'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e89d1e71-9917-402e-817a-f23e92a4b408'::uuid, $c$水中時計$c$, false, 1),
  ('e89d1e71-9917-402e-817a-f23e92a4b408'::uuid, $c$水深計$c$, false, 2),
  ('e89d1e71-9917-402e-817a-f23e92a4b408'::uuid, $c$コンパス$c$, true, 3),
  ('e89d1e71-9917-402e-817a-f23e92a4b408'::uuid, $c$鋭利な刃物$c$, false, 4),
  ('e89d1e71-9917-402e-817a-f23e92a4b408'::uuid, $c$救命胴衣又は浮力調整具$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0cc0511c-425b-4617-99c1-070276f5557b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$高気圧業務健康診断に関する記述として、正しいものはどれか。$q$,
  $e$高気圧業務に常時従事する労働者には、雇入れの際、配置替えの際及びその後6月以内ごとに1回、医師による健康診断を行う。健康診断個人票は5年間保存し、定期健康診断の結果は所轄労働基準監督署長へ報告する。根拠: 高気圧作業安全衛生規則第38条、第39条及び第40条。$e$,
  'original',
  '潜水士 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0cc0511c-425b-4617-99c1-070276f5557b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0cc0511c-425b-4617-99c1-070276f5557b'::uuid, $c$高気圧業務に常時従事する労働者には、配置後3年以内ごとに1回だけ健康診断を行えばよい。$c$, false, 1),
  ('0cc0511c-425b-4617-99c1-070276f5557b'::uuid, $c$健康診断は、雇入れ時には必要なく、退職時だけ行う。$c$, false, 2),
  ('0cc0511c-425b-4617-99c1-070276f5557b'::uuid, $c$定期健康診断の結果は、労働基準監督署長へ報告する必要がない。$c$, false, 3),
  ('0cc0511c-425b-4617-99c1-070276f5557b'::uuid, $c$健康診断個人票の保存期間は1年間である。$c$, false, 4),
  ('0cc0511c-425b-4617-99c1-070276f5557b'::uuid, $c$高気圧業務に常時従事する労働者には、雇入れ時、配置替え時及び配置後6月以内ごとに1回、健康診断を行う。$c$, true, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c5b24b9e-94ba-4f0a-8b46-a6ec7f176890',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$再圧室の点検に関する記述として、正しいものはどれか。$q$,
  $e$再圧室は、設置時及びその後1月を超えない期間ごとに、送排気設備、通話・警報装置、漏電、電気機械器具・配線などを点検する。点検結果は3年間保存する。また、その日の使用開始前にも送排気設備、通話装置及び警報装置の作動状況を点検する。根拠: 高気圧作業安全衛生規則第44条第1号及び第45条。$e$,
  'original',
  '潜水士 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'::uuid, $c$再圧室は、設置時及びその後1月を超えない期間ごとに点検する。$c$, true, 1),
  ('c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'::uuid, $c$再圧室の定期点検は、5年ごとに行えばよい。$c$, false, 2),
  ('c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'::uuid, $c$定期点検の対象に、通話装置及び警報装置の作動状況は含まれない。$c$, false, 3),
  ('c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'::uuid, $c$その日の使用開始前に点検するのは、再圧室の外観だけでよい。$c$, false, 4),
  ('c5b24b9e-94ba-4f0a-8b46-a6ec7f176890'::uuid, $c$定期点検結果の記録は、直ちに廃棄しなければならない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f8060931-2cc1-422b-9468-19376c741003',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水士免許制度に関する記述として、正しいものはどれか。$q$,
  $e$潜水業務には、潜水士免許を受けた者を就かせなければならない。免許は潜水士免許試験合格者などに都道府県労働局長が与え、満18歳未満の者は免許を受けられない。試験は学科試験であり、実務経験は一律の要件ではない。根拠: 高気圧作業安全衛生規則第12条、第52条～第54条。$e$,
  'original',
  '潜水士 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f8060931-2cc1-422b-9468-19376c741003'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f8060931-2cc1-422b-9468-19376c741003'::uuid, $c$潜水士免許は、市町村長が与える。$c$, false, 1),
  ('f8060931-2cc1-422b-9468-19376c741003'::uuid, $c$満18歳未満でも、潜水士免許試験に合格すれば免許を受けられる。$c$, false, 2),
  ('f8060931-2cc1-422b-9468-19376c741003'::uuid, $c$事業者は、潜水士免許を受けた者でなければ、労働者を潜水業務に就かせてはならない。$c$, true, 3),
  ('f8060931-2cc1-422b-9468-19376c741003'::uuid, $c$潜水士免許試験は、実技試験だけで行われる。$c$, false, 4),
  ('f8060931-2cc1-422b-9468-19376c741003'::uuid, $c$潜水士免許を受けるには、潜水業務に2年以上従事した経験が必須である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水作業者が通常の潜水業務中に吸入する時点の呼吸用ガスについて、法令上の分圧範囲の組合せとして、正しいものはどれか。$q$,
  $e$通常の潜水業務中に吸入する時点では、酸素分圧を18 kPa以上160 kPa以下、窒素分圧を400 kPa以下、二酸化炭素分圧を0.5 kPa以下に保つ。溺水防止措置を講じて浮上させる場合、酸素分圧の上限には220 kPaの特例がある。根拠: 高気圧作業安全衛生規則第15条及び第27条による読替え準用。$e$,
  'original',
  '潜水士 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'::uuid, $c$酸素18～160 kPa、窒素400 kPa以下、二酸化炭素0.5 kPa以下$c$, true, 1),
  ('075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'::uuid, $c$酸素10～100 kPa、窒素200 kPa以下、二酸化炭素5 kPa以下$c$, false, 2),
  ('075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'::uuid, $c$酸素18～220 kPa、窒素800 kPa以下、二酸化炭素10 kPa以下$c$, false, 3),
  ('075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'::uuid, $c$酸素50～300 kPa、窒素400 kPa以上、二酸化炭素0.5 kPa以上$c$, false, 4),
  ('075bb7cc-6ef3-42c7-a6a9-02ebb8dd7a97'::uuid, $c$酸素160～220 kPa、窒素40 kPa以下、二酸化炭素5 kPa以下$c$, false, 5)
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
  WHERE exam_id = 'diver'
    AND source_type = 'original'
    AND source_note LIKE '潜水士 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'diver original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'diver', exam_types.id,
  '潜水士模擬試験A', 240, 40,
  '潜水士 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'diver'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'diver'
      AND name = '潜水士模擬試験A'
  );
