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
  '69cfba9a-70d7-4b5d-92f8-0a6c20dcc598',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('69cfba9a-70d7-4b5d-92f8-0a6c20dcc598', $c$揚貨装置は、船舶において荷を積卸しするため船舶又は岸壁に設置された荷役設備である。$c$, false, 1),
  ('69cfba9a-70d7-4b5d-92f8-0a6c20dcc598', $c$デリック型式の揚貨装置のシングルデリックブームのガイレス荷役方式は、１本のトッピングリフトワイヤロープを使ってデリックブームを旋回させるものである。$c$, false, 2),
  ('69cfba9a-70d7-4b5d-92f8-0a6c20dcc598', $c$デリック型式の揚貨装置のシングルデリックブームのガイ装備荷役方式では、ブーム先端の左右にガイワイヤロープを張り、それぞれのロープの引込み、巻出しを行うことにより、ブーム先端を所定の位置に動かして位置決めをする。$c$, true, 3),
  ('69cfba9a-70d7-4b5d-92f8-0a6c20dcc598', $c$１個の共通旋回台に２台のジブクレーンを搭載したダブルタイプの揚貨装置は、荷を斜めづりしたり、船体が左右に大きく傾斜しても、ジブが揺れずに使用できる特長がある。$c$, false, 4),
  ('69cfba9a-70d7-4b5d-92f8-0a6c20dcc598', $c$走行式橋形クレーン型式の揚貨装置は、荷役時には、クレーンガーダの先端部に設けられたデリックブームが船外に張り出す構造となっている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e1db6a9a-4a37-4750-82e0-cde837f82594',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$シングルワイヤによるけんか巻き荷役方式の説明に関する次の文中の内に入れるＡからＣまでの数字又は語句の組合せとして、適切なものは(１)～(５)のうちどれか。「ブームを固定した状態で、 Ａ 台のウインチの巻上げ・巻下げ運転だけで貨物の荷役を行うことができる。デリックブームの仰角は、強度の上では大きくするほど良いが、あまり大きくし過ぎると、デリックブームが Ｂ 危険がある。つり上げる荷の位置が２本のブームヘッドを結んだ線の Ｃ にないと斜めづりになる。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e1db6a9a-4a37-4750-82e0-cde837f82594', $c$Ａ：１　Ｂ：立ち上がる　Ｃ：真下$c$, false, 1),
  ('e1db6a9a-4a37-4750-82e0-cde837f82594', $c$Ａ：１　Ｂ：立ち上がる　Ｃ：真横$c$, false, 2),
  ('e1db6a9a-4a37-4750-82e0-cde837f82594', $c$Ａ：１　Ｂ：倒れる　Ｃ：真横$c$, false, 3),
  ('e1db6a9a-4a37-4750-82e0-cde837f82594', $c$Ａ：２　Ｂ：倒れる　Ｃ：真下$c$, false, 4),
  ('e1db6a9a-4a37-4750-82e0-cde837f82594', $c$Ａ：２　Ｂ：立ち上がる　Ｃ：真下$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '491f4b22-76fa-4b58-bfee-f3d9f42e7bf6',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$ワイヤロープ端末の止め方とその図の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問3',
  '/exam-figures/cargo_gear/2025-10/q03.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('491f4b22-76fa-4b58-bfee-f3d9f42e7bf6', $c$圧縮止め$c$, false, 1),
  ('491f4b22-76fa-4b58-bfee-f3d9f42e7bf6', $c$クサビ止め$c$, false, 2),
  ('491f4b22-76fa-4b58-bfee-f3d9f42e7bf6', $c$アイスプライス$c$, false, 3),
  ('491f4b22-76fa-4b58-bfee-f3d9f42e7bf6', $c$クリップ止め$c$, true, 4),
  ('491f4b22-76fa-4b58-bfee-f3d9f42e7bf6', $c$合金止め又はソケット止め$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b079e249-5dde-4594-bd0c-f8a55bc40574',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$荷役用スリングとその用途の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b079e249-5dde-4594-bd0c-f8a55bc40574', $c$バケットスリング ………… 長尺物用$c$, false, 1),
  ('b079e249-5dde-4594-bd0c-f8a55bc40574', $c$ボックススリング ………… ばら荷用$c$, true, 2),
  ('b079e249-5dde-4594-bd0c-f8a55bc40574', $c$ウェブスリング …………… 機関車などの大型重量物用$c$, false, 3),
  ('b079e249-5dde-4594-bd0c-f8a55bc40574', $c$キャンバススリング ……… 巻取紙用$c$, false, 4),
  ('b079e249-5dde-4594-bd0c-f8a55bc40574', $c$ドラムスリング …………… 袋物用$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f9653882-3bef-4165-bb26-d43e8a6e82a0',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$つり具及びフックに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f9653882-3bef-4165-bb26-d43e8a6e82a0', $c$グリッパーは、貨物の荷重によって生じる把握力を利用して、直接貨物をつかんでつり上げるつり具で、貨物をつかむ部分の形状、寸法は、木材、箱、ベール梱包などの貨物に応じて有効となるように作られており、それぞれの荷姿に合わせたものを使用する。$c$, true, 1),
  ('f9653882-3bef-4165-bb26-d43e8a6e82a0', $c$リフティングマグネットは、電磁石を応用したつり具で、金、銀、銅、アルミニウムなど、あらゆる金属を引きつけることができるので、スクラップなどの荷役に用いられる。$c$, false, 2),
  ('f9653882-3bef-4165-bb26-d43e8a6e82a0', $c$スプレッダは、クレーン型式の揚貨装置に取り付けて石炭、鉱石、砂利などのばら貨物の荷役に用いられるつり具である。$c$, false, 3),
  ('f9653882-3bef-4165-bb26-d43e8a6e82a0', $c$グラブバケットの種類には、その作動方式により、単索式、複索式及び電動油圧式があり、単索式にあっては荷の自重によりシェルが開閉する。$c$, false, 4),
  ('f9653882-3bef-4165-bb26-d43e8a6e82a0', $c$カーゴフックには、片フックと両フックがあるが、片フックは40ｔ程度以上の大荷重用に使用される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0392a01d-3f99-42f9-b16f-095998b4946f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装具などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0392a01d-3f99-42f9-b16f-095998b4946f', $c$ブロックのシーブの溝底円弧の接触角は、120°以上とする。$c$, false, 1),
  ('0392a01d-3f99-42f9-b16f-095998b4946f', $c$アイ及びアイプレートのうち、プリベンターガイを取り付けるときに用いるアイで、プレートにリングが取り付けられたものを、特にイヤクリートと呼ぶ。$c$, true, 2),
  ('0392a01d-3f99-42f9-b16f-095998b4946f', $c$シャックルには、ふくらんだ形のバウシャックルとＤ字形のストレートシャックルがあり、ロープ、チェーンなどの接続に用いられる。$c$, false, 3),
  ('0392a01d-3f99-42f9-b16f-095998b4946f', $c$マニラロープは、天然繊維のロープとしては最も多く使用され、日光に対して強く、雨、海水などに対しても比較的耐水性がある。$c$, false, 4),
  ('0392a01d-3f99-42f9-b16f-095998b4946f', $c$合成繊維ロープは、天然繊維ロープに比較して軽く強じんであり、衝撃に対しても強く、吸湿性が小さいなどの利点がある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'da19f67a-cb4e-44d5-b6be-6b1b8170a087',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$図において、電動機の回転軸に固定された歯車Ａが電動機の駆動により毎分1600回転し、これにかみ合う歯車の回転により、歯車Ｄが毎分80回転しているとき、歯車Ｂの歯の枚数の値として、適切なものは(１)～(５)のうちどれか。ただし、歯車Ａ、Ｃ及びＤの歯の枚数は、それぞれ16枚、24枚及び120枚とし、ＢとＣの歯車は同じ軸に固定されているものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問7',
  '/exam-figures/cargo_gear/2025-10/q07.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('da19f67a-cb4e-44d5-b6be-6b1b8170a087', $c$43枚$c$, false, 1),
  ('da19f67a-cb4e-44d5-b6be-6b1b8170a087', $c$60枚$c$, false, 2),
  ('da19f67a-cb4e-44d5-b6be-6b1b8170a087', $c$64枚$c$, true, 3),
  ('da19f67a-cb4e-44d5-b6be-6b1b8170a087', $c$73枚$c$, false, 4),
  ('da19f67a-cb4e-44d5-b6be-6b1b8170a087', $c$96枚$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e299f9b4-e710-4b41-a48b-7629ca5169bf',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$油圧駆動式であるジブクレーン型式の揚貨装置の操作に関する作業開始前の注意事項として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e299f9b4-e710-4b41-a48b-7629ca5169bf', $c$船舶側による各部の点検及び注油が完了していることを確認する。$c$, false, 1),
  ('e299f9b4-e710-4b41-a48b-7629ca5169bf', $c$各操作レバーが円滑に動くかどうかを点検するとともに、文字盤に示されている記号などにより各操作レバーの操作方向を確認する。$c$, false, 2),
  ('e299f9b4-e710-4b41-a48b-7629ca5169bf', $c$各操作レバーを順次操作し、巻上げ、巻下げ、起伏、旋回を数回ゆっくり無負荷で行い、異常がなければ荷をつって５～６回試運転を行う。$c$, false, 3),
  ('e299f9b4-e710-4b41-a48b-7629ca5169bf', $c$気温が特に高いときに連続運転をすると、油の温度が上がって粘度が高くなり油圧モータの能力が低下するので、船舶側に連絡し、クーラーをかけてもらい油を冷やす。$c$, true, 4),
  ('e299f9b4-e710-4b41-a48b-7629ca5169bf', $c$試運転の際、油パイプの中に空気が入っていて油圧モータが円滑に回転しないときは、船舶側に連絡し、制御装置又は油圧回路に設けてある空気抜きプラグを緩めて空気抜きをしてもらう。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f18cbb08-f61f-4767-b8fc-a129af9f1267',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$揚貨装置の制限荷重及び制限角度に関するＡからＤまでの記述について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 制限荷重とは、揚貨装置の構造や材料に応じて安全に負荷させることができる最大の荷重をいう。Ｂ デリック型式の揚貨装置の制限荷重は、デリックブーム１本だけで荷をつった場合の最大の荷重のことである。Ｃ 制限荷重の中には、フック、スイベル、スリングなどのつり具の重量は含まれない。Ｄ デリック型式の揚貨装置に制限角度の標示がある場合は、その制限角度未満の角度で使用しなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f18cbb08-f61f-4767-b8fc-a129af9f1267', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('f18cbb08-f61f-4767-b8fc-a129af9f1267', $c$Ａ，Ｃ$c$, false, 2),
  ('f18cbb08-f61f-4767-b8fc-a129af9f1267', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('f18cbb08-f61f-4767-b8fc-a129af9f1267', $c$Ｂ，Ｄ$c$, false, 4),
  ('f18cbb08-f61f-4767-b8fc-a129af9f1267', $c$Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f26f4908-fa82-4d0a-b19a-5ad616f20e6e',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置に関する知識'),
  $q$デリック型式の揚貨装置の構造などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f26f4908-fa82-4d0a-b19a-5ad616f20e6e', $c$デリック型式の揚貨装置は、デリックポスト、デリックブーム及びウインチを主体として構成されている。$c$, false, 1),
  ('f26f4908-fa82-4d0a-b19a-5ad616f20e6e', $c$デリックポストは船体に強固に取り付けられ、デリックブームを介して荷物を支える構造物で、門型(鳥居型)のものと柱１本だけのものがある。$c$, false, 2),
  ('f26f4908-fa82-4d0a-b19a-5ad616f20e6e', $c$デリックブームの下部は、グースネックを介してデリックポストに取り付けられている。$c$, false, 3),
  ('f26f4908-fa82-4d0a-b19a-5ad616f20e6e', $c$グースネックのブロックブラケットは、デリックブームの基部金具に連結され、ブームを受ける働きをする。$c$, true, 4),
  ('f26f4908-fa82-4d0a-b19a-5ad616f20e6e', $c$グースネックは、デリックブームの起伏及び旋回を円滑にする働きと、カーゴワイヤロープなどをウインチドラムに正しく巻き込むためのガイド役をする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9385847a-ca6e-425e-8fec-240db564534f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の運転及び玉掛けの業務に関するＡからＤまでの記述について、法令上、誤っているもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 船舶の上甲板口に設けられた制限荷重20ｔの走行式橋形クレーン型式の揚貨装置の運転の業務には、揚貨装置運転士免許のほか、限定なしのクレーン・デリック運転士免許でも就くことができる。Ｂ クレーンに限定したクレーン・デリック運転士免許では、制限荷重７ｔのデリック型式の揚貨装置の運転の業務に就くことができない。Ｃ 揚貨装置の運転の業務に係る特別教育の受講では、制限荷重4.9ｔのデリック型式の揚貨装置の運転の業務に就くことができない。Ｄ 玉掛け技能講習の修了で、制限荷重4.9ｔのデリック型式の揚貨装置で行う１ｔの荷の玉掛けの業務に就くことができる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9385847a-ca6e-425e-8fec-240db564534f', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('9385847a-ca6e-425e-8fec-240db564534f', $c$Ａ，Ｃ$c$, true, 2),
  ('9385847a-ca6e-425e-8fec-240db564534f', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('9385847a-ca6e-425e-8fec-240db564534f', $c$Ｂ，Ｄ$c$, false, 4),
  ('9385847a-ca6e-425e-8fec-240db564534f', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ac4a6244-048f-44fc-a19d-9fa2baa4e957',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の玉掛けに用いるワイヤロープの安全係数の説明として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ac4a6244-048f-44fc-a19d-9fa2baa4e957', $c$ワイヤロープにかかる荷重の最大の値を、当該ワイヤロープの断面積で除した値である。$c$, false, 1),
  ('ac4a6244-048f-44fc-a19d-9fa2baa4e957', $c$ワイヤロープの許容荷重の値を、当該ワイヤロープの切断荷重の値で除した値である。$c$, false, 2),
  ('ac4a6244-048f-44fc-a19d-9fa2baa4e957', $c$ワイヤロープにかかる衝撃荷重の値を、つり荷の質量で除した値である。$c$, false, 3),
  ('ac4a6244-048f-44fc-a19d-9fa2baa4e957', $c$ワイヤロープにかかる荷重の最大の値を、当該ワイヤロープの切断荷重の値で除した値である。$c$, false, 4),
  ('ac4a6244-048f-44fc-a19d-9fa2baa4e957', $c$ワイヤロープの切断荷重の値を、当該ワイヤロープにかかる荷重の最大の値で除した値である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5cce4f57-af62-42ec-8a63-486b64aa6883',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業における危険防止措置に関する記述として、法令に定められていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5cce4f57-af62-42ec-8a63-486b64aa6883', $c$港湾荷役作業を開始する前に、当該作業が行われる船倉の内部、ばく露甲板の上又は岸壁の上にある荷の中に、塩素、シアン酸、四アルキル鉛等急性中毒を起こすおそれのある物、腐食性液体その他の腐食性の物、火薬類又は危険物が存するかどうかを調べなければならない。$c$, false, 1),
  ('5cce4f57-af62-42ec-8a63-486b64aa6883', $c$揚貨装置等を用いて、船倉の内部から荷を巻き上げ、又は船倉の内部へ荷を巻き卸す作業を行うときは、当該作業を開始する前に、ハッチビーム又は開放されたちょうつがい付きハッチボードの固定の状態について点検しなければならない。$c$, false, 2),
  ('5cce4f57-af62-42ec-8a63-486b64aa6883', $c$船倉の内部の小麦、大豆、とうもろこし等ばら物の荷を卸す作業を行う場合において、荷の移動を防止するための隔壁が倒壊することにより、当該作業に従事する労働者に危険を及ぼすおそれのあるときは、当該隔壁が確実に取り付けられていることを確認した後でなければ、当該作業に労働者を従事させてはならない。$c$, true, 3),
  ('5cce4f57-af62-42ec-8a63-486b64aa6883', $c$船舶に荷を積み、船舶から荷を卸し、又は船舶において荷を移動させる作業を行うときは、当該作業を安全に行うため必要な照度を保持しなければならない。$c$, false, 4),
  ('5cce4f57-af62-42ec-8a63-486b64aa6883', $c$揚貨装置等を用いて、綿花、羊毛、コルク等でベール包装により包装されているものの巻上げの作業を行うときは、労働者に、当該包装に用いられている帯鉄、ロープ又は針金にスリングのフックをかけさせてはならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '64f8df16-13c9-421e-817b-18df3602ad94',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$港湾荷役作業に関するＡからＥまでの記述について、法令上、立入り等を禁止しなければならないもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 揚貨装置を用いて荷の巻上げの作業が行われている場合において、甲板からの深さが３ｍの船倉へ通行するための設備を使用して通行する者に、荷が激突するおそれのあるときの、当該通行設備の通行Ｂ 揚貨装置のブームの起伏の作業が行われている場合において、当該ブームが倒れることにより当該場所の周囲において作業に従事する者に危険を及ぼすおそれのあるところへの立入りＣ 揚貨装置を用いて巻出索又は引込索により荷を引いているときの、当該索の外角側への作業に従事する者の立入りＤ 防網等の荷の落下防止設備が設けられている同一の船倉の内部において、上層で作業が行われているときの下層での作業Ｅ ハッチボードの開閉の作業が行われている場所の下方で、ハッチボードが落下することにより当該場所の周囲において作業に従事する者に危険を及ぼすおそれのあるところへの立入り$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('64f8df16-13c9-421e-817b-18df3602ad94', $c$Ａ，Ｂ，Ｃ，Ｄ$c$, false, 1),
  ('64f8df16-13c9-421e-817b-18df3602ad94', $c$Ａ，Ｂ，Ｅ$c$, true, 2),
  ('64f8df16-13c9-421e-817b-18df3602ad94', $c$Ｂ，Ｃ，Ｅ$c$, false, 3),
  ('64f8df16-13c9-421e-817b-18df3602ad94', $c$Ｃ，Ｄ$c$, false, 4),
  ('64f8df16-13c9-421e-817b-18df3602ad94', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c4c711b0-163a-4ee9-bfe1-53a08dcf222e',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置を用いて作業を行うときに使用するワイヤスリング等のスリングの状態については、法令上、点検の実施が定められているが、当該点検の実施時期に関する記述として、法令に定める内容と一致するものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c4c711b0-163a-4ee9-bfe1-53a08dcf222e', $c$その日の作業を開始する前に行う。$c$, true, 1),
  ('c4c711b0-163a-4ee9-bfe1-53a08dcf222e', $c$その日の作業の開始後、遅滞なく行う。$c$, false, 2),
  ('c4c711b0-163a-4ee9-bfe1-53a08dcf222e', $c$その日の作業を開始する前及び終了した後に行う。$c$, false, 3),
  ('c4c711b0-163a-4ee9-bfe1-53a08dcf222e', $c$当該船舶における荷役作業を開始した後、遅滞なく行う。$c$, false, 4),
  ('c4c711b0-163a-4ee9-bfe1-53a08dcf222e', $c$１月以内ごとに１回、定期に行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a52ae461-f6d7-4d4d-a276-2caaafdd647b',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$船内荷役作業主任者(以下、本問において「作業主任者」という。)の選任及び職務に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a52ae461-f6d7-4d4d-a276-2caaafdd647b', $c$事業者は、総トン数600ｔの船舶において、荷を積み、荷を卸し、又は荷を移動させる作業については、作業主任者を選任しなければならない。ただし、当該船舶において、当該作業を揚貨装置を用いないで行うものにあっては、この限りでない。$c$, false, 1),
  ('a52ae461-f6d7-4d4d-a276-2caaafdd647b', $c$事業者は、「揚貨装置運転士免許」を有する者又は「船内荷役作業主任者技能講習」を修了した者のうちから、作業主任者を選任しなければならない。$c$, false, 2),
  ('a52ae461-f6d7-4d4d-a276-2caaafdd647b', $c$事業者は、作業主任者を選任したときは、遅滞なく、選任報告書を所轄労働基準監督署長に提出しなければならない。$c$, false, 3),
  ('a52ae461-f6d7-4d4d-a276-2caaafdd647b', $c$事業者は、作業主任者に、作業の方法を決定させるとともに、作業を直接指揮させなければならない。ただし、業務の都合上やむを得ない場合であって、あらかじめ周辺の作業者との連絡調整を行ったときは、直接指揮しなくても差支えない。$c$, false, 4),
  ('a52ae461-f6d7-4d4d-a276-2caaafdd647b', $c$事業者は、作業主任者に、通行設備、荷役機械、保護具並びに器具及び工具を点検整備させるとともに、これらの使用状況を監視させなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '14830796-2ee9-4522-8f5a-e4ef25bf3d36',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の玉掛けに用いる玉掛用具として、法令上、その使用が禁止されているものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('14830796-2ee9-4522-8f5a-e4ef25bf3d36', $c$直径の減少が公称径の７％のワイヤロープ$c$, false, 1),
  ('14830796-2ee9-4522-8f5a-e4ef25bf3d36', $c$伸びが、当該鎖が製造されたときの長さの５％の鎖$c$, false, 2),
  ('14830796-2ee9-4522-8f5a-e4ef25bf3d36', $c$使用する際の安全係数が５となるフック$c$, false, 3),
  ('14830796-2ee9-4522-8f5a-e4ef25bf3d36', $c$ワイヤロープ１よりの間において素線(フィラ線を除く。以下同じ。)の数の10％の素線が切断したワイヤロープ$c$, true, 4),
  ('14830796-2ee9-4522-8f5a-e4ef25bf3d36', $c$リンクの断面の直径の減少が、製造されたときの当該直径の10％の鎖$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3ded16ce-1076-4b65-a925-5e18231d09e5',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置を用いて作業を行うときの、揚貨装置の運転についての合図に関する法令条文に基づくＡからＥまでの記述について、その記述内容が、当該法令の内容と一致するもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 事業者は、揚貨装置の運転について一定の合図(以下、本問において「合図」という。)を定めなければならない。Ｂ 事業者は、合図を行う者(以下、本問において「合図者」という。)を船舶ごとに指名しなければならない。Ｃ 事業者があらかじめ合図者を指名することができないときは、揚貨装置運転士免許の資格を有する者は、合図者として自らを指名することができる。ただし、合図者として自らを指名した者は、当該作業終了後直ちに事業者にその旨を報告しなければならない。Ｄ 合図者として事業者から指名を受けた者は、揚貨装置を用いて行う作業に従事するときは、事業者が定めた合図を行わなければならない。Ｅ 合図者として事業者から指名を受けた者が、事業者が定めた合図を行うときは、揚貨装置を用いて行う作業に従事する労働者は、当該合図者が行う合図に従わなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3ded16ce-1076-4b65-a925-5e18231d09e5', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('3ded16ce-1076-4b65-a925-5e18231d09e5', $c$Ａ，Ｂ，Ｄ，Ｅ$c$, false, 2),
  ('3ded16ce-1076-4b65-a925-5e18231d09e5', $c$Ａ，Ｄ，Ｅ$c$, true, 3),
  ('3ded16ce-1076-4b65-a925-5e18231d09e5', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('3ded16ce-1076-4b65-a925-5e18231d09e5', $c$Ｃ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '376000a2-48b3-42a0-ac0e-37b4743da48c',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$揚貨装置の取扱いなどに関するＡからＤまでの記述について、法令上、正しいもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 揚貨装置等を用いて、船倉の内部の荷で、ハッチの直下にあるもの以外のものを巻き上げる作業を行うときは、巻出索を使用する等により、あらかじめ、当該荷をハッチの直下に移してから行わなければならない。Ｂ 揚貨装置等を用いて、荷の巻出しの作業を行うときは、巻出索に用いるみぞ車を、ビームクランプ、シャックル、リング、ストラップ等の取付具により船のフレームに取り付けてはならない。Ｃ 揚貨装置を用いて、荷の巻上げ又は巻卸しの作業を行うときは、当該作業を開始する前に、揚貨装置の作動状態について点検し、異常がないことを確認しなければならない。Ｄ 揚貨装置の運転者を荷をつったまま作業位置から離れさせてはならない。ただし、作業の性質上やむを得ない場合又は安全な作業の遂行上必要な場合に、揚貨装置の運転を停止し、かつ、ブレーキをかけるときは、この限りでない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('376000a2-48b3-42a0-ac0e-37b4743da48c', $c$Ａ，Ｂ，Ｃ，Ｄ$c$, false, 1),
  ('376000a2-48b3-42a0-ac0e-37b4743da48c', $c$Ａ，Ｃ$c$, true, 2),
  ('376000a2-48b3-42a0-ac0e-37b4743da48c', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('376000a2-48b3-42a0-ac0e-37b4743da48c', $c$Ｂ，Ｄ$c$, false, 4),
  ('376000a2-48b3-42a0-ac0e-37b4743da48c', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3d96ab5c-b269-4b43-849c-f08b8ba0a3ff',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は揚貨装置運転士など労働安全衛生法に基づく免許及び免許証に係る法令条文を抜粋したものであるが、この文中の 内に入れるＡ及びＢの語句の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。「労働安全衛生法違反により免許の取消しの処分を受けた者は、 Ａ 、免許の取消しをした Ｂ に免許証を返還しなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3d96ab5c-b269-4b43-849c-f08b8ba0a3ff', $c$遅滞なく 都道府県労働局長$c$, true, 1),
  ('3d96ab5c-b269-4b43-849c-f08b8ba0a3ff', $c$遅滞なく 労働基準監督署長$c$, false, 2),
  ('3d96ab5c-b269-4b43-849c-f08b8ba0a3ff', $c$処分を受けた日から起算して14日以内に 労働基準監督署長$c$, false, 3),
  ('3d96ab5c-b269-4b43-849c-f08b8ba0a3ff', $c$処分を受けた日から起算して30日以内に 都道府県労働局長$c$, false, 4),
  ('3d96ab5c-b269-4b43-849c-f08b8ba0a3ff', $c$処分を受けた日から起算して30日以内に 労働基準監督署長$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a899efca-1f1b-4b9c-9882-ca6bc08dc5fe',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a899efca-1f1b-4b9c-9882-ca6bc08dc5fe', $c$直流はＡＣ、交流はＤＣと表される。$c$, false, 1),
  ('a899efca-1f1b-4b9c-9882-ca6bc08dc5fe', $c$直流は、変圧器によって容易に電圧を変えることができる。$c$, false, 2),
  ('a899efca-1f1b-4b9c-9882-ca6bc08dc5fe', $c$電力として配電される交流は、同一地域内であっても家庭用と工場の動力用では周波数が異なる。$c$, false, 3),
  ('a899efca-1f1b-4b9c-9882-ca6bc08dc5fe', $c$単相交流を三つ集め、電流及び電圧の大きさ並びに電流の方向が時間の経過に関係なく一定となるものを三相交流という。$c$, false, 4),
  ('a899efca-1f1b-4b9c-9882-ca6bc08dc5fe', $c$交流は、整流器で直流に変換できるが、得られた直流は完全に平滑ではなく波が多少残るため、脈流と呼ばれる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '00333f06-0cde-42ee-90e3-8d7896d96e94',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電圧、電流、抵抗などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('00333f06-0cde-42ee-90e3-8d7896d96e94', $c$電流の単位はアンペア(Ａ)で、0.01Ａは１mＡとも表す。$c$, true, 1),
  ('00333f06-0cde-42ee-90e3-8d7896d96e94', $c$抵抗に電流が流れたときに発生する熱をジュール熱という。$c$, false, 2),
  ('00333f06-0cde-42ee-90e3-8d7896d96e94', $c$電力とは、電気エネルギーが単位時間当たりにする仕事の量をいう。$c$, false, 3),
  ('00333f06-0cde-42ee-90e3-8d7896d96e94', $c$回路の抵抗が同じ場合、電流が大きいほど消費電力は大きくなる。$c$, false, 4),
  ('00333f06-0cde-42ee-90e3-8d7896d96e94', $c$100Ｖで200Ｗの作業灯を20日間点灯し続けたときの消費電力量は、96kＷhである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'edd2846f-f678-4709-ac0f-595eaaed40d9',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気抵抗に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('edd2846f-f678-4709-ac0f-595eaaed40d9', $c$抵抗の単位はオーム(Ω)で、1000000Ωは１ＭΩとも表す。$c$, false, 1),
  ('edd2846f-f678-4709-ac0f-595eaaed40d9', $c$抵抗を並列に接続したときの合成抵抗の値は、個々の抵抗の値のどれよりも小さい。$c$, false, 2),
  ('edd2846f-f678-4709-ac0f-595eaaed40d9', $c$６Ωと12Ωの抵抗を直列に接続したときの合成抵抗の値は、18Ωである。$c$, false, 3),
  ('edd2846f-f678-4709-ac0f-595eaaed40d9', $c$導体でできた円形断面の電線の場合、断面の直径が同じまま長さが３倍になると抵抗の値は３倍になる。$c$, false, 4),
  ('edd2846f-f678-4709-ac0f-595eaaed40d9', $c$導体でできた円形断面の電線の場合、長さが同じまま断面の直径が２倍になると抵抗の値は２分の１になる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a279b40b-c6bd-4b3d-9456-206c7d80afff',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$一般的に電気をよく通す導体及び電気を通しにくい絶縁体(不導体)に区分されるものを表したＡからＥまでの組合せのうち、適切なもののみを全て挙げたものは(１)～(５)のうちどれか。導体 絶縁体(不導体)Ａ ステンレス 大理石Ｂ 雲母 ガラスＣ アルミニウム 磁器Ｄ 鉛 黒鉛Ｅ 塩水 空気$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a279b40b-c6bd-4b3d-9456-206c7d80afff', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('a279b40b-c6bd-4b3d-9456-206c7d80afff', $c$Ａ，Ｃ，Ｅ$c$, true, 2),
  ('a279b40b-c6bd-4b3d-9456-206c7d80afff', $c$Ｂ，Ｄ$c$, false, 3),
  ('a279b40b-c6bd-4b3d-9456-206c7d80afff', $c$Ｃ，Ｄ，Ｅ$c$, false, 4),
  ('a279b40b-c6bd-4b3d-9456-206c7d80afff', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2a6ed531-6481-4bf2-a444-194d8ff685be',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気計器の使用方法に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2a6ed531-6481-4bf2-a444-194d8ff685be', $c$揚貨装置に用いられる電気計器には、ボルトメーターと呼ばれる電圧計、アンメーターと呼ばれる電流計などがある。$c$, false, 1),
  ('2a6ed531-6481-4bf2-a444-194d8ff685be', $c$電流計は、測定する回路に直列に接続して測定し、電圧計は、測定する回路に並列に接続して測定する。$c$, false, 2),
  ('2a6ed531-6481-4bf2-a444-194d8ff685be', $c$交流は、時間の経過とともに電流や電圧の大きさと方向が周期的に変化するので、交流用の電圧計や電流計は、一般に、電圧又は電流の最大値で目盛られている。$c$, true, 3),
  ('2a6ed531-6481-4bf2-a444-194d8ff685be', $c$回路計(テスター)は、直流電圧、交流電圧、直流電流などを、スイッチを切り替えることによって計測できる計器である。$c$, false, 4),
  ('2a6ed531-6481-4bf2-a444-194d8ff685be', $c$電気回路の絶縁性が低下すると、漏えい電流が多くなり、漏電が起きることがあるので、絶縁抵抗計を用いて絶縁体の抵抗を測定する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e', $c$感電による危険を電流と時間の積によって評価する基準によれば、一般に、50Ａの電流が人体を流れた場合、安全率を考慮して１秒以内の通電時間が安全限界とされている。$c$, false, 1),
  ('0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e', $c$感電による人体への影響の程度は、電流の大きさ、通電時間、電流の種類、体質などの条件により異なる。$c$, true, 2),
  ('0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e', $c$接地線には、できるだけ電気抵抗の大きな電線を使った方が丈夫で安全である。$c$, false, 3),
  ('0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e', $c$船倉内で使用する移動式コンベアは、導電性のカバーなどを導線で船体につなぐ接地を行っている場合には、コンベアの充電部分に身体が直接触れても感電の危険はない。$c$, false, 4),
  ('0e412da2-fdcb-4bbf-883c-3bd58dbcbe7e', $c$人体は身体内部の電気抵抗が皮膚の電気抵抗よりも大きいため、電気によるやけどの影響は皮膚深部には及ばないが、皮膚表面は極めて大きな傷害を受ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '04549995-8a93-487e-bf80-b12a7fca3075',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油圧駆動モータに関するＡからＥまでの記述について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 油圧駆動モータは、高圧の油を動力源に用い、回転運動として動力を得る装置であるが、高圧の油を得るために油圧ポンプとそれを駆動する電動機などが必要である。Ｂ 油圧駆動モータは、一般に、電動機に比べ小型軽量で、加減速性能が極めて良好で遠隔操作も可能であるが、油漏れが起きやすく、火花禁止の場所では使用できない欠点がある。Ｃ 油圧駆動モータは、作動油の温度変化の影響を受けない構造で、常に一定の効率で駆動することができる。Ｄ ベーンモータは、ロータに取り付けたベーンとカムリングで構成する各油室に圧油を送ってロータを回転させ、モータ軸に回転運動を与える構造である。Ｅ ラジアル形プランジャモータは、プランジャが回転軸と同一方向に配列されたもので、プランジャの往復運動により偏心板が回転し、モータ軸に回転運動を与えるものである。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('04549995-8a93-487e-bf80-b12a7fca3075', $c$Ａ，Ｂ，Ｃ，Ｅ$c$, false, 1),
  ('04549995-8a93-487e-bf80-b12a7fca3075', $c$Ａ，Ｄ$c$, false, 2),
  ('04549995-8a93-487e-bf80-b12a7fca3075', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('04549995-8a93-487e-bf80-b12a7fca3075', $c$Ｂ，Ｃ，Ｅ$c$, true, 4),
  ('04549995-8a93-487e-bf80-b12a7fca3075', $c$Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c08ddc5f-9741-46b8-b8d2-c8172d490f9e',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c08ddc5f-9741-46b8-b8d2-c8172d490f9e', $c$かご形三相誘導電動機の回転子は、鉄心のまわりに太い導線がかご形に配置された簡単な構造で、回転子からスリップリングを通じて接続された外部の起動抵抗器を使用して、速度制御を行うことができる。$c$, true, 1),
  ('c08ddc5f-9741-46b8-b8d2-c8172d490f9e', $c$巻線形三相誘導電動機では、固定子側を一次側、回転子側を二次側と呼ぶ。$c$, false, 2),
  ('c08ddc5f-9741-46b8-b8d2-c8172d490f9e', $c$直流電動機は、一般に、速度制御を行う場合の精度において交流電動機よりも性能が優れているが、整流子及びブラシの保守が必要である。$c$, false, 3),
  ('c08ddc5f-9741-46b8-b8d2-c8172d490f9e', $c$直 流 電 動 機 の 回 転 の 向 き を 変 え る に は 、 電 源 回 路 の ＋ ( プ ラ ス ) と－(マイナス)の接続を入れ替える。$c$, false, 4),
  ('c08ddc5f-9741-46b8-b8d2-c8172d490f9e', $c$揚貨装置に用いられるウインチの電動機は完全に防水できるよう全閉型になっているが、運転中の発熱を冷やすため送風機を組み込んだものがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4967c605-8a98-4e30-9879-7795abd5f4a4',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電動機の付属機器に関するＡからＤまでの記述について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 間接制御器では、制御器をウインチの近くに据え付ける必要はなく、離れた位置で操作ができるので、通常、ハッチ内が良く見える位置に２基の制御器を取り付け、荷の状態を見ながら２基のウインチを１人で操作するようになっている。Ｂ 直接制御器は、主幹制御器の操作レバーにより継電器を働かせて、電動機の回路を開閉する電磁接触器を操作するものである。Ｃ サーマルリレーは、回路に過大な電流が流れたときに自動的に電磁接触器を開いて電流を断ち、電動機を保護するものである。Ｄ 直接制御器は、間接制御器に比べ制御器に流れる電流が小さい。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4967c605-8a98-4e30-9879-7795abd5f4a4', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('4967c605-8a98-4e30-9879-7795abd5f4a4', $c$Ａ，Ｄ$c$, false, 2),
  ('4967c605-8a98-4e30-9879-7795abd5f4a4', $c$Ｂ，Ｃ$c$, false, 3),
  ('4967c605-8a98-4e30-9879-7795abd5f4a4', $c$Ｂ，Ｄ$c$, true, 4),
  ('4967c605-8a98-4e30-9879-7795abd5f4a4', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f00c3ac5-0a9f-45a7-98ce-d38c7172583f',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$内燃機関に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f00c3ac5-0a9f-45a7-98ce-d38c7172583f', $c$内燃機関は、始動回転力(トルク)が大きいため、負荷したままでも始動することができる。$c$, false, 1),
  ('f00c3ac5-0a9f-45a7-98ce-d38c7172583f', $c$ディーゼル機関は、常温常圧の空気の中に高温高圧の軽油や重油を噴射して燃焼させる。$c$, false, 2),
  ('f00c3ac5-0a9f-45a7-98ce-d38c7172583f', $c$内燃機関は、逆転運転が簡単にできないため、摩擦クラッチ及び歯車の切替えにより、起動、停止、正転及び逆転の作動を行う。$c$, true, 3),
  ('f00c3ac5-0a9f-45a7-98ce-d38c7172583f', $c$４行程式のディーゼル機関は、吸入行程、爆発行程、圧縮行程及び排気行程の順序で作動する。$c$, false, 4),
  ('f00c3ac5-0a9f-45a7-98ce-d38c7172583f', $c$２行程式のディーゼル機関は、クランク軸が２回転するごとに１回の動力を発生するものであるから、同じ大きさの機関の場合には、その馬力は４行程式機関の２倍となる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '44c50da5-d9fa-4d31-b341-4caba143209a',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のようにＯ点に同一平面上の三つの力Ｐ１、Ｐ２、Ｐ３が作用しているとき、これらの合力に最も近いものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問31',
  '/exam-figures/cargo_gear/2025-10/q31.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('44c50da5-d9fa-4d31-b341-4caba143209a', $c$Ａ$c$, false, 1),
  ('44c50da5-d9fa-4d31-b341-4caba143209a', $c$Ｂ$c$, false, 2),
  ('44c50da5-d9fa-4d31-b341-4caba143209a', $c$Ｃ$c$, false, 3),
  ('44c50da5-d9fa-4d31-b341-4caba143209a', $c$Ｄ$c$, true, 4),
  ('44c50da5-d9fa-4d31-b341-4caba143209a', $c$Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c76c14d3-ccf7-4e41-84b5-346ebc560a5c',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のような天びん棒で荷Ｗをワイヤロープでつり下げ、つり合うとき、天びん棒を支えるための力Ｆの値は(１)～(５)のうちどれか。ただし、重力の加速度は9.8ｍ/ｓ²とし、天びん棒及びワイヤロープの質量は考えないものとする。(支点の左側に荷Ｗ、距離1ｍ。支点の右側に荷20kg、距離1.5ｍ。Ｆは支点で天びん棒を支える力)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c76c14d3-ccf7-4e41-84b5-346ebc560a5c', $c$98Ｎ$c$, false, 1),
  ('c76c14d3-ccf7-4e41-84b5-346ebc560a5c', $c$196Ｎ$c$, false, 2),
  ('c76c14d3-ccf7-4e41-84b5-346ebc560a5c', $c$294Ｎ$c$, false, 3),
  ('c76c14d3-ccf7-4e41-84b5-346ebc560a5c', $c$392Ｎ$c$, false, 4),
  ('c76c14d3-ccf7-4e41-84b5-346ebc560a5c', $c$490Ｎ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c10b619b-6ef9-4e92-a5c0-24561e82af3e',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＤまでの物体の体積を求める計算式について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。ただし、πは円周率とする。
Ａ 円柱：半径²×π×高さ×(1/2)
Ｂ 三角柱：縦×横×高さ×(1/2)
Ｃ 球：直径³×π×(4/3)
Ｄ 円錐体：半径²×π×高さ×(1/3)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c10b619b-6ef9-4e92-a5c0-24561e82af3e', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('c10b619b-6ef9-4e92-a5c0-24561e82af3e', $c$Ａ，Ｃ$c$, true, 2),
  ('c10b619b-6ef9-4e92-a5c0-24561e82af3e', $c$Ｂ，Ｃ$c$, false, 3),
  ('c10b619b-6ef9-4e92-a5c0-24561e82af3e', $c$Ｂ，Ｄ$c$, false, 4),
  ('c10b619b-6ef9-4e92-a5c0-24561e82af3e', $c$Ｃ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5a96bd7f-9871-47b9-8893-ccca6b4bbfcb',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$均質な材料でできた固体の物体(以下、本問において「物体」という。)及びその荷の重心又は安定に関するＡからＥまでの記述について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。Ａ 直方体の物体の置き方を変える場合、重心の位置が高くなるほど安定性は悪くなる。Ｂ 重心の位置が物体の外部にある物体であっても、置き方を変えると重心の位置が物体の内部に移動する場合がある。Ｃ 直方体の物体の置き方を変える場合、物体の底面積が小さくなるほど安定性は悪くなる。Ｄ 水平面上に置いた直方体の物体を傾けた場合、重心からの鉛直線がその物体の底面を通るときは、その物体は元の位置に戻らないで倒れる。Ｅ 長尺の荷を揚貨装置でつり上げるため、目安で重心位置を定めてその真上にカーゴフックを置き、玉掛けを行い、地切り直前まで少しだけつり上げたとき、荷が傾いた場合は、荷の実際の重心位置は目安とした重心位置よりも傾斜した荷の高い方の側にある。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5a96bd7f-9871-47b9-8893-ccca6b4bbfcb', $c$Ａ，Ｂ，Ｄ$c$, false, 1),
  ('5a96bd7f-9871-47b9-8893-ccca6b4bbfcb', $c$Ａ，Ｃ$c$, false, 2),
  ('5a96bd7f-9871-47b9-8893-ccca6b4bbfcb', $c$Ｂ，Ｃ，Ｅ$c$, false, 3),
  ('5a96bd7f-9871-47b9-8893-ccca6b4bbfcb', $c$Ｂ，Ｄ，Ｅ$c$, true, 4),
  ('5a96bd7f-9871-47b9-8893-ccca6b4bbfcb', $c$Ｃ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ab3f0361-5eea-4c7e-974e-a32d46178f52',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$船舶上に設置された走行式橋形クレーン型式の揚貨装置で荷をつり上げ、つり荷を移動させるために上甲板口両側に設置された走行レールに沿って、５秒間に１ｍ移動する速度で走行させながら、５秒間に１ｍ移動する速度で横行させ続けているとき、つり荷が５秒間に移動する距離の値に最も近いものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ab3f0361-5eea-4c7e-974e-a32d46178f52', $c$0.5ｍ$c$, false, 1),
  ('ab3f0361-5eea-4c7e-974e-a32d46178f52', $c$1.0ｍ$c$, false, 2),
  ('ab3f0361-5eea-4c7e-974e-a32d46178f52', $c$1.4ｍ$c$, true, 3),
  ('ab3f0361-5eea-4c7e-974e-a32d46178f52', $c$1.7ｍ$c$, false, 4),
  ('ab3f0361-5eea-4c7e-974e-a32d46178f52', $c$2.0ｍ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '88fe6fdf-22ab-42ab-90ba-f493fbff1523',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$図のように、水平な床面に置いた質量Ｗの物体を床面に沿って引っ張り、動き始める直前の力Ｆの値が980Ｎであったとき、Ｗの値は(１)～(５)のうちどれか。ただし、接触面の静止摩擦係数は0.2とし、重力の加速度は9.8ｍ/ｓ²とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('88fe6fdf-22ab-42ab-90ba-f493fbff1523', $c$20㎏$c$, false, 1),
  ('88fe6fdf-22ab-42ab-90ba-f493fbff1523', $c$200㎏$c$, false, 2),
  ('88fe6fdf-22ab-42ab-90ba-f493fbff1523', $c$333㎏$c$, false, 3),
  ('88fe6fdf-22ab-42ab-90ba-f493fbff1523', $c$500㎏$c$, true, 4),
  ('88fe6fdf-22ab-42ab-90ba-f493fbff1523', $c$1921㎏$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cbda7eed-121b-4d55-8d63-2877d9748997',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＣまでの図のとおり、同一形状で質量が異なる三つの荷を、それぞれ同じ長さの２本の玉掛け用ワイヤロープ(以下、本問において「ワイヤロープ」という。)を用いて、それぞれ異なるつり角度でつり上げるとき、これらの荷を、１本のワイヤロープにかかる張力の値が大きい順に並べたものは(１)～(５)のうちどれか。ただし、いずれも荷の左右のつり合いは取れており、左右のワイヤロープの張力は同じとし、ワイヤロープの質量は考えないものとする。(Ａ：荷200kg、つり角度60°／Ｂ：荷190kg、つり角度90°／Ｃ：荷180kg、つり角度120°)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cbda7eed-121b-4d55-8d63-2877d9748997', $c$Ａ Ｂ Ｃ$c$, false, 1),
  ('cbda7eed-121b-4d55-8d63-2877d9748997', $c$Ａ Ｃ Ｂ$c$, false, 2),
  ('cbda7eed-121b-4d55-8d63-2877d9748997', $c$Ｂ Ａ Ｃ$c$, false, 3),
  ('cbda7eed-121b-4d55-8d63-2877d9748997', $c$Ｃ Ａ Ｂ$c$, false, 4),
  ('cbda7eed-121b-4d55-8d63-2877d9748997', $c$Ｃ Ｂ Ａ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '753f93e9-e0a8-4baf-b833-e320604426ef',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('753f93e9-e0a8-4baf-b833-e320604426ef', $c$ウインチのドラムには、曲げ荷重とねじり荷重がかかる。$c$, true, 1),
  ('753f93e9-e0a8-4baf-b833-e320604426ef', $c$カーゴフックには、主に圧縮荷重がかかる。$c$, false, 2),
  ('753f93e9-e0a8-4baf-b833-e320604426ef', $c$片振り荷重は、大きさは同じであるが、向きが時間とともに変わる荷重である。$c$, false, 3),
  ('753f93e9-e0a8-4baf-b833-e320604426ef', $c$荷重が繰り返し作用すると、比較的小さな荷重であっても機械や構造物が破壊することがあるが、このような現象を引き起こす荷重を静荷重という。$c$, false, 4),
  ('753f93e9-e0a8-4baf-b833-e320604426ef', $c$せん断荷重は、材料を押し縮めるように働く荷重である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e63f6391-831d-460e-99b9-42641d6b9b80',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$軟鋼の材料の強さ、応力などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e63f6391-831d-460e-99b9-42641d6b9b80', $c$材料に荷重をかけると、材料の内部にはその荷重に抵抗し、つり合いを保とうとする内力が生じる。$c$, false, 1),
  ('e63f6391-831d-460e-99b9-42641d6b9b80', $c$材料が圧縮荷重を受けたときに生じる応力を圧縮応力という。$c$, false, 2),
  ('e63f6391-831d-460e-99b9-42641d6b9b80', $c$引張応力は、材料の断面積を材料に作用する引張荷重で割って求める。$c$, true, 3),
  ('e63f6391-831d-460e-99b9-42641d6b9b80', $c$材料に荷重が作用し変形するとき、荷重が作用する前の元の量(原形)に対する変形量の割合をひずみという。$c$, false, 4),
  ('e63f6391-831d-460e-99b9-42641d6b9b80', $c$引張試験において、材料の試験片を材料試験機に取り付けて静かに引張荷重をかけると、加えられた荷重に応じて試験片に変形が生じるが、荷重の大きさが「応力－ひずみ線図」における比例限度以内であれば、荷重を取り除くと、試験片は荷重が作用する前の形状に戻る。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2f0e5805-f21c-4e7d-8066-3c260d447f05',
  'cargo_gear',
  (SELECT id FROM exam_types WHERE exam_id = 'cargo_gear' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'cargo_gear' AND e.code = 'common' AND c.name = '揚貨装置の運転のために必要な力学に関する知識'),
  $q$下図に掲げるＡからＥまでの滑車を用いて、質量Ｗの荷をつり上げるとき、荷を支えるために必要な力Ｆを求める式がそれぞれの図の下部に記載してあるが、これらの力Ｆを求める式について、適切でないもののみを全て挙げた組合せは(１)～(５)のうちどれか。ただし、ｇは重力の加速度とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 揚貨装置運転士試験 問40',
  '/exam-figures/cargo_gear/2025-10/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2f0e5805-f21c-4e7d-8066-3c260d447f05', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('2f0e5805-f21c-4e7d-8066-3c260d447f05', $c$Ａ，Ｄ，Ｅ$c$, true, 2),
  ('2f0e5805-f21c-4e7d-8066-3c260d447f05', $c$Ｂ，Ｃ$c$, false, 3),
  ('2f0e5805-f21c-4e7d-8066-3c260d447f05', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('2f0e5805-f21c-4e7d-8066-3c260d447f05', $c$Ｃ，Ｄ，Ｅ$c$, false, 5);

do $$
declare
  cargo_gear_2025_10 int;
  fig_missing int;
  bad_cat int;
begin
  select count(*) into cargo_gear_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 揚貨装置運転士試験%';

  if cargo_gear_2025_10 <> 40 then
    raise exception 'cargo_gear 2025-10 sitting must be 40 questions (got %)', cargo_gear_2025_10;
  end if;

  select count(*) into bad_cat
  from (
    select c.name
    from questions q
    join categories c on c.id = q.category_id
    where q.source_type = 'past_exam'
      and q.source_note like '%令和7年10月公表 揚貨装置運転士試験%'
    group by c.name
    having count(*) <> 10
  ) subject_counts;

  if bad_cat <> 0 then
    raise exception 'cargo_gear 2025-10 must have 10 questions per subject';
  end if;

  select count(*) into fig_missing
  from questions
  where source_type = 'past_exam'
    and (
      (source_note ~ '揚貨装置運転士試験 問3$' and figure_url is distinct from '/exam-figures/cargo_gear/2025-10/q03.jpg')
      or (source_note ~ '揚貨装置運転士試験 問7$' and figure_url is distinct from '/exam-figures/cargo_gear/2025-10/q07.jpg')
      or (source_note ~ '揚貨装置運転士試験 問31$' and figure_url is distinct from '/exam-figures/cargo_gear/2025-10/q31.jpg')
      or (source_note ~ '揚貨装置運転士試験 問40$' and figure_url is distinct from '/exam-figures/cargo_gear/2025-10/q40.jpg')
    );

  if fig_missing <> 0 then
    raise exception 'cargo_gear 2025-10 required figures are missing (got % mismatches)', fig_missing;
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
  '揚貨装置運転士模擬試験(令和7年10月)',
  150,
  40,
  '令和7年10月公表 揚貨装置運転士試験'
from exam_types
where exam_types.exam_id = 'cargo_gear'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'cargo_gear'
      and source_filter = '令和7年10月公表 揚貨装置運転士試験'
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
  '揚貨装置運転士模擬試験(令和7年10月)【原動機電気・力学免除】',
  75,
  20,
  '令和7年10月公表 揚貨装置運転士試験',
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
      and name = '揚貨装置運転士模擬試験(令和7年10月)【原動機電気・力学免除】'
  );
