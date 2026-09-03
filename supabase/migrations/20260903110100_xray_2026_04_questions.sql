-- xray 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'xray', 'エックス線作業主任者', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'xray');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'xray', 'common', 'エックス線作業主任者'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'xray' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'xray', 'common', 'エックス線作業主任者', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'xray' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の管理に関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の管理に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', '関係法令', 2
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の測定に関する知識', 3
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の測定に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の生体に与える影響に関する知識', 4
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の生体に与える影響に関する知識'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '396ca9fe-df3e-40a8-94a9-ae67e019fd5a',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('396ca9fe-df3e-40a8-94a9-ae67e019fd5a', $c$エックス線は、エックス線管の陰極と陽極の間に高電圧をかけて発生させる高エネルギーの荷電粒子の流れである。$c$, false, 1),
  ('396ca9fe-df3e-40a8-94a9-ae67e019fd5a', $c$エックス線は、直接電離放射線である。$c$, false, 2),
  ('396ca9fe-df3e-40a8-94a9-ae67e019fd5a', $c$連続エックス線は、高エネルギー電子が原子核近傍の強い電場を通過するとき急に減速され、運動エネルギーの一部を電磁波の形で放出するものである。$c$, true, 3),
  ('396ca9fe-df3e-40a8-94a9-ae67e019fd5a', $c$エックス線管の管電圧と管電流が一定の場合、ターゲット元素の原子番号が大きいほど、連続エックス線の最短波長は短くなる。$c$, false, 4),
  ('396ca9fe-df3e-40a8-94a9-ae67e019fd5a', $c$制動エックス線は、軌道電子が、エネルギー準位の高い軌道から低い軌道へと遷移するときに発生する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0a36bb0a-f675-4c14-a92f-92dc9640ba15',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$工業用エックス線装置のエックス線管及びエックス線の発生に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0a36bb0a-f675-4c14-a92f-92dc9640ba15', $c$エックス線管の内部には、効率的にエックス線を発生させるためにアルゴンなどの不活性ガスが封入されている。$c$, false, 1),
  ('0a36bb0a-f675-4c14-a92f-92dc9640ba15', $c$陰極のフィラメント端子間の電圧は、フィラメント加熱用の降圧変圧器を用いて10～20V程度にされている。$c$, true, 2),
  ('0a36bb0a-f675-4c14-a92f-92dc9640ba15', $c$陽極のターゲットにタングステンが多く用いられる主な理由は、熱伝導率が高く、加工しやすいことである。$c$, false, 3),
  ('0a36bb0a-f675-4c14-a92f-92dc9640ba15', $c$陽極のターゲット上のエックス線が発生する部分を実効焦点といい、これをエックス線束の利用方向から見たものを実焦点という。$c$, false, 4),
  ('0a36bb0a-f675-4c14-a92f-92dc9640ba15', $c$陽極のターゲットに衝突する直前の電子の運動エネルギーは、管電圧の２乗に比例する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a121408f-71e3-44eb-8309-d0fd7cb7e035',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線装置の管電圧を一定にして、管電流を増加させた場合に、発生する連続エックス線に認められる変化として、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a121408f-71e3-44eb-8309-d0fd7cb7e035', $c$最大エネルギーは、管電流に比例して大きくなる。$c$, false, 1),
  ('a121408f-71e3-44eb-8309-d0fd7cb7e035', $c$最大強度を示す波長は、短くなる。$c$, false, 2),
  ('a121408f-71e3-44eb-8309-d0fd7cb7e035', $c$線質は、硬くなる。$c$, false, 3),
  ('a121408f-71e3-44eb-8309-d0fd7cb7e035', $c$全強度は、管電流にほぼ比例して大きくなる。$c$, true, 4),
  ('a121408f-71e3-44eb-8309-d0fd7cb7e035', $c$発生効率は、管電流にほぼ比例して高くなる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9b4d9560-e4b2-4b0f-abe9-580c662362e1',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線と物質との相互作用に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9b4d9560-e4b2-4b0f-abe9-580c662362e1', $c$レイリー散乱では、エックス線の方向は変わるが、エネルギーは変わらない。$c$, false, 1),
  ('9b4d9560-e4b2-4b0f-abe9-580c662362e1', $c$光電効果が起こる確率は、エックス線のエネルギーが高くなるほど低下する。$c$, false, 2),
  ('9b4d9560-e4b2-4b0f-abe9-580c662362e1', $c$光電効果により原子から放出される電子を反跳電子という。$c$, true, 3),
  ('9b4d9560-e4b2-4b0f-abe9-580c662362e1', $c$コンプトン効果が起こる確率は、物質の原子番号が大きくなるほど増大する。$c$, false, 4),
  ('9b4d9560-e4b2-4b0f-abe9-580c662362e1', $c$コンプトン効果による散乱エックス線は、入射エックス線のエネルギーが低い場合は、横方向より前方と後方に散乱されやすい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '41204b5a-b176-48d3-b851-888c26eece48',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$単一エネルギーで太い線束のエックス線が物質を透過するときの減弱及び再生係数(ビルドアップ係数)に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('41204b5a-b176-48d3-b851-888c26eece48', $c$太い線束のエックス線では、散乱線が加わるため、細い線束のエックス線より減弱曲線の勾配は緩やかになり、見かけ上、減弱係数が大きくなる。$c$, true, 1),
  ('41204b5a-b176-48d3-b851-888c26eece48', $c$再生係数は、入射エックス線の線量率には依存しない。$c$, false, 2),
  ('41204b5a-b176-48d3-b851-888c26eece48', $c$再生係数は、物質の厚さが薄くなるほど小さくなる。$c$, false, 3),
  ('41204b5a-b176-48d3-b851-888c26eece48', $c$再生係数は、透過後、物質から離れるほど小さくなり、その値は１に近づく。$c$, false, 4),
  ('41204b5a-b176-48d3-b851-888c26eece48', $c$再生係数は、入射エックス線のエネルギーや物質の種類によって異なる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '573ed210-ae65-4202-81c5-ec2b2258d756',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$あるエネルギーのエックス線に対する鉛の質量減弱係数が0.4cm²/gであるとき、このエックス線に対する鉛の１/10価層に最も近い厚さは次のうちどれか。ただし、鉛の密度は11.4g/cm³とし、loge２＝0.69、loge５＝1.61とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('573ed210-ae65-4202-81c5-ec2b2258d756', $c$1 mm$c$, false, 1),
  ('573ed210-ae65-4202-81c5-ec2b2258d756', $c$2 mm$c$, false, 2),
  ('573ed210-ae65-4202-81c5-ec2b2258d756', $c$5 mm$c$, true, 3),
  ('573ed210-ae65-4202-81c5-ec2b2258d756', $c$10 mm$c$, false, 4),
  ('573ed210-ae65-4202-81c5-ec2b2258d756', $c$20 mm$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a303b0b6-65fc-451b-b68f-0e84ec890efb',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$図のように、エックス線装置を用い、厚さ20mmの鋼板に管電圧100kVでエックス線を垂直に照射したとき、照射野の中心から２mの距離にある図のＡ点からＤ点における散乱線の空気カーマ率の大きさに関する次の記述のうち、正しいものはどれか。ただし、鋼板からの散乱線以外の影響は考えないものとし、また、照射条件は一定とする。なお、Ａ点は散乱角150°、Ｂ点は120°、Ｃ点は60°、Ｄ点は30°の位置にある。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a303b0b6-65fc-451b-b68f-0e84ec890efb', $c$Ａ点における空気カーマ率は、鋼板を同じ厚さのアルミニウム板に替えると増加する。$c$, true, 1),
  ('a303b0b6-65fc-451b-b68f-0e84ec890efb', $c$Ａ点における空気カーマ率は、鋼板の厚さを30mmに替えると減少する。$c$, false, 2),
  ('a303b0b6-65fc-451b-b68f-0e84ec890efb', $c$Ｂ点における空気カーマ率は、Ａ点における空気カーマ率より大きい。$c$, false, 3),
  ('a303b0b6-65fc-451b-b68f-0e84ec890efb', $c$Ｃ点における空気カーマ率は、Ｄ点における空気カーマ率より大きい。$c$, false, 4),
  ('a303b0b6-65fc-451b-b68f-0e84ec890efb', $c$Ｄ点における空気カーマ率は、鋼板の厚さを10mmに替えると減少する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b50c16b0-c366-4874-91e6-812ea88b0bbc',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線を利用した各種試験装置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b50c16b0-c366-4874-91e6-812ea88b0bbc', $c$蛍光エックス線分析装置は、試料にエックス線を照射して発生した特性エックス線(蛍光エックス線)の波長を分析し、又はエネルギーを測定することによって、元素分析を行う装置である。$c$, false, 1),
  ('b50c16b0-c366-4874-91e6-812ea88b0bbc', $c$エックス線マイクロアナライザーは、細く絞ったエックス線を物質に照射すると特有の回折像が得られることを利用して、物質の結晶構造を解析する装置である。$c$, true, 2),
  ('b50c16b0-c366-4874-91e6-812ea88b0bbc', $c$散乱型厚さ計は、被検査物体にエックス線を照射したときに発生する後方散乱線の強度が、被検査物体の厚さに応じて変化することを利用した装置である。$c$, false, 3),
  ('b50c16b0-c366-4874-91e6-812ea88b0bbc', $c$エックス線応力測定装置は、応力による結晶の面間隔の変化をエックス線の回折を利用して調べることにより、物質内の残留応力の大きさを測定する装置である。$c$, false, 4),
  ('b50c16b0-c366-4874-91e6-812ea88b0bbc', $c$エックス線透過試験装置は、被検査物体を透過したエックス線による画像を観察する装置で、画像の検出にはフィルムなどが用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e341c80b-9e39-4da4-a661-ecd30b252846',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線装置を用いて透過写真撮影を行う場合のエックス線の遮蔽及び散乱線の低減に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e341c80b-9e39-4da4-a661-ecd30b252846', $c$絞りは、エックス線束の広がりを制限し、エックス線を必要な部分にだけ照射するために用いる。$c$, false, 1),
  ('e341c80b-9e39-4da4-a661-ecd30b252846', $c$ろ過板は、被写体からの後方散乱線の低減に効果がある。$c$, false, 2),
  ('e341c80b-9e39-4da4-a661-ecd30b252846', $c$照射筒は、照射口に取り付けるラッパ状の遮蔽体で、エックス線束及び散乱線が外部へ漏えいしないようにするために用いる。$c$, false, 3),
  ('e341c80b-9e39-4da4-a661-ecd30b252846', $c$遮蔽体には、原子番号が大きく、密度の高い物質を用いるのがよい。$c$, false, 4),
  ('e341c80b-9e39-4da4-a661-ecd30b252846', $c$コンクリートの遮蔽体は、同程度の遮蔽効果を得るために鉛の約２倍の厚さが必要であるが、施工が容易で安価であるため広く用いられている。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f05e0383-31bd-4c7b-9b3d-73550e2c33d4',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$あるエックス線装置のエックス線管の焦点から１m離れた点での１cm線量当量率は120mSv/hであった。このエックス線装置を用いて、鉄板とアルミニウム板を重ね合わせた板に細い線束のエックス線を照射したとき、エックス線管の焦点から１m離れた点における透過後の１cm線量当量率は、15mSv/hであった。このとき、鉄板とアルミニウム板の厚さの組合せとして正しいものは次のうちどれか。ただし、このエックス線に対する鉄の減弱係数を3.0cm⁻¹、アルミニウムの減弱係数を0.5cm⁻¹とし、鉄板及びアルミニウム板を透過した後のエックス線の実効エネルギーは、透過前と変わらないものとし、散乱線による影響は無いものとする。なお、 loge２＝0.69とする。鉄板 アルミニウム板$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f05e0383-31bd-4c7b-9b3d-73550e2c33d4', $c$2.3 mm 13.8 mm$c$, false, 1),
  ('f05e0383-31bd-4c7b-9b3d-73550e2c33d4', $c$2.3 mm 20.7 mm$c$, false, 2),
  ('f05e0383-31bd-4c7b-9b3d-73550e2c33d4', $c$4.6 mm 13.8 mm$c$, true, 3),
  ('f05e0383-31bd-4c7b-9b3d-73550e2c33d4', $c$4.6 mm 20.7 mm$c$, false, 4),
  ('f05e0383-31bd-4c7b-9b3d-73550e2c33d4', $c$4.6 mm 27.6 mm$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ec758c29-59d0-4fe9-90aa-4e87e1a36d5d',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて放射線業務を行う場合の管理区域に関する次の記述のうち、労働安全衛生関係法令上、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ec758c29-59d0-4fe9-90aa-4e87e1a36d5d', $c$管理区域は、外部放射線による等価線量が３か月間につき1.3mSvを超えるおそれのある区域である。$c$, false, 1),
  ('ec758c29-59d0-4fe9-90aa-4e87e1a36d5d', $c$管理区域には、放射線業務従事者以外の者が立ち入ることを禁止し、その旨を明示しなければならない。$c$, false, 2),
  ('ec758c29-59d0-4fe9-90aa-4e87e1a36d5d', $c$放射線装置室内で放射線業務を行う場合、その室の入口に放射線装置室である旨の標識を掲げたときは、管理区域を標識により明示する必要はない。$c$, false, 3),
  ('ec758c29-59d0-4fe9-90aa-4e87e1a36d5d', $c$管理区域設定に当たっての外部放射線による実効線量の算定は、原則として１cm線量当量により行うが、70μm線量当量が１cm線量当量の10倍を超えるおそれのある場合においては、70μm線量当量により行うものとする。$c$, false, 4),
  ('ec758c29-59d0-4fe9-90aa-4e87e1a36d5d', $c$管理区域に立ち入る労働者は、放射線測定器を用いて外部被ばくによる線量を測定することが著しく困難な場合を除き、管理区域内において、放射線測定器を装着しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '94cc6e76-1c07-4a5e-98df-4e713b4dcb79',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$放射線業務従事者の被ばく限度として、労働安全衛生関係法令上、誤っているものは次のうちどれか。ただし、放射線業務従事者は、緊急作業には従事しないものとし、また、被ばく限度に関する経過措置の適用はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('94cc6e76-1c07-4a5e-98df-4e713b4dcb79', $c$放射線業務従事者が眼の水晶体に受ける等価線量の限度……………… ５年間につき100mSv及び１年間につき50mSv$c$, false, 1),
  ('94cc6e76-1c07-4a5e-98df-4e713b4dcb79', $c$妊娠と診断された女性の放射線業務従事者が腹部表面に受ける等価線量の限度 ……………… 妊娠と診断されたときから出産までの間につき２mSv$c$, false, 2),
  ('94cc6e76-1c07-4a5e-98df-4e713b4dcb79', $c$男性の放射線業務従事者が皮膚に受ける等価線量の限度……………… １年間につき500mSv$c$, false, 3),
  ('94cc6e76-1c07-4a5e-98df-4e713b4dcb79', $c$男性の放射線業務従事者が受ける実効線量の限度……………… ５年間につき100mSv、かつ、１年間につき50mSv$c$, false, 4),
  ('94cc6e76-1c07-4a5e-98df-4e713b4dcb79', $c$女性の放射線業務従事者(妊娠する可能性がないと診断されたもの及び妊娠と診断されたものを除く。)が受ける実効線量の限度……………… １か月間につき３mSv$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '35a639e5-1522-47fc-a560-66f9e2fbc7c5',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を取り扱う放射線業務従事者が管理区域内で受ける外部被ばくによる線量を測定するために放射線測定器を装着する全ての部位として、労働安全衛生関係法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('35a639e5-1522-47fc-a560-66f9e2fbc7c5', $c$最も多く放射線にさらされるおそれのある部位が手指であり、次に多い部位が腹・大腿部である女性の放射線業務従事者(妊娠する可能性がないと診断されたものを除く。) ………………………………… 腹部及び手指$c$, false, 1),
  ('35a639e5-1522-47fc-a560-66f9e2fbc7c5', $c$最も多く放射線にさらされるおそれのある部位が腹・大腿部であり、次に多い部位が手指である女性の放射線業務従事者(妊娠する可能性がないと診断されたものを除く。) ………………………………… 腹部のみ$c$, false, 2),
  ('35a639e5-1522-47fc-a560-66f9e2fbc7c5', $c$最も多く放射線にさらされるおそれのある部位が頭・頸部であり、次に多い部位が腹・大腿部である男性の放射線業務従事者………………………………………………………… 胸部及び頭・頸部$c$, false, 3),
  ('35a639e5-1522-47fc-a560-66f9e2fbc7c5', $c$最も多く放射線にさらされるおそれのある部位が胸・上腕部であり、次に多い部位が手指である男性の放射線業務従事者 ……… 胸部のみ$c$, false, 4),
  ('35a639e5-1522-47fc-a560-66f9e2fbc7c5', $c$最も多く放射線にさらされるおそれのある部位が手指であり、次に多い部位が頭・頸部である男性の放射線業務従事者 ………… 胸部及び手指$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f785dea5-b501-4679-97a1-ce02b4fa8bc9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を使用する放射線業務従事者が管理区域内において外部被ばくを受けるとき、算定し、記録しなければならない線量として、労働安全衛生関係法令上、正しいものは次のうちどれか。ただし、放射線業務従事者は、緊急作業には従事しないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f785dea5-b501-4679-97a1-ce02b4fa8bc9', $c$５年間において、実効線量が１年間につき20mSvを超えたことのある男性の放射線業務従事者の実効線量については、６か月ごと及び５年ごとの合計$c$, false, 1),
  ('f785dea5-b501-4679-97a1-ce02b4fa8bc9', $c$５年間において、実効線量が１年間につき20mSvを超えたことのない男性の放射線業務従事者の実効線量については、１年ごと及び５年ごとの合計$c$, false, 2),
  ('f785dea5-b501-4679-97a1-ce02b4fa8bc9', $c$放射線業務従事者の皮膚に受けた等価線量については、３か月ごと及び１年ごとの合計$c$, true, 3),
  ('f785dea5-b501-4679-97a1-ce02b4fa8bc9', $c$１か月間に受ける実効線量が1.7mSvを超えるおそれのある女性の放射線業務従事者(妊娠する可能性がないと診断されたものを除く。)の実効線量については、３か月ごと、１年ごと及び５年ごとの合計$c$, false, 4),
  ('f785dea5-b501-4679-97a1-ce02b4fa8bc9', $c$妊娠中の女性の放射線業務従事者の腹部表面に受ける等価線量については、３か月ごと及び妊娠中の合計$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8deec79e-9fbc-4586-8507-c488afd2b654',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$工業用の特定エックス線装置を用いて放射線装置室で透視を行うときに講ずべき措置について述べた次の文中の[ ]内に入れるＡからＣの語句又は数値の組合せとして、労働安全衛生関係法令上、正しいものは(１)～(５)のうちどれか。ただし、エックス線の照射中に透視作業従事労働者の身体の一部が当該装置の内部に入るおそれがあるものとする。「利用線錐中の受像器を通過したエックス線の空気中の[ Ａ ]が、エックス線管の焦点から[ Ｂ ]mの距離において、[ Ｃ ]μGy/h以下になるようにすること。」
Ａ Ｂ Ｃ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8deec79e-9fbc-4586-8507-c488afd2b654', $c$吸収線量 １ 17.4$c$, false, 1),
  ('8deec79e-9fbc-4586-8507-c488afd2b654', $c$吸収線量 ５ 30$c$, false, 2),
  ('8deec79e-9fbc-4586-8507-c488afd2b654', $c$空気カーマ率 １ 17.4$c$, true, 3),
  ('8deec79e-9fbc-4586-8507-c488afd2b654', $c$空気カーマ率 １ 30$c$, false, 4),
  ('8deec79e-9fbc-4586-8507-c488afd2b654', $c$空気カーマ率 ５ 17.4$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '67da0dc8-f386-401f-8bf0-85bbdddbfdb8',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置構造規格に基づき、特定エックス線装置の見やすい箇所に表示しなければならない事項に該当するものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('67da0dc8-f386-401f-8bf0-85bbdddbfdb8', $c$製造者名$c$, true, 1),
  ('67da0dc8-f386-401f-8bf0-85bbdddbfdb8', $c$製造番号$c$, false, 2),
  ('67da0dc8-f386-401f-8bf0-85bbdddbfdb8', $c$設置年月$c$, false, 3),
  ('67da0dc8-f386-401f-8bf0-85bbdddbfdb8', $c$エックス線管の遮蔽能力$c$, false, 4),
  ('67da0dc8-f386-401f-8bf0-85bbdddbfdb8', $c$エックス線作業主任者の氏名$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '036cb623-cf53-47e2-b0b9-0deddbe2b96e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$電離放射線健康診断(以下「健康診断」という。)の実施について、労働安全衛生関係法令に違反しているものは次のうちどれか。ただし、労働者は緊急作業に従事しないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('036cb623-cf53-47e2-b0b9-0deddbe2b96e', $c$放射線業務に配置替えの際に行う健康診断において、被ばく歴のない労働者に対し、医師が必要と認めなかったので、「皮膚の検査」を省略している。$c$, true, 1),
  ('036cb623-cf53-47e2-b0b9-0deddbe2b96e', $c$定期の健康診断において、健康診断を行おうとする日の属する年の前年１年間に受けた実効線量が５mSvを超えず、かつ、健康診断を行おうとする日の属する１年間に受ける実効線量が５mSvを超えるおそれのない労働者に対し、医師が必要と認めなかったので、「被ばく歴の有無(被ばく歴を有する者については、作業の場所、内容及び期間、放射線障害の有無、自覚症状の有無その他放射線による被ばくに関する事項)の調査及びその評価」を除く他の項目を省略している。$c$, false, 2),
  ('036cb623-cf53-47e2-b0b9-0deddbe2b96e', $c$事業場において実施した健康診断の項目に異常の所見があると診断された労働者について、その結果に基づき、健康を保持するために必要な措置について、健康診断が行われた日から３か月以内に、医師の意見を聴き、その意見を電離放射線健康診断個人票に記載している。$c$, false, 3),
  ('036cb623-cf53-47e2-b0b9-0deddbe2b96e', $c$管理区域に一時的に立ち入るが放射線業務に従事していない労働者に対しては、健康診断を行っていない。$c$, false, 4),
  ('036cb623-cf53-47e2-b0b9-0deddbe2b96e', $c$定期の健康診断を行ったときは、遅滞なく、電離放射線健康診断結果報告書を所轄労働基準監督署長に提出しているが、雇入れ又は放射線業務に配置替えの際に行った健康診断については提出していない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '52567c64-66da-4e03-b26d-2320924a06e9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて放射線業務を行う作業場の管理区域に該当する部分の作業環境測定に関する次の文中の[ ]内に入れるＡからＣの語句の組合せとして、労働安全衛生関係法令上、正しいものは(１)～(５)のうちどれか。「作業場のうち管理区域に該当する部分について、１か月以内(エックス線装置を固定して使用する場合において使用の方法及び遮蔽物の位置が一定しているときは、[ Ａ ]以内)ごとに１回、定期に、作業環境測定を行い、その都度、測定日時、測定箇所、測定結果、[ Ｂ ]等一定の事項を記録し、[ Ｃ ]保存しなければならない。」
Ａ Ｂ Ｃ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('52567c64-66da-4e03-b26d-2320924a06e9', $c$３か月 放射線測定器の種類、型式及び性能 ５年間$c$, false, 1),
  ('52567c64-66da-4e03-b26d-2320924a06e9', $c$３か月 放射線測定器の種類、型式及び性能 30年間$c$, false, 2),
  ('52567c64-66da-4e03-b26d-2320924a06e9', $c$６か月 放射線測定器の種類、型式及び性能 30年間$c$, false, 3),
  ('52567c64-66da-4e03-b26d-2320924a06e9', $c$６か月 測定結果に基づき実施した措置の概要 ５年間$c$, true, 4),
  ('52567c64-66da-4e03-b26d-2320924a06e9', $c$６か月 測定結果に基づき実施した措置の概要 30年間$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cdf7f5ef-8261-4615-a480-4e1a9e50c69b',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$放射線装置室内でエックス線の照射中に、法令に基づき設けられた遮蔽物が破損し、かつ、直ちに照射を停止することが困難である事故が発生し、事故によって受ける実効線量が15mSvを超えるおそれのある区域が生じた。このとき講じた次のＡからＤの措置について、労働安全衛生関係法令上、正しいものの組合せは(１)～(５)のうちどれか。
Ａ 当該区域を標識によって明示した。
Ｂ 放射線業務従事者を除き、作業に従事する者の当該区域への立入りを禁止した。
Ｃ 事故が発生したとき、速やかに、その旨を所轄労働基準監督署長に報告した。
Ｄ 事故が発生したとき当該区域内にいた労働者については、実効線量及び等価線量が法定の被ばく限度を超えていない者を除き、速やかに、医師の診察又は処置を受けさせた。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cdf7f5ef-8261-4615-a480-4e1a9e50c69b', $c$Ａ，Ｃ$c$, true, 1),
  ('cdf7f5ef-8261-4615-a480-4e1a9e50c69b', $c$Ａ，Ｄ$c$, false, 2),
  ('cdf7f5ef-8261-4615-a480-4e1a9e50c69b', $c$Ｂ，Ｃ$c$, false, 3),
  ('cdf7f5ef-8261-4615-a480-4e1a9e50c69b', $c$Ｂ，Ｄ$c$, false, 4),
  ('cdf7f5ef-8261-4615-a480-4e1a9e50c69b', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7f4fe8bd-6f29-4729-8781-aa08b166a51e',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて透過写真撮影の業務に常時従事する労働者50人を含めて、250人の労働者を常時使用する製造業の事業場における衛生管理体制に関する次の記述のうち、労働安全衛生関係法令上、誤っているものはどれか。ただし、その他の有害業務はなく、産業医及び衛生管理者の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7f4fe8bd-6f29-4729-8781-aa08b166a51e', $c$衛生管理者は、２人以上選任しなければならない。$c$, false, 1),
  ('7f4fe8bd-6f29-4729-8781-aa08b166a51e', $c$衛生管理者のうち１人は、その事業場に専属でない労働衛生コンサルタントのうちから選任することができる。$c$, false, 2),
  ('7f4fe8bd-6f29-4729-8781-aa08b166a51e', $c$衛生管理者は、全て第一種衛生管理者免許を有する者のうちから選任することができる。$c$, false, 3),
  ('7f4fe8bd-6f29-4729-8781-aa08b166a51e', $c$産業医は、この事業場に専属でない者を選任することができる。$c$, false, 4),
  ('7f4fe8bd-6f29-4729-8781-aa08b166a51e', $c$総括安全衛生管理者を選任しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cb7289a0-e031-4369-b7ef-ff40d7c89727',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線に関連した量とその単位の組合せとして、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cb7289a0-e031-4369-b7ef-ff40d7c89727', $c$Ｗ値 ……………………………… eV$c$, false, 1),
  ('cb7289a0-e031-4369-b7ef-ff40d7c89727', $c$エネルギー ……………………… J$c$, false, 2),
  ('cb7289a0-e031-4369-b7ef-ff40d7c89727', $c$粒子フルエンス ………………… m⁻²$c$, false, 3),
  ('cb7289a0-e031-4369-b7ef-ff40d7c89727', $c$電気量（電荷） ………………… A$c$, true, 4),
  ('cb7289a0-e031-4369-b7ef-ff40d7c89727', $c$カーマ …………………………… J･kg⁻¹$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e4e0a5b0-37bc-459b-be5f-0352ec5a01e3',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$被ばく線量を測定するための放射線測定器に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e4e0a5b0-37bc-459b-be5f-0352ec5a01e3', $c$熱ルミネセンス線量計(ＴＬＤ)は、放射線照射後、素子を加熱することによって発する蛍光の強度から線量を読み取る線量計で、線量を読み取ると素子から情報が消失してしまうので、再度読み取ることができない。$c$, false, 1),
  ('e4e0a5b0-37bc-459b-be5f-0352ec5a01e3', $c$蛍光ガラス線量計は、放射線にさらされた銀活性リン酸塩ガラスの検出素子に紫外線を当てて発する蛍光を利用したもので、線量の読み取りを繰り返し行うことができる。$c$, false, 2),
  ('e4e0a5b0-37bc-459b-be5f-0352ec5a01e3', $c$半導体式ポケット線量計は、固体内での放射線の電離作用を利用した線量計で、検出器にはＰＮ接合型シリコン半導体が用いられている。$c$, false, 3),
  ('e4e0a5b0-37bc-459b-be5f-0352ec5a01e3', $c$光刺激ルミネセンス(ＯＳＬ)線量計は、ラジオフォトルミネセンスを利用した線量計で、検出素子にはフッ化カルシウムなどが用いられている。$c$, true, 4),
  ('e4e0a5b0-37bc-459b-be5f-0352ec5a01e3', $c$電荷蓄積式(ＤＩＳ)線量計は、不揮発性メモリ素子(ＭＯＳＦＥＴトランジスタ)を電離箱の構成要素の一部とした線量計である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bb49defb-465e-4942-af1e-95c4c6dc01f2',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$エックス線の測定に用いるＮaI(Ｔl)シンチレーション検出器に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bb49defb-465e-4942-af1e-95c4c6dc01f2', $c$シンチレータに混入される微量のタリウムは、発光波長の調整や発光量増加の役割を果たす活性剤である。$c$, false, 1),
  ('bb49defb-465e-4942-af1e-95c4c6dc01f2', $c$シンチレータにエックス線が入射すると、紫外領域の減衰時間の長い光が放射される。$c$, true, 2),
  ('bb49defb-465e-4942-af1e-95c4c6dc01f2', $c$シンチレータから放射された光は、光電子増倍管の光電面で光電子に変換され、増倍された後、電流パルスとして出力される。$c$, false, 3),
  ('bb49defb-465e-4942-af1e-95c4c6dc01f2', $c$光電子増倍管から得られる出力パルス波高には、入射エックス線のエネルギーの情報が含まれている。$c$, false, 4),
  ('bb49defb-465e-4942-af1e-95c4c6dc01f2', $c$光電子増倍管の増倍率は、印加電圧に依存するので、光電子増倍管に印加する高圧電源は安定化する必要がある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a7876e0f-cca8-4ffc-8876-ee3564b79072',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$次のエックス線とその測定に用いるサーベイメータの組合せのうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a7876e0f-cca8-4ffc-8876-ee3564b79072', $c$50mSv/h程度の線量率で、散乱線を多く含むエックス線…………………………… ＧＭ計数管式サーベイメータ$c$, true, 1),
  ('a7876e0f-cca8-4ffc-8876-ee3564b79072', $c$0.1μSv/h程度の線量率のエックス線…………………………… ＮaI(Ｔl)シンチレーション式サーベイメータ$c$, false, 2),
  ('a7876e0f-cca8-4ffc-8876-ee3564b79072', $c$200mSv/h程度の線量率のエックス線…………………………… 電離箱式サーベイメータ$c$, false, 3),
  ('a7876e0f-cca8-4ffc-8876-ee3564b79072', $c$300keV程度のエネルギーで、10mSv/h程度の線量率のエックス線…………………………… 電離箱式サーベイメータ$c$, false, 4),
  ('a7876e0f-cca8-4ffc-8876-ee3564b79072', $c$100keV程度のエネルギーで、10μSv/h程度の線量率のエックス線…………………………… 半導体式サーベイメータ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bccf5590-d2f6-42e5-92bd-c6f9c5ff568c',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線検出器とそれに関係の深い用語との組合せとして、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bccf5590-d2f6-42e5-92bd-c6f9c5ff568c', $c$電離箱 …………………………… ガス増幅$c$, false, 1),
  ('bccf5590-d2f6-42e5-92bd-c6f9c5ff568c', $c$比例計数管 ……………………… 窒息現象$c$, false, 2),
  ('bccf5590-d2f6-42e5-92bd-c6f9c5ff568c', $c$ＧＭ計数管 ……………………… 電子なだれ$c$, true, 3),
  ('bccf5590-d2f6-42e5-92bd-c6f9c5ff568c', $c$シンチレーション検出器 ……… 緑色レーザー光$c$, false, 4),
  ('bccf5590-d2f6-42e5-92bd-c6f9c5ff568c', $c$フリッケ線量計 ………………… グロー曲線$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '81ba3d8f-190b-4665-bd0a-49b2010af944',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線の測定などについての用語に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('81ba3d8f-190b-4665-bd0a-49b2010af944', $c$半導体検出器において、放射線が半導体中で１個の電子・正孔対を作るのに必要な平均エネルギーをε値といい、シリコン結晶の場合は、約3.6eVである。$c$, true, 1),
  ('81ba3d8f-190b-4665-bd0a-49b2010af944', $c$ＧＭ計数管の動作特性曲線において、印加電圧を上げても計数率がほとんど変わらない範囲をプラトーといい、プラトー領域の印加電圧では、入射エックス線による一次電離量に比例した大きさの出力パルスが得られる。$c$, false, 2),
  ('81ba3d8f-190b-4665-bd0a-49b2010af944', $c$気体に放射線を照射したとき、１個のイオン対を作るのに必要な平均エネルギーをＷ値といい、気体の種類にあまり依存せず、放射線のエネルギーに応じてほぼ一定の値をとる。$c$, false, 3),
  ('81ba3d8f-190b-4665-bd0a-49b2010af944', $c$入射放射線の線量率が低く、測定器の検出限界に達しないことにより計測されないことを数え落としという。$c$, false, 4),
  ('81ba3d8f-190b-4665-bd0a-49b2010af944', $c$放射線測定器の指針が安定せず、ゆらぐ現象をフェーディングという。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0fcff27b-55c4-4cdc-b337-0b0c00a26b29',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線防護のための被ばく線量の算定に関する次のＡからＤの記述について、正しいものの全ての組合せは(１)～(５)のうちどれか。
Ａ 外部被ばくによる実効線量は、法令に基づき放射線測定器を装着した各部位の１cm線量当量及び70μm線量当量を用いて算定する。
Ｂ 皮膚の等価線量は、エックス線については70μm線量当量により算定する。
Ｃ 眼の水晶体の等価線量は、放射線の種類及びエネルギーに応じて、１cm線量当量、３mm線量当量又は70μm線量当量のうちいずれか適切なものにより算定する。
Ｄ 妊娠中の女性の腹部表面の等価線量は、腹・大腿部における70μm線量当量により算定する。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0fcff27b-55c4-4cdc-b337-0b0c00a26b29', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('0fcff27b-55c4-4cdc-b337-0b0c00a26b29', $c$Ａ，Ｃ，Ｄ$c$, false, 2),
  ('0fcff27b-55c4-4cdc-b337-0b0c00a26b29', $c$Ａ，Ｄ$c$, false, 3),
  ('0fcff27b-55c4-4cdc-b337-0b0c00a26b29', $c$Ｂ，Ｃ$c$, true, 4),
  ('0fcff27b-55c4-4cdc-b337-0b0c00a26b29', $c$Ｂ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3806ec43-f8fe-44fc-8ad8-9b2ec706ccac',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$男性の放射線業務従事者が、エックス線装置を用い、肩から大腿部までを覆う防護衣を着用して放射線業務を行った。労働安全衛生関係法令に基づき、胸部(防護衣の下)及び頭・頸部の２か所に放射線測定器を装着して、被ばく線量を測定した結果は、下の表のとおりであった。この業務に従事した間に受けた外部被ばくによる実効線量の算定値に最も近いものは、(１)～(５)のうちどれか。ただし、防護衣の中は均等被ばくとみなし、外部被ばくによる実効線量は、次式により算出するものとする。ＨＥＥ＝0.08Ｈａ＋0.44Ｈｂ＋0.45Ｈｃ＋0.03ＨｍＨＥＥ：外部被ばくによる実効線量Ｈａ ：頭・頸部における線量当量Ｈｂ ：胸・上腕部における線量当量Ｈｃ ：腹・大腿部における線量当量Ｈｍ ：「頭・頸部」、「胸・上腕部」及び「腹・大腿部」のうち被ばくが最大となる部位における線量当量表の値は、胸部の１cm線量当量0.3mSv・70μm線量当量0.3mSv、頭・頸部の１cm線量当量1.2mSv・70μm線量当量1.1mSvである。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3806ec43-f8fe-44fc-8ad8-9b2ec706ccac', $c$0.2 mSv$c$, false, 1),
  ('3806ec43-f8fe-44fc-8ad8-9b2ec706ccac', $c$0.4 mSv$c$, true, 2),
  ('3806ec43-f8fe-44fc-8ad8-9b2ec706ccac', $c$0.6 mSv$c$, false, 3),
  ('3806ec43-f8fe-44fc-8ad8-9b2ec706ccac', $c$0.9 mSv$c$, false, 4),
  ('3806ec43-f8fe-44fc-8ad8-9b2ec706ccac', $c$1.2 mSv$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$あるサーベイメータを用いて、時定数を10秒に設定し、エックス線を測定したところ、計数率は５(cps)を示した。このとき、計数率の相対標準偏差は(１)～(５)のうちどれか。ただし、積分回路の時定数Ｔ秒のサーベイメータを用いて線量を測定し、計数率ｎ(cps)を得たとき、計数率の標準偏差σ(cps)は次式で示される。σ＝√(ｎ／２Ｔ)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d', $c$1％$c$, false, 1),
  ('14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d', $c$5％$c$, false, 2),
  ('14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d', $c$8％$c$, false, 3),
  ('14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d', $c$10％$c$, true, 4),
  ('14a2df64-2ce7-4f0f-bdcc-d8d3fb93cc2d', $c$20％$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '14148962-5db2-40e6-b758-a348ffb0f5cd',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$ＧＭ計数管式サーベイメータにより放射線を測定し、700cpsの計数率を得た。ＧＭ計数管の分解時間が100μsであるとき、真の計数率(cps)に最も近い値は次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('14148962-5db2-40e6-b758-a348ffb0f5cd', $c$670$c$, false, 1),
  ('14148962-5db2-40e6-b758-a348ffb0f5cd', $c$690$c$, false, 2),
  ('14148962-5db2-40e6-b758-a348ffb0f5cd', $c$710$c$, false, 3),
  ('14148962-5db2-40e6-b758-a348ffb0f5cd', $c$750$c$, true, 4),
  ('14148962-5db2-40e6-b758-a348ffb0f5cd', $c$800$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ed68b281-913e-454f-a0aa-8bc27279ad24',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線感受性に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ed68b281-913e-454f-a0aa-8bc27279ad24', $c$細胞周期の中で、放射線感受性が高いのは、Ｇ１期(ＤＮＡ合成準備期)後期からＳ期(ＤＮＡ合成期)初期とＭ期(分裂期)である。$c$, false, 1),
  ('ed68b281-913e-454f-a0aa-8bc27279ad24', $c$神経組織の放射線感受性は成人では低いが、胎児では高い。$c$, false, 2),
  ('ed68b281-913e-454f-a0aa-8bc27279ad24', $c$皮膚の基底細胞層は、角質層より放射線感受性が高い。$c$, false, 3),
  ('ed68b281-913e-454f-a0aa-8bc27279ad24', $c$小腸の絨毛先端部の細胞は、腺窩細胞(クリプト細胞)より放射線感受性が低い。$c$, false, 4),
  ('ed68b281-913e-454f-a0aa-8bc27279ad24', $c$半致死線量は、細胞の放射線感受性を表す指標として用いられ、その値が大きいほど、細胞の放射線感受性は高い。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '14fd1503-4e4d-4507-aa84-f39b6ef4b459',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$次のＡからＣの人体の組織・器官について、放射線感受性の高いものから順に並べたものは(１)～(５)のうちどれか。
Ａ 肺
Ｂ 汗腺
Ｃ 神経線維$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('14fd1503-4e4d-4507-aa84-f39b6ef4b459', $c$Ａ, Ｂ，Ｃ$c$, false, 1),
  ('14fd1503-4e4d-4507-aa84-f39b6ef4b459', $c$Ａ，Ｃ, Ｂ$c$, false, 2),
  ('14fd1503-4e4d-4507-aa84-f39b6ef4b459', $c$Ｂ, Ａ, Ｃ$c$, true, 3),
  ('14fd1503-4e4d-4507-aa84-f39b6ef4b459', $c$Ｂ, Ｃ，Ａ$c$, false, 4),
  ('14fd1503-4e4d-4507-aa84-f39b6ef4b459', $c$Ｃ，Ａ, Ｂ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b28bdf58-be0c-416d-bef4-68b9c7e7dbbb',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$エックス線の直接作用と間接作用に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b28bdf58-be0c-416d-bef4-68b9c7e7dbbb', $c$エックス線による直接作用では、エックス線によって飛び出した二次電子が生体高分子の電離又は励起を引き起こし、生体高分子に損傷を与える。$c$, false, 1),
  ('b28bdf58-be0c-416d-bef4-68b9c7e7dbbb', $c$エックス線による間接作用では、エックス線によって飛び出した二次電子が水分子の電離又は励起を引き起こしてラジカルを生成し、そのラジカルが生体高分子に損傷を与える。$c$, false, 2),
  ('b28bdf58-be0c-416d-bef4-68b9c7e7dbbb', $c$低温下では、直接作用による放射線効果は減少するが、間接作用による放射線効果は影響を受けない。$c$, true, 3),
  ('b28bdf58-be0c-416d-bef4-68b9c7e7dbbb', $c$生体中のシステインなどのＳＨ基をもつ化学物質がエックス線の生物効果を軽減することは、間接作用により説明される。$c$, false, 4),
  ('b28bdf58-be0c-416d-bef4-68b9c7e7dbbb', $c$溶液中の酵素の濃度を変えて一定線量のエックス線を照射するとき、酵素の濃度が減少するに従って、酵素の全分子のうち不活性化される分子の占める割合が増加することは、間接作用により説明される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '520b758b-1107-4f5d-b04a-46792676a2d3',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$生物効果比(ＲＢＥ)に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('520b758b-1107-4f5d-b04a-46792676a2d3', $c$ＲＢＥは、次の式で定義される。ＲＢＥ＝(ある反応を起こす基準放射線の吸収線量)／(同じ反応を起こす試験放射線の吸収線量)$c$, true, 1),
  ('520b758b-1107-4f5d-b04a-46792676a2d3', $c$ＲＢＥを求めるための基準となる放射線としては、⁶⁰Ｃｏのベータ線が用いられる。$c$, false, 2),
  ('520b758b-1107-4f5d-b04a-46792676a2d3', $c$エックス線は、そのエネルギーの高低にかかわらず、ＲＢＥが１より小さい。$c$, false, 3),
  ('520b758b-1107-4f5d-b04a-46792676a2d3', $c$ある生物効果についてのＲＢＥの値は、同じ線質の放射線であれば、線量率、温度、酸素分圧などの照射条件が異なっても変わらない。$c$, false, 4),
  ('520b758b-1107-4f5d-b04a-46792676a2d3', $c$培養細胞の致死作用に関するＲＢＥは、放射線の線エネルギー付与(ＬＥＴ)が500keV/μm付近まではＬＥＴが高くなるにつれ増大し最大値に達するが、更にＬＥＴが高くなるとＲＢＥは小さくなっていく。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '44316433-3cca-4a14-b915-3cf216b7e4d9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$組織加重係数に関する次のＡからＤの記述のうち、正しいものの組合せは(１)～(５)のうちどれか。
Ａ 組織加重係数は、各組織・臓器の確定的影響に対する相対的な放射線感受性を表す係数である。
Ｂ 組織加重係数は、骨髄より生殖腺の方が大きい。
Ｃ 全ての組織・臓器の組織加重係数の合計は、１である。
Ｄ 被ばくした組織・臓器の等価線量に組織加重係数を乗じて足し合わせることにより、実効線量を得ることができる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('44316433-3cca-4a14-b915-3cf216b7e4d9', $c$Ａ，Ｂ$c$, false, 1),
  ('44316433-3cca-4a14-b915-3cf216b7e4d9', $c$Ａ，Ｃ$c$, false, 2),
  ('44316433-3cca-4a14-b915-3cf216b7e4d9', $c$Ｂ，Ｃ$c$, false, 3),
  ('44316433-3cca-4a14-b915-3cf216b7e4d9', $c$Ｂ，Ｄ$c$, false, 4),
  ('44316433-3cca-4a14-b915-3cf216b7e4d9', $c$Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b1bbe131-30f7-4f32-a5dc-bb8fca71e773',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線による遺伝的影響に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b1bbe131-30f7-4f32-a5dc-bb8fca71e773', $c$遺伝的影響には、しきい線量があり、ヒトでは１Gy程度と推定されている。$c$, false, 1),
  ('b1bbe131-30f7-4f32-a5dc-bb8fca71e773', $c$生殖腺が被ばくしなければ、遺伝的影響が生じるおそれはない。$c$, true, 2),
  ('b1bbe131-30f7-4f32-a5dc-bb8fca71e773', $c$胎内被ばくを受け、出生した子供にみられる発育遅延は、遺伝的影響である。$c$, false, 3),
  ('b1bbe131-30f7-4f32-a5dc-bb8fca71e773', $c$親の体細胞に突然変異が生じると、子孫に遺伝的影響が生じる。$c$, false, 4),
  ('b1bbe131-30f7-4f32-a5dc-bb8fca71e773', $c$倍加線量は、放射線による遺伝的影響を推定する指標とされ、その値が小さいほど遺伝的影響は起こりにくい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'be6c3b23-643c-4836-99d1-4f7982d7ceab',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線の生体影響に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('be6c3b23-643c-4836-99d1-4f7982d7ceab', $c$酸素増感比(ＯＥＲ)は、酸素が存在しない状態と存在する状態とを比較し、同じ生物効果を与える線量の比で、酸素効果の大きさを表すものである。$c$, true, 1),
  ('be6c3b23-643c-4836-99d1-4f7982d7ceab', $c$線エネルギー付与(ＬＥＴ)とは、物質中を放射線が通過するとき、荷電粒子の飛跡に沿って単位長さ当たりに物質に与えられるエネルギーをいい、放射線の線量率を表す指標とされる。$c$, false, 2),
  ('be6c3b23-643c-4836-99d1-4f7982d7ceab', $c$組織加重係数が最も大きい組織・臓器は、脳である。$c$, false, 3),
  ('be6c3b23-643c-4836-99d1-4f7982d7ceab', $c$全致死線量は、半致死線量の２倍に相当する線量であり、この線量を被ばくした個体は数時間～数日のうちに死亡する。$c$, false, 4),
  ('be6c3b23-643c-4836-99d1-4f7982d7ceab', $c$平均致死線量は、被ばくした集団のうち50％の個体が一定の期間内に死亡する線量である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '78931343-fd00-49f3-8c5b-ed911bec7cbb',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$ヒトが一時に全身にエックス線の照射を受けた場合の早期影響に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('78931343-fd00-49f3-8c5b-ed911bec7cbb', $c$１～２Gy程度の被ばくで、放射線宿酔の症状が現れることがある。$c$, false, 1),
  ('78931343-fd00-49f3-8c5b-ed911bec7cbb', $c$被ばくから死亡までの期間は、一般に造血器官の障害による場合の方が、消化器官の障害による場合より長い。$c$, false, 2),
  ('78931343-fd00-49f3-8c5b-ed911bec7cbb', $c$ＬＤ50/60に相当する線量の被ばくでは、被ばくしたヒトのうち約半数のヒトが、60日以内に、主に造血器官の障害により死亡する。$c$, false, 3),
  ('78931343-fd00-49f3-8c5b-ed911bec7cbb', $c$消化器官の障害を主因とする死亡までの期間は、５～20日程度である。$c$, false, 4),
  ('78931343-fd00-49f3-8c5b-ed911bec7cbb', $c$５～10Gy程度の被ばくによる死亡は、主に中枢神経系の障害によるものである。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6ffef341-176d-4a4b-b6f1-b0eef51c2177',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$エックス線被ばくによる末梢血液中の血球の変化に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6ffef341-176d-4a4b-b6f1-b0eef51c2177', $c$被ばくにより赤色骨髄中の幹細胞が障害を受けると、末梢血液中の血球数は減少していく。$c$, false, 1),
  ('6ffef341-176d-4a4b-b6f1-b0eef51c2177', $c$末梢血液中の血球数の減少は、250 μGy程度の被ばくから認められる。$c$, true, 2),
  ('6ffef341-176d-4a4b-b6f1-b0eef51c2177', $c$末梢血液中のリンパ球を除く白血球は、被ばく直後は一時的に増加が認められることがある。$c$, false, 3),
  ('6ffef341-176d-4a4b-b6f1-b0eef51c2177', $c$末梢血液中の血球のうち、被ばく後減少が現れるのが最も遅いものは赤血球である。$c$, false, 4),
  ('6ffef341-176d-4a4b-b6f1-b0eef51c2177', $c$末梢血液中の赤血球の減少は貧血を招き、血小板の減少は出血傾向を示す原因となる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd5ff6090-945a-4d8b-98ff-39b291fbb1d5',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線の被ばくによる確率的影響及び確定的影響に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 エックス線作業主任者試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d5ff6090-945a-4d8b-98ff-39b291fbb1d5', $c$確率的影響の発生を完全に防止することは、放射線防護の目的の一つである。$c$, false, 1),
  ('d5ff6090-945a-4d8b-98ff-39b291fbb1d5', $c$確率的影響では、被ばく線量と影響の発生確率の関係がＳ字状曲線で示される。$c$, false, 2),
  ('d5ff6090-945a-4d8b-98ff-39b291fbb1d5', $c$確定的影響では、被ばく線量の増加とともに影響の発生確率は増加するが、障害の重篤度は変わらない。$c$, false, 3),
  ('d5ff6090-945a-4d8b-98ff-39b291fbb1d5', $c$実効線量は、確率的影響を評価するための量である。$c$, true, 4),
  ('d5ff6090-945a-4d8b-98ff-39b291fbb1d5', $c$遺伝的影響には、確率的影響に分類されるものと確定的影響に分類されるものがある。$c$, false, 5);

do $$
declare
  xray_2026_04 int;
begin
  select count(*) into xray_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 エックス線作業主任者試験%';

  if xray_2026_04 <> 40 then
    raise exception 'xray 2026-04 sitting must be 40 questions (got %)', xray_2026_04;
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
  'xray',
  exam_types.id,
  'エックス線作業主任者模擬試験(令和8年4月)',
  240,
  40,
  '令和8年4月公表 エックス線作業主任者試験'
from exam_types
where exam_types.exam_id = 'xray'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'xray'
      and source_filter = '令和8年4月公表 エックス線作業主任者試験'
      and category_scope is null
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'xray',
  exam_types.id,
  'エックス線作業主任者模擬試験(令和8年4月)【生体影響免除】',
  180,
  30,
  '令和8年4月公表 エックス線作業主任者試験',
  array[
    'エックス線の管理に関する知識',
    '関係法令',
    'エックス線の測定に関する知識'
  ]
from exam_types
where exam_types.exam_id = 'xray'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'xray'
      and name = 'エックス線作業主任者模擬試験(令和8年4月)【生体影響免除】'
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'xray',
  exam_types.id,
  'エックス線作業主任者模擬試験(令和8年4月)【測定・生体影響免除】',
  120,
  20,
  '令和8年4月公表 エックス線作業主任者試験',
  array[
    'エックス線の管理に関する知識',
    '関係法令'
  ]
from exam_types
where exam_types.exam_id = 'xray'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'xray'
      and name = 'エックス線作業主任者模擬試験(令和8年4月)【測定・生体影響免除】'
  );
