-- xray オリジナル問題 questions / choices / mock_exams 投入
-- 既存の past_exam 行は削除しない。模試名は実在の回次を示さない。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7bdd6ebf-56c5-4287-be0e-62eba331049c',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線管の構造とエックス線の発生について、正しいものはどれか。$q$,
  $e$加熱された陰極のフィラメントから熱電子が放出され、管電圧によって陽極ターゲットへ加速される。高速電子がターゲットで急激に減速すると、制動放射による連続エックス線などが発生する。管内は高真空に保たれる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問1',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7bdd6ebf-56c5-4287-be0e-62eba331049c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7bdd6ebf-56c5-4287-be0e-62eba331049c'::uuid, $c$熱陰極から放出された陽子が、陰極と陽極の間で加速される。$c$, false, 1),
  ('7bdd6ebf-56c5-4287-be0e-62eba331049c'::uuid, $c$フィラメントを加熱すると熱電子が放出され、高電圧によって陽極のターゲットへ加速される。$c$, true, 2),
  ('7bdd6ebf-56c5-4287-be0e-62eba331049c'::uuid, $c$陽極で発生した電子がフィラメントへ衝突して、エックス線を発生させる。$c$, false, 3),
  ('7bdd6ebf-56c5-4287-be0e-62eba331049c'::uuid, $c$集束電極は、陽極から放出されたエックス線を電気的に加速する。$c$, false, 4),
  ('7bdd6ebf-56c5-4287-be0e-62eba331049c'::uuid, $c$エックス線管内には空気が封入され、空気分子との衝突によってエックス線が発生する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '70984084-1cba-480c-b0d6-23ee57032226',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$連続エックス線の発生効率がターゲット元素の原子番号 $Z$ と管電圧 $V$ の積に比例するとする。ターゲットを原子番号42の元素から原子番号74の元素へ変更し、管電圧を80 kVから120 kVへ上げた。変更後の発生効率は変更前の約何倍か。$q$,
  $e$$\eta\propto ZV$ より、$\eta_2/\eta_1=(74\times120)/(42\times80)=8880/3360\approx2.64$ となる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問2',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '70984084-1cba-480c-b0d6-23ee57032226'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('70984084-1cba-480c-b0d6-23ee57032226'::uuid, $c$1.32倍$c$, false, 1),
  ('70984084-1cba-480c-b0d6-23ee57032226'::uuid, $c$1.76倍$c$, false, 2),
  ('70984084-1cba-480c-b0d6-23ee57032226'::uuid, $c$2.14倍$c$, false, 3),
  ('70984084-1cba-480c-b0d6-23ee57032226'::uuid, $c$2.64倍$c$, true, 4),
  ('70984084-1cba-480c-b0d6-23ee57032226'::uuid, $c$3.52倍$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b2b31b68-09ce-43ca-99a2-820c535cb4d9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$特性エックス線のK系列について、正しいものはどれか。$q$,
  $e$K殻の空孔へL殻の電子が遷移するとKα線、M殻などの電子が遷移するとKβ線が発生する。そのエネルギーはターゲット元素固有の殻の結合エネルギー差で決まる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問3',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b2b31b68-09ce-43ca-99a2-820c535cb4d9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b2b31b68-09ce-43ca-99a2-820c535cb4d9'::uuid, $c$Kα線は、K殻の電子がL殻へ移るときに発生する。$c$, false, 1),
  ('b2b31b68-09ce-43ca-99a2-820c535cb4d9'::uuid, $c$Kα線は、L殻の空孔へM殻の電子が移るときに発生する。$c$, false, 2),
  ('b2b31b68-09ce-43ca-99a2-820c535cb4d9'::uuid, $c$Kβ線は、M殻などの電子がK殻の空孔へ移るときに発生する。$c$, true, 3),
  ('b2b31b68-09ce-43ca-99a2-820c535cb4d9'::uuid, $c$K系列のエネルギーは、管電圧だけで決まりターゲット元素には依存しない。$c$, false, 4),
  ('b2b31b68-09ce-43ca-99a2-820c535cb4d9'::uuid, $c$特性エックス線は、電子が原子核の電場で減速されるだけで発生する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線と物質との相互作用について、正しいものはどれか。$q$,
  $e$干渉性散乱では原子の電離や大きなエネルギー損失を伴わず、主として光子の方向が変化する。光電効果では光子の全エネルギーが吸収され、電子対生成のしきいエネルギーは1.022 MeVである。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問4',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'::uuid, $c$光電効果では、入射光子はエネルギーの一部だけを失って散乱する。$c$, false, 1),
  ('0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'::uuid, $c$コンプトン散乱では、入射光子は自由電子と対消滅する。$c$, false, 2),
  ('0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'::uuid, $c$干渉性散乱では、原子が電離されることなく、主として光子の進行方向が変化する。$c$, true, 3),
  ('0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'::uuid, $c$電子対生成は、光子エネルギーが0.511 MeVを超えると必ず生じる。$c$, false, 4),
  ('0e6a7bd9-be4d-43e7-aafd-886d4ffaa80e'::uuid, $c$光電効果の発生確率は、一般に物質の原子番号が高くなるほど低下する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'd062f512-02a7-4fae-a5c7-ad66b471d068',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$再生係数（ビルドアップ係数）を用いた遮蔽計算について、正しいものはどれか。$q$,
  $e$広い線束条件では散乱線も評価点へ到達するため、一般に $D=BD_0e^{-\mu x}$ と表す。散乱線の寄与がある場合の $B$ は通常1以上で、エネルギー、材質、遮蔽厚さなどに依存する。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問5',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'd062f512-02a7-4fae-a5c7-ad66b471d068'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('d062f512-02a7-4fae-a5c7-ad66b471d068'::uuid, $c$再生係数は、散乱線を含む線量を一次線だけによる線量で除した量として扱われる。$c$, true, 1),
  ('d062f512-02a7-4fae-a5c7-ad66b471d068'::uuid, $c$再生係数は、遮蔽体の厚さにかかわらず常に1未満である。$c$, false, 2),
  ('d062f512-02a7-4fae-a5c7-ad66b471d068'::uuid, $c$再生係数を用いると、散乱線の寄与を完全に除外できる。$c$, false, 3),
  ('d062f512-02a7-4fae-a5c7-ad66b471d068'::uuid, $c$狭い線束条件で測定した指数減弱式は、広い線束条件でも再生係数なしで常に成立する。$c$, false, 4),
  ('d062f512-02a7-4fae-a5c7-ad66b471d068'::uuid, $c$再生係数は、放射線のエネルギーや遮蔽体の材質には依存しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '96630910-a224-40f3-814b-ea71088dfb58',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$工業分野におけるエックス線利用装置とその用途の組合せとして、適切なものはどれか。$q$,
  $e$エックス線回折装置は結晶による回折を利用して結晶構造や結晶相を調べる。透過試験やCTは内部構造の非破壊検査、蛍光エックス線分析は元素分析、厚さ計は透過量などを利用した厚さ測定に用いられる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問6',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '96630910-a224-40f3-814b-ea71088dfb58'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('96630910-a224-40f3-814b-ea71088dfb58'::uuid, $c$エックス線回折装置―結晶構造や結晶相の分析$c$, true, 1),
  ('96630910-a224-40f3-814b-ea71088dfb58'::uuid, $c$エックス線透過試験装置―材料表面の色彩の測定$c$, false, 2),
  ('96630910-a224-40f3-814b-ea71088dfb58'::uuid, $c$蛍光エックス線分析装置―試料内部の残留応力だけの測定$c$, false, 3),
  ('96630910-a224-40f3-814b-ea71088dfb58'::uuid, $c$エックス線CT装置―試料の質量を天びんと同じ原理で測定$c$, false, 4),
  ('96630910-a224-40f3-814b-ea71088dfb58'::uuid, $c$エックス線厚さ計―試料から放出される超音波の周波数を測定$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '74d9e018-04ad-4038-b1d9-e1164175846f',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線照射によって物体から生じる散乱線の性質について、正しいものはどれか。$q$,
  $e$コンプトン散乱では散乱角が大きいほど電子へ移るエネルギーが大きくなり、散乱光子のエネルギーは低くなる。したがって、前方散乱光子は後方散乱光子より一般に高エネルギーである。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問7',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '74d9e018-04ad-4038-b1d9-e1164175846f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('74d9e018-04ad-4038-b1d9-e1164175846f'::uuid, $c$コンプトン散乱光子のエネルギーは、散乱角が大きくなるほど一般に高くなる。$c$, false, 1),
  ('74d9e018-04ad-4038-b1d9-e1164175846f'::uuid, $c$前方へ散乱された光子は、後方へ散乱された光子より一般に高いエネルギーをもつ。$c$, true, 2),
  ('74d9e018-04ad-4038-b1d9-e1164175846f'::uuid, $c$180度方向への後方散乱では、散乱光子のエネルギーは入射光子と必ず等しい。$c$, false, 3),
  ('74d9e018-04ad-4038-b1d9-e1164175846f'::uuid, $c$散乱線の角度分布は、入射エックス線のエネルギーには影響されない。$c$, false, 4),
  ('74d9e018-04ad-4038-b1d9-e1164175846f'::uuid, $c$散乱体の寸法を大きくしても、発生する散乱線量は変化しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'f4608e61-6cea-42cd-a602-e61ea98a6a91',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線装置の周囲における散乱線を低減する方法として、最も適切なものはどれか。$q$,
  $e$絞りやコリメータによって照射野を必要最小限にすると、散乱線を生じる照射体積が小さくなり、周囲の散乱線量を低減できる。距離の確保や適切な遮蔽も有効である。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問8',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'f4608e61-6cea-42cd-a602-e61ea98a6a91'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('f4608e61-6cea-42cd-a602-e61ea98a6a91'::uuid, $c$照射野を必要以上に広げる。$c$, false, 1),
  ('f4608e61-6cea-42cd-a602-e61ea98a6a91'::uuid, $c$被照射物と作業者との距離を短くする。$c$, false, 2),
  ('f4608e61-6cea-42cd-a602-e61ea98a6a91'::uuid, $c$必要な範囲に照射野を絞り、散乱線の発生に寄与する照射体積を小さくする。$c$, true, 3),
  ('f4608e61-6cea-42cd-a602-e61ea98a6a91'::uuid, $c$遮蔽体を一次線の方向から外し、散乱線だけを通過させる。$c$, false, 4),
  ('f4608e61-6cea-42cd-a602-e61ea98a6a91'::uuid, $c$管電圧と管電流を無条件に最大値へ設定する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '713f03f0-68df-432c-a96e-13972fb1f5cc',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$あるエックス線源から2 mの位置における空気カーマ率を $K_0$ とする。評価点を4 mの位置へ移し、さらに半価層3 mmの遮蔽体によって、空気カーマ率を $K_0$ の64分の1以下にしたい。狭い線束条件とし、空気による減弱を無視するとき、必要な遮蔽体の最小厚さはどれか。$q$,
  $e$逆二乗則で $(2/4)^2=1/4$。遮蔽体でさらに $(1/64)/(1/4)=1/16=(1/2)^4$ にする必要があるため、半価層4枚分、$3\ \mathrm{mm}\times4=12\ \mathrm{mm}$ が必要となる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問9',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '713f03f0-68df-432c-a96e-13972fb1f5cc'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('713f03f0-68df-432c-a96e-13972fb1f5cc'::uuid, $c$3 mm$c$, false, 1),
  ('713f03f0-68df-432c-a96e-13972fb1f5cc'::uuid, $c$6 mm$c$, false, 2),
  ('713f03f0-68df-432c-a96e-13972fb1f5cc'::uuid, $c$9 mm$c$, false, 3),
  ('713f03f0-68df-432c-a96e-13972fb1f5cc'::uuid, $c$12 mm$c$, true, 4),
  ('713f03f0-68df-432c-a96e-13972fb1f5cc'::uuid, $c$18 mm$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '961a737d-7be6-4614-ad28-cae1f9067fd1',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$点状とみなせるエックス線源から1 mの位置における空気カーマ率が80 μGy/hである。この装置を1週間に5時間使用する。境界の判定基準として、仮に1週間当たりの空気カーマを20 μGy以下とする場合、逆二乗則だけを考慮すると必要な最小距離は約何mか。遮蔽体及び空気による減弱は無視する。$q$,
  $e$距離 $r$ mでの週間空気カーマは $80\times5/r^2=400/r^2$ μGy。$400/r^2\le20$ より $r^2\ge20$、したがって $r\ge\sqrt{20}\approx4.47$ mである。なお、20 μGy/週は計算条件として仮定した値であり、法令上の管理区域基準ではない。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問10',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '961a737d-7be6-4614-ad28-cae1f9067fd1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('961a737d-7be6-4614-ad28-cae1f9067fd1'::uuid, $c$2.0 m$c$, false, 1),
  ('961a737d-7be6-4614-ad28-cae1f9067fd1'::uuid, $c$3.2 m$c$, false, 2),
  ('961a737d-7be6-4614-ad28-cae1f9067fd1'::uuid, $c$4.5 m$c$, true, 3),
  ('961a737d-7be6-4614-ad28-cae1f9067fd1'::uuid, $c$6.3 m$c$, false, 4),
  ('961a737d-7be6-4614-ad28-cae1f9067fd1'::uuid, $c$20.0 m$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e06b4094-592d-4ee9-9e7f-fa72c2096f08',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$管理区域について正しいものはどれか。$q$,
  $e$該当区域は標識で明示し、必要のある者以外を立ち入らせてはならない。根拠：電離放射線障害防止規則第3条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問11',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e06b4094-592d-4ee9-9e7f-fa72c2096f08'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e06b4094-592d-4ee9-9e7f-fa72c2096f08'::uuid, $c$外部放射線が1週間につき1.3 mSvを超える区域だけをいう。$c$, false, 1),
  ('e06b4094-592d-4ee9-9e7f-fa72c2096f08'::uuid, $c$外部放射線と空気中放射性物質による実効線量の合計が3月間につき1.3 mSvを超えるおそれのある区域は管理区域となる。$c$, true, 2),
  ('e06b4094-592d-4ee9-9e7f-fa72c2096f08'::uuid, $c$床の色分けだけで明示でき、標識は不要である。$c$, false, 3),
  ('e06b4094-592d-4ee9-9e7f-fa72c2096f08'::uuid, $c$測定器を装着すれば誰でも立ち入れる。$c$, false, 4),
  ('e06b4094-592d-4ee9-9e7f-fa72c2096f08'::uuid, $c$事故時の応急措置は掲示事項に含まれない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'bf314da8-639c-47ae-bf97-bdf38c14957b',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$遮蔽物が照射中に破損し照射停止が困難となり、実効線量が15 mSvを超えるおそれのある区域が生じた。正しい措置はどれか。$q$,
  $e$直ちに作業を中止し、該当区域から退避させ標識で明示する。根拠：同規則第42条（退避）。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問12',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'bf314da8-639c-47ae-bf97-bdf38c14957b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('bf314da8-639c-47ae-bf97-bdf38c14957b'::uuid, $c$作業終了後に測定する。$c$, false, 1),
  ('bf314da8-639c-47ae-bf97-bdf38c14957b'::uuid, $c$作業を中止するが区域内で待機させる。$c$, false, 2),
  ('bf314da8-639c-47ae-bf97-bdf38c14957b'::uuid, $c$直ちに作業を中止して退避させ、区域を標識で明示する。$c$, true, 3),
  ('bf314da8-639c-47ae-bf97-bdf38c14957b'::uuid, $c$50 mSv超を確認するまで退避不要である。$c$, false, 4),
  ('bf314da8-639c-47ae-bf97-bdf38c14957b'::uuid, $c$測定器装着者は通常作業を続ける。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '98aac1bd-dd37-467d-9511-fce6aecd16a4',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$外部被ばく測定器の装着部位について正しいものはどれか。$q$,
  $e$原則装着部位は男性等では胸部、その他の女性では腹部である。別部位が最もさらされる場合は追加測定する。根拠：同規則第8条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問13',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '98aac1bd-dd37-467d-9511-fce6aecd16a4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('98aac1bd-dd37-467d-9511-fce6aecd16a4'::uuid, $c$男性は腹部、妊娠可能な女性は胸部。$c$, false, 1),
  ('98aac1bd-dd37-467d-9511-fce6aecd16a4'::uuid, $c$男性及び妊娠可能性なしと診断された女性は胸部、その他の女性は腹部。$c$, true, 2),
  ('98aac1bd-dd37-467d-9511-fce6aecd16a4'::uuid, $c$全員手首だけ。$c$, false, 3),
  ('98aac1bd-dd37-467d-9511-fce6aecd16a4'::uuid, $c$頭・頸部が最多被ばく部位でも追加測定不要。$c$, false, 4),
  ('98aac1bd-dd37-467d-9511-fce6aecd16a4'::uuid, $c$一時立入者は測定不要。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e0bdf020-7469-40b4-824a-a82685ac2efe',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$通常の放射線業務従事者の実効線量限度として正しいものはどれか。$q$,
  $e$5年間につき100 mSvを超えず、かつ1年間につき50 mSvを超えないようにする。根拠：同規則第4条第1項。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問14',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e0bdf020-7469-40b4-824a-a82685ac2efe'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e0bdf020-7469-40b4-824a-a82685ac2efe'::uuid, $c$年間20 mSvのみ$c$, false, 1),
  ('e0bdf020-7469-40b4-824a-a82685ac2efe'::uuid, $c$5年50 mSvかつ年10 mSv$c$, false, 2),
  ('e0bdf020-7469-40b4-824a-a82685ac2efe'::uuid, $c$5年100 mSvかつ年50 mSv$c$, true, 3),
  ('e0bdf020-7469-40b4-824a-a82685ac2efe'::uuid, $c$5年250 mSvかつ年100 mSv$c$, false, 4),
  ('e0bdf020-7469-40b4-824a-a82685ac2efe'::uuid, $c$生涯100 mSvのみ$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '6fc89db0-b86d-4bba-b8fc-f3176d4c2837',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置の放射線装置室への設置について正しいものはどれか。$q$,
  $e$原則は専用室設置だが、上記構造の場合などは例外となる。根拠：同規則第15条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問15',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '6fc89db0-b86d-4bba-b8fc-f3176d4c2837'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('6fc89db0-b86d-4bba-b8fc-f3176d4c2837'::uuid, $c$全装置を例外なく専用室に置く。$c$, false, 1),
  ('6fc89db0-b86d-4bba-b8fc-f3176d4c2837'::uuid, $c$外側の1 cm線量当量率が20 μSv/hを超えないよう遮蔽された装置は例外となり得る。$c$, true, 2),
  ('6fc89db0-b86d-4bba-b8fc-f3176d4c2837'::uuid, $c$200 μSv/h以下なら必ず室外設置できる。$c$, false, 3),
  ('6fc89db0-b86d-4bba-b8fc-f3176d4c2837'::uuid, $c$入口標識は不要。$c$, false, 4),
  ('6fc89db0-b86d-4bba-b8fc-f3176d4c2837'::uuid, $c$無関係者も自由に立ち入れる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$工業用特定エックス線装置による間接撮影（適用除外等なし）の措置として正しいものはどれか。$q$,
  $e$接触可能表面から10 cmの自由空気中の空気カーマを1回につき1.0 μGy以下とする。根拠：同規則第12条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問16',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'::uuid, $c$照射野を受像面より広くする。$c$, false, 1),
  ('5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'::uuid, $c$一次防護遮蔽体は接触可能表面から1 mで1回1.0 μGy以下。$c$, false, 2),
  ('5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'::uuid, $c$一次防護遮蔽体は接触可能表面から10 cmで1回1.0 μGy以下。$c$, true, 3),
  ('5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'::uuid, $c$基準は1.0 mGy/h以下。$c$, false, 4),
  ('5fba5d12-1f1b-4445-a57a-0c0f1f7e83e6'::uuid, $c$被照射体周囲の遮蔽物に線量基準はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c667244f-5c80-48d1-b8df-53ddecbc65e7',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$常時放射線業務に従事し管理区域に入る労働者の健康診断について正しいものはどれか。$q$,
  $e$雇入れ・配置替えの際及びその後6月以内ごとに1回行う。根拠：同規則第56条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問17',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c667244f-5c80-48d1-b8df-53ddecbc65e7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c667244f-5c80-48d1-b8df-53ddecbc65e7'::uuid, $c$雇入れ時だけ。$c$, false, 1),
  ('c667244f-5c80-48d1-b8df-53ddecbc65e7'::uuid, $c$雇入れ等の際及び3月以内ごと。$c$, false, 2),
  ('c667244f-5c80-48d1-b8df-53ddecbc65e7'::uuid, $c$雇入れ等の際及び6月以内ごと。$c$, true, 3),
  ('c667244f-5c80-48d1-b8df-53ddecbc65e7'::uuid, $c$雇入れ等の際及び1年以内ごと。$c$, false, 4),
  ('c667244f-5c80-48d1-b8df-53ddecbc65e7'::uuid, $c$被ばく歴調査は含まれない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '520dbd40-b824-466d-8d13-e7574dffc83e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$労働基準監督署長への報告について正しいものはどれか。$q$,
  $e$事業者が遅滞なく結果報告書を提出する。根拠：同規則第58条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問18',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '520dbd40-b824-466d-8d13-e7574dffc83e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('520dbd40-b824-466d-8d13-e7574dffc83e'::uuid, $c$異常所見がなければ報告不要。$c$, false, 1),
  ('520dbd40-b824-466d-8d13-e7574dffc83e'::uuid, $c$1年分を一括提出する。$c$, false, 2),
  ('520dbd40-b824-466d-8d13-e7574dffc83e'::uuid, $c$定期健康診断後、遅滞なく所定報告書を所轄署長へ提出する。$c$, true, 3),
  ('520dbd40-b824-466d-8d13-e7574dffc83e'::uuid, $c$都道府県知事だけに提出する。$c$, false, 4),
  ('520dbd40-b824-466d-8d13-e7574dffc83e'::uuid, $c$労働者本人だけが提出する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '308b3ccc-bae3-4fc2-bbcc-49c2575eff4e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$固定装置で使用方法及び遮蔽物位置が一定の管理区域の測定頻度と記録保存期間の正しい組合せはどれか。$q$,
  $e$この条件では6月以内ごとに1回とでき、記録は5年間保存する。根拠：同規則第53条・第54条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問19',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'::uuid, $c$1月以内ごと―1年$c$, false, 1),
  ('308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'::uuid, $c$3月以内ごと―3年$c$, false, 2),
  ('308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'::uuid, $c$6月以内ごと―5年$c$, true, 3),
  ('308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'::uuid, $c$1年以内ごと―5年$c$, false, 4),
  ('308b3ccc-bae3-4fc2-bbcc-49c2575eff4e'::uuid, $c$2年以内ごと―30年$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '407169f9-2f38-4cd2-9e28-16c5e0688165',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線作業主任者について正しいものはどれか。$q$,
  $e$管理区域ごとに選任し、測定器装着点検、照射条件調整、立入確認、作業方法決定・指揮などを行う。根拠：同規則第46条・第47条。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問20',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '407169f9-2f38-4cd2-9e28-16c5e0688165'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('407169f9-2f38-4cd2-9e28-16c5e0688165'::uuid, $c$事業場全体で必ず1人。$c$, false, 1),
  ('407169f9-2f38-4cd2-9e28-16c5e0688165'::uuid, $c$無免許でも経験だけで選任可能。$c$, false, 2),
  ('407169f9-2f38-4cd2-9e28-16c5e0688165'::uuid, $c$管理区域ごとに免許を受けた者から選任する。$c$, true, 3),
  ('407169f9-2f38-4cd2-9e28-16c5e0688165'::uuid, $c$測定器装着点検は職務外。$c$, false, 4),
  ('407169f9-2f38-4cd2-9e28-16c5e0688165'::uuid, $c$作業者を指揮する職務はない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '88661c2e-9dab-49b6-81c8-5f4d4f2d090e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線に関する量と単位の組合せとして正しいものはどれか。$q$,
  $e$実効線量・等価線量はSv、吸収線量・カーマはGy、放射能はBq、照射線量はC/kgで表す。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問21',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '88661c2e-9dab-49b6-81c8-5f4d4f2d090e'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('88661c2e-9dab-49b6-81c8-5f4d4f2d090e'::uuid, $c$吸収線量―Bq$c$, false, 1),
  ('88661c2e-9dab-49b6-81c8-5f4d4f2d090e'::uuid, $c$放射能―Gy$c$, false, 2),
  ('88661c2e-9dab-49b6-81c8-5f4d4f2d090e'::uuid, $c$実効線量―Sv$c$, true, 3),
  ('88661c2e-9dab-49b6-81c8-5f4d4f2d090e'::uuid, $c$照射線量―J/kg$c$, false, 4),
  ('88661c2e-9dab-49b6-81c8-5f4d4f2d090e'::uuid, $c$空気カーマ―C/kg$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '78f53892-053e-4da5-8965-db564daaf56a',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$気体電離検出器について正しいものはどれか。$q$,
  $e$電離箱は一次イオン対を収集する。比例計数管では出力が一次電離量に比例し、GM計数管はエネルギー情報を得にくい。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問22',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '78f53892-053e-4da5-8965-db564daaf56a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('78f53892-053e-4da5-8965-db564daaf56a'::uuid, $c$電離箱は一次イオン対を収集し、通常は気体増幅を利用しない。$c$, true, 1),
  ('78f53892-053e-4da5-8965-db564daaf56a'::uuid, $c$比例計数管では気体増幅が生じない。$c$, false, 2),
  ('78f53892-053e-4da5-8965-db564daaf56a'::uuid, $c$GM計数管のパルス波高は入射エネルギーに正確に比例する。$c$, false, 3),
  ('78f53892-053e-4da5-8965-db564daaf56a'::uuid, $c$3種類とも同じ印加電圧範囲で使う。$c$, false, 4),
  ('78f53892-053e-4da5-8965-db564daaf56a'::uuid, $c$比例計数管では一次電離情報が完全に失われる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'a7b13900-0854-456f-a9ab-85cf43998eca',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$GM計数管について正しいものはどれか。$q$,
  $e$放電直後には不感時間があるため、高計数率で数え落としが増える。消滅ガスは不要な放電の持続や再放電を抑える。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問23',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'a7b13900-0854-456f-a9ab-85cf43998eca'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('a7b13900-0854-456f-a9ab-85cf43998eca'::uuid, $c$検出直後も次の放射線を必ず同効率で検出する。$c$, false, 1),
  ('a7b13900-0854-456f-a9ab-85cf43998eca'::uuid, $c$不感時間があり、高計数率では数え落としが増える。$c$, true, 2),
  ('a7b13900-0854-456f-a9ab-85cf43998eca'::uuid, $c$精密なエネルギー分析に適する。$c$, false, 3),
  ('a7b13900-0854-456f-a9ab-85cf43998eca'::uuid, $c$消滅ガスは放電を持続させる。$c$, false, 4),
  ('a7b13900-0854-456f-a9ab-85cf43998eca'::uuid, $c$プラトー外で高電圧にするほど安定する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '961d1cb4-2058-41d1-9400-3d6d3d6bf015',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$シンチレーション検出器について正しいものはどれか。$q$,
  $e$シンチレータの微弱な発光を光電子増倍管等で電気信号へ変換し、計数やエネルギー分析に利用する。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問24',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '961d1cb4-2058-41d1-9400-3d6d3d6bf015'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('961d1cb4-2058-41d1-9400-3d6d3d6bf015'::uuid, $c$シンチレータ内に生じた光を光電子増倍管などで電気信号に変換する。$c$, true, 1),
  ('961d1cb4-2058-41d1-9400-3d6d3d6bf015'::uuid, $c$光ではなく音波だけを生じる。$c$, false, 2),
  ('961d1cb4-2058-41d1-9400-3d6d3d6bf015'::uuid, $c$無機シンチレータはエックス線を検出できない。$c$, false, 3),
  ('961d1cb4-2058-41d1-9400-3d6d3d6bf015'::uuid, $c$出力は入射エネルギーと無関係。$c$, false, 4),
  ('961d1cb4-2058-41d1-9400-3d6d3d6bf015'::uuid, $c$光電子増倍管は光を減衰させるために使う。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7aa28273-e166-4843-b318-0509490861e1',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$サーベイメータの選定・使用方法として正しいものはどれか。$q$,
  $e$放射線の種類、エネルギー、線量率範囲、方向特性、応答時間を考慮する。未知の場合は通常、高い測定レンジから始める。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問25',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7aa28273-e166-4843-b318-0509490861e1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7aa28273-e166-4843-b318-0509490861e1'::uuid, $c$全機種の特性と範囲は同じ。$c$, false, 1),
  ('7aa28273-e166-4843-b318-0509490861e1'::uuid, $c$予想されるエネルギーと線量率が適用範囲内か確認する。$c$, true, 2),
  ('7aa28273-e166-4843-b318-0509490861e1'::uuid, $c$最大目盛超過値は最大目盛として記録する。$c$, false, 3),
  ('7aa28273-e166-4843-b318-0509490861e1'::uuid, $c$未知線量率でも最高感度レンジから始める。$c$, false, 4),
  ('7aa28273-e166-4843-b318-0509490861e1'::uuid, $c$時定数は応答速度に影響しない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '994d21c4-3abb-471d-bafd-abeb10454cb5',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$蛍光ガラス線量計とTLDについて正しいものはどれか。$q$,
  $e$蛍光ガラス線量計は一般に再読取り可能。TLDは加熱発光を測るため読取りで蓄積情報の多くが失われるが、熱処理後に再使用できる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問26',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '994d21c4-3abb-471d-bafd-abeb10454cb5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('994d21c4-3abb-471d-bafd-abeb10454cb5'::uuid, $c$蛍光ガラス線量計は読取りで情報が直ちに完全消失する。$c$, false, 1),
  ('994d21c4-3abb-471d-bafd-abeb10454cb5'::uuid, $c$TLDは加熱読取り後も同じ値を何度でも再読取りできる。$c$, false, 2),
  ('994d21c4-3abb-471d-bafd-abeb10454cb5'::uuid, $c$蛍光ガラス線量計は一般に再読取りできる。$c$, true, 3),
  ('994d21c4-3abb-471d-bafd-abeb10454cb5'::uuid, $c$両者とも積算線量を測定できない。$c$, false, 4),
  ('994d21c4-3abb-471d-bafd-abeb10454cb5'::uuid, $c$TLDは光を当てるだけで必ず読み出す。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'adfb4c2a-0804-405e-9ddd-89006bc8aade',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$肺に8 mSv、甲状腺に3 mSvの等価線量を受け、他は0であった。組織加重係数を肺0.12、甲状腺0.04とすると実効線量はいくらか。$q$,
  $e$$E=\sum w_TH_T=(0.12\times8)+(0.04\times3)=0.96+0.12=1.08$ mSv。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問27',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'adfb4c2a-0804-405e-9ddd-89006bc8aade'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('adfb4c2a-0804-405e-9ddd-89006bc8aade'::uuid, $c$0.44 mSv$c$, false, 1),
  ('adfb4c2a-0804-405e-9ddd-89006bc8aade'::uuid, $c$0.96 mSv$c$, false, 2),
  ('adfb4c2a-0804-405e-9ddd-89006bc8aade'::uuid, $c$1.08 mSv$c$, true, 3),
  ('adfb4c2a-0804-405e-9ddd-89006bc8aade'::uuid, $c$1.32 mSv$c$, false, 4),
  ('adfb4c2a-0804-405e-9ddd-89006bc8aade'::uuid, $c$11.0 mSv$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'cf015f64-2365-4e71-ada5-1922beb1f13a',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$半導体検出器及びε値・W値について正しいものはどれか。$q$,
  $e$シリコンのε値は約3.6 eVで、36 keVなら $36,000/3.6=10,000$ 組の電子・正孔対を生じる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問28',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'cf015f64-2365-4e71-ada5-1922beb1f13a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('cf015f64-2365-4e71-ada5-1922beb1f13a'::uuid, $c$ε値は電子・正孔対を1組作る平均エネルギーである。$c$, true, 1),
  ('cf015f64-2365-4e71-ada5-1922beb1f13a'::uuid, $c$シリコンのε値は空気のW値より一般に大きい。$c$, false, 2),
  ('cf015f64-2365-4e71-ada5-1922beb1f13a'::uuid, $c$半導体検出器は気体電離を利用する。$c$, false, 3),
  ('cf015f64-2365-4e71-ada5-1922beb1f13a'::uuid, $c$ε値が小さいほど生成対数は少ない。$c$, false, 4),
  ('cf015f64-2365-4e71-ada5-1922beb1f13a'::uuid, $c$ε値3.6 eVなら36 keVで約100組生じる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'c4c91f50-f891-4695-ba03-dcfb32315c4c',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$一定時間に6,400カウントを得た。ポアソン分布に従い他の誤差を無視すると、相対標準偏差は何％か。$q$,
  $e$標準偏差は $\sqrt{N}=80$、相対標準偏差は $80/6400=1/80=0.0125=1.25\%$。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問29',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'c4c91f50-f891-4695-ba03-dcfb32315c4c'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('c4c91f50-f891-4695-ba03-dcfb32315c4c'::uuid, $c$0.16％$c$, false, 1),
  ('c4c91f50-f891-4695-ba03-dcfb32315c4c'::uuid, $c$0.80％$c$, false, 2),
  ('c4c91f50-f891-4695-ba03-dcfb32315c4c'::uuid, $c$1.25％$c$, true, 3),
  ('c4c91f50-f891-4695-ba03-dcfb32315c4c'::uuid, $c$2.50％$c$, false, 4),
  ('c4c91f50-f891-4695-ba03-dcfb32315c4c'::uuid, $c$8.00％$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '79ca7e29-8fee-4f21-a51d-9ab9252dfb15',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$校正定数が70 keVで0.92、110 keVで1.08である。直線補間した95 keVでの校正定数はいくらか。$q$,
  $e$$k=0.92+[(95-70)/(110-70)](1.08-0.92)=0.92+(25/40)\times0.16=1.02$。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問30',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '79ca7e29-8fee-4f21-a51d-9ab9252dfb15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('79ca7e29-8fee-4f21-a51d-9ab9252dfb15'::uuid, $c$0.96$c$, false, 1),
  ('79ca7e29-8fee-4f21-a51d-9ab9252dfb15'::uuid, $c$0.98$c$, false, 2),
  ('79ca7e29-8fee-4f21-a51d-9ab9252dfb15'::uuid, $c$1.00$c$, false, 3),
  ('79ca7e29-8fee-4f21-a51d-9ab9252dfb15'::uuid, $c$1.02$c$, true, 4),
  ('79ca7e29-8fee-4f21-a51d-9ab9252dfb15'::uuid, $c$1.06$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '5621907d-4b2a-4f8d-af5a-38271a89bf77',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$DNA損傷と修復について正しいものはどれか。$q$,
  $e$二本鎖切断の修復失敗・誤修復は、染色体異常、突然変異、細胞死などにつながる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問31',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '5621907d-4b2a-4f8d-af5a-38271a89bf77'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('5621907d-4b2a-4f8d-af5a-38271a89bf77'::uuid, $c$一本鎖切断は一切修復されない。$c$, false, 1),
  ('5621907d-4b2a-4f8d-af5a-38271a89bf77'::uuid, $c$二本鎖切断の誤修復は染色体異常や突然変異につながることがある。$c$, true, 2),
  ('5621907d-4b2a-4f8d-af5a-38271a89bf77'::uuid, $c$放射線は細胞膜だけに作用する。$c$, false, 3),
  ('5621907d-4b2a-4f8d-af5a-38271a89bf77'::uuid, $c$細胞周期や酸素の影響を受けない。$c$, false, 4),
  ('5621907d-4b2a-4f8d-af5a-38271a89bf77'::uuid, $c$細胞が生存すれば遺伝情報は必ず正常である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'b713078e-30d4-49c4-93aa-5e98a01f6e42',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$組織・器官の放射線感受性について正しいものはどれか。$q$,
  $e$造血組織、生殖腺、腸上皮などは比較的高感受性で、筋肉や成熟神経組織は比較的低感受性である。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問32',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'b713078e-30d4-49c4-93aa-5e98a01f6e42'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('b713078e-30d4-49c4-93aa-5e98a01f6e42'::uuid, $c$一般に細胞分裂が盛んで未分化な細胞ほど高感受性である。$c$, true, 1),
  ('b713078e-30d4-49c4-93aa-5e98a01f6e42'::uuid, $c$成熟神経細胞は造血幹細胞より高感受性。$c$, false, 2),
  ('b713078e-30d4-49c4-93aa-5e98a01f6e42'::uuid, $c$筋肉はリンパ組織より高感受性。$c$, false, 3),
  ('b713078e-30d4-49c4-93aa-5e98a01f6e42'::uuid, $c$生殖腺細胞は特に抵抗性が高い。$c$, false, 4),
  ('b713078e-30d4-49c4-93aa-5e98a01f6e42'::uuid, $c$分裂頻度と無関係である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'ef6eaf81-b0c3-48c1-81d5-c7578f7641cf',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$線量率効果及びしきい線量について正しいものはどれか。$q$,
  $e$組織反応には一般にしきい線量がある。多くの場合、低線量率・分割照射では修復が進み影響が小さくなる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問33',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'::uuid, $c$同じ総線量なら照射条件にかかわらず影響は必ず同じ。$c$, false, 1),
  ('ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'::uuid, $c$組織反応には一般にしきい線量がある。$c$, true, 2),
  ('ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'::uuid, $c$確率的影響では重症度が線量に比例する。$c$, false, 3),
  ('ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'::uuid, $c$分割照射は必ず影響を大きくする。$c$, false, 4),
  ('ef6eaf81-b0c3-48c1-81d5-c7578f7641cf'::uuid, $c$低線量率なら影響は必ず完全消失する。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$半致死線量について正しいものはどれか。$q$,
  $e$LD50/30など、観察期間を伴う集団指標であり、線量率、被ばく条件、個体差、医療処置などで変わる。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問34',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'::uuid, $c$集団の50％が定めた観察期間内に死亡すると推定される線量。$c$, true, 1),
  ('9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'::uuid, $c$個人の身体半分が死亡する線量。$c$, false, 2),
  ('9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'::uuid, $c$全致死線量は医療処置等に関係なく一定。$c$, false, 3),
  ('9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'::uuid, $c$観察期間なしでも一つに決まる。$c$, false, 4),
  ('9cd0324b-3d3f-4829-b0d4-cef7a6d4f96f'::uuid, $c$確率的影響だけの指標である。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  'e96f2714-5cfa-4ffb-b479-d6d3d904d514',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$急性放射線症候群について正しいものはどれか。$q$,
  $e$急性全身被ばくでは前駆症状、潜伏期を経て、線量に応じ造血器症候群や消化管症候群などが現れることがある。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問35',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = 'e96f2714-5cfa-4ffb-b479-d6d3d904d514'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('e96f2714-5cfa-4ffb-b479-d6d3d904d514'::uuid, $c$初期に悪心、嘔吐、食欲不振などが現れることがある。$c$, true, 1),
  ('e96f2714-5cfa-4ffb-b479-d6d3d904d514'::uuid, $c$造血器障害では白血球・血小板が増え続ける。$c$, false, 2),
  ('e96f2714-5cfa-4ffb-b479-d6d3d904d514'::uuid, $c$消化管症候群は造血器症候群より一般に低線量で生じる。$c$, false, 3),
  ('e96f2714-5cfa-4ffb-b479-d6d3d904d514'::uuid, $c$潜伏期後に症状は現れない。$c$, false, 4),
  ('e96f2714-5cfa-4ffb-b479-d6d3d904d514'::uuid, $c$手指局所被ばくだけで必ず全身症候群になる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$直接作用と間接作用について正しいものはどれか。$q$,
  $e$直接作用は標的分子を直接電離・励起する作用。間接作用は水の放射線分解生成物を介する作用で、低LETのエックス線では寄与が大きい。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問36',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'::uuid, $c$直接作用は熱だけによる。$c$, false, 1),
  ('7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'::uuid, $c$間接作用はDNAを直接電離する作用。$c$, false, 2),
  ('7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'::uuid, $c$間接作用では水の放射線分解によるラジカルなどが生体分子を損傷する。$c$, true, 3),
  ('7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'::uuid, $c$エックス線影響に水は関与しない。$c$, false, 4),
  ('7c6e5ef4-d98d-446b-ae3d-49fa51aebd8b'::uuid, $c$酸素存在で間接作用は必ず弱くなる。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '13323269-5b3b-470f-951d-8c19a0c8c4ab',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$RBEとLETについて正しいものはどれか。$q$,
  $e$RBEは同一効果を生じる基準放射線線量を対象放射線線量で除す。非常に高いLETでは過剰効果によりRBEが低下することもある。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問37',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '13323269-5b3b-470f-951d-8c19a0c8c4ab'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('13323269-5b3b-470f-951d-8c19a0c8c4ab'::uuid, $c$LETは単位距離当たりに付与するエネルギーを表す。$c$, true, 1),
  ('13323269-5b3b-470f-951d-8c19a0c8c4ab'::uuid, $c$RBEは物理的半減期の比較値。$c$, false, 2),
  ('13323269-5b3b-470f-951d-8c19a0c8c4ab'::uuid, $c$RBEは対象線量を基準線量で除す。$c$, false, 3),
  ('13323269-5b3b-470f-951d-8c19a0c8c4ab'::uuid, $c$LET上昇に伴いRBEは無限に増え続ける。$c$, false, 4),
  ('13323269-5b3b-470f-951d-8c19a0c8c4ab'::uuid, $c$エックス線はアルファ線より高LET。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '542843ee-767e-44fd-a704-0de1db550b52',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$高線量全身被ばく後の血球変化について正しいものはどれか。$q$,
  $e$リンパ球は比較的早期から減少し得る。骨髄障害により顆粒球や血小板も減少する。成熟赤血球の変化は比較的遅い。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問38',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '542843ee-767e-44fd-a704-0de1db550b52'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('542843ee-767e-44fd-a704-0de1db550b52'::uuid, $c$リンパ球は高感受性で早期に減少することがある。$c$, true, 1),
  ('542843ee-767e-44fd-a704-0de1db550b52'::uuid, $c$赤血球は直後に必ずゼロになる。$c$, false, 2),
  ('542843ee-767e-44fd-a704-0de1db550b52'::uuid, $c$血小板は変化しない。$c$, false, 3),
  ('542843ee-767e-44fd-a704-0de1db550b52'::uuid, $c$白血球は増加し続ける。$c$, false, 4),
  ('542843ee-767e-44fd-a704-0de1db550b52'::uuid, $c$血球変化は骨髄障害と無関係。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '0d555643-0df1-4653-b8d9-0482e27c0f75',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線皮膚炎について正しいものはどれか。$q$,
  $e$比較的高い局所被ばくで紅斑、脱毛、落屑、水疱、潰瘍などが生じ得る。組織反応であり一般にしきい線量がある。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問39',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '0d555643-0df1-4653-b8d9-0482e27c0f75'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('0d555643-0df1-4653-b8d9-0482e27c0f75'::uuid, $c$紅斑、脱毛、水疱、潰瘍などが含まれる。$c$, true, 1),
  ('0d555643-0df1-4653-b8d9-0482e27c0f75'::uuid, $c$しきい線量がなく微量でも必ず潰瘍が生じる。$c$, false, 2),
  ('0d555643-0df1-4653-b8d9-0482e27c0f75'::uuid, $c$重症度は線量と無関係。$c$, false, 3),
  ('0d555643-0df1-4653-b8d9-0482e27c0f75'::uuid, $c$照射面積・線量率は影響しない。$c$, false, 4),
  ('0d555643-0df1-4653-b8d9-0482e27c0f75'::uuid, $c$基底細胞層は影響を受けない。$c$, false, 5)
) AS incoming(question_id, choice_text, is_correct, sort_order)
WHERE NOT EXISTS (
  SELECT 1 FROM choices c WHERE c.question_id = incoming.question_id
);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
SELECT
  '4f3bfb2e-5fc4-474e-a078-4b40f991ad7a',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線による遺伝的影響について正しいものはどれか。$q$,
  $e$生殖細胞の遺伝子変異・染色体異常が受精に関与すれば子孫へ影響する可能性がある。放射線防護上は確率的影響として扱う。

---

法令問題は、2026年9月時点の電離放射線障害防止規則に基づいて作成した。$e$,
  'original',
  'エックス線作業主任者 オリジナル問題 問40',
  NULL
WHERE NOT EXISTS (
  SELECT 1 FROM questions WHERE id = '4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT * FROM (VALUES
  ('4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'::uuid, $c$体細胞変異だけが必ず子孫へ伝わる。$c$, false, 1),
  ('4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'::uuid, $c$生殖細胞の突然変異は子孫に影響する可能性がある。$c$, true, 2),
  ('4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'::uuid, $c$線量増加で個々の影響の重症度だけが増す組織反応である。$c$, false, 3),
  ('4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'::uuid, $c$被ばく本人にだけ現れる。$c$, false, 4),
  ('4f3bfb2e-5fc4-474e-a078-4b40f991ad7a'::uuid, $c$生殖細胞は放射線で変異しない。$c$, false, 5)
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
  WHERE exam_id = 'xray'
    AND source_type = 'original'
    AND source_note LIKE 'エックス線作業主任者 オリジナル問題%';
  IF original_count <> 40 THEN
    RAISE EXCEPTION 'xray original questions must be 40 (got %)', original_count;
  END IF;
END $$;

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'xray', exam_types.id,
  'エックス線作業主任者模擬試験A', 240, 40,
  'エックス線作業主任者 オリジナル問題',
  NULL
FROM exam_types
WHERE exam_types.exam_id = 'xray'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'xray'
      AND name = 'エックス線作業主任者模擬試験A'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'xray', exam_types.id,
  'エックス線作業主任者模擬試験A【生体影響免除】', 180, 30,
  'エックス線作業主任者 オリジナル問題',
  ARRAY['エックス線の管理に関する知識', '関係法令', 'エックス線の測定に関する知識']
FROM exam_types
WHERE exam_types.exam_id = 'xray'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'xray'
      AND name = 'エックス線作業主任者模擬試験A【生体影響免除】'
  );

INSERT INTO mock_exams (
  exam_id, exam_type_id, name, time_limit_minutes, question_count, source_filter, category_scope
)
SELECT
  'xray', exam_types.id,
  'エックス線作業主任者模擬試験A【測定・生体影響免除】', 120, 20,
  'エックス線作業主任者 オリジナル問題',
  ARRAY['エックス線の管理に関する知識', '関係法令']
FROM exam_types
WHERE exam_types.exam_id = 'xray'
  AND exam_types.code = 'common'
  AND NOT EXISTS (
    SELECT 1 FROM mock_exams
    WHERE exam_id = 'xray'
      AND name = 'エックス線作業主任者模擬試験A【測定・生体影響免除】'
  );
