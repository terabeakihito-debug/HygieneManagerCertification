-- crane_all 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'crane_all', 'クレーン・デリック運転士（限定なし）', '公益財団法人安全衛生技術試験協会', true
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'crane_all');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'crane_all', 'common', 'クレーン・デリック運転士（限定なし）'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'crane_all', 'common', 'クレーン・デリック運転士（限定なし）', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'crane_all' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'crane_all', 'クレーン及びデリックに関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'crane_all'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'クレーン及びデリックに関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'crane_all', '関係法令', 2
FROM exam_types et
WHERE et.exam_id = 'crane_all'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'crane_all', '原動機及び電気に関する知識', 3
FROM exam_types et
WHERE et.exam_id = 'crane_all'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '原動機及び電気に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'crane_all', 'クレーンの運転のために必要な力学に関する知識', 4
FROM exam_types et
WHERE et.exam_id = 'crane_all'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'クレーンの運転のために必要な力学に関する知識'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンに関する用語の記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27', $c$天井クレーンの寄りとは、クラブトロリをクレーンガーダ端の停止位置まで寄せたときの、クラブトロリ端部とクレーンガーダ端部との間の最小の水平距離をいう。$c$, false, 1),
  ('6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27', $c$起伏するジブクレーンのジブの傾斜角とは、ジブの中心線と水平面とのなす角をいう。$c$, true, 2),
  ('6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27', $c$起伏するジブクレーンの作業半径とは、ジブの取付けピンの中心から、ジブ先端のシーブの中心までの距離をいい、引込みクレーンでは、水平引込み機構により、ジブを起伏させると作業半径が変化する。$c$, false, 3),
  ('6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27', $c$天井クレーンのキャンバとは、クレーンガーダに荷重がかかったときに生じる下向きのそり(曲がり)をいう。$c$, false, 4),
  ('6544cbe0-ecb4-4839-8e9b-5ac6de8dfe27', $c$定格速度とは、つり上げ荷重に相当する荷重の荷をつって、巻上げ、走行、横行、旋回などの作動を行う場合の、それぞれの最高の速度をいう。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b8bf9871-963c-41d0-a7e2-605130331e01',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの構造部分に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b8bf9871-963c-41d0-a7e2-605130331e01', $c$ジブクレーンのジブは、荷をより多くつり上げることができるように、自重をできるだけ軽くするとともに、剛性を持たせる必要があるため、パイプトラス構造やボックス構造のものが用いられる。$c$, true, 1),
  ('b8bf9871-963c-41d0-a7e2-605130331e01', $c$Ｉビームガーダは、Ｉ形鋼を用いたクレーンガーダで、Ｉビームガーダ単独では水平力を支えることができないので、必ず補けたを設ける。$c$, false, 2),
  ('b8bf9871-963c-41d0-a7e2-605130331e01', $c$プレートガーダは、細長い部材を三角形に組んだ骨組構造で、強度が大きい。$c$, false, 3),
  ('b8bf9871-963c-41d0-a7e2-605130331e01', $c$橋形クレーンの脚部には、剛脚と揺脚があり、剛脚はクレーンガーダに作用する水平力に耐える構造とするため、クレーンガーダとピンヒンジで接合されている。$c$, false, 4),
  ('b8bf9871-963c-41d0-a7e2-605130331e01', $c$ボックスガーダは、鋼板を箱形状の断面に構成したものであるが、その断面形状では水平力を十分に支えることができないため、補けたと組み合わせて用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2ae6884e-32b4-45ec-ad03-966e6ebe1cbc',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$次の図はクレーンなどで使用されているフィラー形のワイヤロープの構造を示したものであるが、ＡからＤまでに示す部分の名称の組合せとして、適切なものは(１)～(５)のうちどれか。
Ａ Ｂ Ｃ Ｄ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問3',
  '/exam-figures/crane_all/2025-10/q03.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2ae6884e-32b4-45ec-ad03-966e6ebe1cbc', $c$素線 ストランド フィラー線 心綱$c$, false, 1),
  ('2ae6884e-32b4-45ec-ad03-966e6ebe1cbc', $c$素線 ストランド 心綱 フィラー線$c$, false, 2),
  ('2ae6884e-32b4-45ec-ad03-966e6ebe1cbc', $c$心綱 素線 ストランド フィラー線$c$, true, 3),
  ('2ae6884e-32b4-45ec-ad03-966e6ebe1cbc', $c$心綱 フィラー線 ストランド 素線$c$, false, 4),
  ('2ae6884e-32b4-45ec-ad03-966e6ebe1cbc', $c$ストランド 素線 フィラー線 心綱$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '360ecbf8-b66a-4c27-a5d0-313b86e03681',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの運動とそれに対する安全装置などの組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('360ecbf8-b66a-4c27-a5d0-313b86e03681', $c$横行 ………… 横行車輪直径の５分の１以上の高さの車輪止め$c$, false, 1),
  ('360ecbf8-b66a-4c27-a5d0-313b86e03681', $c$走行 ………… 走行車輪直径の３分の１以上の高さの車輪止め$c$, false, 2),
  ('360ecbf8-b66a-4c27-a5d0-313b86e03681', $c$起伏 ………… 斜行防止装置$c$, false, 3),
  ('360ecbf8-b66a-4c27-a5d0-313b86e03681', $c$巻下げ ……… 重錘形リミットスイッチを用いた巻過防止装置$c$, false, 4),
  ('360ecbf8-b66a-4c27-a5d0-313b86e03681', $c$巻上げ ……… ねじ形リミットスイッチを用いた巻過防止装置$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '924a4300-3e24-4b66-9ecc-40edbeb5ab9b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$下記に掲げるＡからＥまでのボルトの締め付けや緩み止めに用いられる部品名とその図について、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ ばね座金 Ｂ ダブルナット Ｃ ばねナット
Ｄ 溝付きナット Ｅ 舌付き座金$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問5',
  '/exam-figures/crane_all/2025-10/q05.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('924a4300-3e24-4b66-9ecc-40edbeb5ab9b', $c$Ａ，Ｂ，Ｅ$c$, false, 1),
  ('924a4300-3e24-4b66-9ecc-40edbeb5ab9b', $c$Ａ，Ｃ，Ｅ$c$, false, 2),
  ('924a4300-3e24-4b66-9ecc-40edbeb5ab9b', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('924a4300-3e24-4b66-9ecc-40edbeb5ab9b', $c$Ｃ，Ｄ$c$, true, 4),
  ('924a4300-3e24-4b66-9ecc-40edbeb5ab9b', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '307f68ac-f747-45c4-bdeb-d9bf9052781c',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの給油及び点検に関するＡからＥまでの記述として、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ ワイヤロープは、シーブ通過による繰り返し曲げを受ける部分、ロープ端部の取付け部分などに重点を置いて点検する。
Ｂ 潤滑油としてギヤー油を用いた減速機箱は、箱内が密封されているので、油の交換は不要である。
Ｃ 給油装置は、配管の穴あき、詰まりなどにより給油されないことがあるので、給油部分から古い油が押し出されている状態などにより、新油が給油されていることを確認する。
Ｄ 軸受へのグリースの給油は、転がり軸受では毎日１回程度、平軸受(滑り軸受)では６か月に１回程度の間隔で行う。
Ｅ グリースカップ式の給油方法は、グリースカップから一定の圧力で自動的にグリースが圧送されるので、給油の手間がかからない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('307f68ac-f747-45c4-bdeb-d9bf9052781c', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('307f68ac-f747-45c4-bdeb-d9bf9052781c', $c$Ａ，Ｃ$c$, true, 2),
  ('307f68ac-f747-45c4-bdeb-d9bf9052781c', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('307f68ac-f747-45c4-bdeb-d9bf9052781c', $c$Ｂ，Ｄ，Ｅ$c$, false, 4),
  ('307f68ac-f747-45c4-bdeb-d9bf9052781c', $c$Ｃ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2959946b-e878-41db-83c5-67954c8661ac',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンのブレーキに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2959946b-e878-41db-83c5-67954c8661ac', $c$バンドブレーキには、バンドを締め付けたときにバンドが平均して締まるように、バンドの外周にすき間を調整する摩擦パッドが配置されている。$c$, true, 1),
  ('2959946b-e878-41db-83c5-67954c8661ac', $c$足踏み油圧式ディスクブレーキは、油圧シリンダ、ブレーキピストン及びこれらをつなぐ配管などに油漏れや空気の混入があると、制動力が生じなくなることがある。$c$, false, 2),
  ('2959946b-e878-41db-83c5-67954c8661ac', $c$つり上げ装置のブレーキの制動トルクの値は、定格荷重に相当する荷重の荷をつった場合における当該装置のトルクの値の150％以上に調整する。$c$, false, 3),
  ('2959946b-e878-41db-83c5-67954c8661ac', $c$ドラム形電磁ブレーキは、制動時につり荷を停止位置で安全に支持する無電圧作動型のブレーキである。$c$, false, 4),
  ('2959946b-e878-41db-83c5-67954c8661ac', $c$電動油圧押上機ブレーキは、ばねにより制動を行い、押上機の油圧の押上げ力によりブレーキの制動を開放する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f028a5db-e9df-485f-addc-c9528ca9d0e5',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$デリックの種類及び型式に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f028a5db-e9df-485f-addc-c9528ca9d0e5', $c$鳥居形デリックは、２本の直立したマストを２本のステーにより後方から支えるもので、旋回角度はステーにより制限され、通常は180°が限度である。$c$, false, 1),
  ('f028a5db-e9df-485f-addc-c9528ca9d0e5', $c$ガイデリックは、１本の傾斜したマストを６本以上のガイロープにより支えるもので、ブームはガイロープをくぐるようにして旋回するが、旋回角度はガイロープにより制限され、通常は240°が限度である。$c$, false, 2),
  ('f028a5db-e9df-485f-addc-c9528ca9d0e5', $c$ジンポールデリックは、１本の直立したマストを２本のガイロープにより後方から支えるもので、旋回角度は、通常180°が限度である。$c$, false, 3),
  ('f028a5db-e9df-485f-addc-c9528ca9d0e5', $c$二又デリックは、下端が互いに交差する２本のマストを２本以上のガイロープにより後方から支えるもので、旋回は120°まで可能である。$c$, false, 4),
  ('f028a5db-e9df-485f-addc-c9528ca9d0e5', $c$スチフレッグデリックは、１本の直立したマストを通常90°に開いた２本のステーにより後方から支えるもので、旋回角度は通常240°が限度である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a9ddf841-a106-4bac-8a06-ca1113cb6060',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ガイデリックの作動装置に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a9ddf841-a106-4bac-8a06-ca1113cb6060', $c$デリック用ウインチには、単胴式と複胴式がある。$c$, false, 1),
  ('a9ddf841-a106-4bac-8a06-ca1113cb6060', $c$旋回に使用されるスインガードラムは、ウインチドラムの前側に設けられ、旋回用ワイヤロープが巻き付けられた二つのドラムを作動させることにより、ブームを旋回させるものである。$c$, false, 2),
  ('a9ddf841-a106-4bac-8a06-ca1113cb6060', $c$巻上げ装置にデリック用ウインチを使用するものでは、巻上げは原動機を正転させ、巻下げは原動機を逆転させることにより行う。$c$, true, 3),
  ('a9ddf841-a106-4bac-8a06-ca1113cb6060', $c$巻上げ装置の巻上げ用ワイヤロープは、ブーム先端のシーブ、マスト下部のシーブ、マストステップの下のシーブを経てドラムに巻き取られる。$c$, false, 4),
  ('a9ddf841-a106-4bac-8a06-ca1113cb6060', $c$デリック用ウインチの原動機は、台枠後方に取り付けられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6dfb1041-7282-4cf3-ae2f-d206e7fb2440',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$デリックの取扱いに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6dfb1041-7282-4cf3-ae2f-d206e7fb2440', $c$構造上、巻過防止装置を備えることができないデリックは、巻過ぎを防止するためドラムに目印を付け、この目印に注意して作業を行う。$c$, false, 1),
  ('6dfb1041-7282-4cf3-ae2f-d206e7fb2440', $c$ウインチを用いるデリックでは、作業中に停電になったときは、止め金を外し、クラッチをつなぎ、スイッチを切って送電を待つ。$c$, false, 2),
  ('6dfb1041-7282-4cf3-ae2f-d206e7fb2440', $c$ドラムに巻き取るワイヤロープが乱巻きになり始めた場合は、あわてて巻き戻すと乱巻きが更に進んでしまうので、一旦巻き重ねた上で、巻き戻すときにフリートアングルを調整する。$c$, false, 3),
  ('6dfb1041-7282-4cf3-ae2f-d206e7fb2440', $c$ブレーキ、クラッチ、警報装置などの機能を確認するためのならし運転は、無負荷で行う。$c$, true, 4),
  ('6dfb1041-7282-4cf3-ae2f-d206e7fb2440', $c$巻上げ操作による荷の横引きを行うときは、周囲に人がいないことを確認してから行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e4aecf6c-56b1-47db-b5c2-b1773a5046f5',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーン・デリック運転士免許及び免許証に関するＡからＥまでの記述として、法令上、誤っているもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 免許証を他人に譲渡又は貸与したときは、免許の取消し又は効力の一時停止の処分を受けることがある。
Ｂ 労働安全衛生法違反により免許の取消しの処分を受けた者は、処分を受けた日から起算して30日以内に、免許の取消しをした都道府県労働局長に免許証を返還しなければならない。
Ｃ 労働安全衛生法違反により免許を取り消され、その取消しの日から起算して１年を経過しない者は、免許を受けることができない。
Ｄ 免許に係る業務に現に就いている者は、氏名を変更したときは、免許証の書替えを受けなければならない。ただし、変更後の氏名を確認することができる他の技能講習修了証等を携帯するときは、この限りでない。
Ｅ 免許証の書替えを受けようとする者は、免許証書替申請書を免許証の交付を受けた都道府県労働局長又はその者の所属する事業場の住所を管轄する都道府県労働局長に提出しなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e4aecf6c-56b1-47db-b5c2-b1773a5046f5', $c$Ａ，Ｂ，Ｄ$c$, false, 1),
  ('e4aecf6c-56b1-47db-b5c2-b1773a5046f5', $c$Ａ，Ｃ$c$, false, 2),
  ('e4aecf6c-56b1-47db-b5c2-b1773a5046f5', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('e4aecf6c-56b1-47db-b5c2-b1773a5046f5', $c$Ｂ，Ｄ，Ｅ$c$, true, 4),
  ('e4aecf6c-56b1-47db-b5c2-b1773a5046f5', $c$Ｃ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ecd96689-ba79-4efa-94a9-2bd1981c3f5a',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$建設物の内部に設置する走行クレーン(以下、本問において｢クレーン｣という。)に関する記述として、法令上、違反となるものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ecd96689-ba79-4efa-94a9-2bd1981c3f5a', $c$クレーンと建設物との間の歩道のうち、建設物の柱に接する部分の歩道の幅を0.3ｍとしている。$c$, true, 1),
  ('ecd96689-ba79-4efa-94a9-2bd1981c3f5a', $c$クレーンの運転室の端から労働者が墜落するおそれがあるため、当該運転室の端と運転室に通ずる歩道の端との間隔を0.2ｍとしている。$c$, false, 2),
  ('ecd96689-ba79-4efa-94a9-2bd1981c3f5a', $c$クレーンと建設物との間の歩道のうち、建設物の柱に接する部分以外の歩道の幅を0.7ｍとしている。$c$, false, 3),
  ('ecd96689-ba79-4efa-94a9-2bd1981c3f5a', $c$クレーンガーダに歩道を有しないクレーンの集電装置の部分を除いた最高部と、当該クレーンの上方にある建設物のはりとの間隔を0.3ｍとしている。$c$, false, 4),
  ('ecd96689-ba79-4efa-94a9-2bd1981c3f5a', $c$クレーンガーダの歩道と当該歩道の上方にある建設物のはりとの間隔が1.7ｍであるため、当該歩道上に当該歩道からの高さが1.6ｍの天がいを設けている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '442a9b99-4f4e-4854-bee0-5ff5c403a050',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンに係る作業を行う場合であって、当該作業場において作業に従事する者がつり上げられている荷又はつり具の下に立入ることについて、法令上、禁止とされていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('442a9b99-4f4e-4854-bee0-5ff5c403a050', $c$ハッカー２個を用いて玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 1),
  ('442a9b99-4f4e-4854-bee0-5ff5c403a050', $c$つりクランプ２個を用いて玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, true, 2),
  ('442a9b99-4f4e-4854-bee0-5ff5c403a050', $c$つりチェーンを用いて、荷に設けられた穴又はアイボルトを通さず、１箇所に玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 3),
  ('442a9b99-4f4e-4854-bee0-5ff5c403a050', $c$複数の荷が一度につり上げられている場合であって、当該複数の荷が結束され、箱に入れられる等により固定されていないとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 4),
  ('442a9b99-4f4e-4854-bee0-5ff5c403a050', $c$動力下降以外の方法によってつり具を下降させるとき、つり具の下へ作業に従事する者を立ち入らせた。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9b72211a-8377-4847-a1de-19ce81526536',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は同一のランウェイに並置されている走行クレーンの修理、調整、点検等(以下、本問において「修理等」という。)の作業を行うときの措置に係る法令条文の一部を抜粋したものであるが、この文中の[ ]内に入れるＡからＣまでの語句の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。「同一のランウェイに並置されている走行クレーンの修理等の作業を行うときは、[ Ａ ]をおくこと、ランウェイの上に[ Ｂ ]を設けること等、労働者の[ Ｃ ]するための措置を講じなければならない。」
Ａ Ｂ Ｃ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9b72211a-8377-4847-a1de-19ce81526536', $c$作業を指揮する者 クレーンの運転を禁止する旨の表示 危険を防止$c$, false, 1),
  ('9b72211a-8377-4847-a1de-19ce81526536', $c$作業を指揮する者 関係者以外立入禁止の表示 注意を喚起$c$, false, 2),
  ('9b72211a-8377-4847-a1de-19ce81526536', $c$監視人 ストッパー 危険を防止$c$, true, 3),
  ('9b72211a-8377-4847-a1de-19ce81526536', $c$監視人 クレーンの運転を禁止する旨の表示 注意を喚起$c$, false, 4),
  ('9b72211a-8377-4847-a1de-19ce81526536', $c$関係者以外立入禁止の表示 ストッパー 危険を防止$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2605175b-52ef-48b3-a413-288351c48954',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの自主検査及び点検に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2605175b-52ef-48b3-a413-288351c48954', $c$１年以内ごとに１回行う定期自主検査における荷重試験では、定格荷重に相当する荷重の荷をつって、つり上げ、走行等の作動を定格速度により行うものとする。$c$, false, 1),
  ('2605175b-52ef-48b3-a413-288351c48954', $c$１か月以内ごとに１回行う定期自主検査においては、巻過防止装置の異常の有無について検査を行わなければならない。$c$, false, 2),
  ('2605175b-52ef-48b3-a413-288351c48954', $c$作業開始前の点検においては、ワイヤロープが通っている箇所の状態について点検を行わなければならない。$c$, false, 3),
  ('2605175b-52ef-48b3-a413-288351c48954', $c$１か月をこえる期間使用せず、当該期間中に１か月以内ごとに１回行う定期自主検査を行わなかったクレーンについては、その使用を再び開始する際に、所定の事項について自主検査を行わなければならない。$c$, false, 4),
  ('2605175b-52ef-48b3-a413-288351c48954', $c$１年以内ごとに１回行う定期自主検査の結果の記録は３年間保存し、１か月以内ごとに１回行う定期自主検査の結果の記録は１年間保存しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '91924133-927e-4b18-84bf-9ee97b2f83d5',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重10ｔの転倒するおそれのあるジブクレーン(以下、本問において｢クレーン｣という。)の検査に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('91924133-927e-4b18-84bf-9ee97b2f83d5', $c$クレーン検査証の有効期間の更新を受けようとする者は、原則として、登録性能検査機関が行う性能検査を受けなければならない。$c$, false, 1),
  ('91924133-927e-4b18-84bf-9ee97b2f83d5', $c$性能検査においては、クレーンの各部分の構造及び機能について点検を行うほか、荷重試験及び安定度試験を行うものとする。$c$, true, 2),
  ('91924133-927e-4b18-84bf-9ee97b2f83d5', $c$クレーンのジブに変更を加えた者は、所轄労働基準監督署長が検査の必要がないと認めたものを除き、変更検査を受けなければならない。$c$, false, 3),
  ('91924133-927e-4b18-84bf-9ee97b2f83d5', $c$変更検査においては、クレーンの各部分の構造及び機能について点検を行うほか、荷重試験及び安定度試験を行うものとする。$c$, false, 4),
  ('91924133-927e-4b18-84bf-9ee97b2f83d5', $c$所轄労働基準監督署長は、変更検査のために必要があると認めるときは、当該検査に係るクレーンについて、当該検査を受ける者に塗装の一部をはがすことを命ずることができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a36a57f5-95a2-45b4-9057-238c9e1d7727',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの玉掛けに用いる玉掛用具として、法令上、その使用が禁止とされていないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a36a57f5-95a2-45b4-9057-238c9e1d7727', $c$使用する際の安全係数が４となるシャックル$c$, false, 1),
  ('a36a57f5-95a2-45b4-9057-238c9e1d7727', $c$使用する際の安全係数が５となるワイヤロープ$c$, false, 2),
  ('a36a57f5-95a2-45b4-9057-238c9e1d7727', $c$リンクの断面の直径の減少が、製造されたときの当該直径の10％のつりチェーン$c$, true, 3),
  ('a36a57f5-95a2-45b4-9057-238c9e1d7727', $c$直径の減少が公称径の８％のワイヤロープ$c$, false, 4),
  ('a36a57f5-95a2-45b4-9057-238c9e1d7727', $c$ワイヤロープ１よりの間において素線(フィラ線を除く。以下同じ。)の数の10％の素線が切断したワイヤロープ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6fdd36a7-4202-4194-901d-ba3047445fc8',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重７ｔのデリック(以下、本問において「デリック」という。)の使用等に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6fdd36a7-4202-4194-901d-ba3047445fc8', $c$デリックの直働式以外の巻過防止装置は、フック等のつり具の上面又は当該つり具の巻上げ用シーブの上面とブームの先端のシーブその他当該上面が接触するおそれのある物(ブームを除く。)の下面との間隔が0.05ｍ以上になるように調整しておかなければならない。$c$, false, 1),
  ('6fdd36a7-4202-4194-901d-ba3047445fc8', $c$ブームを有するデリックを、デリック明細書に記載されているブームの傾斜角の範囲をこえて使用するときは、作業を指揮する者を選任して、その者の直接の指揮のもとに作業を実施しなければならない。$c$, false, 2),
  ('6fdd36a7-4202-4194-901d-ba3047445fc8', $c$デリックの運転者は、荷をつったままで運転位置から離れてはならない。
ただし、作業の性質上やむを得ない場合又は安全な作業の遂行上必要な場合に、デリックの運転を停止し、かつ、ブレーキをかけるときは、この限りでない。$c$, false, 3),
  ('6fdd36a7-4202-4194-901d-ba3047445fc8', $c$デリック検査証を受けたデリックを貸与するときは、デリック検査証とともにするのでなければ、貸与してはならない。$c$, true, 4),
  ('6fdd36a7-4202-4194-901d-ba3047445fc8', $c$限定なしのクレーン・デリック運転士免許を有する労働者は、デリックの運転の業務に従事中にデリックの安全装置を臨時に取りはずす必要が生じたときは、あらかじめ事業者の許可を得ずに取りはずすことができる。ただし、当該安全装置を取りはずしたときは、直ちに事業者にその旨を報告しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a9088f43-a1a5-42ce-8be2-88ce035b6fdb',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$デリックに係る許可、設置、検査及び検査証に関する記述として、法令上、誤っているものは次のうちどれか。
ただし、設置から廃止までの期間が３年間で、設置作業場内の移設はないものとし、計画の届出に係る免除認定を受けていない場合とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a9088f43-a1a5-42ce-8be2-88ce035b6fdb', $c$つり上げ荷重4.9ｔのデリックを製造しようとする者は、原則として、あらかじめ、所轄都道府県労働局長の製造許可を受けなければならない。$c$, false, 1),
  ('a9088f43-a1a5-42ce-8be2-88ce035b6fdb', $c$つり上げ荷重3.9ｔのデリックを設置しようとする事業者は、当該工事の完了の日までに、デリック設置届を所轄労働基準監督署長に提出しなければならない。$c$, true, 2),
  ('a9088f43-a1a5-42ce-8be2-88ce035b6fdb', $c$つり上げ荷重1.9ｔのデリックを設置しようとする事業者は、あらかじめ、デリック設置報告書を所轄労働基準監督署長に提出しなければならない。$c$, false, 3),
  ('a9088f43-a1a5-42ce-8be2-88ce035b6fdb', $c$つり上げ荷重2.9ｔのデリックを設置した者は、所轄労働基準監督署長が検査の必要がないと認めたデリックを除き、落成検査を受けなければならない。$c$, false, 4),
  ('a9088f43-a1a5-42ce-8be2-88ce035b6fdb', $c$デリック検査証を受けたデリックを設置している者に異動があったときは、デリックを設置している者は、当該異動後10日以内に、デリック検査証書替申請書にデリック検査証を添えて、所轄労働基準監督署長に提出し、書替えを受けなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '26b48495-ceac-4e61-b9de-3df187cca66b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$デリックの運転及び玉掛けの業務に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('26b48495-ceac-4e61-b9de-3df187cca66b', $c$限定なしのクレーン・デリック運転士免許で、つり上げ荷重20ｔの鳥居形デリックの運転の業務に就くことができる。$c$, false, 1),
  ('26b48495-ceac-4e61-b9de-3df187cca66b', $c$デリックの運転の業務に係る特別の教育の受講では、つり上げ荷重６ｔのガイデリックの運転の業務に就くことができない。$c$, false, 2),
  ('26b48495-ceac-4e61-b9de-3df187cca66b', $c$玉掛け技能講習の修了で、つり上げ荷重10ｔのスチフレッグデリックで行う５ｔの荷の玉掛けの業務に就くことができる。$c$, false, 3),
  ('26b48495-ceac-4e61-b9de-3df187cca66b', $c$クレーンに限定したクレーン・デリック運転士免許では、つり上げ荷重７ｔのジンポールデリックの運転の業務に就くことができない。$c$, false, 4),
  ('26b48495-ceac-4e61-b9de-3df187cca66b', $c$玉掛けの業務に係る特別の教育の受講で、つり上げ荷重２ｔの二又デリックで行う0.9ｔの荷の玉掛けの業務に就くことができる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ff1b7f22-8da4-4118-a7b0-918d5c6338dd',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$原動機及び電気に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ff1b7f22-8da4-4118-a7b0-918d5c6338dd', $c$単相交流を三つ集め、電流及び電圧の大きさ並びに電流の方向が、時間の経過に関係なく一定となるものを三相交流という。$c$, true, 1),
  ('ff1b7f22-8da4-4118-a7b0-918d5c6338dd', $c$発電所から消費地の変電所までの送電には、電力の損失を少なくするため、特別高圧の交流が使用されている。$c$, false, 2),
  ('ff1b7f22-8da4-4118-a7b0-918d5c6338dd', $c$交流は、整流器で直流に変換できるが、得られた直流は完全に平滑ではなく波が多少残るため、脈流と呼ばれる。$c$, false, 3),
  ('ff1b7f22-8da4-4118-a7b0-918d5c6338dd', $c$交流は、変圧器によって電圧を変えることができる。$c$, false, 4),
  ('ff1b7f22-8da4-4118-a7b0-918d5c6338dd', $c$電動機は、電気エネルギーを機械力に変換する装置である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3a560ef5-71ba-43aa-899f-34986f58ec3b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$図のような回路について、ＡＥ間に60Ｖの電圧をかけたときの電流Ｉ(Ａ)、電圧Ｅ(Ｖ)、抵抗Ｒ(Ω)の値に関する記述として、適切でないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問22',
  '/exam-figures/crane_all/2025-10/q22.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3a560ef5-71ba-43aa-899f-34986f58ec3b', $c$ＡＢ間の電圧の値は48Ⅴである。$c$, false, 1),
  ('3a560ef5-71ba-43aa-899f-34986f58ec3b', $c$ＢＤ間の電圧の値は12Ⅴである。$c$, false, 2),
  ('3a560ef5-71ba-43aa-899f-34986f58ec3b', $c$Ｂ点を流れる電流の値は４Ａである。$c$, true, 3),
  ('3a560ef5-71ba-43aa-899f-34986f58ec3b', $c$Ｄ点を流れる電流の値は２Ａである。$c$, false, 4),
  ('3a560ef5-71ba-43aa-899f-34986f58ec3b', $c$ＢＥ間の抵抗の値は２Ωである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '612fc800-0308-4450-92b8-845fc8161ea9',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('612fc800-0308-4450-92b8-845fc8161ea9', $c$三相誘導電動機の回転子は、固定子の回転磁界により回転するが、負荷がかかると同期速度より２～５％遅く回転する性質がある。$c$, false, 1),
  ('612fc800-0308-4450-92b8-845fc8161ea9', $c$三相誘導電動機の同期速度は、周波数を一定とすれば、極数が少ないほど遅くなる。$c$, true, 2),
  ('612fc800-0308-4450-92b8-845fc8161ea9', $c$かご形三相誘導電動機の回転子は、鉄心の周りに太い導線(バー)がかご形に配置された簡単な構造である。$c$, false, 3),
  ('612fc800-0308-4450-92b8-845fc8161ea9', $c$巻線形三相誘導電動機は、固定子側、回転子側ともに巻線を用いた構造で、回転子側の巻線はスリップリングを通して外部抵抗と接続するようになっている。$c$, false, 4),
  ('612fc800-0308-4450-92b8-845fc8161ea9', $c$直流電動機は、一般に、速度制御性能が優れているが、整流子及びブラシの保守が必要である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5946dbdc-0680-4a32-aaeb-12005b71804f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機の制御器に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5946dbdc-0680-4a32-aaeb-12005b71804f', $c$制御器は、電動機に正転、停止、逆転及び制御速度の指令を与えるもので、制御の方式により直接制御器と間接制御器に大別され、さらに、両者の混合型である複合制御器がある。$c$, false, 1),
  ('5946dbdc-0680-4a32-aaeb-12005b71804f', $c$無線操作用の制御器には、切替え開閉器により、機上運転に切り替えることができる機能を持つものがある。$c$, false, 2),
  ('5946dbdc-0680-4a32-aaeb-12005b71804f', $c$ユニバーサル制御器は、１本の操作ハンドルを前後左右や斜めに操作することにより、２個の制御器を同時に又は単独で操作できる構造にしたものである。$c$, false, 3),
  ('5946dbdc-0680-4a32-aaeb-12005b71804f', $c$ドラム形直接制御器は、ハンドルで回される円弧状のセグメントと固定フィンガーにより、電動機の主回路を直接開閉する制御器である。$c$, false, 4),
  ('5946dbdc-0680-4a32-aaeb-12005b71804f', $c$エンコーダー型制御器は、ハンドル位置を連続的に検出し、電動機の主回路を直接開閉する直接制御器である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '85274b9b-44b6-477f-9597-26bd0a919b71',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの給電装置及び配線に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('85274b9b-44b6-477f-9597-26bd0a919b71', $c$キャブタイヤケーブルは、導体に細い素線を使い、これを多数より合わせており、外装被覆も厚く丈夫に作られているので、引きずったり、屈曲を繰り返す用途に適している。$c$, false, 1),
  ('85274b9b-44b6-477f-9597-26bd0a919b71', $c$トロリ線の材料には、溝付硬銅トロリ線やレールなどが用いられる。$c$, false, 2),
  ('85274b9b-44b6-477f-9597-26bd0a919b71', $c$トロリ線給電のうち絶縁トロリ線方式のものは、一本一本のトロリ線が、すその開いた絶縁物で被覆されており、集電子はその間を摺動して集電する。$c$, false, 3),
  ('85274b9b-44b6-477f-9597-26bd0a919b71', $c$旋回体、ケーブル巻取式などの回転部分への給電には、トロリバーが用いられる。$c$, true, 4),
  ('85274b9b-44b6-477f-9597-26bd0a919b71', $c$内部配線は、一般に、絶縁電線を金属管などの電線管又は金属ダクト内に収め、外部からの損傷を防いでいる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a5ef30c6-6ef0-4f43-ab83-51ba83fde071',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機の制御に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a5ef30c6-6ef0-4f43-ab83-51ba83fde071', $c$ゼロノッチインターロックは、各制御器のハンドルが停止位置になければ、主電磁接触器を投入できないようにしたものである。$c$, false, 1),
  ('a5ef30c6-6ef0-4f43-ab83-51ba83fde071', $c$直接制御は、シーケンサーを使用するので、間接制御に比べ自動運転や速度制御が容易である。$c$, true, 2),
  ('a5ef30c6-6ef0-4f43-ab83-51ba83fde071', $c$間接制御は、電動機の主回路に電磁接触器を挿入し、主回路の開閉を電磁接触器に行わせる方式で、制御器は、主回路を開閉する電磁接触器の電磁コイル回路の開閉を受け持つ。$c$, false, 3),
  ('a5ef30c6-6ef0-4f43-ab83-51ba83fde071', $c$巻線形三相誘導電動機の半間接制御は、一次側を間接制御、二次側を直接制御によって行う。$c$, false, 4),
  ('a5ef30c6-6ef0-4f43-ab83-51ba83fde071', $c$コースチングノッチは、制御器の第１ノッチとして設けられ、ブレーキにのみ通電してブレーキを緩めるようになっているノッチである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '69948d0a-65d9-40e2-b493-1732ed24e376',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの巻線形三相誘導電動機の速度制御方式などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('69948d0a-65d9-40e2-b493-1732ed24e376', $c$電動油圧押上機ブレーキ制御は、速度制御用に設置した電動油圧押上機ブレーキの操作電源を電動機の二次側回路に接続し、制動力を制御するもので、巻下げ時に電動機の回転速度が遅くなれば制動力を小さくするように自動的に調整し、安定した低速運転を行うものである。$c$, false, 1),
  ('69948d0a-65d9-40e2-b493-1732ed24e376', $c$渦電流ブレーキ制御は、電気的なブレーキであり機械的な摩擦力を利用しないため、摩擦による消耗部分がなく、制御性も優れている。$c$, false, 2),
  ('69948d0a-65d9-40e2-b493-1732ed24e376', $c$サイリスター一次電圧制御は、電動機の回転数を検出し、指定された速度と比較しながら制御するため、極めて安定した速度が得られる。$c$, false, 3),
  ('69948d0a-65d9-40e2-b493-1732ed24e376', $c$ダイナミックブレーキ制御は、巻下げの速度制御時に電動機の一次側を交流電源から切り離し、一次側に直流電源を接続して通電し、直流励磁を加えることにより制動力を得るものであるが、つり荷が重い場合には低速での巻下げができない。$c$, true, 4),
  ('69948d0a-65d9-40e2-b493-1732ed24e376', $c$二次抵抗制御は、回転子の巻線に接続した抵抗器の抵抗値を変化させて速度制御するもので、始動時には二次抵抗を全抵抗挿入状態から順次短絡することにより、緩始動することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電気機器の故障の原因などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f', $c$集電装置の火花が激しい場合の原因の一つとして、集電子が摩耗していることがあげられる。$c$, false, 1),
  ('b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f', $c$過電流継電器が作動する場合の原因の一つとして、電動機の回路が断線していることがあげられる。$c$, true, 2),
  ('b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f', $c$電動機が停止しない場合の原因の一つとして、電磁接触器の主接点が溶着していることがあげられる。$c$, false, 3),
  ('b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f', $c$電動機がうなるが起動しない場合の原因の一つとして、負荷が大きすぎることがあげられる。$c$, false, 4),
  ('b8f91bdc-f8ba-49bf-a801-12cfe84a8e0f', $c$電動機が起動した後、回転数が上がらない場合の原因の一つとして、電源の電圧降下が大きいことがあげられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3f3a3970-871c-4721-91f2-fee1e1208377',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$一般的に電気をよく通す導体及び電気を通しにくい絶縁体(不導体)に区分されるものの組合せとして、適切なものは(１)～(５)のうちどれか。
導体 絶縁体(不導体)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3f3a3970-871c-4721-91f2-fee1e1208377', $c$鋳鉄 塩水$c$, false, 1),
  ('3f3a3970-871c-4721-91f2-fee1e1208377', $c$雲母 空気$c$, false, 2),
  ('3f3a3970-871c-4721-91f2-fee1e1208377', $c$鋼 黒鉛$c$, false, 3),
  ('3f3a3970-871c-4721-91f2-fee1e1208377', $c$大理石 ガラス$c$, false, 4),
  ('3f3a3970-871c-4721-91f2-fee1e1208377', $c$アルミニウム 磁器$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3f049819-9364-46a9-b892-2c15bfd1f080',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関するＡからＥまでの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 感電による人体への影響の程度は、電流の大きさ、通電時間、電流の種類、体質などの条件により異なる。
Ｂ 電気によるやけどには、アークなどの高熱による熱傷のほか、電流通過に伴い発生するジュール熱によって引き起こされる、皮膚や内部組織の傷害がある。
Ｃ 感電による危険を電流と時間の積によって評価する基準によれば、一般に、50Ａの電流が人体を流れた場合、安全率を考慮して１秒以内の通電時間が安全限界とされている。
Ｄ 天井クレーンは、鋼製の走行車輪を経て走行レールに接触しているため、走行レールが接地されている場合は、クレーンガーダ上で走行トロリ線の充電部分に身体が接触しても、感電の危険はない。
Ｅ 接地抵抗は小さいほど良いので、接地線は十分な太さのものを使用する。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3f049819-9364-46a9-b892-2c15bfd1f080', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('3f049819-9364-46a9-b892-2c15bfd1f080', $c$Ｂ，Ｃ，Ｄ$c$, false, 2),
  ('3f049819-9364-46a9-b892-2c15bfd1f080', $c$Ｂ，Ｅ$c$, false, 3),
  ('3f049819-9364-46a9-b892-2c15bfd1f080', $c$Ｃ，Ｄ$c$, true, 4),
  ('3f049819-9364-46a9-b892-2c15bfd1f080', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9231e0b0-c297-44ab-8dd3-d3cf817965a7',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のようにＯ点に同一平面上の三つの力Ｐ１、Ｐ２、Ｐ３が作用しているとき、これらの合力に最も近いものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問31',
  '/exam-figures/crane_all/2025-10/q31.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9231e0b0-c297-44ab-8dd3-d3cf817965a7', $c$Ａ$c$, false, 1),
  ('9231e0b0-c297-44ab-8dd3-d3cf817965a7', $c$Ｂ$c$, true, 2),
  ('9231e0b0-c297-44ab-8dd3-d3cf817965a7', $c$Ｃ$c$, false, 3),
  ('9231e0b0-c297-44ab-8dd3-d3cf817965a7', $c$Ｄ$c$, false, 4),
  ('9231e0b0-c297-44ab-8dd3-d3cf817965a7', $c$Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '03387cd3-55e5-4f26-a60b-70f06ed8a8ce',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$天井クレーンで荷をつり上げ、つり荷を移動させるためにクレーンを10秒間に８ｍ移動する速度で走行させながら10秒間に６ｍ移動する速度で横行させ続けているとき、つり荷が10秒間に移動する距離は(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('03387cd3-55e5-4f26-a60b-70f06ed8a8ce', $c$６ｍ$c$, false, 1),
  ('03387cd3-55e5-4f26-a60b-70f06ed8a8ce', $c$８ｍ$c$, false, 2),
  ('03387cd3-55e5-4f26-a60b-70f06ed8a8ce', $c$10ｍ$c$, true, 3),
  ('03387cd3-55e5-4f26-a60b-70f06ed8a8ce', $c$12ｍ$c$, false, 4),
  ('03387cd3-55e5-4f26-a60b-70f06ed8a8ce', $c$14ｍ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '326465dd-f202-42c2-9913-35d260b7f318',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＤまでの物体の体積を求める計算式として、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。
ただし、πは円周率とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問33',
  '/exam-figures/crane_all/2025-10/q33.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('326465dd-f202-42c2-9913-35d260b7f318', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('326465dd-f202-42c2-9913-35d260b7f318', $c$Ａ，Ｃ$c$, false, 2),
  ('326465dd-f202-42c2-9913-35d260b7f318', $c$Ｂ$c$, false, 3),
  ('326465dd-f202-42c2-9913-35d260b7f318', $c$Ｂ，Ｄ$c$, true, 4),
  ('326465dd-f202-42c2-9913-35d260b7f318', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a474d02d-ce37-4c2b-ae43-7b6fa773a577',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$均質な材料でできた固体の物体(以下、本問において「物体」という。)及びその荷の重心に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a474d02d-ce37-4c2b-ae43-7b6fa773a577', $c$円柱の物体の重心の位置は、円柱の上下の底面の円の中心を結んだ線分の中点の位置にある。$c$, true, 1),
  ('a474d02d-ce37-4c2b-ae43-7b6fa773a577', $c$重心の位置が物体の外部にある物体であっても、置き方を変えると重心の位置が物体の内部に移動する場合がある。$c$, false, 2),
  ('a474d02d-ce37-4c2b-ae43-7b6fa773a577', $c$複雑な形状の物体の重心は、二つ以上の点になる場合があるが、重心の数が多いほどその物体の安定性は良くなる。$c$, false, 3),
  ('a474d02d-ce37-4c2b-ae43-7b6fa773a577', $c$水平面上に置いた直方体の物体を傾けた場合、重心からの鉛直線がその物体の底面を外れるときは、その物体は元の位置に戻る。$c$, false, 4),
  ('a474d02d-ce37-4c2b-ae43-7b6fa773a577', $c$長尺の荷をクレーンでつり上げるため、目安で重心位置を定めてその真上にフックを置き、玉掛けを行い、地切り直前まで少しだけつり上げたとき、荷が傾いた場合は、荷の実際の重心位置は目安とした重心位置よりも傾斜した荷の高い方の側にある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e', $c$クレーンのシーブを通る巻上げ用ワイヤロープには、引張荷重と曲げ荷重がかかる。$c$, false, 1),
  ('34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e', $c$天井クレーンのクレーンガーダには、曲げ荷重がかかる。$c$, false, 2),
  ('34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e', $c$クレーンのフックには、引張荷重と曲げ荷重がかかる。$c$, false, 3),
  ('34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e', $c$両振り荷重は、向きと大きさが時間とともに変わる荷重である。$c$, false, 4),
  ('34ac2d0c-b0d7-4df3-8885-c1ee3930cc5e', $c$荷重が繰返し作用すると、比較的小さな荷重であっても機械や構造物が破壊することがあるが、このような現象を引き起こす荷重を静荷重という。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '33f9b064-6ce1-476b-ac2b-8fa8aab4452c',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のような天びん棒で荷Ｗをワイヤロープでつり下げ、つり合うとき、天びん棒を支えるための力Ｆの値は(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ²とし、天びん棒及びワイヤロープの質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問36',
  '/exam-figures/crane_all/2025-10/q36.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('33f9b064-6ce1-476b-ac2b-8fa8aab4452c', $c$98Ｎ$c$, false, 1),
  ('33f9b064-6ce1-476b-ac2b-8fa8aab4452c', $c$196Ｎ$c$, false, 2),
  ('33f9b064-6ce1-476b-ac2b-8fa8aab4452c', $c$294Ｎ$c$, false, 3),
  ('33f9b064-6ce1-476b-ac2b-8fa8aab4452c', $c$392Ｎ$c$, false, 4),
  ('33f9b064-6ce1-476b-ac2b-8fa8aab4452c', $c$490Ｎ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a8982a13-31ce-4921-92e4-9c5e9e33233b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のように、水平な床面に置いた質量Ｗの物体を床面に沿って引っ張り、動き始める直前の力Ｆの値が588Ｎであったとき、Ｗの値は(１)～(５)のうちどれか。
ただし、接触面の静止摩擦係数は0.6とし、重力の加速度は9.8ｍ/ｓ²とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問37',
  '/exam-figures/crane_all/2025-10/q37.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a8982a13-31ce-4921-92e4-9c5e9e33233b', $c$36㎏$c$, false, 1),
  ('a8982a13-31ce-4921-92e4-9c5e9e33233b', $c$86㎏$c$, false, 2),
  ('a8982a13-31ce-4921-92e4-9c5e9e33233b', $c$100㎏$c$, true, 3),
  ('a8982a13-31ce-4921-92e4-9c5e9e33233b', $c$120㎏$c$, false, 4),
  ('a8982a13-31ce-4921-92e4-9c5e9e33233b', $c$150㎏$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'fa56ef51-2c32-435e-9645-08b4386c49d6',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のように質量10㎏の荷を同じ長さの２本のロープを用いて２人でそれぞれ鉛直線に対し30°の角度で引き上げ支えているとき、１人がロープを引く力の値に最も近いものは(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ²とする。また、左右のロープの張力は同じとし、ロープの質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問38',
  '/exam-figures/crane_all/2025-10/q38.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fa56ef51-2c32-435e-9645-08b4386c49d6', $c$５Ｎ$c$, false, 1),
  ('fa56ef51-2c32-435e-9645-08b4386c49d6', $c$12Ｎ$c$, false, 2),
  ('fa56ef51-2c32-435e-9645-08b4386c49d6', $c$50Ｎ$c$, false, 3),
  ('fa56ef51-2c32-435e-9645-08b4386c49d6', $c$57Ｎ$c$, true, 4),
  ('fa56ef51-2c32-435e-9645-08b4386c49d6', $c$114Ｎ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c818557a-f6d9-452f-8f62-f5fbb06c3934',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$天井から垂直につるした直径２cmの丸棒の先端に質量100㎏の荷をつり下げるとき、丸棒に生じる引張応力の値に最も近いものは(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ²とし、丸棒の質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c818557a-f6d9-452f-8f62-f5fbb06c3934', $c$１Ｎ/mm²$c$, false, 1),
  ('c818557a-f6d9-452f-8f62-f5fbb06c3934', $c$２Ｎ/mm²$c$, false, 2),
  ('c818557a-f6d9-452f-8f62-f5fbb06c3934', $c$３Ｎ/mm²$c$, true, 3),
  ('c818557a-f6d9-452f-8f62-f5fbb06c3934', $c$６Ｎ/mm²$c$, false, 4),
  ('c818557a-f6d9-452f-8f62-f5fbb06c3934', $c$８Ｎ/mm²$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '190b072e-fe08-4522-a67c-f50d012c351b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のような滑車を用いて、質量Ｗの荷をつり上げるとき、荷を支えるために必要な力Ｆを求める式がそれぞれの図の下部に記載してあるが、これらの力Ｆを求める式として、適切でないものは(１)～(５)のうちどれか。
ただし、ｇは重力の加速度とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 クレーン・デリック運転士（限定なし）試験 問40',
  '/exam-figures/crane_all/2025-10/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('190b072e-fe08-4522-a67c-f50d012c351b', $c$図（１）$c$, true, 1),
  ('190b072e-fe08-4522-a67c-f50d012c351b', $c$図（２）$c$, false, 2),
  ('190b072e-fe08-4522-a67c-f50d012c351b', $c$図（３）$c$, false, 3),
  ('190b072e-fe08-4522-a67c-f50d012c351b', $c$図（４）$c$, false, 4),
  ('190b072e-fe08-4522-a67c-f50d012c351b', $c$図（５）$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '492a350d-b075-4041-b9cb-e650c8b4ae1f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンに関する用語の記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('492a350d-b075-4041-b9cb-e650c8b4ae1f', $c$キャンバとは、天井クレーンなどであらかじめクレーンガーダに与える上向きのそり(曲がり)をいう。$c$, false, 1),
  ('492a350d-b075-4041-b9cb-e650c8b4ae1f', $c$天井クレーンのスパンとは、クレーンが走行するレールの中心間の水平距離をいう。$c$, false, 2),
  ('492a350d-b075-4041-b9cb-e650c8b4ae1f', $c$揚程とは、つり具を有効に上げ下げできる上限と下限との間の垂直移動距離をいう。$c$, false, 3),
  ('492a350d-b075-4041-b9cb-e650c8b4ae1f', $c$つり上げ荷重とは、クレーンの構造及び材料に応じて負荷させることができる最大の荷重をいい、フックなどのつり具分が含まれる。$c$, false, 4),
  ('492a350d-b075-4041-b9cb-e650c8b4ae1f', $c$起伏するジブクレーンの作業半径とは、ジブの取付けピンの中心から、ジブ先端のシーブの中心までの距離をいい、引込みクレーンでは、水平引込み機構により、ジブを起伏させると作業半径が変化する。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '24ba5c02-302c-44e7-a985-53aca45388e1',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンのブレーキに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('24ba5c02-302c-44e7-a985-53aca45388e1', $c$バンドブレーキには、バンドを締め付けたときにバンドが平均して締まるように、バンドの外周にすき間を調整する摩擦パッドが配置されている。$c$, true, 1),
  ('24ba5c02-302c-44e7-a985-53aca45388e1', $c$電動油圧押上機ブレーキは、ばねにより制動を行い、押上機の油圧の押上げ力によりブレーキの制動を開放する。$c$, false, 2),
  ('24ba5c02-302c-44e7-a985-53aca45388e1', $c$足踏み油圧式ディスクブレーキは、運転室で操作する天井クレーンの走行用やジブクレーンの旋回用に用いられる。$c$, false, 3),
  ('24ba5c02-302c-44e7-a985-53aca45388e1', $c$ディスクブレーキは、ディスクをブレーキ片(パッド)で両側からはさみ付けて制動する構造のものである。$c$, false, 4),
  ('24ba5c02-302c-44e7-a985-53aca45388e1', $c$つり上げ装置のブレーキの制動トルクの値は、定格荷重に相当する荷重の荷をつった場合における当該装置のトルクの値の150％以上に調整する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4c0fa41b-44b2-4d15-9367-5289731a39bd',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ワイヤロープ端末の止め方とその図の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問3',
  '/exam-figures/crane_all/2026-04/q03.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4c0fa41b-44b2-4d15-9367-5289731a39bd', $c$圧縮止め$c$, false, 1),
  ('4c0fa41b-44b2-4d15-9367-5289731a39bd', $c$クサビ止め$c$, false, 2),
  ('4c0fa41b-44b2-4d15-9367-5289731a39bd', $c$アイスプライス$c$, false, 3),
  ('4c0fa41b-44b2-4d15-9367-5289731a39bd', $c$クリップ止め$c$, true, 4),
  ('4c0fa41b-44b2-4d15-9367-5289731a39bd', $c$合金詰め又は亜鉛詰めソケット止め$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '94bc5fd5-74af-4351-b15d-68d3ca6c45ef',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$ボルトの締め付けや緩み止めに用いられる部品名とその図の組合せとして、適切でないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問4',
  '/exam-figures/crane_all/2026-04/q04.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('94bc5fd5-74af-4351-b15d-68d3ca6c45ef', $c$ダブルナット$c$, false, 1),
  ('94bc5fd5-74af-4351-b15d-68d3ca6c45ef', $c$ばね座金$c$, false, 2),
  ('94bc5fd5-74af-4351-b15d-68d3ca6c45ef', $c$溝付きナット$c$, false, 3),
  ('94bc5fd5-74af-4351-b15d-68d3ca6c45ef', $c$舌付き座金$c$, true, 4),
  ('94bc5fd5-74af-4351-b15d-68d3ca6c45ef', $c$ばねナット$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの運動とそれに対する安全装置などの組合せとして、適切でないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728', $c$走行 ……… 斜行防止装置$c$, false, 1),
  ('f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728', $c$横行 ……… 横行車輪直径の４分の１以上の高さの車輪止め$c$, false, 2),
  ('f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728', $c$巻下げ …… 重錘形リミットスイッチを用いた巻過防止装置$c$, true, 3),
  ('f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728', $c$巻上げ …… ねじ形リミットスイッチを用いた巻過防止装置$c$, false, 4),
  ('f68e7bcc-7fe6-40fa-a24f-c13bd7ff1728', $c$起伏 ……… 傾斜角指示装置$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '02abc069-ac29-49b4-9ded-2fa6de7a2963',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$クレーンの給油及び点検に関する次のＡからＥの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 潤滑油としてギヤー油を用いた減速機箱は、箱内が密封されているので、油の交換は不要である。
Ｂ グリースカップ式の給油方法は、グリースカップから一定の圧力で自動的にグリースが圧送されるので、給油の手間がかからない。
Ｃ 集中給油式の給油方式は、ポンプから給油管、分配管及び分配弁を通じて、各給油箇所に一定量の給油を行う方式である。
Ｄ 軸受へのグリースの給油は、転がり軸受では毎日１回程度、平軸受(滑り軸受)では６か月に１回程度の間隔で行う。
Ｅ 給油装置は、配管の穴あき、詰まりなどにより給油されないことがあるので、給油部分から古い油が押し出されている状態などにより、新油が給油されていることを確認する。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('02abc069-ac29-49b4-9ded-2fa6de7a2963', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('02abc069-ac29-49b4-9ded-2fa6de7a2963', $c$Ａ，Ｂ，Ｄ$c$, true, 2),
  ('02abc069-ac29-49b4-9ded-2fa6de7a2963', $c$Ｂ，Ｄ，Ｅ$c$, false, 3),
  ('02abc069-ac29-49b4-9ded-2fa6de7a2963', $c$Ｃ，Ｅ$c$, false, 4),
  ('02abc069-ac29-49b4-9ded-2fa6de7a2963', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '76f1ed06-0daa-4c99-990c-01133a6a2992',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$図において、電動機の回転軸に固定された歯車Ａが電動機の駆動により回転し、これにかみ合う歯車Ｂが毎分300回転しているとき、歯車Ａ及び歯車Ｄの回転数の値の組み合わせとして、適切なものは(１)～(５)のうちどれか。
ただし、歯車Ａ、Ｂ、Ｃ及びＤの歯数は、それぞれ16、64、25及び100とし、ＢとＣの歯車は同じ軸に固定されているものとする。
歯車Ａ 歯車Ｄ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問7',
  '/exam-figures/crane_all/2026-04/q07.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('76f1ed06-0daa-4c99-990c-01133a6a2992', $c$768rpm 64rpm$c$, false, 1),
  ('76f1ed06-0daa-4c99-990c-01133a6a2992', $c$768rpm 75rpm$c$, false, 2),
  ('76f1ed06-0daa-4c99-990c-01133a6a2992', $c$1200rpm 75rpm$c$, true, 3),
  ('76f1ed06-0daa-4c99-990c-01133a6a2992', $c$1200rpm 100rpm$c$, false, 4),
  ('76f1ed06-0daa-4c99-990c-01133a6a2992', $c$1875rpm 256rpm$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '07af7c33-a859-4289-9a69-69f480dcad15',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$デリックの種類及び型式に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('07af7c33-a859-4289-9a69-69f480dcad15', $c$ガイデリックは、１本の傾斜したマストを６本以上のガイロープにより支えるもので、ブームはガイロープをくぐるようにして旋回するが、旋回角度はガイロープにより制限され、通常は240°が限度である。$c$, false, 1),
  ('07af7c33-a859-4289-9a69-69f480dcad15', $c$ジンポールデリックは、２本のマストを４本以上のガイロープにより支えるもので、マストを直立させて使用する。$c$, false, 2),
  ('07af7c33-a859-4289-9a69-69f480dcad15', $c$スチフレッグデリックは、１本の直立したマストを通常135°に開いた２本のガイロープにより後方から支えるもので、安定度はガイデリックより小さい。$c$, false, 3),
  ('07af7c33-a859-4289-9a69-69f480dcad15', $c$二又デリックは、下端が互いに交差する２本のマストを２本以上のガイロープにより後方から支えるもので、旋回は120°まで可能である。$c$, false, 4),
  ('07af7c33-a859-4289-9a69-69f480dcad15', $c$鳥居形デリックは、２本のマストとその上端を結ぶ横ばりをガイロープにより後方から支えるもので、通常、数個のつり具の組合せにより荷の巻上げ及び巻下げを行う。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e1085e3e-d9a6-45b2-856a-7fd277f65f2b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$デリックの取扱いに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e1085e3e-d9a6-45b2-856a-7fd277f65f2b', $c$ウインチを用いるデリックでは、作業中に停電になったときは、ブレーキに歯止め又は止め金を掛け、クラッチを外し、スイッチを切って送電を待つ。$c$, false, 1),
  ('e1085e3e-d9a6-45b2-856a-7fd277f65f2b', $c$巻下げのとき、ドラムをフリーにして、ブレーキだけで速度を制御するデリックの場合は、急ブレーキによる衝撃を避けるため、慎重な運転操作が求められる。$c$, false, 2),
  ('e1085e3e-d9a6-45b2-856a-7fd277f65f2b', $c$みぞ付きでないドラムにワイヤロープを重ね巻きにするデリックは、ワイヤロープのフリートアングルが制限されている。$c$, false, 3),
  ('e1085e3e-d9a6-45b2-856a-7fd277f65f2b', $c$構造上、巻過防止装置を備えることができないデリックの場合は、ドラムに目印を付けて巻過ぎを防止する。$c$, true, 4),
  ('e1085e3e-d9a6-45b2-856a-7fd277f65f2b', $c$ブレーキ、クラッチ、警報装置などの機能を確認するためのならし運転は、無負荷で行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8e6ff5e1-db5a-4291-998e-32ab8114181e',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーン及びデリックに関する知識'),
  $q$デリックの旋回に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8e6ff5e1-db5a-4291-998e-32ab8114181e', $c$デリック用ウインチのスインガードラムは、旋回用ワイヤロープの巻取り、巻戻しにより旋回を行うもので、ウインチドラムの前側に設けられている。$c$, false, 1),
  ('8e6ff5e1-db5a-4291-998e-32ab8114181e', $c$旋回するデリックでは、ブルホイールに取り付けられたストライカにより、リミットスイッチを作動させて、旋回の制限位置の手前で警報させているものがある。$c$, false, 2),
  ('8e6ff5e1-db5a-4291-998e-32ab8114181e', $c$ガイデリックでは、ブルホイールが回転するとき、マストは回転しない。$c$, true, 3),
  ('8e6ff5e1-db5a-4291-998e-32ab8114181e', $c$ブルホイールは、マスト下部に水平に固定された円形の輪である。$c$, false, 4),
  ('8e6ff5e1-db5a-4291-998e-32ab8114181e', $c$旋回専用の電動機で旋回装置を駆動して、ブームを旋回させるデリックがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$建設物の内部に設置する走行クレーン(以下、本問において｢クレーン｣という。)に関する記述として、法令上、違反となるものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e', $c$クレーンガーダに歩道を有しないクレーンの集電装置の部分を除いた最高部と、当該クレーンの上方にある建設物のはりとの間隔を0.3ｍとしている。$c$, false, 1),
  ('ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e', $c$クレーンガーダの歩道と当該歩道の上方にある建設物のはりとの間隔が1.7ｍであるため、当該歩道上に当該歩道からの高さが1.6ｍの天がいを設けている。$c$, false, 2),
  ('ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e', $c$クレーンガーダに歩道を有するクレーンの集電装置の部分を除いた最高部と、当該クレーンの上方にある建設物のはりとの間隔を0.5ｍとしている。$c$, false, 3),
  ('ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e', $c$クレーンと建設物との間の歩道のうち、建設物の柱に接する部分の歩道の幅を0.3ｍとしている。$c$, true, 4),
  ('ca37cd30-8733-4c42-bdfa-f84d3fa6ba4e', $c$クレーンの運転室の端から労働者が墜落するおそれがあるため、当該運転室の端と運転室に通ずる歩道の端との間隔を0.2ｍとしている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '45c341e3-4814-4a5e-9010-999414f01e74',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンに係る作業を行う場合であって、当該作業場において作業に従事する者がつり上げられている荷の下に立ち入ることについて、法令上、禁止とされていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('45c341e3-4814-4a5e-9010-999414f01e74', $c$動力下降以外の方法によって荷を下降させるとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 1),
  ('45c341e3-4814-4a5e-9010-999414f01e74', $c$ハッカー２個を用いて玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 2),
  ('45c341e3-4814-4a5e-9010-999414f01e74', $c$ワイヤロープを用いて、荷に設けられた穴に当該ワイヤロープを通して、１箇所に玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, true, 3),
  ('45c341e3-4814-4a5e-9010-999414f01e74', $c$複数の荷が一度につり上げられている場合であって、当該複数の荷が結束され、箱に入れられる等により固定されていないとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 4),
  ('45c341e3-4814-4a5e-9010-999414f01e74', $c$陰圧により吸着させるつり具を用いて玉掛けをした荷がつり上げられているとき、つり上げられている荷の下へ作業に従事する者を立ち入らせた。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'eaa0e12b-da2e-4078-9dac-f820acc8ac31',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次のうち、法令上、クレーンの玉掛用具として使用禁止とされていないものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('eaa0e12b-da2e-4078-9dac-f820acc8ac31', $c$エンドレスでないワイヤロープで、その両端にフック、シャックル、リング又はアイのいずれも備えていないもの$c$, false, 1),
  ('eaa0e12b-da2e-4078-9dac-f820acc8ac31', $c$使用する際の安全係数が５となるワイヤロープ$c$, false, 2),
  ('eaa0e12b-da2e-4078-9dac-f820acc8ac31', $c$伸びが製造されたときの長さの６％のつりチェーン$c$, false, 3),
  ('eaa0e12b-da2e-4078-9dac-f820acc8ac31', $c$使用する際の安全係数が４となるシャックル$c$, false, 4),
  ('eaa0e12b-da2e-4078-9dac-f820acc8ac31', $c$直径の減少が公称径の６％のワイヤロープ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ac7cefed-bcd2-4d06-bedd-f3f8155ee11b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重10ｔの転倒するおそれのあるジブクレーン(以下、本問において｢クレーン｣という。)の検査に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ac7cefed-bcd2-4d06-bedd-f3f8155ee11b', $c$クレーン検査証の有効期間の更新を受けようとする者は、原則として、登録性能検査機関が行う性能検査を受けなければならない。$c$, false, 1),
  ('ac7cefed-bcd2-4d06-bedd-f3f8155ee11b', $c$性能検査においては、クレーンの各部分の構造及び機能について点検を行うほか、荷重試験及び安定度試験を行うものとする。$c$, true, 2),
  ('ac7cefed-bcd2-4d06-bedd-f3f8155ee11b', $c$クレーンのジブに変更を加えた者は、所轄労働基準監督署長が検査の必要がないと認めたものを除き、変更検査を受けなければならない。$c$, false, 3),
  ('ac7cefed-bcd2-4d06-bedd-f3f8155ee11b', $c$所轄労働基準監督署長は、変更検査に合格したクレーンについて、当該クレーン検査証に検査期日、変更部分及び検査結果について裏書を行うものとする。$c$, false, 4),
  ('ac7cefed-bcd2-4d06-bedd-f3f8155ee11b', $c$クレーン検査証の有効期間をこえて使用を休止したクレーンを再び使用しようとする者は、使用再開検査を受けなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '51ded342-8425-47dd-a9dd-4bd0cf65e510',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は同一のランウェイに並置されている走行クレーンの修理、調整、点検等(以下、本問において「修理等」という。)の作業を行うときの措置に係る法令条文の一部を抜粋したものであるが、この文中の[ ]内に入れるＡからＣまでの語句の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。「同一のランウェイに並置されている走行クレーンの修理等の作業を行うときは、[ Ａ ]をおくこと、ランウェイの上に[ Ｂ ]を設けること等、労働者の[ Ｃ ]するための措置を講じなければならない。」
Ａ Ｂ Ｃ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('51ded342-8425-47dd-a9dd-4bd0cf65e510', $c$関係者以外立入禁止の表示 ストッパー 危険を防止$c$, false, 1),
  ('51ded342-8425-47dd-a9dd-4bd0cf65e510', $c$関係者以外立入禁止の表示 ストッパー 注意を喚起$c$, false, 2),
  ('51ded342-8425-47dd-a9dd-4bd0cf65e510', $c$監視人 ストッパー 危険を防止$c$, true, 3),
  ('51ded342-8425-47dd-a9dd-4bd0cf65e510', $c$監視人 クレーンの運転を禁止する旨の表示 注意を喚起$c$, false, 4),
  ('51ded342-8425-47dd-a9dd-4bd0cf65e510', $c$作業を指揮する者 クレーンの運転を禁止する旨の表示 危険を防止$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c52292fc-9969-4343-a253-03b2cad9c238',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーンの使用に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c52292fc-9969-4343-a253-03b2cad9c238', $c$油圧を動力として用いるクレーンの安全弁については、原則として、つり上げ荷重に相当する荷重をかけたときの油圧に相当する圧力以下で作用するように調整しておかなければならない。$c$, true, 1),
  ('c52292fc-9969-4343-a253-03b2cad9c238', $c$クレーンの直働式の巻過防止装置については、つり具の上面又は当該つり具の巻上げ用シーブの上面とドラムその他当該上面が接触するおそれのある物(傾斜したジブを除く。)の下面との間隔が0.05ｍ以上となるように調整しておかなければならない。$c$, false, 2),
  ('c52292fc-9969-4343-a253-03b2cad9c238', $c$ジブクレーンについては、クレーン明細書に記載されているジブの傾斜角(つり上げ荷重が３ｔ未満のジブクレーンにあっては、これを製造した者が指定したジブの傾斜角)の範囲をこえて使用してはならない。$c$, false, 3),
  ('c52292fc-9969-4343-a253-03b2cad9c238', $c$労働者からクレーンの安全装置の機能が失われている旨の申出があったときは、すみやかに、適当な措置を講じなければならない。$c$, false, 4),
  ('c52292fc-9969-4343-a253-03b2cad9c238', $c$クレーン検査証を受けたクレーンを用いて作業を行うときは、当該作業を行う場所に、当該クレーンのクレーン検査証を備え付けておかなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3fca18bd-5c54-40a3-b37d-4a2e1cc65b62',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$クレーン・デリック運転士免許及び免許証に関するＡからＤまでの記述として、法令上、違反となるもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ つり上げ荷重が10ｔの機上で運転する方式の天井クレーンの運転の業務に従事している者が、免許証の滅失が心配なため、運転を行う際は免許証を携帯しているが、クレーンの運転以外の業務の際は免許証の写しを携帯している。
Ｂ クレーンの運転の業務に従事している者が、免許証を滅失したが、当該免許証の写し及び事業者による当該免許証の所持を証明する書面を携帯しているので、免許証の再交付を受けていない。
Ｃ クレーンの運転の業務に従事している者が、氏名を変更したが、他の技能講習修了証等で変更後の氏名を確認できるので、免許証の書替えを受けていない。
Ｄ クレーンの運転中に、重大な過失により労働災害を発生させたため、クレーン・デリック運転士免許の取消しの処分を受けた者が、免許証の免許の種類の欄にクレーン・デリック運転士免許に加えて、他の種類の免許に係る事項が記載されているので、クレーン・デリック運転士免許の取消しをした都道府県労働局長に免許証を返還していない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3fca18bd-5c54-40a3-b37d-4a2e1cc65b62', $c$Ａ，Ｂ$c$, false, 1),
  ('3fca18bd-5c54-40a3-b37d-4a2e1cc65b62', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('3fca18bd-5c54-40a3-b37d-4a2e1cc65b62', $c$Ｂ，Ｃ，Ｄ$c$, true, 3),
  ('3fca18bd-5c54-40a3-b37d-4a2e1cc65b62', $c$Ｃ，Ｄ$c$, false, 4),
  ('3fca18bd-5c54-40a3-b37d-4a2e1cc65b62', $c$Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '46eabefc-4b6f-4a68-9fb9-d28da23c763f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$デリックに係る許可、設置、検査及び検査証に関する記述として、法令上、誤っているものは次のうちどれか。
ただし、設置から廃止までの期間が３年間で、設置作業場内の移設はないものとし、計画の届出に係る免除認定を受けていない場合とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('46eabefc-4b6f-4a68-9fb9-d28da23c763f', $c$つり上げ荷重2.9ｔのデリックを設置しようとする事業者は、当該工事の開始の日の30日前までにデリック設置届を所轄労働基準監督署長に提出しなければならない。$c$, false, 1),
  ('46eabefc-4b6f-4a68-9fb9-d28da23c763f', $c$つり上げ荷重3.9ｔのデリックを設置した者は、所轄労働基準監督署長が検査の必要がないと認めたデリックを除き、落成検査を受けなければならない。$c$, false, 2),
  ('46eabefc-4b6f-4a68-9fb9-d28da23c763f', $c$デリック検査証を受けたデリックを設置している者に異動があったときは、デリックを設置している者は、当該異動後10日以内に、デリック検査証書替申請書にデリック検査証を添えて、所轄労働基準監督署長に提出し、書替えを受けなければならない。$c$, false, 3),
  ('46eabefc-4b6f-4a68-9fb9-d28da23c763f', $c$つり上げ荷重4.9ｔのデリックを製造しようとする者は、原則として、あらかじめ、所轄都道府県労働局長の製造許可を受けなければならない。$c$, false, 4),
  ('46eabefc-4b6f-4a68-9fb9-d28da23c763f', $c$つり上げ荷重1.9ｔのデリックを設置した事業者は、設置後10日以内にデリック設置報告書を所轄労働基準監督署長に提出しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '957e7fc0-6300-4e88-b580-0db230b757fc',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$デリックの運転及び玉掛けの業務に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('957e7fc0-6300-4e88-b580-0db230b757fc', $c$クレーンに限定したクレーン・デリック運転士免許では、つり上げ荷重６ｔのガイデリックの運転の業務に就くことができない。$c$, false, 1),
  ('957e7fc0-6300-4e88-b580-0db230b757fc', $c$玉掛け技能講習の修了で、つり上げ荷重７ｔのスチフレッグデリックで行う３ｔの荷の玉掛けの業務に就くことができる。$c$, false, 2),
  ('957e7fc0-6300-4e88-b580-0db230b757fc', $c$玉掛けの業務に係る特別の教育の受講では、つり上げ荷重２ｔの二又デリックで行う0.9ｔの荷の玉掛けの業務に就くことができない。$c$, false, 3),
  ('957e7fc0-6300-4e88-b580-0db230b757fc', $c$限定なしのクレーン・デリック運転士免許で、つり上げ荷重20ｔの鳥居形デリックの運転の業務に就くことができる。$c$, false, 4),
  ('957e7fc0-6300-4e88-b580-0db230b757fc', $c$デリックの運転の業務に係る特別の教育の受講では、つり上げ荷重４ｔのジンポールデリックの運転の業務に就くことができない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '90de5135-3fce-48ce-879b-b321d31e16c6',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '関係法令'),
  $q$デリックの自主検査及び点検に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('90de5135-3fce-48ce-879b-b321d31e16c6', $c$定期自主検査を行ったときは、当該自主検査結果を、デリック検査証に記録しなければならない。$c$, false, 1),
  ('90de5135-3fce-48ce-879b-b321d31e16c6', $c$１年以内ごとに１回行う定期自主検査における荷重試験は、つり上げ荷重に相当する荷重の荷をつって、つり上げ、旋回及びブームの起伏の作動を定格速度により行わなければならない。$c$, false, 2),
  ('90de5135-3fce-48ce-879b-b321d31e16c6', $c$１年以内ごとに１回行う定期自主検査の結果の記録は３年間保存し、１か月以内ごとに１回行う定期自主検査の結果の記録は１年間保存しなければならない。$c$, false, 3),
  ('90de5135-3fce-48ce-879b-b321d31e16c6', $c$１か月以内ごとに１回行う定期自主検査を行った場合において、異常を認めたときは、次回の定期自主検査までに補修しなければならない。$c$, false, 4),
  ('90de5135-3fce-48ce-879b-b321d31e16c6', $c$作業開始前の点検においては、ワイヤロープが通っている箇所の状態について点検を行わなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c9c402eb-2f6f-4c24-ab22-0d04dd2596cc',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c9c402eb-2f6f-4c24-ab22-0d04dd2596cc', $c$単相交流を三つ集め、電流及び電圧の大きさ並びに電流の方向が、時間の経過に関係なく一定となるものを三相交流という。$c$, false, 1),
  ('c9c402eb-2f6f-4c24-ab22-0d04dd2596cc', $c$交流用の電圧計や電流計の計測値は、電圧や電流の最大値を示している。$c$, false, 2),
  ('c9c402eb-2f6f-4c24-ab22-0d04dd2596cc', $c$直流はＡＣ、交流はＤＣと表される。$c$, false, 3),
  ('c9c402eb-2f6f-4c24-ab22-0d04dd2596cc', $c$工場の動力用電源には、一般に、200Ｖ級又は400Ｖ級の三相交流が使用されている。$c$, true, 4),
  ('c9c402eb-2f6f-4c24-ab22-0d04dd2596cc', $c$直流は、変圧器によって容易に電圧を変えることができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6a3c4947-0228-4c89-80e8-821cf520cbe5',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電圧、電流、抵抗及び電力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6a3c4947-0228-4c89-80e8-821cf520cbe5', $c$抵抗を直列につないだときの合成抵抗の値は、個々の抵抗の値のどれよりも大きい。$c$, false, 1),
  ('6a3c4947-0228-4c89-80e8-821cf520cbe5', $c$回路が消費する電力Ｐ(Ｗ)は、回路にかかる電圧をＥ(Ｖ)、回路に流れる電流をＩ(Ａ)とすれば、Ｐ(Ｗ)＝Ｅ(Ｖ)×Ｉ(Ａ)で表される。$c$, false, 2),
  ('6a3c4947-0228-4c89-80e8-821cf520cbe5', $c$回路に流れる電流の大きさは、回路にかかる電圧に比例し、回路の抵抗に反比例する。$c$, false, 3),
  ('6a3c4947-0228-4c89-80e8-821cf520cbe5', $c$導体でできた円形断面の電線の長さが２倍になると抵抗の値は２倍になり、断面の直径が２倍になると抵抗の値は２分の１になる。$c$, true, 4),
  ('6a3c4947-0228-4c89-80e8-821cf520cbe5', $c$電圧の単位はボルト(Ｖ)で、1000Ｖは１kＶとも表す。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '845495ff-ddb9-4471-b112-e3495c5b95dd',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('845495ff-ddb9-4471-b112-e3495c5b95dd', $c$巻線形三相誘導電動機は、固定子側、回転子側ともに巻線を用いた構造で、回転子側の巻線はスリップリングを通して外部抵抗と接続するようになっている。$c$, false, 1),
  ('845495ff-ddb9-4471-b112-e3495c5b95dd', $c$三相誘導電動機の同期速度は、周波数を一定とすれば、極数が少ないほど速くなる。$c$, false, 2),
  ('845495ff-ddb9-4471-b112-e3495c5b95dd', $c$三相誘導電動機の回転子は、固定子の回転磁界により回転するが、負荷がかかると同期速度より15～20％遅く回転する性質がある。$c$, true, 3),
  ('845495ff-ddb9-4471-b112-e3495c5b95dd', $c$直流電動機では、固定子を界磁と呼ぶ。$c$, false, 4),
  ('845495ff-ddb9-4471-b112-e3495c5b95dd', $c$かご形三相誘導電動機は、スリップリングやブラシがない極めて簡単な構造である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '45e02262-07f1-40e8-815f-2ad887facd43',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機の付属機器に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('45e02262-07f1-40e8-815f-2ad887facd43', $c$ドラム形直接制御器は、ハンドルで回される円弧状のフィンガーとそれに接する固定セグメントにより電磁接触器の操作回路を開閉する制御器である。$c$, false, 1),
  ('45e02262-07f1-40e8-815f-2ad887facd43', $c$レバーハンドル式の制御器は、操作レバーを水平方向に回して操作する構造である。$c$, false, 2),
  ('45e02262-07f1-40e8-815f-2ad887facd43', $c$ユニバーサル制御器は、１本の操作ハンドルを前後左右や斜めに操作することにより、３個の制御器を同時に又は単独で操作できる構造にしたものである。$c$, false, 3),
  ('45e02262-07f1-40e8-815f-2ad887facd43', $c$エンコーダー型制御器は、ハンドル位置を連続的に検出し、電動機の主回路を直接開閉する直接制御器である。$c$, false, 4),
  ('45e02262-07f1-40e8-815f-2ad887facd43', $c$押しボタンスイッチには、一段目で低速、二段目で高速運転ができるようにした二段押込み式のものがある。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f98b6559-97f4-4b76-8052-099652d3055b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの給電装置及び配線に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f98b6559-97f4-4b76-8052-099652d3055b', $c$トロリ線の材料には、溝付硬銅トロリ線やレールなどが用いられる。$c$, false, 1),
  ('f98b6559-97f4-4b76-8052-099652d3055b', $c$トロリ線給電のうち絶縁トロリ線方式のものは、一本一本のトロリ線が、すその開いた絶縁物で被覆されており、集電子はその間を摺動して集電する。$c$, false, 2),
  ('f98b6559-97f4-4b76-8052-099652d3055b', $c$旋回体、ケーブル巻取式などの回転部分への給電には、トロリバーが用いられる。$c$, true, 3),
  ('f98b6559-97f4-4b76-8052-099652d3055b', $c$内部配線は、一般に、絶縁電線を金属管などの電線管又は金属ダクト内に収め、外部からの損傷を防いでいる。$c$, false, 4),
  ('f98b6559-97f4-4b76-8052-099652d3055b', $c$キャブタイヤケーブルは、導体に細い素線を使い、これを多数より合わせており、外装被覆も厚く丈夫に作られているので、引きずったり、屈曲を繰り返す用途に適している。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3e3c3619-16bd-4164-b6d3-f63851194b82',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機の制御に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3e3c3619-16bd-4164-b6d3-f63851194b82', $c$直接制御は、容量の大きな電動機では制御器のハンドル操作が重くなるので使用できない。$c$, false, 1),
  ('3e3c3619-16bd-4164-b6d3-f63851194b82', $c$間接制御では、シーケンサーを使用することにより、直接制御に比べ、いろいろな自動運転や速度制御を容易に行うことができる。$c$, false, 2),
  ('3e3c3619-16bd-4164-b6d3-f63851194b82', $c$巻線形三相誘導電動機の半間接制御は、電流の多い一次側を電磁接触器で間接制御し、電流の比較的少ない二次側を直接制御器で直接制御する方式である。$c$, false, 3),
  ('3e3c3619-16bd-4164-b6d3-f63851194b82', $c$コースチングノッチは、制御器の第１ノッチとして設けられ、ブレーキには通電しないで電動機にのみ通電して、ブレーキを緩めるものである。$c$, true, 4),
  ('3e3c3619-16bd-4164-b6d3-f63851194b82', $c$ゼロノッチインターロックは、各制御器のハンドルが停止位置になければ、主電磁接触器を投入できないようにしたものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4b00f824-b389-49c5-9517-072e0cc8c991',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電動機の速度制御方式などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4b00f824-b389-49c5-9517-072e0cc8c991', $c$巻線形三相誘導電動機の二次抵抗制御は、回転子の巻線に接続した抵抗器の抵抗値を変化させて速度制御するもので、始動時には二次抵抗を全抵抗挿入状態から順次短絡することにより、緩始動することができる。$c$, false, 1),
  ('4b00f824-b389-49c5-9517-072e0cc8c991', $c$巻線形三相誘導電動機の電動油圧押上機ブレーキ制御は、機械的な摩擦力を利用して制御するため、ブレーキドラムが過熱することがある。$c$, false, 2),
  ('4b00f824-b389-49c5-9517-072e0cc8c991', $c$かご形三相誘導電動機では、電源回路に抵抗器、リアクトル、サイリスターなどを挿入し、電動機の始動電流を抑えて、緩始動を行う方法がある。$c$, false, 3),
  ('4b00f824-b389-49c5-9517-072e0cc8c991', $c$巻線形三相誘導電動機のダイナミックブレーキ制御は、巻下げの速度制御時に電動機の一次側を交流電源から切り離し、一次側に直流電源を接続して通電し、直流励磁を加えることにより制動力を得るもので、つり荷が極めて軽い場合でも低速で荷の巻下げができる特長がある。$c$, true, 4),
  ('4b00f824-b389-49c5-9517-072e0cc8c991', $c$巻線形三相誘導電動機のサイリスター一次電圧制御は、電動機の一次側に加える電圧を変えると、同じ負荷に対して回転数が変わる性質を利用して速度制御を行うものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd6154d23-d2b8-4bd7-a28b-d1a35a54cad7',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$一般的に電気をよく通す導体及び電気を通しにくい絶縁体(不導体)に区分されるものの組合せとして、適切なものは(１)～(５)のうちどれか。
導体 絶縁体(不導体)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d6154d23-d2b8-4bd7-a28b-d1a35a54cad7', $c$鋳鉄 塩水$c$, false, 1),
  ('d6154d23-d2b8-4bd7-a28b-d1a35a54cad7', $c$雲母 大理石$c$, false, 2),
  ('d6154d23-d2b8-4bd7-a28b-d1a35a54cad7', $c$空気 ガラス$c$, false, 3),
  ('d6154d23-d2b8-4bd7-a28b-d1a35a54cad7', $c$銅 黒鉛$c$, false, 4),
  ('d6154d23-d2b8-4bd7-a28b-d1a35a54cad7', $c$アルミニウム 磁器$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f84f3b3e-688e-4066-b536-0dd2ed2eb2d9',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$クレーンの電気機器の故障の原因などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f84f3b3e-688e-4066-b536-0dd2ed2eb2d9', $c$電動機がうなるが起動しない場合の原因の一つとして、負荷が大きすぎることがあげられる。$c$, false, 1),
  ('f84f3b3e-688e-4066-b536-0dd2ed2eb2d9', $c$電動機が起動した後、回転数が上がらない場合の原因の一つとして、電源の電圧降下が大きいことがあげられる。$c$, false, 2),
  ('f84f3b3e-688e-4066-b536-0dd2ed2eb2d9', $c$集電装置の火花が激しい場合の原因の一つとして、集電子が摩耗していることがあげられる。$c$, false, 3),
  ('f84f3b3e-688e-4066-b536-0dd2ed2eb2d9', $c$電動機が全く起動しない場合の原因の一つとして、配線の端子が外れていることがあげられる。$c$, false, 4),
  ('f84f3b3e-688e-4066-b536-0dd2ed2eb2d9', $c$過電流継電器が作動する場合の原因の一つとして、電動機の回路が断線していることがあげられる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2705da57-a4d3-4fae-8b0f-28781d631376',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2705da57-a4d3-4fae-8b0f-28781d631376', $c$接地線には、できるだけ電気抵抗の大きな電線を使った方が丈夫で、安全である。$c$, true, 1),
  ('2705da57-a4d3-4fae-8b0f-28781d631376', $c$天井クレーンは、鋼製の走行車輪を経て走行レールに接触しているため、走行レールが接地されている場合は、クレーン上の電気機器も取付けボルトの締付けが良ければ接地されることになる。$c$, false, 2),
  ('2705da57-a4d3-4fae-8b0f-28781d631376', $c$接地は、漏電している電気機器のフレームなどに人が接触したとき、感電の危険を少なくする効果がある。$c$, false, 3),
  ('2705da57-a4d3-4fae-8b0f-28781d631376', $c$感電による人体への影響の程度は、電流の大きさ、通電時間、電流の種類、体質などの条件により異なる。$c$, false, 4),
  ('2705da57-a4d3-4fae-8b0f-28781d631376', $c$電気によるやけどには、アークなどの高熱による熱傷のほか、電流通過に伴い発生するジュール熱によって引き起こされる、皮膚や内部組織の傷害がある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e471a5f9-8063-413a-90a9-0e03c6dd2c8f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e471a5f9-8063-413a-90a9-0e03c6dd2c8f', $c$力の三要素とは、力の大きさ、力の向き及び力の作用点をいう。$c$, false, 1),
  ('e471a5f9-8063-413a-90a9-0e03c6dd2c8f', $c$力の大きさをＦ、回転軸の中心から力の作用線に下ろした垂線の長さをＬとすれば、力のモーメントＭは、Ｍ＝Ｆ/Ｌで求められる。$c$, true, 2),
  ('e471a5f9-8063-413a-90a9-0e03c6dd2c8f', $c$多数の力が一点に作用し、つり合っているとき、これらの力の合力は「０」になる。$c$, false, 3),
  ('e471a5f9-8063-413a-90a9-0e03c6dd2c8f', $c$力が物体に作用する位置をその作用線上以外の箇所に移すと、物体に与える効果が変わる。$c$, false, 4),
  ('e471a5f9-8063-413a-90a9-0e03c6dd2c8f', $c$一直線上に作用する互いに逆を向く二つの力の合力の大きさは、その二つの力の大きさの差で求められる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'aabc38c2-5ed8-4aee-a813-923b24372eac',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のように天井クレーンで質量６ｔの荷をつるとき、Ｂの支点が支える力の値に最も近いものは(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ²とし、クレーンガーダ、クラブトロリ及びワイヤロープの質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問32',
  '/exam-figures/crane_all/2026-04/q32.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('aabc38c2-5ed8-4aee-a813-923b24372eac', $c$４kＮ$c$, false, 1),
  ('aabc38c2-5ed8-4aee-a813-923b24372eac', $c$12kＮ$c$, false, 2),
  ('aabc38c2-5ed8-4aee-a813-923b24372eac', $c$23kＮ$c$, false, 3),
  ('aabc38c2-5ed8-4aee-a813-923b24372eac', $c$36kＮ$c$, true, 4),
  ('aabc38c2-5ed8-4aee-a813-923b24372eac', $c$94kＮ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1b00f817-2e4b-4f9b-86a2-368cdc435f1b',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$物体の質量及び比重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1b00f817-2e4b-4f9b-86a2-368cdc435f1b', $c$物体の質量と、その物体と同じ体積の４℃の純水の質量との比をその物体の比重という。$c$, false, 1),
  ('1b00f817-2e4b-4f9b-86a2-368cdc435f1b', $c$鋼の比重は、銅の比重より小さい。$c$, false, 2),
  ('1b00f817-2e4b-4f9b-86a2-368cdc435f1b', $c$アルミニウム、鋳鉄、鉛及び木材を比重の大きい順に並べると、「鉛、鋳鉄、アルミニウム、木材」となる。$c$, false, 3),
  ('1b00f817-2e4b-4f9b-86a2-368cdc435f1b', $c$物体の体積をＶ、その単位体積当たりの質量をｄとすれば、その物体の質量Ｗは、Ｗ＝Ｖ×ｄで求められる。$c$, false, 4),
  ('1b00f817-2e4b-4f9b-86a2-368cdc435f1b', $c$形状が立方体で均質な材料でできている物体では、縦、横、高さ３辺の長さがそれぞれ２分の１になると質量は４分の１になる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5ed754a4-7047-4cf3-b216-0d6779539fbe',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$均質な材料でできた固体の物体(以下、本問において「物体」という。)の重心及び安定に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5ed754a4-7047-4cf3-b216-0d6779539fbe', $c$物体全体に作用する重力は、物体を細かく分けたときに各部分に作用する重力の和であるが、物体の各部分に作用する重力の合力は一点に集中して作用すると考えられ、この点(合力の作用点)を重心という。$c$, false, 1),
  ('5ed754a4-7047-4cf3-b216-0d6779539fbe', $c$直方体の物体の置き方を変える場合、重心の位置が高くなるほど安定性は悪くなる。$c$, false, 2),
  ('5ed754a4-7047-4cf3-b216-0d6779539fbe', $c$円柱の物体の重心の位置は、円柱の上下の底面の円の中心を結んだ線分の中点の位置にある。$c$, false, 3),
  ('5ed754a4-7047-4cf3-b216-0d6779539fbe', $c$水平面上に置いた直方体の物体を傾けた場合、重心からの鉛直線がその物体の底面を通るときは、その物体は元の位置に戻らないで倒れる。$c$, true, 4),
  ('5ed754a4-7047-4cf3-b216-0d6779539fbe', $c$重心は、物体の形状によっては必ずしも物体の内部にあるとは限らない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd2853b58-ae53-48ae-ae9b-d253c184d8e3',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$天井クレーンで荷をつり上げ、つり荷を移動させるためにクレーンを５秒間に４ｍ移動する速度で走行させながら５秒間に３ｍ移動する速度で横行させ続けているとき、つり荷が10秒間に移動する距離は(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d2853b58-ae53-48ae-ae9b-d253c184d8e3', $c$３ｍ$c$, false, 1),
  ('d2853b58-ae53-48ae-ae9b-d253c184d8e3', $c$４ｍ$c$, false, 2),
  ('d2853b58-ae53-48ae-ae9b-d253c184d8e3', $c$５ｍ$c$, false, 3),
  ('d2853b58-ae53-48ae-ae9b-d253c184d8e3', $c$７ｍ$c$, false, 4),
  ('d2853b58-ae53-48ae-ae9b-d253c184d8e3', $c$10ｍ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'dfaa80b5-3e23-4994-9083-1448d2a6f228',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$物体に働く摩擦力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dfaa80b5-3e23-4994-9083-1448d2a6f228', $c$物体が他の物体に接触しながら運動しているときに働く摩擦力を、運動摩擦力という。$c$, false, 1),
  ('dfaa80b5-3e23-4994-9083-1448d2a6f228', $c$物体に働く運動摩擦力は、最大静止摩擦力より小さい。$c$, false, 2),
  ('dfaa80b5-3e23-4994-9083-1448d2a6f228', $c$床面で静止している物体には、その物体を床面に沿って引っ張るなどして力を加えなければ、静止摩擦力は働かない。$c$, false, 3),
  ('dfaa80b5-3e23-4994-9083-1448d2a6f228', $c$静止摩擦係数をμ、物体の接触面に作用する垂直力をＮとすれば、最大静止摩擦力Ｆは、Ｆ＝μ/Ｎで求められる。$c$, true, 4),
  ('dfaa80b5-3e23-4994-9083-1448d2a6f228', $c$円柱状の物体を動かす場合、転がり摩擦力は滑り摩擦力に比べると小さい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a97d9578-0d19-435c-bff4-321778271109',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a97d9578-0d19-435c-bff4-321778271109', $c$天井クレーンのクレーンガーダには、主に引張荷重がかかる。$c$, true, 1),
  ('a97d9578-0d19-435c-bff4-321778271109', $c$クレーンのシーブを通る巻上げ用ワイヤロープには、主に引張荷重と曲げ荷重がかかる。$c$, false, 2),
  ('a97d9578-0d19-435c-bff4-321778271109', $c$荷を巻き下げているときに急制動すると、玉掛け用ワイヤロープには、衝撃荷重がかかる。$c$, false, 3),
  ('a97d9578-0d19-435c-bff4-321778271109', $c$クレーンのフックには、主に引張荷重と曲げ荷重がかかる。$c$, false, 4),
  ('a97d9578-0d19-435c-bff4-321778271109', $c$片振り荷重は、向きは同じであるが、大きさが時間とともに変わる荷重である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '815d529e-ab26-4910-bb51-1ac673d22e45',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$天井から垂直につるした直径１cmの丸棒の先端に質量100㎏の荷をつり下げるとき、丸棒に生じる引張応力の値に最も近いものは(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ²とし、丸棒の質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('815d529e-ab26-4910-bb51-1ac673d22e45', $c$１Ｎ/mm²$c$, false, 1),
  ('815d529e-ab26-4910-bb51-1ac673d22e45', $c$６Ｎ/mm²$c$, false, 2),
  ('815d529e-ab26-4910-bb51-1ac673d22e45', $c$12Ｎ/mm²$c$, true, 3),
  ('815d529e-ab26-4910-bb51-1ac673d22e45', $c$25Ｎ/mm²$c$, false, 4),
  ('815d529e-ab26-4910-bb51-1ac673d22e45', $c$31Ｎ/mm²$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ebd2633b-20e2-4c29-86e7-bc7187ddfaf3',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＣまでの図のとおり、同一形状で質量が異なる三つの荷を、それぞれ同じ長さの２本の玉掛け用ワイヤロープ(以下、本問において「ワイヤロープ」という。)を用いて、それぞれ異なるつり角度でつり上げるとき、これらの荷を、１本のワイヤロープにかかる張力の値が大きい順に並べたものは(１)～(５)のうちどれか。
ただし、いずれも荷の左右のつり合いは取れており、左右のワイヤロープの張力は同じとし、ワイヤロープの質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問39',
  '/exam-figures/crane_all/2026-04/q39.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ebd2633b-20e2-4c29-86e7-bc7187ddfaf3', $c$Ａ Ｂ Ｃ$c$, true, 1),
  ('ebd2633b-20e2-4c29-86e7-bc7187ddfaf3', $c$Ａ Ｃ Ｂ$c$, false, 2),
  ('ebd2633b-20e2-4c29-86e7-bc7187ddfaf3', $c$Ｂ Ａ Ｃ$c$, false, 3),
  ('ebd2633b-20e2-4c29-86e7-bc7187ddfaf3', $c$Ｃ Ａ Ｂ$c$, false, 4),
  ('ebd2633b-20e2-4c29-86e7-bc7187ddfaf3', $c$Ｃ Ｂ Ａ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '79f434f1-d4ac-4cfb-a3a1-e395ace1b81f',
  'crane_all',
  (SELECT id FROM exam_types WHERE exam_id = 'crane_all' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'crane_all' AND e.code = 'common' AND c.name = 'クレーンの運転のために必要な力学に関する知識'),
  $q$図のような滑車を用いて、質量Ｗの荷をつり上げるとき、荷を支えるために必要な力Ｆを求める式がそれぞれの図の下部に記載してあるが、これらの力Ｆを求める式として、適切でないものは(１)～(５)のうちどれか。
ただし、ｇは重力の加速度とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 クレーン・デリック運転士（限定なし）試験 問40',
  '/exam-figures/crane_all/2026-04/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('79f434f1-d4ac-4cfb-a3a1-e395ace1b81f', $c$図（１）$c$, true, 1),
  ('79f434f1-d4ac-4cfb-a3a1-e395ace1b81f', $c$図（２）$c$, false, 2),
  ('79f434f1-d4ac-4cfb-a3a1-e395ace1b81f', $c$図（３）$c$, false, 3),
  ('79f434f1-d4ac-4cfb-a3a1-e395ace1b81f', $c$図（４）$c$, false, 4),
  ('79f434f1-d4ac-4cfb-a3a1-e395ace1b81f', $c$図（５）$c$, false, 5);

do $$
declare
  crane_2025_10 int;
  crane_2026_04 int;
begin
  select count(*) into crane_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 クレーン・デリック運転士（限定なし）試験%';

  select count(*) into crane_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 クレーン・デリック運転士（限定なし）試験%';

  if crane_2025_10 <> 40 then
    raise exception 'crane_all 2025-10 sitting must be 40 questions (got %)', crane_2025_10;
  end if;
  if crane_2026_04 <> 40 then
    raise exception 'crane_all 2026-04 sitting must be 40 questions (got %)', crane_2026_04;
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
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和7年10月)',
  150,
  40,
  '令和7年10月公表 クレーン・デリック運転士（限定なし）試験'
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and source_filter = '令和7年10月公表 クレーン・デリック運転士（限定なし）試験'
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'crane_all',
  exam_types.id,
  'クレーン・デリック運転士模擬試験(令和8年4月)',
  150,
  40,
  '令和8年4月公表 クレーン・デリック運転士（限定なし）試験'
from exam_types
where exam_types.exam_id = 'crane_all'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'crane_all'
      and source_filter = '令和8年4月公表 クレーン・デリック運転士（限定なし）試験'
  );

