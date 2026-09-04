-- cargo_gear 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'cargo_gear', '揚貨装置運転士', '公益財団法人安全衛生技術試験協会', true
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'cargo_gear');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'cargo_gear', 'common', '揚貨装置運転士'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'cargo_gear', 'common', '揚貨装置運転士', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'cargo_gear' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'cargo_gear', '揚貨装置に関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'cargo_gear'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '揚貨装置に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'cargo_gear', '関係法令', 2
FROM exam_types et
WHERE et.exam_id = 'cargo_gear'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'cargo_gear', '原動機及び電気に関する知識', 3
FROM exam_types et
WHERE et.exam_id = 'cargo_gear'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '原動機及び電気に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'cargo_gear', '揚貨装置の運転のために必要な力学に関する知識', 4
FROM exam_types et
WHERE et.exam_id = 'cargo_gear'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '揚貨装置の運転のために必要な力学に関する知識'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ed2cfe45-e6c7-49e3-a3a8-c69022dce44a',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ed2cfe45-e6c7-49e3-a3a8-c69022dce44a', $c$揚貨装置は、船舶において荷を積卸しするため船舶に設置された荷役設備である。$c$, false, 1),
  ('ed2cfe45-e6c7-49e3-a3a8-c69022dce44a', $c$デリック型式の揚貨装置は、デリックポスト、デリックブーム及びウインチを主体に構成されている。$c$, false, 2),
  ('ed2cfe45-e6c7-49e3-a3a8-c69022dce44a', $c$ジブクレーン型式の揚貨装置は、巻上げなどの動力には、一般に、油圧モータ又は電動機が使用される。$c$, false, 3),
  ('ed2cfe45-e6c7-49e3-a3a8-c69022dce44a', $c$走行式橋形クレーン型式の揚貨装置は、上甲板口の両側に走行レールを設けたもので、ハッチの適当な位置に移動することができる。$c$, false, 4),
  ('ed2cfe45-e6c7-49e3-a3a8-c69022dce44a', $c$走行式橋形クレーン型式の揚貨装置は、荷役時には、クレーンガーダの先端部に設けられたデリックブームが船外に張り出す構造となっている。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6b9847d6-bd54-4909-8c78-817d871272da',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$デリック型式の揚貨装置におけるロープなどに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6b9847d6-bd54-4909-8c78-817d871272da', $c$ガイテークルは、組合せ滑車及びワイヤロープで構成された装置で、デリックブームの先端を所定の位置に固定するために用いられるものもある。$c$, false, 1),
  ('6b9847d6-bd54-4909-8c78-817d871272da', $c$カーゴワイヤロープは、荷のつり上げ、つり下ろしに使用されるもので、カーゴフォールともいい、けんか巻き方式ではカーゴランナーともいう。$c$, false, 2),
  ('6b9847d6-bd54-4909-8c78-817d871272da', $c$けんか巻き方式のセンターガイは、２本のデリックブームの先端をつなぐ動索で、ブームを旋回するために用いられる。$c$, true, 3),
  ('6b9847d6-bd54-4909-8c78-817d871272da', $c$プリベンターガイは、デリックブームの先端を所定の位置に固定するためのワイヤロープのうち、引込み、巻出しを行わない静索で、一端をデリックブームの先端に、他端をブルワークのクリートなどに取り付ける。$c$, false, 4),
  ('6b9847d6-bd54-4909-8c78-817d871272da', $c$トッピングリフトワイヤロープは、デリックブームの起伏動作を行うために用いられるが、ブームを旋回させる働きをするものもある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '08294c85-e1cb-4248-a2c1-824e5b4b3242',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$ワイヤロープに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('08294c85-e1cb-4248-a2c1-824e5b4b3242', $c$ワイヤロープのより方には、「Ｓより」と「Ｚより」があり、一般に「Ｚより」が多く使われている。$c$, false, 1),
  ('08294c85-e1cb-4248-a2c1-824e5b4b3242', $c$「Ｚより」のワイヤロープは、ロープを縦にして見たとき、右上側から左下方向へ、ストランドがよられている。$c$, false, 2),
  ('08294c85-e1cb-4248-a2c1-824e5b4b3242', $c$「ラングより」のワイヤロープは、ロープのよりの方向とストランドのよりの方向が反対である。$c$, true, 3),
  ('08294c85-e1cb-4248-a2c1-824e5b4b3242', $c$フィラー形29本線６よりロープ心入りは、「ＩＷＲＣ６×Ｆｉ(29)」と表示される。$c$, false, 4),
  ('08294c85-e1cb-4248-a2c1-824e5b4b3242', $c$「ラングより」のワイヤロープは、「普通より」のワイヤロープに比べて素線のよりの傾斜が緩やかで、シーブに接する部分などの摩耗の度合は少ないが、キンクしやすく、玉掛け用には使われない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e39b8dcc-cc44-4759-8781-a3cdc1af91c1',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$荷役用スリングとその用途の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e39b8dcc-cc44-4759-8781-a3cdc1af91c1', $c$ウェブスリング …………………… 袋物用$c$, true, 1),
  ('e39b8dcc-cc44-4759-8781-a3cdc1af91c1', $c$バケットスリング ………………… 鋼板用$c$, false, 2),
  ('e39b8dcc-cc44-4759-8781-a3cdc1af91c1', $c$ボックススリング ………………… 巻取紙用$c$, false, 3),
  ('e39b8dcc-cc44-4759-8781-a3cdc1af91c1', $c$キャンバススリング ……………… スクラップ用$c$, false, 4),
  ('e39b8dcc-cc44-4759-8781-a3cdc1af91c1', $c$ドラムスリング …………………… 鋼管用$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '37668c55-bb85-4ed6-9a15-7dc6f421d6ee',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$つり具及びフックに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('37668c55-bb85-4ed6-9a15-7dc6f421d6ee', $c$リフティングマグネットは、電磁石を応用したつり具で、金、銀、銅、アルミニウムなど、あらゆる金属を引きつけることができるので、スクラップなどの荷役に用いられる。$c$, false, 1),
  ('37668c55-bb85-4ed6-9a15-7dc6f421d6ee', $c$グラブバケットの種類には、その作動方式により、単索式、複索式及び電動油圧式があり、単索式にあっては荷の自重によりシェルが開閉する。$c$, false, 2),
  ('37668c55-bb85-4ed6-9a15-7dc6f421d6ee', $c$スプレッダは、クレーン型式の揚貨装置に取り付けて穀類、石炭、鉱石、砂糖などのばら貨物の荷役に用いられるつり具である。$c$, false, 3),
  ('37668c55-bb85-4ed6-9a15-7dc6f421d6ee', $c$グリッパーは貨物を直接つかんでつり上げることができるつり具で、貨物の荷重そのものにより生ずるつかみ力を利用してつり上げるため、貨物をつかむ部分の形状・寸法は、貨物の種類・形状に応じて有効なものが作られており、木材、箱、ベール梱包貨物など、それぞれの荷姿に合わせたものを使い分ける。$c$, true, 4),
  ('37668c55-bb85-4ed6-9a15-7dc6f421d6ee', $c$カーゴフックには、片フックと両フックがあるが、片フックは40ｔ程度以上の大荷重用に使用される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5df16995-8bd7-4760-b95a-ceeaedebe494',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装具などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5df16995-8bd7-4760-b95a-ceeaedebe494', $c$ブロックのシーブの溝底円弧の接触角は、120°以上とする。$c$, false, 1),
  ('5df16995-8bd7-4760-b95a-ceeaedebe494', $c$ロープ、チェーン、フックなどを接続するときに用いるシャックルのうち、Ｄ字形の形状のものを特にバウシャックルと呼ぶ。$c$, true, 2),
  ('5df16995-8bd7-4760-b95a-ceeaedebe494', $c$合成繊維ロープは、天然繊維ロープに比較して軽く強じんであり、衝撃に対しても強く、吸湿性が小さいなどの利点がある。$c$, false, 3),
  ('5df16995-8bd7-4760-b95a-ceeaedebe494', $c$マニラロープは、天然繊維のロープとしては最も多く使用され、日光に対して強く、雨、海水などに対して比較的耐水性がある。$c$, false, 4),
  ('5df16995-8bd7-4760-b95a-ceeaedebe494', $c$リングプレートは、アイプレートにリングを付けたもので、ロープの方向が広範囲に変化する場合などに用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd392d039-caf4-489d-9159-45b1dda10156',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$図において、電動機の回転軸に固定された歯車Ａが電動機の駆動により毎分1200回転し、これにかみ合う歯車の回転により、歯車Ｄが毎分60回転しているとき、歯車Ｂの歯の枚数の値として、適切なものは(１)～(５)のうちどれか。ただし、歯車Ａ、Ｃ及びＤの歯数は、それぞれ12枚、30枚及び150枚とし、ＢとＣの歯車は同じ軸に固定されているものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問7',
  '/exam-figures/cargo_gear/2026-04/q07.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d392d039-caf4-489d-9159-45b1dda10156', $c$34枚$c$, false, 1),
  ('d392d039-caf4-489d-9159-45b1dda10156', $c$48枚$c$, true, 2),
  ('d392d039-caf4-489d-9159-45b1dda10156', $c$55枚$c$, false, 3),
  ('d392d039-caf4-489d-9159-45b1dda10156', $c$60枚$c$, false, 4),
  ('d392d039-caf4-489d-9159-45b1dda10156', $c$64枚$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '438b1882-1a21-49ae-a8c5-56d2c0afa180',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$電動式であるジブクレーン型式の揚貨装置の操作に係る作業開始前の注意事項に関するＡからＤまでの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 巻上げ、巻下げレバー並びに起伏及び旋回用レバーが円滑に動くかどうかを点検するとともに、文字盤に示されている記号などにより各レバーの操作方向を確認する。Ｂ 巻上げ、巻下げレバーについて、前方に倒せば巻下げ、後方(手前)に倒せば巻上げ、中立にすれば停止することを確認する。Ｃ ジブの起伏及び旋回用レバーについて、右に倒せば右旋回、左に倒せば左旋回、後方(手前)に倒せばジブが伏し、前方に倒せば起き、中立にすれば停止することを確認する。Ｄ 操作レバーを１ノッチ、２ノッチと順々に入れ、カーゴワイヤロープの巻上げ、巻下げ、ジブの起伏及び旋回の無負荷運転を２～３回行い、異常がなければ負荷をかけて荷の巻上げ、巻下げを５～６回行う。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('438b1882-1a21-49ae-a8c5-56d2c0afa180', $c$Ａ，Ｂ$c$, false, 1),
  ('438b1882-1a21-49ae-a8c5-56d2c0afa180', $c$Ａ，Ｄ$c$, false, 2),
  ('438b1882-1a21-49ae-a8c5-56d2c0afa180', $c$Ｂ，Ｃ$c$, false, 3),
  ('438b1882-1a21-49ae-a8c5-56d2c0afa180', $c$Ｃ$c$, true, 4),
  ('438b1882-1a21-49ae-a8c5-56d2c0afa180', $c$Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '575b4711-51fb-4fbf-aaca-50889b3a74d7',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置の制限荷重及び制限角度に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 制限荷重とは、揚貨装置の構造や材料に応じて安全に負荷させることができる最大の荷重をいう。Ｂ デリック型式の揚貨装置の制限荷重は、デリックブーム１本だけで荷をつった場合の最大の荷重のことである。Ｃ 制限荷重の中には、フック、スイベル、スリングなどのつり具の重量は含まれない。Ｄ デリック型式の揚貨装置に制限角度の標示がある場合は、その制限角度未満の角度で使用しなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('575b4711-51fb-4fbf-aaca-50889b3a74d7', $c$Ａ，Ｂ$c$, true, 1),
  ('575b4711-51fb-4fbf-aaca-50889b3a74d7', $c$Ａ，Ｃ，Ｄ$c$, false, 2),
  ('575b4711-51fb-4fbf-aaca-50889b3a74d7', $c$Ｂ，Ｃ$c$, false, 3),
  ('575b4711-51fb-4fbf-aaca-50889b3a74d7', $c$Ｂ，Ｄ$c$, false, 4),
  ('575b4711-51fb-4fbf-aaca-50889b3a74d7', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4da555f4-39bd-4f6d-8242-4752c069e815',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$下記に掲げる図はグースネックを示したものであるが、その説明に関するＡからのＥまでの記述として、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ グースネックブラケットは、グースネックをデリックポストに固定する構造体である。Ｂ グースネックは、デリックブームの伸縮及び旋回を円滑にする働きと、カーゴワイヤロープなどをウインチドラムに正しく巻き込むためのガイド役をする。Ｃ ブロックブラケットは、デリックブームの基部金具に連結され、ブームを受ける働きをする。Ｄ ピンテルは、カーゴワイヤロープ用などの滑車を取り付けるための滑車受けとなる。Ｅ グースネックブラケット及びブロックブラケットに設けられたグリースニップルは、ピンテル部に給油を行うためのものである。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問10',
  '/exam-figures/cargo_gear/2026-04/q10.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4da555f4-39bd-4f6d-8242-4752c069e815', $c$Ａ，Ｂ，Ｅ$c$, false, 1),
  ('4da555f4-39bd-4f6d-8242-4752c069e815', $c$Ａ，Ｄ$c$, false, 2),
  ('4da555f4-39bd-4f6d-8242-4752c069e815', $c$Ｂ，Ｃ，Ｄ$c$, true, 3),
  ('4da555f4-39bd-4f6d-8242-4752c069e815', $c$Ｂ，Ｄ，Ｅ$c$, false, 4),
  ('4da555f4-39bd-4f6d-8242-4752c069e815', $c$Ｃ，Ｅグリースニップルデリックポストブロックブラケット$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6a745473-fd00-48f3-b75f-cafeaeb84029',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の運転及び玉掛けの業務に関するＡからＤまでの記述について、法令上、正しいもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 揚貨装置運転士免許で、岸壁において船舶の荷役作業に使用するつり上げ荷重20ｔの移動式クレーンの運転の業務に就くことができる。Ｂ クレーンに限定したクレーン・デリック運転士免許では、制限荷重７ｔの揚貨装置の運転の業務に就くことができない。Ｃ 揚貨装置の運転の業務に係る特別教育の受講で、制限荷重４ｔの揚貨装置の運転の業務に就くことができる。Ｄ 限定なしのクレーン・デリック運転士免許で、船舶のハッチ上に設置された制限荷重20ｔの走行式橋形クレーン型式の揚貨装置の運転の業務に就くことができる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6a745473-fd00-48f3-b75f-cafeaeb84029', $c$Ａ，Ｂ$c$, false, 1),
  ('6a745473-fd00-48f3-b75f-cafeaeb84029', $c$Ａ，Ｄ$c$, false, 2),
  ('6a745473-fd00-48f3-b75f-cafeaeb84029', $c$Ｂ，Ｃ$c$, true, 3),
  ('6a745473-fd00-48f3-b75f-cafeaeb84029', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('6a745473-fd00-48f3-b75f-cafeaeb84029', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd583cb66-8066-433d-a3cb-5baae500a5a4',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業における危険防止措置に関するＡからＤまでの記述について、法令に定められているもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 港湾荷役作業の開始後、作業中の船倉の内部、ばく露甲板の上又は岸壁の上にある荷の中に、塩素、シアン酸、四アルキル鉛等急性中毒を起こすおそれのある物、腐食性液体その他の腐食性の物、火薬類又は危険物が存することが明らかになったときは、作業指揮者を選任して、当該作業指揮者にこれらの物の安全な取扱い方法を定めさせ、当該取扱いの方法によって作業を実施させなければならない。Ｂ 揚貨装置等を用いて、船倉の内部から荷を巻き上げ、又は船倉の内部へ荷を巻き卸す作業中、ハッチビーム又は開放されたちょうつがい付きハッチボード(以下、本問においてハッチビーム等という。)が固定されていないことが明らかとなったときは、監視人を置き、ハッチビーム等の脱落等により危険が及ぶ範囲へ立ち入らせる労働者の作業状況を監視させなければならない。Ｃ 揚貨装置等を用いて、綿花、羊毛、コルク等でベール包装により包装されているものの巻上げの作業を行うときは、労働者に、当該包装に用いられている帯鉄、ロープ又は針金にスリングのフックをかけさせてはならない。Ｄ 船倉の内部の小麦、大豆、とうもろこし等ばら物の荷を卸す作業を行う場合において、当該作業中、シフチングボード、フィーダボックス等荷の移動を防止するための隔壁が倒壊すること等により労働者に危険を及ぼすおそれのあることが明らかになったときは、当該隔壁等を固定しなければならない。ただし、作業指揮者を選任して、当該作業指揮者に作業の方法及び労働者の配置を決定させ、当該作業を指揮させるときは、この限りでない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d583cb66-8066-433d-a3cb-5baae500a5a4', $c$Ａ，Ｂ$c$, false, 1),
  ('d583cb66-8066-433d-a3cb-5baae500a5a4', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('d583cb66-8066-433d-a3cb-5baae500a5a4', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('d583cb66-8066-433d-a3cb-5baae500a5a4', $c$Ｃ$c$, true, 4),
  ('d583cb66-8066-433d-a3cb-5baae500a5a4', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e6fcd38d-40db-4e10-a45d-86528b491c0f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文中の 内に入れるＡからＣまでの語句又は数字の組合せとして、法令上、正しいものは(１)～(５)のうちどれか。「事業者は、揚貨装置の玉掛けに用いるワイヤロープの安全係数については、Ａ 以上としなければならない。この安全係数は、ワイヤロープの Ｂ の値を、当該ワイヤロープにかかる荷重の Ｃ の値で除した値である。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e6fcd38d-40db-4e10-a45d-86528b491c0f', $c$５ 衝撃荷重 最大$c$, false, 1),
  ('e6fcd38d-40db-4e10-a45d-86528b491c0f', $c$５ 切断荷重 最大$c$, false, 2),
  ('e6fcd38d-40db-4e10-a45d-86528b491c0f', $c$５ 切断荷重 最小$c$, false, 3),
  ('e6fcd38d-40db-4e10-a45d-86528b491c0f', $c$６ 切断荷重 最大$c$, true, 4),
  ('e6fcd38d-40db-4e10-a45d-86528b491c0f', $c$６ 衝撃荷重 最小$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '214f1307-4463-458f-ad88-8eacbb056538',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業における、「当該作業に従事する者」の立入り、通行及び作業に関するＡからＥまでの記述について、法令上、禁止とされていないもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 揚貨装置を用いて荷の巻上げの作業が行われている場合において、甲板からの深さが３ｍの船倉へ通行するための設備を使用して通行する者に、荷が激突するおそれのあるときの、当該通行設備の通行Ｂ 揚貨装置のブームの起伏の作業が行われている場合において、当該ブームが倒れることにより当該場所の周囲において作業に従事する者に危険を及ぼすおそれのあるところへの立入りＣ 揚貨装置を用いて巻出索又は引込索により荷を引いているときの、当該索の外角側への保護帽を着用した当該作業に従事する者の立入りＤ 防網等の荷の落下防止設備が設けられている同一の船倉の内部において、上層で作業が行われているときの下層での作業Ｅ ハッチボードの開閉の作業が行われている場所の下方で、ハッチボードが落下することにより当該場所の周囲において作業に従事する者に危険を及ぼすおそれのあるところへの立入り$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('214f1307-4463-458f-ad88-8eacbb056538', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('214f1307-4463-458f-ad88-8eacbb056538', $c$Ａ，Ｂ，Ｅ$c$, false, 2),
  ('214f1307-4463-458f-ad88-8eacbb056538', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('214f1307-4463-458f-ad88-8eacbb056538', $c$Ｃ，Ｄ$c$, true, 4),
  ('214f1307-4463-458f-ad88-8eacbb056538', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '482b7cfd-85d7-49f0-9115-62c373bda2b8',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$船内荷役作業主任者(以下、本問において「作業主任者」という。)の選任及び職務に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('482b7cfd-85d7-49f0-9115-62c373bda2b8', $c$事業者は、総トン数400ｔの船舶において、荷を積み、荷を卸し、又は荷を移動させる作業については、揚貨装置を用いないで行うものであっても、作業主任者を選任しなければならない。$c$, false, 1),
  ('482b7cfd-85d7-49f0-9115-62c373bda2b8', $c$作業主任者は、揚貨装置運転士免許を有する者のうちから選任しなければならない。$c$, false, 2),
  ('482b7cfd-85d7-49f0-9115-62c373bda2b8', $c$事業者は、作業主任者に、通行設備、荷役機械、保護具並びに器具及び工具を点検整備させるとともに、これらの使用状況を監視させなければならない。$c$, true, 3),
  ('482b7cfd-85d7-49f0-9115-62c373bda2b8', $c$事業者は、作業主任者に、作業の方法を決定させるとともに、作業を直接指揮させなければならない。ただし、業務の都合上やむを得ない場合であって、あらかじめ周辺の作業者との連絡調整を行ったときは、この限りでない。$c$, false, 4),
  ('482b7cfd-85d7-49f0-9115-62c373bda2b8', $c$事業者は、作業主任者を選任したときは、遅滞なく、選任報告書を所轄労働基準監督署長に提出しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '64dcb3c7-9fd8-43ae-b723-b5c3997789c7',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置を用いて作業を行うときに用いるフック付きスリング、もっこスリング、ワイヤスリング等のスリングについての点検を行わなければならない時期として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('64dcb3c7-9fd8-43ae-b723-b5c3997789c7', $c$その日の作業を開始する前に行う。$c$, true, 1),
  ('64dcb3c7-9fd8-43ae-b723-b5c3997789c7', $c$その日の作業の開始後、遅滞なく行う。$c$, false, 2),
  ('64dcb3c7-9fd8-43ae-b723-b5c3997789c7', $c$揚貨装置を用いた作業中、異常を認めたときに行う。$c$, false, 3),
  ('64dcb3c7-9fd8-43ae-b723-b5c3997789c7', $c$その日の作業を終了した後、直ちに行う。$c$, false, 4),
  ('64dcb3c7-9fd8-43ae-b723-b5c3997789c7', $c$その日の作業を終了した後、異常を認めたときに行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ce24cd5d-8a70-414a-b13e-8b76297b587d',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の玉掛けに用いる玉掛用具として、法令上、その使用が禁止とされていないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ce24cd5d-8a70-414a-b13e-8b76297b587d', $c$使用する際の安全係数が５となるワイヤロープ$c$, false, 1),
  ('ce24cd5d-8a70-414a-b13e-8b76297b587d', $c$伸びが、当該鎖が製造されたときの長さの６％の鎖$c$, false, 2),
  ('ce24cd5d-8a70-414a-b13e-8b76297b587d', $c$リンクの断面の直径の減少が、製造されたときの当該直径の11％の鎖$c$, false, 3),
  ('ce24cd5d-8a70-414a-b13e-8b76297b587d', $c$直径の減少が公称径の10％のワイヤロープ$c$, false, 4),
  ('ce24cd5d-8a70-414a-b13e-8b76297b587d', $c$使用する際の安全係数が５となるフック$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f9f5478c-46c5-4785-86aa-7d1257032860',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置を用いて作業を行うときの、揚貨装置の運転についての合図に関する法令条文に基づくＡからＤまでの記述について、その記述内容が、法令に定められているもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 事業者は、揚貨装置の運転について一定の合図(以下、本問において「合図」という。)を定めなければならない。Ｂ 事業者は、合図を行う者(以下、本問において「合図者」という。)を船舶ごとに指名しなければならない。Ｃ 事業者が、合図者を指名できないときは、揚貨装置運転士は自らを合図者として指名することが出来る。ただし、揚貨装置運転士が自らを合図者として指名したときは、遅滞なく、その旨を事業者に報告しなければならない。Ｄ 揚貨装置を用いて行う作業に従事する労働者は、合図者が行う合図に従わなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f9f5478c-46c5-4785-86aa-7d1257032860', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('f9f5478c-46c5-4785-86aa-7d1257032860', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('f9f5478c-46c5-4785-86aa-7d1257032860', $c$Ａ，Ｄ$c$, true, 3),
  ('f9f5478c-46c5-4785-86aa-7d1257032860', $c$Ｂ，Ｃ$c$, false, 4),
  ('f9f5478c-46c5-4785-86aa-7d1257032860', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '54beab1a-aba2-4d57-98be-ded17f2311e5',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の取扱いなどに関するＡからＤまでの記述について、法令上、誤っているもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 揚貨装置を用いて、荷の巻上げ又は巻卸しの作業を行うときは、当該作業の開始後遅滞なく、揚貨装置の作動状態について点検し、異常がないことを確認しなければならない。Ｂ 揚貨装置等を用いて、荷の巻出しの作業を行うときは、巻出索に用いるみぞ車を、ビームクランプ、シャックル、リング、ストラップ等の取付具により船のフレームに取り付けてはならない。Ｃ 揚貨装置の運転者を荷をつったまま作業位置から離れさせてはならない。ただし、作業の性質上やむを得ない場合又は安全な作業の遂行上必要な場合に、揚貨装置の運転を停止し、かつ、ブレーキをかけるときは、この限りでない。Ｄ 揚貨装置等を用いて、船倉の内部の荷で、ハッチの直下にあるもの以外のものを巻き上げる作業を行うときは、巻出索を使用する等により、あらかじめ、当該荷をハッチの直下に移してから行わなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('54beab1a-aba2-4d57-98be-ded17f2311e5', $c$Ａ，Ｂ，Ｃ$c$, true, 1),
  ('54beab1a-aba2-4d57-98be-ded17f2311e5', $c$Ａ，Ｄ$c$, false, 2),
  ('54beab1a-aba2-4d57-98be-ded17f2311e5', $c$Ｂ，Ｃ$c$, false, 3),
  ('54beab1a-aba2-4d57-98be-ded17f2311e5', $c$Ｂ，Ｄ$c$, false, 4),
  ('54beab1a-aba2-4d57-98be-ded17f2311e5', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5a56351d-a29a-49fc-aa69-6a08d305e2ec',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は揚貨装置運転士など労働安全衛生法に基づく免許及び免許証に係る法令条文を抜粋したものであるが、この文中の 内に入れるＡ及びＢの語句の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。「労働安全衛生法違反により免許の取消しの処分を受けた者は、 Ａ 、免許の取消しをした Ｂ に免許証を返還しなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5a56351d-a29a-49fc-aa69-6a08d305e2ec', $c$遅滞なく 労働基準監督署長$c$, false, 1),
  ('5a56351d-a29a-49fc-aa69-6a08d305e2ec', $c$遅滞なく 都道府県労働局長$c$, true, 2),
  ('5a56351d-a29a-49fc-aa69-6a08d305e2ec', $c$処分を受けた日から起算して14日以内に 労働基準監督署長$c$, false, 3),
  ('5a56351d-a29a-49fc-aa69-6a08d305e2ec', $c$処分を受けた日から起算して30日以内に 労働基準監督署長$c$, false, 4),
  ('5a56351d-a29a-49fc-aa69-6a08d305e2ec', $c$処分を受けた日から起算して30日以内に 都道府県労働局長$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd60ac30c-deba-438d-a3e8-2eacd90b3d84',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d60ac30c-deba-438d-a3e8-2eacd90b3d84', $c$単相交流を三つ集め、電流及び電圧の大きさ並びに電流の方向が時間の経過に関係なく一定となるものを三相交流という。$c$, false, 1),
  ('d60ac30c-deba-438d-a3e8-2eacd90b3d84', $c$交流は、電流及び電圧の大きさ及び方向が周期的に変化する。$c$, true, 2),
  ('d60ac30c-deba-438d-a3e8-2eacd90b3d84', $c$交流発電機を直流電動機で駆動すると、その発電機からは直流が出力されるが、出力された直流は完全に平滑ではなく波が多少残るため、脈流と呼ばれる。$c$, false, 3),
  ('d60ac30c-deba-438d-a3e8-2eacd90b3d84', $c$直流はＡＣ、交流はＤＣと表される。$c$, false, 4),
  ('d60ac30c-deba-438d-a3e8-2eacd90b3d84', $c$直流は、変圧器によって容易に電圧を変えることができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '253a7d94-8068-42b2-a79d-1b5febecf675',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電圧、電流、抵抗などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('253a7d94-8068-42b2-a79d-1b5febecf675', $c$電流の単位はアンペア(Ａ)で、0.001Ａは１mＡとも表す。$c$, false, 1),
  ('253a7d94-8068-42b2-a79d-1b5febecf675', $c$100Ｖで200Ｗの作業灯を24時間点灯し続けたときの消費電力量は、48kＷhである。$c$, true, 2),
  ('253a7d94-8068-42b2-a79d-1b5febecf675', $c$抵抗に電流が流れたときに発生する熱をジュール熱という。$c$, false, 3),
  ('253a7d94-8068-42b2-a79d-1b5febecf675', $c$電力とは、電気エネルギーが単位時間当たりにする仕事の量をいう。$c$, false, 4),
  ('253a7d94-8068-42b2-a79d-1b5febecf675', $c$回路の抵抗が同じ場合、電流が大きいほど消費電力は大きくなる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd6f8c291-ff34-4252-9c79-212886afdfb5',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$図のような回路について、ＡＥ間に60Ｖの電圧をかけたときの電流Ｉ(Ａ)、電圧Ｅ(Ｖ)、抵抗Ｒ(Ω)の値に関する記述として、適切でないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問23',
  '/exam-figures/cargo_gear/2026-04/q23.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d6f8c291-ff34-4252-9c79-212886afdfb5', $c$Ｂ点を流れる電流の値は４Ａである。$c$, true, 1),
  ('d6f8c291-ff34-4252-9c79-212886afdfb5', $c$Ｄ点を流れる電流の値は２Ａである。$c$, false, 2),
  ('d6f8c291-ff34-4252-9c79-212886afdfb5', $c$ＡＢ間の電圧の値は48Ⅴである。$c$, false, 3),
  ('d6f8c291-ff34-4252-9c79-212886afdfb5', $c$ＢＣ間の電圧の値は12Ⅴである。$c$, false, 4),
  ('d6f8c291-ff34-4252-9c79-212886afdfb5', $c$ＡＥ間の抵抗の値は10Ωである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f98fa393-783c-4fe6-8856-7632da706112',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気の導体及び絶縁体(不導体)に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f98fa393-783c-4fe6-8856-7632da706112', $c$鋳鉄は、電気の絶縁体である。$c$, false, 1),
  ('f98fa393-783c-4fe6-8856-7632da706112', $c$磁器は、電気の導体である。$c$, false, 2),
  ('f98fa393-783c-4fe6-8856-7632da706112', $c$黒鉛は、電気の絶縁体である。$c$, false, 3),
  ('f98fa393-783c-4fe6-8856-7632da706112', $c$雲母は、電気の導体である。$c$, false, 4),
  ('f98fa393-783c-4fe6-8856-7632da706112', $c$空気は、電気の絶縁体である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a039fae7-032b-47f3-b9e5-6c9afc76354c',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気計器に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a039fae7-032b-47f3-b9e5-6c9afc76354c', $c$回路計(テスター)は、直流電圧、交流電圧、直流電流などを、スイッチを切り替えることによって計測できる計器である。$c$, false, 1),
  ('a039fae7-032b-47f3-b9e5-6c9afc76354c', $c$回路計(テスター)では、測定する回路の電圧や電流の大きさの見当がつかない場合は、最初に測定範囲の最大レンジで測定する。$c$, false, 2),
  ('a039fae7-032b-47f3-b9e5-6c9afc76354c', $c$電圧計は、測定する回路に直列に接続して電圧の大きさを測定する。$c$, true, 3),
  ('a039fae7-032b-47f3-b9e5-6c9afc76354c', $c$交流用の電圧計や電流計は、一般に電圧又は電流の最大値ではなく実効値で目盛られている。$c$, false, 4),
  ('a039fae7-032b-47f3-b9e5-6c9afc76354c', $c$電気回路の絶縁性が低下すると、漏えい電流が多くなり、漏電が起きることがあるので、絶縁抵抗計を用いて絶縁体の抵抗を測定する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '856b581e-b730-47e1-925f-4deef319ac16',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('856b581e-b730-47e1-925f-4deef319ac16', $c$電気機器のカバーなどを抵抗の少ない導線で船体などに接地しておけば、電気機器の充電部分に人が接触しても、感電の危険はない。$c$, false, 1),
  ('856b581e-b730-47e1-925f-4deef319ac16', $c$接地線には、できるだけ電気抵抗の大きな電線を使った方が丈夫で安全である。$c$, false, 2),
  ('856b581e-b730-47e1-925f-4deef319ac16', $c$感電による人体への影響の程度は、電流の大きさ、通電時間、電流の種類、体質などの条件により異なる。$c$, true, 3),
  ('856b581e-b730-47e1-925f-4deef319ac16', $c$人体は身体内部の電気抵抗が皮膚の電気抵抗よりも大きいため、電気やけどの影響は皮膚深部には及ばないが、皮膚表面は極めて大きな傷害を受ける。$c$, false, 4),
  ('856b581e-b730-47e1-925f-4deef319ac16', $c$感電による危険を電流と時間の積によって評価する基準によれば、一般に、500ⅿＡの電流が人体を流れた場合、安全率を考慮して１秒以内の通電時間が安全限界とされている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '93d5ea8f-748b-4d78-a1b2-81fc497e84eb',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧駆動モータに関するＡからＥまでの記述について、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 油圧駆動モータは、高圧の油を動力源に用い、回転運動として動力を得る装置であるが、高圧の油を得るために油圧ポンプとそれを駆動する電動機などが必要である。Ｂ 油圧駆動モータは、一般に、電動機に比べ小型軽量で、加減速性能が極めて良好で遠隔操作も可能であるが、油漏れが起きやすく、火花禁止の場所では使用できない欠点がある。Ｃ 油圧駆動モータは、作動油の温度変化の影響を受けない構造で、常に一定の効率で駆動することができる。Ｄ アキシャル形プランジャモータは、プランジャが回転軸と同一方向に配列されたもので、プランジャの往復運動により斜板が回転し、モータ軸に回転運動を与えるものである。Ｅ ベーンモータは、ロータに取り付けたベーンとカムリングで構成する各油室に圧油を送ってロータを回転させ、モータ軸に回転運動を与える構造である。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('93d5ea8f-748b-4d78-a1b2-81fc497e84eb', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('93d5ea8f-748b-4d78-a1b2-81fc497e84eb', $c$Ａ，Ｄ，Ｅ$c$, true, 2),
  ('93d5ea8f-748b-4d78-a1b2-81fc497e84eb', $c$Ａ，Ｅ$c$, false, 3),
  ('93d5ea8f-748b-4d78-a1b2-81fc497e84eb', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('93d5ea8f-748b-4d78-a1b2-81fc497e84eb', $c$Ｂ，Ｃ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5f803bef-3f76-4955-b325-d8e492b39775',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5f803bef-3f76-4955-b325-d8e492b39775', $c$かご形三相誘導電動機は、巻線形三相誘導電動機に比べ、構造が簡単で、取扱いも容易である。$c$, false, 1),
  ('5f803bef-3f76-4955-b325-d8e492b39775', $c$直流電動機は、交流電動機に比べ速度の制御性能が良い。$c$, false, 2),
  ('5f803bef-3f76-4955-b325-d8e492b39775', $c$直流電動機では、固定子を界磁と呼ぶ。$c$, false, 3),
  ('5f803bef-3f76-4955-b325-d8e492b39775', $c$巻線形三相誘導電動機は、固定子側も回転子側も巻線になっており、回転子巻線はスリップリングを通して外部抵抗と接続される。$c$, false, 4),
  ('5f803bef-3f76-4955-b325-d8e492b39775', $c$巻線形三相誘導電動機では、回転子側を一次側、固定子側を二次側と呼ぶ。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd293e00b-8ec0-4b9f-ad81-d1620682fc07',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機の付属機器に関するＡからＤまでの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 直接制御器は、主幹制御器の操作レバーにより継電器を働かせて、電動機の回路を開閉する電磁接触器を操作するものである。Ｂ 直接制御器は、間接制御器に比べ制御器に流れる電流が小さい。Ｃ 間接制御器では、制御器をウインチの近くに据え付ける必要はなく、離れた位置で操作ができるので、通常、ハッチ内が良く見える位置に２基の制御器を取り付け、荷の状態を見ながら２基のウインチを１人で操作するようになっている。Ｄ サーマルリレーは、回路に過大な電流が流れたときに自動的に電磁接触器を開いて電流を断ち、電動機を保護するものである。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d293e00b-8ec0-4b9f-ad81-d1620682fc07', $c$Ａ，Ｂ$c$, true, 1),
  ('d293e00b-8ec0-4b9f-ad81-d1620682fc07', $c$Ａ，Ｃ$c$, false, 2),
  ('d293e00b-8ec0-4b9f-ad81-d1620682fc07', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('d293e00b-8ec0-4b9f-ad81-d1620682fc07', $c$Ｂ，Ｄ$c$, false, 4),
  ('d293e00b-8ec0-4b9f-ad81-d1620682fc07', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8532e676-2a20-4401-8616-d4865bbe9581',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$ガソリン機関と比べた場合のディーゼル機関の一般的な特徴として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8532e676-2a20-4401-8616-d4865bbe9581', $c$１馬力当たりのエンジン質量が大きい。$c$, false, 1),
  ('8532e676-2a20-4401-8616-d4865bbe9581', $c$騒音や振動が大きい。$c$, false, 2),
  ('8532e676-2a20-4401-8616-d4865bbe9581', $c$冬期の始動性がやや悪い。$c$, false, 3),
  ('8532e676-2a20-4401-8616-d4865bbe9581', $c$熱効率が悪い。$c$, true, 4),
  ('8532e676-2a20-4401-8616-d4865bbe9581', $c$運転経費が安い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a42d65c8-da8f-43c1-8c5c-3f5c44cb7007',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のようにＯ点に作用している力Ｐを三つの力に分解するとき、三つの分力の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問31',
  '/exam-figures/cargo_gear/2026-04/q31.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a42d65c8-da8f-43c1-8c5c-3f5c44cb7007', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('a42d65c8-da8f-43c1-8c5c-3f5c44cb7007', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('a42d65c8-da8f-43c1-8c5c-3f5c44cb7007', $c$Ａ，Ｃ，Ｅ$c$, true, 3),
  ('a42d65c8-da8f-43c1-8c5c-3f5c44cb7007', $c$Ｂ，Ｄ，Ｅ$c$, false, 4),
  ('a42d65c8-da8f-43c1-8c5c-3f5c44cb7007', $c$Ｃ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '08d464e9-86d4-42c9-9542-f5040b4c0529',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のように三つの重りをワイヤロープによりつるした天びん棒が支点Ｏでつり合っているとき、Ｂ点にある重りＰの質量は(１)～(５)のうちどれか。ただし、天びん棒及びワイヤロープの質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問32',
  '/exam-figures/cargo_gear/2026-04/q32.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('08d464e9-86d4-42c9-9542-f5040b4c0529', $c$13kg$c$, false, 1),
  ('08d464e9-86d4-42c9-9542-f5040b4c0529', $c$20kg$c$, false, 2),
  ('08d464e9-86d4-42c9-9542-f5040b4c0529', $c$24kg$c$, false, 3),
  ('08d464e9-86d4-42c9-9542-f5040b4c0529', $c$35kg$c$, true, 4),
  ('08d464e9-86d4-42c9-9542-f5040b4c0529', $c$45kgＥＡＰＢ ＤＣ35cm 20cm30kg Ｐ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '69823506-c762-4bdc-b3d2-d2715ce59ee4',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$物体の質量及び比重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('69823506-c762-4bdc-b3d2-d2715ce59ee4', $c$物体の質量と、その物体と同じ体積の４℃の純水の質量との比をその物体の比重という。$c$, false, 1),
  ('69823506-c762-4bdc-b3d2-d2715ce59ee4', $c$全体が均質な球体で、比重が１より大きい材質からなる物体は、水に沈む。$c$, false, 2),
  ('69823506-c762-4bdc-b3d2-d2715ce59ee4', $c$アルミニウムの丸棒が、その長さは同じで、直径が３倍になると、質量は９倍になる。$c$, false, 3),
  ('69823506-c762-4bdc-b3d2-d2715ce59ee4', $c$物体の質量をＷ、その体積をＶとすれば、その単位体積当たりの質量ｄは、ｄ＝Ｗ/Ｖで求められる。$c$, false, 4),
  ('69823506-c762-4bdc-b3d2-d2715ce59ee4', $c$鋼の比重は、鋳鉄の比重より小さい。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2e56334f-b2da-4eee-b539-def786ba64ac',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$次の文中の 内に入れるＡからＣまでの語句の組合せとして、適切なものは(１)～(５)のうちどれか。「水平面に置いてある物体が図に示すように傾いているとき、この物体の各部分に作用する Ａ により生じている力の合力Ｗが重心Ｇに鉛直に作用し、回転の中心△を支点として、物体を Ｂ とする方向に Ｃ が働く。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2e56334f-b2da-4eee-b539-def786ba64ac', $c$Ａ：重力　Ｂ：倒そう　Ｃ：力のモーメント$c$, false, 1),
  ('2e56334f-b2da-4eee-b539-def786ba64ac', $c$Ａ：重力　Ｂ：元に戻そう　Ｃ：力のモーメント$c$, true, 2),
  ('2e56334f-b2da-4eee-b539-def786ba64ac', $c$Ａ：復元力　Ｂ：元に戻そう　Ｃ：力のモーメント$c$, false, 3),
  ('2e56334f-b2da-4eee-b539-def786ba64ac', $c$Ａ：復元力　Ｂ：元に戻そう　Ｃ：引張力$c$, false, 4),
  ('2e56334f-b2da-4eee-b539-def786ba64ac', $c$Ａ：遠心力　Ｂ：倒そう　Ｃ：引張力$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '09107b49-fecc-4602-a280-5c9594cee599',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$物体の運動に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('09107b49-fecc-4602-a280-5c9594cee599', $c$運動の速さと向きを示す量を速度といい、速度の変化の程度を示す量を加速度という。$c$, false, 1),
  ('09107b49-fecc-4602-a280-5c9594cee599', $c$物体が一定の加速度で加速し、その速度が10秒間に10ｍ/ｓから35ｍ/ｓになったときの加速度は、25ｍ/ｓ²である。$c$, true, 2),
  ('09107b49-fecc-4602-a280-5c9594cee599', $c$等速直線運動をしている物体の移動した距離をＬ、その移動に要した時間をＴとすれば、その速さＶは、Ｖ＝Ｌ/Ｔで求められる。$c$, false, 3),
  ('09107b49-fecc-4602-a280-5c9594cee599', $c$外から力が作用しない限り、静止している物体が静止の状態を、また、運動している物体が同一の運動の状態を続けようとする性質を慣性という。$c$, false, 4),
  ('09107b49-fecc-4602-a280-5c9594cee599', $c$荷をつった状態でジブクレーン型式の揚貨装置のジブを旋回させると、荷は旋回する前の作業半径より大きい半径で回るようになる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7b02a42d-3570-4b1f-a6ef-3dcb82069f4d',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のように、水平な床面に置いた質量Ｗの物体を床面に沿って引っ張り、動き始める直前の力Ｆの値が490Ｎであったとき、Ｗの値は(１)～(５)のうちどれか。ただし、接触面の静止摩擦係数は0.5とし、重力の加速度は9.8ｍ/ｓ²とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7b02a42d-3570-4b1f-a6ef-3dcb82069f4d', $c$25㎏$c$, false, 1),
  ('7b02a42d-3570-4b1f-a6ef-3dcb82069f4d', $c$100㎏$c$, true, 2),
  ('7b02a42d-3570-4b1f-a6ef-3dcb82069f4d', $c$245㎏$c$, false, 3),
  ('7b02a42d-3570-4b1f-a6ef-3dcb82069f4d', $c$980㎏$c$, false, 4),
  ('7b02a42d-3570-4b1f-a6ef-3dcb82069f4d', $c$2401㎏$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e02f74da-12b0-4836-ac1a-c0f991b9b5fc',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e02f74da-12b0-4836-ac1a-c0f991b9b5fc', $c$走行式橋形クレーン型式の揚貨装置のガーダ(桁)には、主に曲げ荷重がかかる。$c$, false, 1),
  ('e02f74da-12b0-4836-ac1a-c0f991b9b5fc', $c$シーブを通るカーゴワイヤロープには、主に引張荷重と曲げ荷重がかかる。$c$, false, 2),
  ('e02f74da-12b0-4836-ac1a-c0f991b9b5fc', $c$両振り荷重は、向きと大きさが時間とともに変わる荷重である。$c$, false, 3),
  ('e02f74da-12b0-4836-ac1a-c0f991b9b5fc', $c$ウインチのドラムには、主に引張荷重とせん断荷重がかかる。$c$, true, 4),
  ('e02f74da-12b0-4836-ac1a-c0f991b9b5fc', $c$衝撃荷重は、極めて短時間に急激に加わる荷重である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '38a83c35-5e93-4ea4-ba6d-956a050cef4a',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＤまでの図のとおり、同一形状で質量が異なる四つの荷を、それぞれ同じ長さの２本の玉掛け用ワイヤロープ(以下、本問において「ワイヤロープ」という。)を用いて、それぞれ異なるつり角度でつり上げるとき、これらの荷を、１本のワイヤロープにかかる張力の値が小さい順に並べたものは(１)～(５)のうちどれか。ただし、いずれも荷の左右のつり合いは取れており、左右のワイヤロープの張力は同じとし、ワイヤロープの質量は考えないものとする。(Ａ：荷900㎏、つり角度30°／Ｂ：荷750kg、つり角度60°／Ｃ：荷600kg、つり角度90°／Ｄ：荷500kg、つり角度120°)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('38a83c35-5e93-4ea4-ba6d-956a050cef4a', $c$Ａ Ｂ Ｃ Ｄ$c$, false, 1),
  ('38a83c35-5e93-4ea4-ba6d-956a050cef4a', $c$Ａ Ｄ Ｂ Ｃ$c$, false, 2),
  ('38a83c35-5e93-4ea4-ba6d-956a050cef4a', $c$Ｂ Ａ Ｄ Ｃ$c$, false, 3),
  ('38a83c35-5e93-4ea4-ba6d-956a050cef4a', $c$Ｃ Ｂ Ａ Ｄ$c$, true, 4),
  ('38a83c35-5e93-4ea4-ba6d-956a050cef4a', $c$Ｄ Ａ Ｂ Ｃ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'eb1290b3-3f63-40ce-b8cb-839b614554d2',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$軟鋼の材料の強さ、応力などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('eb1290b3-3f63-40ce-b8cb-839b614554d2', $c$材料に荷重をかけると、材料の内部にはその荷重に抵抗し、つり合いを保とうとする外力が生じる。$c$, true, 1),
  ('eb1290b3-3f63-40ce-b8cb-839b614554d2', $c$繰返し荷重が作用するとき、比較的小さな荷重であっても材料が破壊することがあるが、このような現象を材料の疲れによる破壊(疲労破壊)という。$c$, false, 2),
  ('eb1290b3-3f63-40ce-b8cb-839b614554d2', $c$引張試験において、材料の試験片を材料試験機に取り付けて静かに引張荷重をかけると、加えられた荷重に応じて試験片に変形が生じるが、荷重の大きさが「荷重－伸び線図」(応力ひずみ線図)における比例限度以内であれば、荷重を取り除くと、試験片は荷重が作用する前の形状に戻る。$c$, false, 3),
  ('eb1290b3-3f63-40ce-b8cb-839b614554d2', $c$材料に荷重が作用し変形するとき、荷重が作用する前(原形)の量に対する変形量の割合をひずみという。$c$, false, 4),
  ('eb1290b3-3f63-40ce-b8cb-839b614554d2', $c$引張応力は、材料に作用する引張荷重を材料の断面積で割って求める。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'afafed98-8927-420a-834e-1eab98e6da7d',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のような組合せ滑車を用いて質量175㎏の荷を２個つるとき、これを支えるために必要な力Ｆの値に最も近いものは(１)～(５)のうちどれか。ただし、重力の加速度は9.8ｍ/ｓ²とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 揚貨装置運転士試験 問40',
  '/exam-figures/cargo_gear/2026-04/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('afafed98-8927-420a-834e-1eab98e6da7d', $c$327Ｎ$c$, false, 1),
  ('afafed98-8927-420a-834e-1eab98e6da7d', $c$368Ｎ$c$, false, 2),
  ('afafed98-8927-420a-834e-1eab98e6da7d', $c$429Ｎ$c$, true, 3),
  ('afafed98-8927-420a-834e-1eab98e6da7d', $c$735Ｎ$c$, false, 4),
  ('afafed98-8927-420a-834e-1eab98e6da7d', $c$858Ｎ$c$, false, 5);

do $$
declare
  cargo_gear_2026_04 int;
  fig_missing int;
  bad_cat int;
begin
  select count(*) into cargo_gear_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 揚貨装置運転士試験%';

  if cargo_gear_2026_04 <> 40 then
    raise exception 'cargo_gear 2026-04 sitting must be 40 questions (got %)', cargo_gear_2026_04;
  end if;

  select count(*) into bad_cat
  from (
    select c.name
    from questions q
    join categories c on c.id = q.category_id
    where q.source_type = 'past_exam'
      and q.source_note like '%令和8年4月公表 揚貨装置運転士試験%'
    group by c.name
    having count(*) <> 10
  ) subject_counts;

  if bad_cat <> 0 then
    raise exception 'cargo_gear 2026-04 must have 10 questions per subject';
  end if;

  select count(*) into fig_missing
  from questions
  where source_type = 'past_exam'
    and (
      (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問7$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q07.jpg')
      or (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問10$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q10.jpg')
      or (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問23$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q23.jpg')
      or (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問31$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q31.jpg')
      or (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問32$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q32.jpg')
      or (source_note like '%令和8年4月公表%' and source_note ~ '揚貨装置運転士試験 問40$' and figure_url is distinct from '/exam-figures/cargo_gear/2026-04/q40.jpg')
    );

  if fig_missing <> 0 then
    raise exception 'cargo_gear 2026-04 required figures are missing (got % mismatches)', fig_missing;
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
  'cargo_gear',
  exam_types.id,
  '揚貨装置運転士模擬試験(令和8年4月)',
  150,
  40,
  '令和8年4月公表 揚貨装置運転士試験'
from exam_types
where exam_types.exam_id = 'cargo_gear'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'cargo_gear'
      and source_filter = '令和8年4月公表 揚貨装置運転士試験'
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
  'cargo_gear',
  exam_types.id,
  '揚貨装置運転士模擬試験(令和8年4月)【原動機電気・力学免除】',
  75,
  20,
  '令和8年4月公表 揚貨装置運転士試験',
  array[
    '揚貨装置に関する知識',
    '関係法令'
  ]
from exam_types
where exam_types.exam_id = 'cargo_gear'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'cargo_gear'
      and name = '揚貨装置運転士模擬試験(令和8年4月)【原動機電気・力学免除】'
  );
