-- xray 基盤登録 (exams / exam_types / exam_categories / categories)
-- および令和7年10月 過去問 questions / choices / mock_exams
-- 生成元: data/past-exams/xray_2025-10.txt
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
  'bef8f0cd-d83c-4e3a-ba05-df883fd7e279',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線管及びエックス線の発生に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bef8f0cd-d83c-4e3a-ba05-df883fd7e279', $c$エックス線管の内部は、効率的にエックス線を発生させるため、高度の真空になっている。$c$, false, 1),
  ('bef8f0cd-d83c-4e3a-ba05-df883fd7e279', $c$陰極で発生する熱電子の数は、フィラメント電流を変えることで制御される。$c$, false, 2),
  ('bef8f0cd-d83c-4e3a-ba05-df883fd7e279', $c$陽極のターゲットはエックス線管の軸に対して斜めになっており、加速された熱電子が衝突しエックス線が発生する領域である実焦点は、これをエックス線束の利用方向から見た実効焦点よりも小さくなる。$c$, true, 3),
  ('bef8f0cd-d83c-4e3a-ba05-df883fd7e279', $c$連続エックス線の発生効率は、ターゲット元素の原子番号と管電圧の積にほぼ比例する。$c$, false, 4),
  ('bef8f0cd-d83c-4e3a-ba05-df883fd7e279', $c$管電圧がターゲット元素に固有の励起電圧を超える場合、発生するエックス線は、連続エックス線と特性エックス線が混在したものになる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ce8111cd-40a7-49b6-af04-0b2c5c5c0906',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$特性エックス線に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ce8111cd-40a7-49b6-af04-0b2c5c5c0906', $c$特性エックス線の波長は、ターゲット元素の原子番号が大きくなると長くなる。$c$, false, 1),
  ('ce8111cd-40a7-49b6-af04-0b2c5c5c0906', $c$特性エックス線は、原子核のエネルギー準位の遷移に伴い、原子核から放出される。$c$, false, 2),
  ('ce8111cd-40a7-49b6-af04-0b2c5c5c0906', $c$管電圧が、Ｋ系列の特性エックス線を発生させるのに必要な最小値であるＫ励起電圧を下回るときは、他の系列の特性エックス線も発生することはない。$c$, false, 3),
  ('ce8111cd-40a7-49b6-af04-0b2c5c5c0906', $c$Ｋ殻電子が電離されたことによって特性エックス線が発生することをオージェ効果という。$c$, false, 4),
  ('ce8111cd-40a7-49b6-af04-0b2c5c5c0906', $c$Ｋ系列の特性エックス線は、エックス線管の管電圧を上げると強度が増大するが、その波長は変わらない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '069094bd-75da-4616-b1ff-3cb554296ecf',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線装置について、次のＡからＤのように条件を変化させるとき、発生する連続エックス線の全強度を大きくするものの全ての組合せは(１)～(５)のうちどれか。
Ａ 管電流は一定にして、管電圧を２倍にする。
Ｂ 管電圧は１/２にして、管電流を２倍にする。
Ｃ 管電圧は２倍にして、管電流を１/２にする。
Ｄ 管電圧及び管電流は一定にして、ターゲットを原子番号のより大きな元素にする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('069094bd-75da-4616-b1ff-3cb554296ecf', $c$Ａ，Ｂ$c$, false, 1),
  ('069094bd-75da-4616-b1ff-3cb554296ecf', $c$Ａ，Ｃ$c$, false, 2),
  ('069094bd-75da-4616-b1ff-3cb554296ecf', $c$Ａ，Ｃ，Ｄ$c$, true, 3),
  ('069094bd-75da-4616-b1ff-3cb554296ecf', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('069094bd-75da-4616-b1ff-3cb554296ecf', $c$Ｂ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bc903625-6ecb-48e5-90ed-9f7655c4f371',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線と物質との相互作用に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bc903625-6ecb-48e5-90ed-9f7655c4f371', $c$レイリー散乱により散乱されたエックス線の波長は、入射エックス線の波長より長くなる。$c$, false, 1),
  ('bc903625-6ecb-48e5-90ed-9f7655c4f371', $c$光電効果が生じる確率は、入射エックス線のエネルギーが増大すると、コンプトン効果に比べて急激に低下する。$c$, true, 2),
  ('bc903625-6ecb-48e5-90ed-9f7655c4f371', $c$光電効果により原子から放出される電子の運動エネルギーは、入射エックス線のエネルギーに等しい。$c$, false, 3),
  ('bc903625-6ecb-48e5-90ed-9f7655c4f371', $c$コンプトン効果とは、原子のＫ殻、Ｌ殻等の内殻電子がエックス線光子のエネルギーの一部を吸収して原子の外に飛び出し、入射エックス線が散乱される現象である。$c$, false, 4),
  ('bc903625-6ecb-48e5-90ed-9f7655c4f371', $c$コンプトン効果によるエックス線の散乱は、入射エックス線のエネルギーが高くなると、前方より後方に多く生じるようになる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ec82248a-12da-4328-b3ba-b82116f8cc95',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$単一エネルギーで太い線束のエックス線が物質を透過するときの減弱及び再生係数(ビルドアップ係数)に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ec82248a-12da-4328-b3ba-b82116f8cc95', $c$再生係数は、入射エックス線のエネルギーや物質の種類によって異なる。$c$, false, 1),
  ('ec82248a-12da-4328-b3ba-b82116f8cc95', $c$再生係数は、物質への照射面積が大きいほど大きくなる。$c$, false, 2),
  ('ec82248a-12da-4328-b3ba-b82116f8cc95', $c$再生係数は、物質の厚さが薄くなるほど小さくなる。$c$, false, 3),
  ('ec82248a-12da-4328-b3ba-b82116f8cc95', $c$再生係数は、透過後、物質から離れるほど小さくなり、その値は１に近づく。$c$, false, 4),
  ('ec82248a-12da-4328-b3ba-b82116f8cc95', $c$再生係数は、入射エックス線の線量率が高くなるほど小さくなる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '80156593-b0b2-461a-aa75-656167a17153',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線を利用した各種試験装置に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('80156593-b0b2-461a-aa75-656167a17153', $c$蛍光エックス線分析装置は、物質を透過したエックス線を蛍光体を塗布した板の上に当てたときにできる蛍光像を観察することによって、物質の欠陥の程度などを識別する装置である。$c$, true, 1),
  ('80156593-b0b2-461a-aa75-656167a17153', $c$エックス線マイクロアナライザーは、細く絞った電子線束を試料の微小部分に照射し、発生する特性エックス線を分光することによって、微小部分の元素を分析する装置である。$c$, false, 2),
  ('80156593-b0b2-461a-aa75-656167a17153', $c$エックス線回折装置は、結晶質の物質にエックス線を照射すると特有の回折像が得られることを利用して、物質の結晶構造を解析し、物質の性質を調べる装置である。$c$, false, 3),
  ('80156593-b0b2-461a-aa75-656167a17153', $c$エックス線応力測定装置は、応力による結晶の面間隔の変化をエックス線の回折を利用して調べることにより、物質内の残留応力の大きさを測定する装置である。$c$, false, 4),
  ('80156593-b0b2-461a-aa75-656167a17153', $c$散乱型厚さ計は、被検査物体にエックス線を照射したときに発生する後方散乱線の強度が、被検査物体の厚さに応じて変化することを利用した装置である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f5ade2a8-3fe7-467f-bdb2-117102c6be9a',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線の散乱に関する次の文中の[ ]内に入れるＡからＣの語句又は数値の組合せとして、正しいものは(１)～(５)のうちどれか。「エックス線装置を用い、管電圧100kVで、厚さが20mmの鋼板及びアルミニウム板のそれぞれにエックス線のビームを垂直に照射し、散乱角135°の方向の後方散乱線の空気カーマ率を、照射野の中心から２mの位置で測定してその大きさを比較したところ、[ Ａ ]の後方散乱線の方が大きかった。次に、同じ照射条件で、鋼板について、散乱角120°及び135°の方向の後方散乱線の空気カーマ率を、照射野の中心から２mの位置で測定し、その大きさを比較したところ、[ Ｂ ]の方向の方が大きかった。また、同じ照射条件で、鋼板について、散乱角30°及び60°の方向の前方散乱線の空気カーマ率を、照射野の中心から２mの位置で測定し、その大きさを比較したところ、[ Ｃ ]の方向の方が大きかった。」
Ａ Ｂ Ｃ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f5ade2a8-3fe7-467f-bdb2-117102c6be9a', $c$鋼板 120° 60°$c$, false, 1),
  ('f5ade2a8-3fe7-467f-bdb2-117102c6be9a', $c$鋼板 135° 30°$c$, false, 2),
  ('f5ade2a8-3fe7-467f-bdb2-117102c6be9a', $c$鋼板 135° 60°$c$, false, 3),
  ('f5ade2a8-3fe7-467f-bdb2-117102c6be9a', $c$アルミニウム板 120° 60°$c$, false, 4),
  ('f5ade2a8-3fe7-467f-bdb2-117102c6be9a', $c$アルミニウム板 135° 30°$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9ec8636e-ecba-4282-9576-f372209680c6',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$エックス線装置を用いて透過写真撮影を行う場合のエックス線の遮蔽及び散乱線の低減に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9ec8636e-ecba-4282-9576-f372209680c6', $c$遮蔽体には、原子番号が大きく、密度の高い物質を用いるのがよい。$c$, false, 1),
  ('9ec8636e-ecba-4282-9576-f372209680c6', $c$コンクリートの遮蔽体は、同程度の遮蔽効果を得るために鉛の約２倍の厚さが必要であるが、施工が容易で安価であるため広く用いられている。$c$, true, 2),
  ('9ec8636e-ecba-4282-9576-f372209680c6', $c$照射筒は、照射口に取り付けるラッパ状の遮蔽体で、エックス線束及び散乱線が外部へ漏えいしないようにするために用いる。$c$, false, 3),
  ('9ec8636e-ecba-4282-9576-f372209680c6', $c$絞りは、エックス線束の広がりを制限し、エックス線を必要な部分にだけ照射するために用いる。$c$, false, 4),
  ('9ec8636e-ecba-4282-9576-f372209680c6', $c$ろ過板は、軟エックス線を硬化させる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '580d28bc-b140-4333-bceb-70a6430ff4ea',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$図Ⅰのように、鋼板に垂直に細い線束のエックス線を照射し、エックス線管の焦点から５mの位置で、透過したエックス線の１cm線量当量率を測定したところ、64mSv/hであった。次に図Ⅱのように、この線束を厚さ10mmの鋼板で遮蔽し、エックス線管の焦点から10mの位置で１cm線量当量率を測定したところ２mSv/hとなった。この遮蔽鋼板を厚いものに替えて、この位置における１cm線量当量率を0.5mSv/h以下とするために必要な遮蔽鋼板の最小の厚さは次のうちどれか。ただし、エックス線の実効エネルギーは変わらないものとする。また、散乱線の影響は無いものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('580d28bc-b140-4333-bceb-70a6430ff4ea', $c$14 mm$c$, false, 1),
  ('580d28bc-b140-4333-bceb-70a6430ff4ea', $c$17 mm$c$, true, 2),
  ('580d28bc-b140-4333-bceb-70a6430ff4ea', $c$20 mm$c$, false, 3),
  ('580d28bc-b140-4333-bceb-70a6430ff4ea', $c$23 mm$c$, false, 4),
  ('580d28bc-b140-4333-bceb-70a6430ff4ea', $c$27 mm$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '386775e5-4cef-48b8-a1de-e16229a138f8',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の管理に関する知識'),
  $q$下図のように、エックス線装置を用いて鋼板の透過写真撮影を行うとき、エックス線管の焦点から４mの距離のＰ点における写真撮影中の１cm 線量当量率は0.4mSv/hである。露出時間が１枚につき120秒の写真を週300枚撮影するとき、エックス線管の焦点とＰ点を通る直線上で焦点からＰ点の方向にあるＱ点が管理区域の境界線の外側にあるようにしたい。焦点からＱ点までの距離として、最も短いものは(１)～(５)のうちどれか。ただし、３か月は13週とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('386775e5-4cef-48b8-a1de-e16229a138f8', $c$12 m$c$, false, 1),
  ('386775e5-4cef-48b8-a1de-e16229a138f8', $c$17 m$c$, false, 2),
  ('386775e5-4cef-48b8-a1de-e16229a138f8', $c$22 m$c$, false, 3),
  ('386775e5-4cef-48b8-a1de-e16229a138f8', $c$26 m$c$, true, 4),
  ('386775e5-4cef-48b8-a1de-e16229a138f8', $c$32 m$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c5b1526e-b7d7-4780-9e8d-4064d3bef7c9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて放射線業務を行う場合の管理区域に関する次の記述のうち、労働安全衛生関係法令上、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c5b1526e-b7d7-4780-9e8d-4064d3bef7c9', $c$管理区域には、放射線業務従事者以外の者が立ち入ることを禁止し、その旨を明示しなければならない。$c$, false, 1),
  ('c5b1526e-b7d7-4780-9e8d-4064d3bef7c9', $c$放射線装置室内で放射線業務を行う場合、その室の入口に放射線装置室である旨の標識を掲げたときは、管理区域を標識により明示する必要はない。$c$, false, 2),
  ('c5b1526e-b7d7-4780-9e8d-4064d3bef7c9', $c$管理区域設定に当たっての外部放射線による実効線量の算定は、１cm線量当量及び70μm線量当量によって行うものとする。$c$, false, 3),
  ('c5b1526e-b7d7-4780-9e8d-4064d3bef7c9', $c$管理区域内の見やすい場所に、放射線業務従事者が受けた外部被ばくによる線量の測定結果の一定期間ごとの記録を掲示しなければならない。$c$, false, 4),
  ('c5b1526e-b7d7-4780-9e8d-4064d3bef7c9', $c$管理区域内の見やすい場所に、外部被ばくによる線量を測定するための放射線測定器の装着に関する注意事項、事故が発生した場合の応急の措置等放射線による労働者の健康障害の防止に必要な事項を掲示しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f574ba2a-9b1b-4653-aaba-d6ba3cc06d32',
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
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f574ba2a-9b1b-4653-aaba-d6ba3cc06d32', $c$Ａ，Ｂ$c$, false, 1),
  ('f574ba2a-9b1b-4653-aaba-d6ba3cc06d32', $c$Ａ，Ｃ$c$, true, 2),
  ('f574ba2a-9b1b-4653-aaba-d6ba3cc06d32', $c$Ｂ，Ｃ$c$, false, 3),
  ('f574ba2a-9b1b-4653-aaba-d6ba3cc06d32', $c$Ｂ，Ｄ$c$, false, 4),
  ('f574ba2a-9b1b-4653-aaba-d6ba3cc06d32', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2a1bc9d1-fa84-4883-a441-23f36b4fa813',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を取り扱う放射線業務従事者が管理区域内で受ける外部被ばくによる線量を測定するために放射線測定器を装着する全ての部位として、労働安全衛生関係法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2a1bc9d1-fa84-4883-a441-23f36b4fa813', $c$最も多く放射線にさらされるおそれのある部位が手指であり、次に多い部位が頭・頸部である男性の放射線業務従事者 ………… 胸部及び手指$c$, true, 1),
  ('2a1bc9d1-fa84-4883-a441-23f36b4fa813', $c$最も多く放射線にさらされるおそれのある部位が手指であり、次に多い部位が腹・大腿部である女性の放射線業務従事者(妊娠する可能性がないと診断されたものを除く。) ………………………………… 腹部及び手指$c$, false, 2),
  ('2a1bc9d1-fa84-4883-a441-23f36b4fa813', $c$最も多く放射線にさらされるおそれのある部位が手指であり、次に多い部位が胸・上腕部である男性の放射線業務従事者 ……… 胸部及び手指$c$, false, 3),
  ('2a1bc9d1-fa84-4883-a441-23f36b4fa813', $c$最も多く放射線にさらされるおそれのある部位が胸・上腕部であり、次に多い部位が手指である男性の放射線業務従事者 ……… 胸部のみ$c$, false, 4),
  ('2a1bc9d1-fa84-4883-a441-23f36b4fa813', $c$最も多く放射線にさらされるおそれのある部位が頭・頸部であり、次に多い部位が手指である女性の放射線業務従事者(妊娠する可能性がないと診断されたものを除く。) …………………………………… 腹部及び頭・頸部$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'db170908-9a30-4d33-8688-fddd3d8a84d5',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$放射線業務従事者の被ばく限度として、労働安全衛生関係法令上、正しいものは次のうちどれか。ただし、放射線業務従事者は、緊急作業には従事しないものとし、また、被ばく限度に関する経過措置の適用はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('db170908-9a30-4d33-8688-fddd3d8a84d5', $c$男性の放射線業務従事者が受ける実効線量の限度………………………… ５年間につき250mSv及び１年間につき100mSv$c$, false, 1),
  ('db170908-9a30-4d33-8688-fddd3d8a84d5', $c$男性の放射線業務従事者が眼の水晶体に受ける等価線量の限度………………………… ５年間につき100mSv及び１年間につき50mSv$c$, true, 2),
  ('db170908-9a30-4d33-8688-fddd3d8a84d5', $c$男性の放射線業務従事者が皮膚に受ける等価線量の限度………………………… １年間につき300mSv$c$, false, 3),
  ('db170908-9a30-4d33-8688-fddd3d8a84d5', $c$女性の放射線業務従事者(妊娠する可能性がないと診断されたもの及び妊娠と診断されたものを除く。)が受ける実効線量の限度………………………… １か月間につき５mSv$c$, false, 4),
  ('db170908-9a30-4d33-8688-fddd3d8a84d5', $c$妊娠と診断された女性の放射線業務従事者が腹部表面に受ける等価線量の限度 ………………………… 妊娠中につき５mSv$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c5b61289-0c15-4363-8097-06a239c5ad78',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて放射線業務を行う場合の外部放射線の防護に関する次の措置のうち、電離放射線障害防止規則に違反しているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c5b61289-0c15-4363-8097-06a239c5ad78', $c$装置の外側における外部放射線による１cm線量当量率が20μSv/hを超えないように遮蔽された構造のエックス線装置を、放射線装置室以外の室に設置して使用している。$c$, false, 1),
  ('c5b61289-0c15-4363-8097-06a239c5ad78', $c$放射線装置室については、遮蔽壁等の遮蔽物を設け、労働者が常時立ち入る場所における外部放射線による実効線量が、１週間につき５mSvを超えないように管理しており、平均４mSv程度となっている。$c$, true, 2),
  ('c5b61289-0c15-4363-8097-06a239c5ad78', $c$特定エックス線装置を使用するとき、照射筒又はしぼりを用いると装置の使用の目的が妨げられるので、どちらも用いていない。$c$, false, 3),
  ('c5b61289-0c15-4363-8097-06a239c5ad78', $c$管電圧250kVのエックス線装置を放射線装置室以外の場所で使用するとき、装置に電力が供給されている旨を関係者に周知させる措置として、手動の表示灯を用いている。$c$, false, 4),
  ('c5b61289-0c15-4363-8097-06a239c5ad78', $c$特定エックス線装置を用いて透視を行うとき、定格管電流の２倍以上の電流がエックス線管に通じると、直ちに、エックス線管回路が開放位になる自動装置を設けている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b67fca43-3a0d-40d4-88f9-9e910275c9f4',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置構造規格に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b67fca43-3a0d-40d4-88f9-9e910275c9f4', $c$波高値による定格管電圧が100kV未満のエックス線装置には、この構造規格は適用されない。$c$, false, 1),
  ('b67fca43-3a0d-40d4-88f9-9e910275c9f4', $c$エックス線又はエックス線装置の研究又は教育のため、使用のつど組み立てる方式のエックス線装置には、この構造規格は適用されない。$c$, true, 2),
  ('b67fca43-3a0d-40d4-88f9-9e910275c9f4', $c$この構造規格が適用されるエックス線装置は、見やすい箇所に、定格出力、型式検定合格番号、製造者名及び製造年月が表示されていなければならない。$c$, false, 3),
  ('b67fca43-3a0d-40d4-88f9-9e910275c9f4', $c$この構造規格が適用されるエックス線装置は、医療用のものでも工業用のものでも、エックス線管について必要とされる遮蔽の基準は等しい。$c$, false, 4),
  ('b67fca43-3a0d-40d4-88f9-9e910275c9f4', $c$海外から輸入されたエックス線装置には、この構造規格は適用されない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '02611a74-72e8-4d1d-85ff-aa8fd278e114',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$電離放射線健康診断(以下「健康診断」という。)の実施について、労働安全衛生関係法令に違反しているものは次のうちどれか。ただし、労働者は緊急作業に従事しないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('02611a74-72e8-4d1d-85ff-aa8fd278e114', $c$雇入れの際の健康診断において、使用する線源の種類等に応じて「白内障に関する眼の検査」を省略している。$c$, false, 1),
  ('02611a74-72e8-4d1d-85ff-aa8fd278e114', $c$定期の健康診断において、医師が必要でないと認めた労働者に対し、「白血球数及び白血球百分率の検査」を省略している。$c$, false, 2),
  ('02611a74-72e8-4d1d-85ff-aa8fd278e114', $c$放射線業務に配置替えの際に行う健康診断において、被ばく歴のない労働者に対し、医師が必要と認めなかったので、「赤血球数の検査及び血色素量又はヘマトクリット値の検査」を省略している。$c$, true, 3),
  ('02611a74-72e8-4d1d-85ff-aa8fd278e114', $c$事業場において実施した健康診断の項目に異常の所見があると診断された労働者については、その結果に基づき、健康を保持するために必要な措置について、健康診断実施日から３か月以内に、医師の意見を聴いている。$c$, false, 4),
  ('02611a74-72e8-4d1d-85ff-aa8fd278e114', $c$放射線業務従事者が離職する際に健康診断を実施していない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次のＡからＤの場合について、所轄労働基準監督署長にその旨又はその結果を報告しなければならないものの全ての組合せは、(１)～(５)のうちどれか。ただし、労働安全衛生規則を安衛則、電離放射線障害防止規則を電離則という。
Ａ エックス線作業主任者を選任したとき。
Ｂ 労働者数が常時25人の事業場で、電離則に基づく定期の電離放射線健康診断を行ったとき。
Ｃ 労働者数が常時50人以上の事業場で、電離則に基づく雇入れの際の電離放射線健康診断を行ったとき。
Ｄ 労働者数が常時50人以上の事業場で、安衛則に基づく定期健康診断を行ったとき。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9', $c$Ａ，Ｂ$c$, false, 1),
  ('ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9', $c$Ａ，Ｃ$c$, false, 2),
  ('ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9', $c$Ｂ，Ｃ$c$, false, 3),
  ('ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9', $c$Ｂ，Ｄ$c$, true, 4),
  ('ab2f0bd1-4a6f-4c0c-88f5-46b23b3f4be9', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '55700abf-76e2-49fe-b7b3-ee518c5c48f4',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて放射線業務を行う作業場の管理区域に該当する部分の作業環境測定に関する次の記述のうち、労働安全衛生関係法令上、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('55700abf-76e2-49fe-b7b3-ee518c5c48f4', $c$管理区域内でエックス線装置を固定して使用する場合において、被照射体の位置が一定しているときは、６か月以内ごとに１回、定期に、測定を行わなければならない。$c$, false, 1),
  ('55700abf-76e2-49fe-b7b3-ee518c5c48f4', $c$測定は、１cm線量当量率又は１cm線量当量について行うものとするが、70μm線量当量率が１cm線量当量率を超えるおそれのある場所又は70μm線量当量が１cm線量当量を超えるおそれのある場所においては、それぞれ70μm線量当量率又は70μm線量当量について行わなければならない。$c$, false, 2),
  ('55700abf-76e2-49fe-b7b3-ee518c5c48f4', $c$測定の結果は、見やすい場所に掲示する等の方法により、管理区域に立ち入る者に周知させなければならない。$c$, true, 3),
  ('55700abf-76e2-49fe-b7b3-ee518c5c48f4', $c$測定を行ったときは、遅滞なく、その結果を所轄労働基準監督署長に提出しなければならない。$c$, false, 4),
  ('55700abf-76e2-49fe-b7b3-ee518c5c48f4', $c$測定を行ったときは、測定日時、測定方法、測定結果等法定の事項を記録し、30年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c8842934-34a9-45a3-9a0f-285f12a53180',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = '関係法令'),
  $q$エックス線装置を用いて行う透過写真撮影の業務に常時従事する労働者20人を含めて1,200人の労働者を常時使用する製造業の事業場の安全衛生管理体制として、労働安全衛生関係法令上、選任しなければならないものに該当しないものは次のうちどれか。ただし、その他の有害業務はなく、衛生管理者及び産業医の選任の特例はないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c8842934-34a9-45a3-9a0f-285f12a53180', $c$総括安全衛生管理者$c$, false, 1),
  ('c8842934-34a9-45a3-9a0f-285f12a53180', $c$専属の産業医$c$, false, 2),
  ('c8842934-34a9-45a3-9a0f-285f12a53180', $c$４人以上の衛生管理者$c$, false, 3),
  ('c8842934-34a9-45a3-9a0f-285f12a53180', $c$専任の衛生管理者$c$, false, 4),
  ('c8842934-34a9-45a3-9a0f-285f12a53180', $c$衛生工学衛生管理者免許を有する衛生管理者$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1246f74a-7fcc-4e58-bd2d-190c38776bf3',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線に関連した量とその単位の組合せとして、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1246f74a-7fcc-4e58-bd2d-190c38776bf3', $c$吸収線量 ………………………… Gy$c$, false, 1),
  ('1246f74a-7fcc-4e58-bd2d-190c38776bf3', $c$線減弱係数 ……………………… m⁻¹$c$, false, 2),
  ('1246f74a-7fcc-4e58-bd2d-190c38776bf3', $c$カーマ …………………………… Gy$c$, false, 3),
  ('1246f74a-7fcc-4e58-bd2d-190c38776bf3', $c$粒子フルエンス ………………… J･m⁻²$c$, true, 4),
  ('1246f74a-7fcc-4e58-bd2d-190c38776bf3', $c$等価線量 ………………………… J･kg⁻¹$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0c51d294-779a-495b-a1c5-c2c213701645',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$気体の電離を利用する放射線検出器の印加電圧と生じる電離電流の特性に対応した次のＡからＤの領域について、気体(ガス)増幅が生じ、検出器として利用されるものの組合せは(１)～(５)のうちどれか。
Ａ 再結合領域
Ｂ 電離箱領域
Ｃ 比例計数管領域
Ｄ ＧＭ計数管領域$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0c51d294-779a-495b-a1c5-c2c213701645', $c$Ａ，Ｂ$c$, false, 1),
  ('0c51d294-779a-495b-a1c5-c2c213701645', $c$Ａ，Ｃ$c$, false, 2),
  ('0c51d294-779a-495b-a1c5-c2c213701645', $c$Ｂ，Ｃ$c$, false, 3),
  ('0c51d294-779a-495b-a1c5-c2c213701645', $c$Ｂ，Ｄ$c$, false, 4),
  ('0c51d294-779a-495b-a1c5-c2c213701645', $c$Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f5b06b55-014a-4afa-ac7a-bf6613166e44',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線検出器とそれに関係の深い用語との組合せとして、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f5b06b55-014a-4afa-ac7a-bf6613166e44', $c$電離箱 …………………………… 窒息現象$c$, false, 1),
  ('f5b06b55-014a-4afa-ac7a-bf6613166e44', $c$比例計数管 ……………………… グロー曲線$c$, false, 2),
  ('f5b06b55-014a-4afa-ac7a-bf6613166e44', $c$ＧＭ計数管 ……………………… 電子なだれ$c$, true, 3),
  ('f5b06b55-014a-4afa-ac7a-bf6613166e44', $c$シンチレーション検出器 ……… Ｇ値$c$, false, 4),
  ('f5b06b55-014a-4afa-ac7a-bf6613166e44', $c$半導体検出器 …………………… ラジオフォトルミネセンス$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1c71fac5-5b66-4163-b8ff-abdcfdd6afd3',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$エックス線の測定に用いるＮaI(Ｔl)シンチレーション検出器に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1c71fac5-5b66-4163-b8ff-abdcfdd6afd3', $c$シンチレータとして用いられるヨウ化ナトリウム結晶は、微量のタリウムを含有させて活性化されている。$c$, false, 1),
  ('1c71fac5-5b66-4163-b8ff-abdcfdd6afd3', $c$シンチレータにエックス線が入射すると、可視領域の減衰時間の短い光が放射される。$c$, false, 2),
  ('1c71fac5-5b66-4163-b8ff-abdcfdd6afd3', $c$シンチレータから放射された光は、光電子増倍管の光電面で光電子に変換され、増倍された後、電流パルスとして出力される。$c$, false, 3),
  ('1c71fac5-5b66-4163-b8ff-abdcfdd6afd3', $c$光電子増倍管から得られる出力パルス波高は、入射エックス線の線量率に比例する。$c$, true, 4),
  ('1c71fac5-5b66-4163-b8ff-abdcfdd6afd3', $c$光電子増倍管の増倍率は、印加電圧に依存するので、光電子増倍管に印加する高圧電源は安定化する必要がある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8db6294f-e586-42b8-a22f-3ef00476f882',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$次のエックス線とその測定に用いるサーベイメータの組合せのうち、適切でないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8db6294f-e586-42b8-a22f-3ef00476f882', $c$0.1μSv/h程度の線量率のエックス線…………………………… ＮaI(Ｔl)シンチレーション式サーベイメータ$c$, false, 1),
  ('8db6294f-e586-42b8-a22f-3ef00476f882', $c$湿度の高い場所における100μSv/h程度の線量率のエックス線…………………………… ＧＭ計数管式サーベイメータ$c$, false, 2),
  ('8db6294f-e586-42b8-a22f-3ef00476f882', $c$50mSv/h程度の線量率で、散乱線を多く含むエックス線…………………………… ＧＭ計数管式サーベイメータ$c$, true, 3),
  ('8db6294f-e586-42b8-a22f-3ef00476f882', $c$100keV程度のエネルギーで、10μSv/h程度の線量率のエックス線…………………………… 半導体式サーベイメータ$c$, false, 4),
  ('8db6294f-e586-42b8-a22f-3ef00476f882', $c$300keV程度のエネルギーで、10mSv/h程度の線量率のエックス線…………………………… 電離箱式サーベイメータ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9a3e34c6-989a-42ec-a633-6282f8267876',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$蛍光ガラス線量計に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9a3e34c6-989a-42ec-a633-6282f8267876', $c$放射線により生成された蛍光中心が紫外線の照射によって発光する、輝尽性蛍光という現象を利用した線量計である。$c$, false, 1),
  ('9a3e34c6-989a-42ec-a633-6282f8267876', $c$読み取り装置で線量を読み取ることによって蛍光中心が消えてしまうため、再度読み取ることはできない。$c$, false, 2),
  ('9a3e34c6-989a-42ec-a633-6282f8267876', $c$線量計の素子間の感度のばらつきが少なく、また、フェーディングは極めて小さい。$c$, true, 3),
  ('9a3e34c6-989a-42ec-a633-6282f8267876', $c$測定可能な線量の範囲は、熱ルミネセンス線量計より広く、0.1μSv～100Sv程度である。$c$, false, 4),
  ('9a3e34c6-989a-42ec-a633-6282f8267876', $c$素子は、光学的アニーリングにより、再度使用することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c7286c96-3f3f-4ef3-9892-d43401084260',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線防護のための被ばく線量の算定に関する次のＡからＤの記述について、誤っているものの組合せは(１)～(５)のうちどれか。
Ａ 外部被ばくによる実効線量は、法令に基づき放射線測定器を装着した各部位の１cm線量当量及び70μm線量当量を用いて算定する。
Ｂ 皮膚の等価線量は、エックス線については70μm線量当量により算定する。
Ｃ 眼の水晶体の等価線量は、放射線の種類及びエネルギーに応じて、１cm線量当量、３mm線量当量又は70μm線量当量のうちいずれか適切なものにより算定する。
Ｄ 妊娠中の女性の腹部表面の等価線量は、腹・大腿部における70μm線量当量により算定する。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c7286c96-3f3f-4ef3-9892-d43401084260', $c$Ａ，Ｂ$c$, false, 1),
  ('c7286c96-3f3f-4ef3-9892-d43401084260', $c$Ａ，Ｃ$c$, false, 2),
  ('c7286c96-3f3f-4ef3-9892-d43401084260', $c$Ａ，Ｄ$c$, true, 3),
  ('c7286c96-3f3f-4ef3-9892-d43401084260', $c$Ｂ，Ｃ$c$, false, 4),
  ('c7286c96-3f3f-4ef3-9892-d43401084260', $c$Ｂ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a4576f06-2e34-44fa-9ba3-29047de61a08',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$放射線の測定などについての用語に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a4576f06-2e34-44fa-9ba3-29047de61a08', $c$半導体検出器において、放射線が半導体中で１個の電子・正孔対を作るのに必要な平均エネルギーをε値といい、シリコン結晶の場合は、約3.6eVである。$c$, true, 1),
  ('a4576f06-2e34-44fa-9ba3-29047de61a08', $c$ＧＭ計数管の動作特性曲線において、印加電圧を上げても計数率がほとんど変わらない範囲をプラトーといい、プラトー領域の印加電圧では、入射エックス線による一次電離量に比例した大きさの出力パルスが得られる。$c$, false, 2),
  ('a4576f06-2e34-44fa-9ba3-29047de61a08', $c$気体に放射線を照射したとき、１個のイオン対を作るのに必要な平均エネルギーをＷ値といい、気体の種類にあまり依存せず、放射線のエネルギーに応じてほぼ一定の値をとる。$c$, false, 3),
  ('a4576f06-2e34-44fa-9ba3-29047de61a08', $c$ＧＭ計数管が入射放射線により一度放電し、一時的に検出能力が失われた後、出力波高値が弁別レベルまで回復する時間を回復時間という。$c$, false, 4),
  ('a4576f06-2e34-44fa-9ba3-29047de61a08', $c$放射線測定器の指針が安定せず、ゆらぐ現象をフェーディングという。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5b650aed-565f-4392-9bf9-2db68ffc8a08',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$あるサーベイメータを用いて、時定数を２秒に設定し、エックス線を測定したところ、指示値は100(cps)を示した。このとき、計数率の相対標準偏差に最も近い値は(１)～(５)のうちどれか。ただし、積分回路の時定数Ｔ秒のサーベイメータを用いて線量を測定し、計数率ｎ(cps)を得たとき、計数率の標準偏差σ(cps)は次式で示される。σ＝√(ｎ／２Ｔ)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5b650aed-565f-4392-9bf9-2db68ffc8a08', $c$1％$c$, false, 1),
  ('5b650aed-565f-4392-9bf9-2db68ffc8a08', $c$2％$c$, false, 2),
  ('5b650aed-565f-4392-9bf9-2db68ffc8a08', $c$3％$c$, false, 3),
  ('5b650aed-565f-4392-9bf9-2db68ffc8a08', $c$5％$c$, true, 4),
  ('5b650aed-565f-4392-9bf9-2db68ffc8a08', $c$10％$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '96fbfd7b-34f0-42a0-b128-7e86034b74c3',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の測定に関する知識'),
  $q$電離箱式サーベイメータを用い、積算１cm線量当量のレンジ(フルスケールは10μSv)を使用して、ある場所で、実効エネルギーが180keVのエックス線を測定したところ、フルスケールまで指針が振れるのに100秒かかった。このときの１cm線量当量率に最も近い値は次のうちどれか。ただし、測定に用いたこのサーベイメータの校正定数は、エックス線のエネルギーが120keVのときには0.85、250keVのときには0.98であり、このエネルギー範囲では、直線的に変化するものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('96fbfd7b-34f0-42a0-b128-7e86034b74c3', $c$310 μSv/h$c$, false, 1),
  ('96fbfd7b-34f0-42a0-b128-7e86034b74c3', $c$330 μSv/h$c$, true, 2),
  ('96fbfd7b-34f0-42a0-b128-7e86034b74c3', $c$360 μSv/h$c$, false, 3),
  ('96fbfd7b-34f0-42a0-b128-7e86034b74c3', $c$400 μSv/h$c$, false, 4),
  ('96fbfd7b-34f0-42a0-b128-7e86034b74c3', $c$450 μSv/h$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '17b91735-c06d-4263-986c-22dad1be636f',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線によるＤＮＡの損傷と修復に関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('17b91735-c06d-4263-986c-22dad1be636f', $c$放射線によるＤＮＡ損傷には、塩基損傷とＤＮＡ鎖切断があるが、間接電離放射線では、塩基損傷は生じない。$c$, false, 1),
  ('17b91735-c06d-4263-986c-22dad1be636f', $c$ＤＮＡ鎖切断のうち、二重らせんの片方だけが切れる１本鎖切断は、細胞死などの重篤な細胞障害に関連が深い。$c$, false, 2),
  ('17b91735-c06d-4263-986c-22dad1be636f', $c$細胞には、ＤＮＡ鎖切断を修復する機能があり、修復が誤りなく行われれば、細胞は回復し、正常に増殖を続けるが、塩基損傷を修復する機能はない。$c$, false, 3),
  ('17b91735-c06d-4263-986c-22dad1be636f', $c$ＤＮＡ鎖切断の修復方式のうち、非相同末端結合修復は、ＤＮＡ切断端どうしを直接結合する方式である。$c$, true, 4),
  ('17b91735-c06d-4263-986c-22dad1be636f', $c$ＤＮＡ鎖切断のうち、２本鎖切断はＤＮＡ鎖の組換え現象が利用されるため、１本鎖切断に比べて容易に修復される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8675da4f-c143-4700-85a4-3e28301ed8ec',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$次のＡからＣの人体の組織・器官について、放射線感受性の高いものから順に並べたものは(１)～(５)のうちどれか。
Ａ 皮脂腺
Ｂ 甲状腺
Ｃ 神経組織$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8675da4f-c143-4700-85a4-3e28301ed8ec', $c$Ａ, Ｂ，Ｃ$c$, true, 1),
  ('8675da4f-c143-4700-85a4-3e28301ed8ec', $c$Ａ，Ｃ, Ｂ$c$, false, 2),
  ('8675da4f-c143-4700-85a4-3e28301ed8ec', $c$Ｂ, Ａ, Ｃ$c$, false, 3),
  ('8675da4f-c143-4700-85a4-3e28301ed8ec', $c$Ｂ, Ｃ，Ａ$c$, false, 4),
  ('8675da4f-c143-4700-85a4-3e28301ed8ec', $c$Ｃ，Ａ, Ｂ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3c1b01ed-a04f-44a7-b3f3-0d1f430e294f',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線の生体影響などに関する次の記述のうち、正しいものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3c1b01ed-a04f-44a7-b3f3-0d1f430e294f', $c$線量率効果とは、同じ線量を照射する場合に、線量率を低くすると、生物効果が小さくなることをいう。$c$, true, 1),
  ('3c1b01ed-a04f-44a7-b3f3-0d1f430e294f', $c$全致死線量は、半致死線量の２倍に相当する線量であり、この線量を被ばくした個体は数時間～数日のうちに死亡する。$c$, false, 2),
  ('3c1b01ed-a04f-44a7-b3f3-0d1f430e294f', $c$半致死線量は、被ばくした集団の全ての個体が一定の期間内に死亡する最小線量の50％に相当する線量である。$c$, false, 3),
  ('3c1b01ed-a04f-44a7-b3f3-0d1f430e294f', $c$生物効果比(ＲＢＥ)は、基準となる放射線と問題にしている放射線について、各々の同一線量を被ばくしたときの集団の生存率の比により、線質の異なる放射線の生物効果の大きさを比較したものである。$c$, false, 4),
  ('3c1b01ed-a04f-44a7-b3f3-0d1f430e294f', $c$線エネルギー付与(ＬＥＴ)とは、物質中を放射線が通過するとき、荷電粒子の飛跡に沿って単位長さ当たりに物質に与えられるエネルギーをいい、エックス線は高ＬＥＴ放射線に分類される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '10acd56b-434a-4acb-b23b-aca3f6801573',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$ヒトが一時に全身にエックス線の照射を受けた場合の早期影響に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('10acd56b-434a-4acb-b23b-aca3f6801573', $c$１～２Gy程度の被ばくで、放射線宿酔の症状が現れることがある。$c$, false, 1),
  ('10acd56b-434a-4acb-b23b-aca3f6801573', $c$被ばくから死亡までの期間は、一般に造血器官の障害による場合の方が、消化器官の障害による場合より長い。$c$, false, 2),
  ('10acd56b-434a-4acb-b23b-aca3f6801573', $c$３～５Gy程度の被ばくによる死亡は、主に造血器官の障害によるものである。$c$, false, 3),
  ('10acd56b-434a-4acb-b23b-aca3f6801573', $c$消化器官の障害を主因とする死亡までの期間は、５～20日程度である。$c$, false, 4),
  ('10acd56b-434a-4acb-b23b-aca3f6801573', $c$５～10Gy程度の被ばくによる死亡は、主に中枢神経系の障害によるものである。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '082b85bd-df8a-4a24-8061-807daf4a6383',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$エックス線の直接作用と間接作用に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('082b85bd-df8a-4a24-8061-807daf4a6383', $c$エックス線による直接作用では、エックス線によって飛び出した二次電子が生体高分子の電離又は励起を引き起こし、生体高分子に損傷を与える。$c$, false, 1),
  ('082b85bd-df8a-4a24-8061-807daf4a6383', $c$エックス線による間接作用では、エックス線によって飛び出した二次電子が水分子の電離又は励起を引き起こしてラジカルを生成し、そのラジカルが生体高分子に損傷を与える。$c$, false, 2),
  ('082b85bd-df8a-4a24-8061-807daf4a6383', $c$低温下では、直接作用による放射線効果は減少するが、間接作用による放射線効果は影響を受けない。$c$, true, 3),
  ('082b85bd-df8a-4a24-8061-807daf4a6383', $c$生体中にシステインなどのＳＨ基をもつ化合物が存在するとエックス線の生物効果が軽減されることは、間接作用により説明される。$c$, false, 4),
  ('082b85bd-df8a-4a24-8061-807daf4a6383', $c$溶液中の酵素の濃度を変えて一定線量のエックス線を照射するとき、酵素の濃度が減少するに従って、酵素の全分子のうち不活性化される分子の占める割合が増加することは、間接作用により説明される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e55846dd-1ff1-4a3d-855e-9aa22d88e2df',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$生物効果比(ＲＢＥ)に関する次のＡからＤの記述について、正しいものの組合せは(１)～(５)のうちどれか。
Ａ ＲＢＥを求めるときの基準放射線としては、通常、アルファ線が用いられる。
Ｂ ＲＢＥの値は、同じ線質の放射線であっても、着目する生物効果、線量率などの条件によって異なる。
Ｃ エックス線は、そのエネルギーの高低にかかわらず、ＲＢＥが１より小さい。
Ｄ ＲＢＥは、放射線の線エネルギー付与(ＬＥＴ)の増加とともに増大し、100keV/μm付近で最大値を示すが、更にＬＥＴが大きくなるとＲＢＥは減少していく。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e55846dd-1ff1-4a3d-855e-9aa22d88e2df', $c$Ａ，Ｂ$c$, false, 1),
  ('e55846dd-1ff1-4a3d-855e-9aa22d88e2df', $c$Ａ，Ｃ$c$, false, 2),
  ('e55846dd-1ff1-4a3d-855e-9aa22d88e2df', $c$Ｂ，Ｃ$c$, false, 3),
  ('e55846dd-1ff1-4a3d-855e-9aa22d88e2df', $c$Ｂ，Ｄ$c$, true, 4),
  ('e55846dd-1ff1-4a3d-855e-9aa22d88e2df', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd153737e-16fc-4f9d-807b-90c385f2df25',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$エックス線被ばくによる末梢血液中の血球の変化に関する次の記述のうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d153737e-16fc-4f9d-807b-90c385f2df25', $c$末梢血液中の赤血球の減少は貧血を招き、白血球の減少は止血機能の低下を招く原因となる。$c$, true, 1),
  ('d153737e-16fc-4f9d-807b-90c385f2df25', $c$末梢血液中の血球数の減少は、250mGy程度の被ばくから認められる。$c$, false, 2),
  ('d153737e-16fc-4f9d-807b-90c385f2df25', $c$末梢血液中の白血球のうち、リンパ球は他の成分より放射線感受性が高く、被ばく直後から減少が現れる。$c$, false, 3),
  ('d153737e-16fc-4f9d-807b-90c385f2df25', $c$末梢血液中のリンパ球を除く白血球は、被ばく直後は一時的に増加が認められることがある。$c$, false, 4),
  ('d153737e-16fc-4f9d-807b-90c385f2df25', $c$末梢血液中の血球のうち、被ばく後減少が現れるのが最も遅いものは赤血球である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd5d734ea-463c-43e0-b017-c99058858ca4',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$エックス線被ばくによる放射線皮膚炎の症状に関する次のＡからＤの記述について、正しいものの組合せは(１)～(５)のうちどれか。
Ａ 0.2Gyの被ばくでは、皮膚の充血や腫脹がみられる。
Ｂ ３Gyの被ばくでは、軽度の紅斑や一時的な脱毛がみられる。
Ｃ ５Gyの被ばくでは、水疱や永久脱毛がみられる。
Ｄ 25Gyの被ばくでは、進行性びらんや難治性の潰瘍がみられる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d5d734ea-463c-43e0-b017-c99058858ca4', $c$Ａ，Ｂ$c$, false, 1),
  ('d5d734ea-463c-43e0-b017-c99058858ca4', $c$Ａ，Ｃ$c$, false, 2),
  ('d5d734ea-463c-43e0-b017-c99058858ca4', $c$Ｂ，Ｃ$c$, false, 3),
  ('d5d734ea-463c-43e0-b017-c99058858ca4', $c$Ｂ，Ｄ$c$, true, 4),
  ('d5d734ea-463c-43e0-b017-c99058858ca4', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '159eee1b-0f32-4664-a1dc-ff715a8d9be2',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$次のＡからＤの放射線影響について、その発症にしきい線量が存在するものの全ての組合せは(１)～(５)のうちどれか。
Ａ 白血病
Ｂ 永久不妊
Ｃ 皮膚炎
Ｄ 胎児奇形$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('159eee1b-0f32-4664-a1dc-ff715a8d9be2', $c$Ａ，Ｂ，Ｄ$c$, false, 1),
  ('159eee1b-0f32-4664-a1dc-ff715a8d9be2', $c$Ａ，Ｃ$c$, false, 2),
  ('159eee1b-0f32-4664-a1dc-ff715a8d9be2', $c$Ａ，Ｄ$c$, false, 3),
  ('159eee1b-0f32-4664-a1dc-ff715a8d9be2', $c$Ｂ，Ｃ$c$, false, 4),
  ('159eee1b-0f32-4664-a1dc-ff715a8d9be2', $c$Ｂ，Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'fb73f6f0-eb5b-4769-91cf-a70347373ef2',
  'xray',
  (SELECT id FROM exam_types WHERE exam_id = 'xray' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'xray' AND e.code = 'common' AND c.name = 'エックス線の生体に与える影響に関する知識'),
  $q$放射線による遺伝的影響等に関する次のＡからＤの記述について、正しいものの全ての組合せは(１)～(５)のうちどれか。
Ａ 生殖細胞の突然変異には、遺伝子突然変異と染色体異常がある。
Ｂ 染色体異常には、逆位、転座などがある。
Ｃ 生殖腺が被ばくしたときに生じるおそれのある障害には、遺伝的影響のほか、身体的影響に分類されるものがある。
Ｄ 放射線照射により、突然変異率を自然における値の２倍にする線量を倍加線量といい、ヒトでは約0.05Gyである。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 エックス線作業主任者試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fb73f6f0-eb5b-4769-91cf-a70347373ef2', $c$Ａ, Ｂ$c$, false, 1),
  ('fb73f6f0-eb5b-4769-91cf-a70347373ef2', $c$Ａ, Ｂ, Ｃ$c$, true, 2),
  ('fb73f6f0-eb5b-4769-91cf-a70347373ef2', $c$Ａ, Ｃ$c$, false, 3),
  ('fb73f6f0-eb5b-4769-91cf-a70347373ef2', $c$Ｂ, Ｃ，Ｄ$c$, false, 4),
  ('fb73f6f0-eb5b-4769-91cf-a70347373ef2', $c$Ｂ, Ｄ$c$, false, 5);

do $$
declare
  xray_2025_10 int;
begin
  select count(*) into xray_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 エックス線作業主任者試験%';

  if xray_2025_10 <> 40 then
    raise exception 'xray 2025-10 sitting must be 40 questions (got %)', xray_2025_10;
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
  'エックス線作業主任者模擬試験(令和7年10月)',
  240,
  40,
  '令和7年10月公表 エックス線作業主任者試験'
from exam_types
where exam_types.exam_id = 'xray'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'xray'
      and source_filter = '令和7年10月公表 エックス線作業主任者試験'
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
  'エックス線作業主任者模擬試験(令和7年10月)【生体影響免除】',
  180,
  30,
  '令和7年10月公表 エックス線作業主任者試験',
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
      and name = 'エックス線作業主任者模擬試験(令和7年10月)【生体影響免除】'
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
  'エックス線作業主任者模擬試験(令和7年10月)【測定・生体影響免除】',
  120,
  20,
  '令和7年10月公表 エックス線作業主任者試験',
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
      and name = 'エックス線作業主任者模擬試験(令和7年10月)【測定・生体影響免除】'
  );
