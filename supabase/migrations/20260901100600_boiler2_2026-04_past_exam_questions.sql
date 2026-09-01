-- boiler2 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'boiler2', '二級ボイラー技士', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'boiler2');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'boiler2', 'common', '二級ボイラー技士'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'boiler2', 'common', '二級ボイラー技士', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'boiler2' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'boiler2', 'ボイラーの構造に関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'boiler2'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'ボイラーの構造に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'boiler2', 'ボイラーの取扱いに関する知識', 2
FROM exam_types et
WHERE et.exam_id = 'boiler2'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'ボイラーの取扱いに関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'boiler2', '燃料及び燃焼に関する知識', 3
FROM exam_types et
WHERE et.exam_id = 'boiler2'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '燃料及び燃焼に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'boiler2', '関係法令', 4
FROM exam_types et
WHERE et.exam_id = 'boiler2'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e9adf340-1a04-4328-b280-1fb7a34891f1',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$熱及び蒸気に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e9adf340-1a04-4328-b280-1fb7a34891f1', $c$温度の単位であるセルシウス(摂氏)温度[℃]は、標準大気圧のもとで、水の氷点を０℃、沸点を100℃と定め、この間を100等分したものを１℃としたものである。$c$, false, 1),
  ('e9adf340-1a04-4328-b280-1fb7a34891f1', $c$ボイラー効率は、換算蒸発量と発生蒸気の比エンタルピの積の値を、燃料消費量と燃料低発熱量の積の値で除して示すことができる。$c$, true, 2),
  ('e9adf340-1a04-4328-b280-1fb7a34891f1', $c$大気が地球上に及ぼす圧力は約0.1ＭPaであり、760㎜の高さの水銀柱がその底面に及ぼす圧力(760㎜Hg)を標準大気圧(１atm)という。$c$, false, 3),
  ('e9adf340-1a04-4328-b280-1fb7a34891f1', $c$単位時間当たりの仕事量を仕事率といい、単位は[Ｗ]で、１Ｗ＝１J/sで仕事量１kＷh＝3.6ＭＪである。$c$, false, 4),
  ('e9adf340-1a04-4328-b280-1fb7a34891f1', $c$水の比熱は、4.187kJ/(kg･K)である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f7abbe7a-3f20-4578-ab50-012954e291e7',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの水循環に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f7abbe7a-3f20-4578-ab50-012954e291e7', $c$ボイラー内で、温度が上昇した水及び気泡を含んだ水は上昇し、その後に温度の低い水が下降して、水の循環流ができる。$c$, false, 1),
  ('f7abbe7a-3f20-4578-ab50-012954e291e7', $c$丸ボイラーは、伝熱面の多くがボイラー水中に設けられ、水の対流が容易なので、特別な水循環の系路を構成する必要がない。$c$, false, 2),
  ('f7abbe7a-3f20-4578-ab50-012954e291e7', $c$水管ボイラーは、水と気泡の混合体が上昇する管と、水が下降する管を区別して設けているものが多い。$c$, false, 3),
  ('f7abbe7a-3f20-4578-ab50-012954e291e7', $c$炉筒ボイラーには、水循環を良くするために、炉筒を中央部から片方に少しずらしたものがある。$c$, false, 4),
  ('f7abbe7a-3f20-4578-ab50-012954e291e7', $c$水循環が良くなるほど、熱が水に十分に伝わるので、伝熱面温度は水温より著しく高い温度となる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b7239e36-af1d-4a83-8ef1-2af039b8eeeb',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの伝熱面、燃焼室及び燃焼装置に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b7239e36-af1d-4a83-8ef1-2af039b8eeeb', $c$燃焼室に直面している伝熱面は接触伝熱面といい、燃焼室を出たガス通路に配置される伝熱面は放射伝熱面といわれる。$c$, true, 1),
  ('b7239e36-af1d-4a83-8ef1-2af039b8eeeb', $c$燃焼室は、燃料を燃焼させ、熱が発生する部分で、火炉ともいわれる。$c$, false, 2),
  ('b7239e36-af1d-4a83-8ef1-2af039b8eeeb', $c$燃焼室は、供給された燃料を速やかに着火・燃焼させ、発生する可燃性ガスと空気との混合接触を良好にして、完全燃焼を行わせる部分である。$c$, false, 3),
  ('b7239e36-af1d-4a83-8ef1-2af039b8eeeb', $c$加圧燃焼方式の燃焼室は、気密構造になっている。$c$, false, 4),
  ('b7239e36-af1d-4a83-8ef1-2af039b8eeeb', $c$燃焼装置は、燃料の種類によって異なり、液体燃料、気体燃料及び微粉炭にはバーナが、一般固体燃料には火格子が用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '575ff94d-078b-430d-a1f2-a2865696eac3',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$炉筒煙管ボイラーに関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('575ff94d-078b-430d-a1f2-a2865696eac3', $c$加圧燃焼方式を採用し、燃焼室熱負荷を高くして燃焼効率を高めたものがある。$c$, false, 1),
  ('575ff94d-078b-430d-a1f2-a2865696eac3', $c$水管ボイラーに比べ、蒸気使用量の変動による圧力変動が小さい。$c$, false, 2),
  ('575ff94d-078b-430d-a1f2-a2865696eac3', $c$戻り燃焼方式を採用し、燃焼効率を高めたものがある。$c$, false, 3),
  ('575ff94d-078b-430d-a1f2-a2865696eac3', $c$炉筒は、他の部分より高温になるので、胴板にブリージングスペースを設けて応力を緩和する。$c$, true, 4),
  ('575ff94d-078b-430d-a1f2-a2865696eac3', $c$煙管には、伝熱効果の高いスパイラル管を使用しているものが多い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'b923e050-3e5b-4c0e-8351-70ad0c04c7e8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$貫流ボイラーに関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b923e050-3e5b-4c0e-8351-70ad0c04c7e8', $c$水管ボイラーに分類されるが、一連の長い管系で構成されており、水循環がない。$c$, false, 1),
  ('b923e050-3e5b-4c0e-8351-70ad0c04c7e8', $c$暖房用、業務用及び工場プロセス用の小形低圧ボイラーとしては、単管式及び多管式が多く使われる。$c$, false, 2),
  ('b923e050-3e5b-4c0e-8351-70ad0c04c7e8', $c$細い管内で給水のほとんどが蒸発するので、十分な処理を行った水を使用しなければならない。$c$, false, 3),
  ('b923e050-3e5b-4c0e-8351-70ad0c04c7e8', $c$伝熱面積当たりの保有水量が著しく小さいので、起動から所要蒸気を発生するまでの時間が短い。$c$, false, 4),
  ('b923e050-3e5b-4c0e-8351-70ad0c04c7e8', $c$同容量の丸ボイラーに比べ、一般に据付面積が大きくなる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '88ad7e12-e39c-453e-ba23-19aec4a9545f',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$暖房用鋳鉄製蒸気ボイラーにハートフォード式連結法により返り管を取り付ける主な目的として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('88ad7e12-e39c-453e-ba23-19aec4a9545f', $c$蒸気圧力の異常な昇圧を防止する。$c$, false, 1),
  ('88ad7e12-e39c-453e-ba23-19aec4a9545f', $c$水の自然循環を良くする。$c$, false, 2),
  ('88ad7e12-e39c-453e-ba23-19aec4a9545f', $c$不純物のボイラーへの混入を防止する。$c$, false, 3),
  ('88ad7e12-e39c-453e-ba23-19aec4a9545f', $c$低水位事故を防止する。$c$, true, 4),
  ('88ad7e12-e39c-453e-ba23-19aec4a9545f', $c$湿り蒸気を乾き飽和蒸気にする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '38e61515-574c-4c67-a2b1-8f228849ac72',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの胴に設けるマンホールなどの穴に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('38e61515-574c-4c67-a2b1-8f228849ac72', $c$マンホールの大きさは、だ円の場合は長径375mm以上、短径275mm以上とし、円形の場合は直径375mm以上とすることが、JISで定められている。$c$, false, 1),
  ('38e61515-574c-4c67-a2b1-8f228849ac72', $c$だ円形又は長方形の穴をボイラーの胴に設ける場合には、短径又は短い辺を胴の軸方向に配置する。$c$, false, 2),
  ('38e61515-574c-4c67-a2b1-8f228849ac72', $c$掃除穴は、ボイラー内部を掃除するための穴で、だ円形又は円形とする。$c$, false, 3),
  ('38e61515-574c-4c67-a2b1-8f228849ac72', $c$検査穴は、ボイラー内部の点検用として設けられるもので、一般にだ円形とする。$c$, true, 4),
  ('38e61515-574c-4c67-a2b1-8f228849ac72', $c$穴を設けた場所は、強度が減少するので、強め材を取り付けたり、フランジを打ち出したりして補強する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8432b8f1-84b0-448d-8f75-6bcfc0676a44',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$温水ボイラー及び蒸気ボイラーの附属品に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8432b8f1-84b0-448d-8f75-6bcfc0676a44', $c$水高計は、温水ボイラーの圧力を測る計器であり、蒸気ボイラーの圧力計に相当する。$c$, false, 1),
  ('8432b8f1-84b0-448d-8f75-6bcfc0676a44', $c$温水ボイラーの温度計は、ボイラー水が最高温度となる箇所の見やすい位置に取り付ける。$c$, false, 2),
  ('8432b8f1-84b0-448d-8f75-6bcfc0676a44', $c$温水ボイラーの逃がし管は、ボイラー水の膨張分を逃がすためのもので、高所に設けた密閉形膨張タンクに直結させる。$c$, true, 3),
  ('8432b8f1-84b0-448d-8f75-6bcfc0676a44', $c$温水ボイラーの逃がし弁は、水の膨張により圧力が設定した圧力を超えると、弁体を押し上げ、水を逃がすものである。$c$, false, 4),
  ('8432b8f1-84b0-448d-8f75-6bcfc0676a44', $c$暖房用蒸気ボイラーの真空給水ポンプは、受水槽内を真空にして返り管途中の凝縮水を受水槽に吸引するとともに、ボイラーに給水するために用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ab662c43-aea0-4841-a9f9-a1ddba37367a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの蒸気トラップの分類を示すＡからＤまでの方式について、作動原理が蒸気とドレンの温度差を利用するもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ バイメタル式 Ｂ ベローズ式 Ｃ オリフィス式 Ｄ ディスク式$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ab662c43-aea0-4841-a9f9-a1ddba37367a', $c$Ａ，Ｂ$c$, true, 1),
  ('ab662c43-aea0-4841-a9f9-a1ddba37367a', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('ab662c43-aea0-4841-a9f9-a1ddba37367a', $c$Ａ，Ｃ，Ｄ$c$, false, 3),
  ('ab662c43-aea0-4841-a9f9-a1ddba37367a', $c$Ｂ，Ｃ$c$, false, 4),
  ('ab662c43-aea0-4841-a9f9-a1ddba37367a', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '73f598c7-6f38-4dca-b91b-df99aa9b0a86',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$温水ボイラーの温度制御に用いるオンオフ式温度調節器(電気式)に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 感温体内の液体は、温度の上昇・下降によって膨張・収縮し、ベローズやダイヤフラムの変位により、マイクロスイッチを開閉させる。
Ｂ 感温体内の液体には、一般にトルエン、エーテル、アルコールなどが用いられる。
Ｃ 保護管を用いて感温体を取り付ける場合は、保護管内にシリコングリスを挿入してはならない。
Ｄ 温度調節器は、一般に調節温度及び比例帯の設定を行う。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('73f598c7-6f38-4dca-b91b-df99aa9b0a86', $c$Ａ，Ｂ$c$, true, 1),
  ('73f598c7-6f38-4dca-b91b-df99aa9b0a86', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('73f598c7-6f38-4dca-b91b-df99aa9b0a86', $c$Ａ，Ｂ，Ｄ$c$, false, 3),
  ('73f598c7-6f38-4dca-b91b-df99aa9b0a86', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('73f598c7-6f38-4dca-b91b-df99aa9b0a86', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bd5dbc81-28be-455b-89ba-678b590f256d',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$油だきボイラーの点火時に発生する逆火の発生原因となる事象に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bd5dbc81-28be-455b-89ba-678b590f256d', $c$煙道ダンパの開度が不足しているとき。$c$, false, 1),
  ('bd5dbc81-28be-455b-89ba-678b590f256d', $c$複数のバーナを有するボイラーで、燃焼中のバーナの火炎を利用して次のバーナに点火したとき。$c$, false, 2),
  ('bd5dbc81-28be-455b-89ba-678b590f256d', $c$空気より先に燃料を供給したとき。$c$, false, 3),
  ('bd5dbc81-28be-455b-89ba-678b590f256d', $c$煙道内に、すすの堆積が多いとき又は未燃ガスが多く滞留しているとき。$c$, true, 4),
  ('bd5dbc81-28be-455b-89ba-678b590f256d', $c$点火の際に着火遅れが生じたとき。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5c0fd29f-2c5d-434b-a432-8bf755a27270',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーのたき始めに、燃焼量を急激に増加させてはならない理由に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5c0fd29f-2c5d-434b-a432-8bf755a27270', $c$ボイラーとれんが積みとの境界面に隙間が生じる原因となるため。$c$, false, 1),
  ('5c0fd29f-2c5d-434b-a432-8bf755a27270', $c$れんが積みの目地に割れが発生する原因となるため。$c$, false, 2),
  ('5c0fd29f-2c5d-434b-a432-8bf755a27270', $c$ウォータハンマの主要な原因となるため。$c$, true, 3),
  ('5c0fd29f-2c5d-434b-a432-8bf755a27270', $c$クラックや漏れを発生させないため。$c$, false, 4),
  ('5c0fd29f-2c5d-434b-a432-8bf755a27270', $c$煙管の取付け部や継手部から、ボイラー水の漏れの原因となるため。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c113f151-0291-4031-bc2c-1c32253ed06b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラー水位が安全低水面以下の異常低下となる原因に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c113f151-0291-4031-bc2c-1c32253ed06b', $c$蒸気を大量に供給、消費した。$c$, false, 1),
  ('c113f151-0291-4031-bc2c-1c32253ed06b', $c$給水逆止め弁が故障した。$c$, false, 2),
  ('c113f151-0291-4031-bc2c-1c32253ed06b', $c$沸水防止管が閉塞した。$c$, true, 3),
  ('c113f151-0291-4031-bc2c-1c32253ed06b', $c$吹出し装置の閉止が不完全だった。$c$, false, 4),
  ('c113f151-0291-4031-bc2c-1c32253ed06b', $c$水面測定装置が閉塞していた。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '04c4bbd1-db91-4c07-b987-0c950b58c303',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーにおけるキャリオーバの影響に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 蒸気の純度を低下させる。
Ｂ ボイラー水全体が著しく揺動し、水面計の水位が確認しにくくなる。
Ｃ ボイラー水が過熱器に入り、蒸気温度の上昇により過熱器を破損する。
Ｄ 水位制御装置が、ボイラー水位が下がったと誤認して、ボイラー水位を高水位にする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('04c4bbd1-db91-4c07-b987-0c950b58c303', $c$Ａ，Ｂ$c$, true, 1),
  ('04c4bbd1-db91-4c07-b987-0c950b58c303', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('04c4bbd1-db91-4c07-b987-0c950b58c303', $c$Ａ，Ｂ，Ｄ$c$, false, 3),
  ('04c4bbd1-db91-4c07-b987-0c950b58c303', $c$Ｂ，Ｃ$c$, false, 4),
  ('04c4bbd1-db91-4c07-b987-0c950b58c303', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e36056ae-75f1-4610-950c-292c72604378',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーのガラス水面計の機能試験を行う時期に関するＡからＤまでの記述について、適切な時期のみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 休止中のボイラーを稼働させるとき。
Ｂ ガラス管の取替えなどの補修を行ったとき。
Ｃ 水位が絶えず上下にかすかに動いていると確認したとき。
Ｄ プライミングが生じたとき。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e36056ae-75f1-4610-950c-292c72604378', $c$Ａ，Ｂ$c$, false, 1),
  ('e36056ae-75f1-4610-950c-292c72604378', $c$Ａ，Ｂ，Ｄ$c$, true, 2),
  ('e36056ae-75f1-4610-950c-292c72604378', $c$Ａ，Ｃ，Ｄ$c$, false, 3),
  ('e36056ae-75f1-4610-950c-292c72604378', $c$Ｂ，Ｃ$c$, false, 4),
  ('e36056ae-75f1-4610-950c-292c72604378', $c$Ｃ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '46745693-11e3-47be-bf4f-fc6b278bd99f',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーに給水するディフューザポンプの取扱いに関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('46745693-11e3-47be-bf4f-fc6b278bd99f', $c$グランドパッキンシール式の軸については、運転中に少量の水が連続で滴下する程度にパッキンが締まっていることを確認する。$c$, false, 1),
  ('46745693-11e3-47be-bf4f-fc6b278bd99f', $c$運転前に、ポンプ内及びポンプ前後の配管内の空気を十分に抜く。$c$, false, 2),
  ('46745693-11e3-47be-bf4f-fc6b278bd99f', $c$起動は、ポンプ駆動用電動機が過電流とならないように、吸込み弁及び吐出し弁を全開にした状態で行う。$c$, true, 3),
  ('46745693-11e3-47be-bf4f-fc6b278bd99f', $c$運転中は、ポンプの吐出し圧力、流量及び負荷電流が適正であることを確認する。$c$, false, 4),
  ('46745693-11e3-47be-bf4f-fc6b278bd99f', $c$運転を停止するときは、吐出し弁を徐々に閉め、全閉にしてからポンプ駆動用電動機を止める。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a00222a5-6b7d-44c7-80b8-ae80cc61aa44',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーの燃焼安全装置の燃料遮断弁が作動する原因に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a00222a5-6b7d-44c7-80b8-ae80cc61aa44', $c$蒸気圧力が低下した。$c$, true, 1),
  ('a00222a5-6b7d-44c7-80b8-ae80cc61aa44', $c$低水位になった。$c$, false, 2),
  ('a00222a5-6b7d-44c7-80b8-ae80cc61aa44', $c$異常消火した。$c$, false, 3),
  ('a00222a5-6b7d-44c7-80b8-ae80cc61aa44', $c$送風量が低下した。$c$, false, 4),
  ('a00222a5-6b7d-44c7-80b8-ae80cc61aa44', $c$油圧が過昇した。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'dbc9d3aa-806b-4d20-95a6-2385a595d467',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーの運転を停止し、ボイラー水を全部排出する場合の措置に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 運転停止の際は、最初に、ボイラーの水位を常用水位に保つように給水を続け、蒸気の送り出しを徐々に減少させる。
Ｂ 運転停止の際は、ファンを止めた後、燃料の供給を停止し、固体燃料は完全に燃え切らせる。
Ｃ 給水弁及び蒸気弁を閉じた後は、ボイラー内部がわずかに真空になる程度に、空気を送り込んでから空気抜き弁を閉じる。
Ｄ ボイラー水の温度が90℃以下になってから、吹出し弁を開いて排水を行う。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dbc9d3aa-806b-4d20-95a6-2385a595d467', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('dbc9d3aa-806b-4d20-95a6-2385a595d467', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('dbc9d3aa-806b-4d20-95a6-2385a595d467', $c$Ａ，Ｄ$c$, true, 3),
  ('dbc9d3aa-806b-4d20-95a6-2385a595d467', $c$Ｂ，Ｃ$c$, false, 4),
  ('dbc9d3aa-806b-4d20-95a6-2385a595d467', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'adc067f0-1edb-49f7-92a3-6a9f04d5e655',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラー給水の脱酸素剤として使用される薬剤の組合せは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('adc067f0-1edb-49f7-92a3-6a9f04d5e655', $c$塩化ナトリウム りん酸ナトリウム$c$, false, 1),
  ('adc067f0-1edb-49f7-92a3-6a9f04d5e655', $c$りん酸ナトリウム タンニン$c$, false, 2),
  ('adc067f0-1edb-49f7-92a3-6a9f04d5e655', $c$亜硫酸ナトリウム 炭酸ナトリウム$c$, false, 3),
  ('adc067f0-1edb-49f7-92a3-6a9f04d5e655', $c$亜硫酸ナトリウム タンニン$c$, true, 4),
  ('adc067f0-1edb-49f7-92a3-6a9f04d5e655', $c$炭酸ナトリウム りん酸ナトリウム$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '924c339b-9e15-4aa4-9094-8448d6dc48b7',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーの給水の中の溶存気体の除去に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 溶存気体の溶解度は、圧力が高くなると減少する。
Ｂ 脱気法には、化学的脱気法と物理的脱気法がある。
Ｃ 加熱脱気法は、水を加熱し、溶存気体の溶解度を上げることにより、溶存気体を除去する方法である。
Ｄ 膜脱気法は、高分子気体透過膜を介して、水中から溶存気体を除去する方法である。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('924c339b-9e15-4aa4-9094-8448d6dc48b7', $c$Ａ，Ｂ$c$, false, 1),
  ('924c339b-9e15-4aa4-9094-8448d6dc48b7', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('924c339b-9e15-4aa4-9094-8448d6dc48b7', $c$Ａ，Ｃ$c$, false, 3),
  ('924c339b-9e15-4aa4-9094-8448d6dc48b7', $c$Ｂ，Ｄ$c$, true, 4),
  ('924c339b-9e15-4aa4-9094-8448d6dc48b7', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5f239835-b498-4a6a-82b3-488558964b41',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$燃料の分析及び性質に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 総発熱量と真発熱量の差は、燃料に含まれる水素及び水分の割合によって決まる。
Ｂ 液体燃料の発熱量の単位は、通常、ＭJ/kgで表す。
Ｃ 低発熱量は、高発熱量から燃料に含まれる水の顕熱を差し引いたものである。
Ｄ 燃料を空気中で加熱し、他から点火しないで自然に燃え始める最低の温度を、引火点という。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5f239835-b498-4a6a-82b3-488558964b41', $c$Ａ，Ｂ$c$, true, 1),
  ('5f239835-b498-4a6a-82b3-488558964b41', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('5f239835-b498-4a6a-82b3-488558964b41', $c$Ａ，Ｂ，Ｄ$c$, false, 3),
  ('5f239835-b498-4a6a-82b3-488558964b41', $c$Ｂ，Ｄ$c$, false, 4),
  ('5f239835-b498-4a6a-82b3-488558964b41', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '66ba94f1-f1dc-4b24-b414-57727771e37a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$重油に含まれる成分などによる影響に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 硫黄分は、JISによる重油分類の主要な要素であり、３種(Ⅽ重油)１号で質量パーセントで５％以下とされている。
Ｂ 水分が多く含まれると、貯蔵中にスラッジを形成する。
Ｃ 残留炭素分が多いほど、ばいじん量は増加する。
Ｄ 灰分は、ボイラーの伝熱を良好にする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('66ba94f1-f1dc-4b24-b414-57727771e37a', $c$Ａ，Ｂ$c$, false, 1),
  ('66ba94f1-f1dc-4b24-b414-57727771e37a', $c$Ａ，Ｂ，Ｄ$c$, false, 2),
  ('66ba94f1-f1dc-4b24-b414-57727771e37a', $c$Ａ，Ｄ$c$, false, 3),
  ('66ba94f1-f1dc-4b24-b414-57727771e37a', $c$Ｂ，Ｃ$c$, true, 4),
  ('66ba94f1-f1dc-4b24-b414-57727771e37a', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーにおける燃料の燃焼に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb', $c$燃焼には、燃料、空気(酸素)及び温度の三つの要素が必要である。$c$, false, 1),
  ('6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb', $c$着火性が良く、燃焼速度が速い燃料は、狭い燃焼室でも完全燃焼させることができる。$c$, false, 2),
  ('6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb', $c$実際空気量は、一般の燃焼では、理論空気量より少ない。$c$, true, 3),
  ('6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb', $c$燃焼ガスの成分割合は、燃料の成分、空気比及び燃焼の方法で変わる。$c$, false, 4),
  ('6280f7ed-ab66-4e5f-a6df-b5c9f2bd04bb', $c$燃焼ガスの成分には、燃料に含まれる水素や水分などによるＨ₂Ｏがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e53d8e07-cbf4-447c-a900-45cacecbbc82',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$重油燃焼によるボイラー及び附属設備の低温腐食の抑制方法に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e53d8e07-cbf4-447c-a900-45cacecbbc82', $c$燃焼室及び煙道への空気漏入を防止し、煙道ガスの温度の低下を防ぐ。$c$, false, 1),
  ('e53d8e07-cbf4-447c-a900-45cacecbbc82', $c$燃焼ガス中の酸素濃度を下げ、二酸化硫黄から三酸化硫黄への転換を抑制し、燃焼ガスの露点を下げる。$c$, false, 2),
  ('e53d8e07-cbf4-447c-a900-45cacecbbc82', $c$給水温度を下げ、エコノマイザの伝熱面の温度を低く保つ。$c$, true, 3),
  ('e53d8e07-cbf4-447c-a900-45cacecbbc82', $c$硫黄分の少ない重油を選択する。$c$, false, 4),
  ('e53d8e07-cbf4-447c-a900-45cacecbbc82', $c$重油に添加剤を加え、燃焼ガスの露点を下げる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '9f6c00d5-6031-49f6-983a-0841685412da',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの燃料油タンクに関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9f6c00d5-6031-49f6-983a-0841685412da', $c$貯蔵タンクには、一般的に自動油面調節装置を取り付ける。$c$, true, 1),
  ('9f6c00d5-6031-49f6-983a-0841685412da', $c$貯蔵タンクの油取出し管は、タンクの底部から20～30cm上方に取り付ける。$c$, false, 2),
  ('9f6c00d5-6031-49f6-983a-0841685412da', $c$貯蔵タンクの油送入管は、油タンクの上部に取り付ける。$c$, false, 3),
  ('9f6c00d5-6031-49f6-983a-0841685412da', $c$燃料油タンクは、用途により貯蔵タンクとサービスタンクに分類される。$c$, false, 4),
  ('9f6c00d5-6031-49f6-983a-0841685412da', $c$サービスタンクの貯油量は、最大燃焼量の２時間分程度が一般的である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a8b73c72-d6a1-4724-ba0a-e7a0ada5e758',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの油バーナに関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a8b73c72-d6a1-4724-ba0a-e7a0ada5e758', $c$ガンタイプバーナは、ファンと圧力噴霧式バーナを組合せたもので、小容量ボイラーに多く用いられている。$c$, false, 1),
  ('a8b73c72-d6a1-4724-ba0a-e7a0ada5e758', $c$圧力噴霧式バーナは、霧化媒体を混合し、ノズルから噴霧して油を微粒化する。$c$, true, 2),
  ('a8b73c72-d6a1-4724-ba0a-e7a0ada5e758', $c$回転式バーナは、回転軸に取り付けられたカップの内面で油膜を形成し、遠心力により油を微粒化する。$c$, false, 3),
  ('a8b73c72-d6a1-4724-ba0a-e7a0ada5e758', $c$圧力蒸気噴霧式バーナは、比較的高圧の蒸気を霧化媒体として油を微粒化するもので、ターンダウン比が広い。$c$, false, 4),
  ('a8b73c72-d6a1-4724-ba0a-e7a0ada5e758', $c$戻り油式圧力噴霧バーナは、単純な圧力噴霧式バーナに比べ、ターンダウン比が広い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e7002b04-0fe1-40ad-8bdf-89c81466d4bc',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーにおける気体燃料の燃焼の特徴に関する記述について、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e7002b04-0fe1-40ad-8bdf-89c81466d4bc', $c$温暖化ガス削減、公害防止上などに有利である。$c$, false, 1),
  ('e7002b04-0fe1-40ad-8bdf-89c81466d4bc', $c$空気との混合状態を比較的自由に設定でき、火炎の広がり、長さなどの調節が容易である。$c$, false, 2),
  ('e7002b04-0fe1-40ad-8bdf-89c81466d4bc', $c$油火炎に比べると、ガス火炎は火炉での放射伝熱量は増えるが、接触伝熱面での伝熱量は減る。$c$, true, 3),
  ('e7002b04-0fe1-40ad-8bdf-89c81466d4bc', $c$安定した燃焼が得られ、点火及び消火が容易である。$c$, false, 4),
  ('e7002b04-0fe1-40ad-8bdf-89c81466d4bc', $c$燃料の加熱及び霧化媒体の高圧空気又は蒸気が不要である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '61a86ec6-3f4a-425e-bc09-0fb50f8a283b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$次の文中の〔　〕内に入れるＡからＣまでの語句の組合せとして、適切なものは(１)～(５)のうちどれか。
「ボイラーの燃焼室熱負荷とは、単位時間における燃焼室のＡ当たりのＢをいう。通常のＣで、油・ガスバーナのときの燃焼室熱負荷は、400～1200kw/㎥である。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('61a86ec6-3f4a-425e-bc09-0fb50f8a283b', $c$Ａ：単位容積 Ｂ：発生熱量 Ｃ：炉筒煙管ボイラー$c$, true, 1),
  ('61a86ec6-3f4a-425e-bc09-0fb50f8a283b', $c$Ａ：単位容積 Ｂ：吸収熱量 Ｃ：水管ボイラー$c$, false, 2),
  ('61a86ec6-3f4a-425e-bc09-0fb50f8a283b', $c$Ａ：単位面積 Ｂ：発生熱量 Ｃ：貫流ボイラー$c$, false, 3),
  ('61a86ec6-3f4a-425e-bc09-0fb50f8a283b', $c$Ａ：伝熱面積 Ｂ：発生熱量 Ｃ：水管ボイラー$c$, false, 4),
  ('61a86ec6-3f4a-425e-bc09-0fb50f8a283b', $c$Ａ：伝熱面積 Ｂ：吸収熱量 Ｃ：炉筒煙管ボイラー$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '93759b60-cdff-4739-93b6-ef018acc7fa8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの熱損失に関する記述について、一般的に、最も大きな熱損失となるのは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('93759b60-cdff-4739-93b6-ef018acc7fa8', $c$燃えがら中の未燃分による損失$c$, false, 1),
  ('93759b60-cdff-4739-93b6-ef018acc7fa8', $c$不完全燃焼ガスによる損失$c$, false, 2),
  ('93759b60-cdff-4739-93b6-ef018acc7fa8', $c$各部からのドレンによる損失$c$, false, 3),
  ('93759b60-cdff-4739-93b6-ef018acc7fa8', $c$排ガス熱による損失$c$, true, 4),
  ('93759b60-cdff-4739-93b6-ef018acc7fa8', $c$ボイラー周壁からの放散熱による損失$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '31a4196d-38d1-4768-997e-fe63748a3f24',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの通風に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 誘引通風は、平衡通風と押込通風を併用した構造で、炉内圧は大気圧よりわずかに低く調整する。
Ｂ 煙突によって生じる自然通風力は、外気の密度と煙突内のガスの密度との差に、煙突の高さを乗じることにより求められる。
Ｃ 押込通風は、一般に、常温の空気を取り扱い、所要動力が小さいので、油だきボイラーなどに広く用いられている。
Ｄ 平衡通風は、燃焼調節が容易で、通風抵抗の大きなボイラーでも強い通風力が得られる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('31a4196d-38d1-4768-997e-fe63748a3f24', $c$Ａ，Ｂ$c$, false, 1),
  ('31a4196d-38d1-4768-997e-fe63748a3f24', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('31a4196d-38d1-4768-997e-fe63748a3f24', $c$Ａ，Ｄ$c$, false, 3),
  ('31a4196d-38d1-4768-997e-fe63748a3f24', $c$Ｂ，Ｃ，Ｄ$c$, true, 4),
  ('31a4196d-38d1-4768-997e-fe63748a3f24', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4b4ca30c-96c4-4cff-be0e-78380679dc5c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの伝熱面積の算定方法について、法令上、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問31'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4b4ca30c-96c4-4cff-be0e-78380679dc5c', $c$エコノマイザの伝熱面は、伝熱面積に算入しない。$c$, false, 1),
  ('4b4ca30c-96c4-4cff-be0e-78380679dc5c', $c$貫流ボイラーの過熱管の伝熱面は、伝熱面積に算入しない。$c$, false, 2),
  ('4b4ca30c-96c4-4cff-be0e-78380679dc5c', $c$立てボイラー(横管式)の横管の伝熱面積は、横管の外径側で算定する。$c$, false, 3),
  ('4b4ca30c-96c4-4cff-be0e-78380679dc5c', $c$炉筒煙管ボイラーの煙管の伝熱面積は、煙管の内径側で算定する。$c$, false, 4),
  ('4b4ca30c-96c4-4cff-be0e-78380679dc5c', $c$水管ボイラーの耐火れんがでおおわれた水管の外径側の面積は、伝熱面積に算入しない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'd51c766f-515d-4f7b-9d08-f793ec9407ce',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$使用を廃止したボイラー(移動式ボイラー及び小型ボイラーを除く。)を再び設置する場合の手続きの順序として、法令上、適切なものは次のうちどれか。
ただし、計画届の免除認定を受けていない場合とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問32'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d51c766f-515d-4f7b-9d08-f793ec9407ce', $c$設置届 → 使用検査 → 落成検査$c$, false, 1),
  ('d51c766f-515d-4f7b-9d08-f793ec9407ce', $c$設置届 → 溶接検査 → 使用検査$c$, false, 2),
  ('d51c766f-515d-4f7b-9d08-f793ec9407ce', $c$構造検査 → 使用検査 → 設置届$c$, false, 3),
  ('d51c766f-515d-4f7b-9d08-f793ec9407ce', $c$使用検査 → 溶接検査 → 設置報告書$c$, false, 4),
  ('d51c766f-515d-4f7b-9d08-f793ec9407ce', $c$使用検査 → 設置届 → 落成検査$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文中の〔　〕内に入れるＡからＣまでの語句の組合せとして、該当する法令の内容と一致するものは(１)～(５)のうちどれか。
「移動式ボイラー、屋外式ボイラー及び小型ボイラーを除き、伝熱面積がＡｍ２を超えるボイラーについては、Ｂ又は建物の中のⅭで区画された場所に設置しなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問33'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c', $c$Ａ：３ Ｂ：専用の建物 Ｃ：障壁$c$, true, 1),
  ('3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c', $c$Ａ：３ Ｂ：耐火構造物の建物 Ｃ：地下$c$, false, 2),
  ('3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c', $c$Ａ：３ Ｂ：密閉された室 Ｃ：障壁$c$, false, 3),
  ('3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c', $c$Ａ：５ Ｂ：耐火構造物の建物 Ｃ：地下$c$, false, 4),
  ('3b2fd9f6-3bfd-4fb3-beb9-34a505ce9e4c', $c$Ａ：５ Ｂ：専用の建物 Ｃ：障壁$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6d37b775-df38-4df1-be62-759c2ee01944',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの取扱いの作業について、法令上、ボイラー取扱作業主任者として二級ボイラー技士を選任できないボイラーは、次のうちどれか。
ただし、他にボイラーはないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問34'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6d37b775-df38-4df1-be62-759c2ee01944', $c$伝熱面積が15ｍ２の鋳鉄製温水ボイラー$c$, false, 1),
  ('6d37b775-df38-4df1-be62-759c2ee01944', $c$伝熱面積が20ｍ２の炉筒煙管ボイラー$c$, false, 2),
  ('6d37b775-df38-4df1-be62-759c2ee01944', $c$伝熱面積が24ｍ２の鋳鉄製蒸気ボイラー$c$, false, 3),
  ('6d37b775-df38-4df1-be62-759c2ee01944', $c$伝熱面積が50ｍ２の廃熱ボイラー$c$, true, 4),
  ('6d37b775-df38-4df1-be62-759c2ee01944', $c$伝熱面積が240ｍ２の貫流ボイラー$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'dd35a7ea-e430-41f6-a829-08ca2b72e0da',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー(小型ボイラーを除く。)の附属品の管理のために行わなければならない事項に関するＡからＤまでの記述について、法令に定められているもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 圧力計の目盛りには、ボイラーの常用圧力を示す位置に、見やすい表示をすること。
Ｂ 蒸気ボイラーの最高水位は、ガラス水面計又はこれに接近した位置に、現在水位と比較することができるように表示すること。
Ｃ 燃焼ガスに触れる給水管、吹出管及び水面測定装置の連絡管は、耐熱材料で防護すること。
Ｄ 温水ボイラーの返り管については、凍結しないように保温その他の措置を講ずること。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問35'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dd35a7ea-e430-41f6-a829-08ca2b72e0da', $c$Ａ，Ｂ$c$, false, 1),
  ('dd35a7ea-e430-41f6-a829-08ca2b72e0da', $c$Ａ，Ｃ$c$, false, 2),
  ('dd35a7ea-e430-41f6-a829-08ca2b72e0da', $c$Ａ，Ｄ$c$, false, 3),
  ('dd35a7ea-e430-41f6-a829-08ca2b72e0da', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('dd35a7ea-e430-41f6-a829-08ca2b72e0da', $c$Ｃ，Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4d01ab36-9e11-462b-aff1-6f9ea0d6d804',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー(小型ボイラーを除く。)の検査及び検査証に関する記述について、法令上、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問36'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4d01ab36-9e11-462b-aff1-6f9ea0d6d804', $c$ボイラー(移動式ボイラーを除く。)を設置した者は、所轄労働基準監督署長が検査の必要がないと認めたボイラーを除き、落成検査を受けなければならない。$c$, false, 1),
  ('4d01ab36-9e11-462b-aff1-6f9ea0d6d804', $c$原則として、ボイラー検査証の有効期間は、１年である。$c$, false, 2),
  ('4d01ab36-9e11-462b-aff1-6f9ea0d6d804', $c$ボイラー検査証の有効期間の更新を受けようとする者は、性能検査を受けなければならない。$c$, false, 3),
  ('4d01ab36-9e11-462b-aff1-6f9ea0d6d804', $c$性能検査の結果により、ボイラー検査証の有効期間は、１年未満又は１年を超え２年以内の期間を定めて更新される。$c$, false, 4),
  ('4d01ab36-9e11-462b-aff1-6f9ea0d6d804', $c$ボイラーの主蒸気管を変更した者は、所轄労働基準監督署長が検査の必要がないと認めたボイラーを除き、変更検査を受けなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2fa7747b-c79f-4108-811c-08e54f200bfa',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー(小型ボイラーを除く。)の次の部分又は設備を変更しようとするとき、ボイラー変更届を所轄労働基準監督署長に提出しなければならないものは、次のうちどれか。
ただし、計画届の免除認定を受けていない場合とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問37'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2fa7747b-c79f-4108-811c-08e54f200bfa', $c$空気予熱器$c$, false, 1),
  ('2fa7747b-c79f-4108-811c-08e54f200bfa', $c$給水装置$c$, false, 2),
  ('2fa7747b-c79f-4108-811c-08e54f200bfa', $c$過熱器$c$, true, 3),
  ('2fa7747b-c79f-4108-811c-08e54f200bfa', $c$自動制御装置$c$, false, 4),
  ('2fa7747b-c79f-4108-811c-08e54f200bfa', $c$煙管$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ef6438f7-caee-4e93-a390-104e077187c8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$鋼製蒸気ボイラー(小型ボイラーを除く。)の蒸気部に取り付ける圧力計について講ずる措置に関するＡからＤまでの記述について、法令に定められているもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ コック又は弁の開閉状況を容易に知ることができること。
Ｂ 蒸気側連絡管に設置する場合は、圧力計を直接連絡管に取り付けること。
Ｃ 圧力計の目盛盤の最大指度は、常用圧力の1.5倍以上３倍以下の圧力を示す指度とすること。
Ｄ 圧力計の目盛盤の径は、目盛りを確実に確認できるものとすること。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問38'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ef6438f7-caee-4e93-a390-104e077187c8', $c$Ａ，Ｂ，Ｄ$c$, false, 1),
  ('ef6438f7-caee-4e93-a390-104e077187c8', $c$Ａ，Ｃ$c$, false, 2),
  ('ef6438f7-caee-4e93-a390-104e077187c8', $c$Ａ，Ｄ$c$, true, 3),
  ('ef6438f7-caee-4e93-a390-104e077187c8', $c$Ｂ，Ｃ$c$, false, 4),
  ('ef6438f7-caee-4e93-a390-104e077187c8', $c$Ｂ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '88d3a646-139a-424f-917b-fb56f62981b3',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$貫流ボイラー(小型ボイラーを除く。)の附属品に関する記述について、その内容が法令に定められていないものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問39'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('88d3a646-139a-424f-917b-fb56f62981b3', $c$過熱器には、ドレン抜きを備えなければならない。$c$, false, 1),
  ('88d3a646-139a-424f-917b-fb56f62981b3', $c$ボイラーの最大蒸発量以上の吹出し量の安全弁を、過熱器の入口付近に取り付けなければならない。$c$, true, 2),
  ('88d3a646-139a-424f-917b-fb56f62981b3', $c$給水装置の給水管には、給水弁を取り付けなければならないが、逆止め弁は取り付けないことができる場合がある。$c$, false, 3),
  ('88d3a646-139a-424f-917b-fb56f62981b3', $c$ボイラーの燃焼装置には、異常消火又は燃焼用空気の異常な供給停止が起こったときに、自動的にこれを検出し、直ちに燃料の供給を遮断することができる装置を設けなければならない。$c$, false, 4),
  ('88d3a646-139a-424f-917b-fb56f62981b3', $c$給水内管は、取り外しできる構造でなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'cec0a375-4943-493c-8572-ff31ad57759a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$給水が水道その他圧力を有する水源から供給されるＡからＤまでのボイラー(小型ボイラーを除く。)について、法令上、当該水源に係る管を返り管に取り付けなければならないもののみを全てあげた組合せは、(１)～(５)のうちどれか。
Ａ 炉筒煙管ボイラー Ｂ 鋳鉄製ボイラー Ｃ 熱媒ボイラー Ｄ 貫流ボイラー$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 二級ボイラー技士試験 問40'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cec0a375-4943-493c-8572-ff31ad57759a', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('cec0a375-4943-493c-8572-ff31ad57759a', $c$Ａ，Ｄ$c$, false, 2),
  ('cec0a375-4943-493c-8572-ff31ad57759a', $c$Ｂ$c$, true, 3),
  ('cec0a375-4943-493c-8572-ff31ad57759a', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('cec0a375-4943-493c-8572-ff31ad57759a', $c$Ｃ，Ｄ$c$, false, 5);

do $$
declare
  b2_2026_04 int;
begin
  select count(*) into b2_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 二級ボイラー技士試験%';

  if b2_2026_04 <> 40 then
    raise exception 'boiler2 2026-04 sitting must be 40 questions (got %)', b2_2026_04;
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
  'boiler2',
  exam_types.id,
  '二級ボイラー技士模擬試験(令和8年4月)',
  180,
  40,
  '令和8年4月公表 二級ボイラー技士試験'
from exam_types
where exam_types.exam_id = 'boiler2'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'boiler2'
      and source_filter = '令和8年4月公表 二級ボイラー技士試験'
  );
