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
  'dd5557ff-8e05-402d-88fc-37d7c13a081a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$温度及び圧力に関する記述のうち、適切でないものは次のうちどれか。
ただし、*を付した数字は、小数点以下を省略している。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問1'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dd5557ff-8e05-402d-88fc-37d7c13a081a', $c$セルシウス(摂氏)温度は、標準大気圧の下で、水の氷点を０℃、沸点を100℃と定め、この間を100等分したものを１℃としたものである。$c$, false, 1),
  ('dd5557ff-8e05-402d-88fc-37d7c13a081a', $c$セルシウス(摂氏)温度ｔ[℃]と絶対温度Ｔ[Ｋ]との間には、ｔ＝Ｔ＋273*の関係がある。$c$, true, 2),
  ('dd5557ff-8e05-402d-88fc-37d7c13a081a', $c$760㎜の高さの水銀柱がその底面に及ぼす圧力を標準大気圧といい、1013*hPaに相当する。$c$, false, 3),
  ('dd5557ff-8e05-402d-88fc-37d7c13a081a', $c$圧力計に表れる圧力をゲージ圧力といい、その値に大気圧を加えたものを絶対圧力という。$c$, false, 4),
  ('dd5557ff-8e05-402d-88fc-37d7c13a081a', $c$１Paは１ｍ²当たり１Ｎの力が作用する圧力であり、１ＭPa＝10⁶Pa＝１Ｎ/mm²である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '08403a36-e28b-4d1c-82f1-8b106581c170',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの水循環に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問2'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('08403a36-e28b-4d1c-82f1-8b106581c170', $c$ボイラー内で、温度が上昇した水及び気泡を含んだ水は上昇し、その後に温度の低い水が下降して、水の循環流ができる。$c$, false, 1),
  ('08403a36-e28b-4d1c-82f1-8b106581c170', $c$丸ボイラーは、伝熱面の多くがボイラー水中に設けられ、水の対流が容易なので、特別な水循環の系路を構成する必要がない。$c$, false, 2),
  ('08403a36-e28b-4d1c-82f1-8b106581c170', $c$水管ボイラーは、水と気泡の混合体が上昇する管と、水が下降する管を区別して設けているものが多い。$c$, false, 3),
  ('08403a36-e28b-4d1c-82f1-8b106581c170', $c$炉筒ボイラーには、水循環を良くするために、炉筒を中央部から片方に少しずらしたものがある。$c$, false, 4),
  ('08403a36-e28b-4d1c-82f1-8b106581c170', $c$水循環が良くなるほど、熱が水に十分に伝わるので、伝熱面温度は水温より著しく高い温度となる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '53a83791-efba-478d-bd6a-458465e80084',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの伝熱面、燃焼室及び燃焼装置に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問3'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('53a83791-efba-478d-bd6a-458465e80084', $c$燃焼室に直面している伝熱面は接触伝熱面、燃焼室を出た高温ガス通路に配置される伝熱面は対流伝熱面といわれる。$c$, true, 1),
  ('53a83791-efba-478d-bd6a-458465e80084', $c$燃焼室は、燃料を燃焼させ、熱が発生する部分で、火炉ともいわれる。$c$, false, 2),
  ('53a83791-efba-478d-bd6a-458465e80084', $c$燃焼室は、供給された燃料を速やかに着火・燃焼させ、発生する可燃性ガスと空気との混合接触を良好にして、完全燃焼を行わせる部分である。$c$, false, 3),
  ('53a83791-efba-478d-bd6a-458465e80084', $c$加圧燃焼方式の燃焼室は、気密構造になっている。$c$, false, 4),
  ('53a83791-efba-478d-bd6a-458465e80084', $c$燃焼装置は、燃料の種類によって異なり、液体燃料、気体燃料及び微粉炭にはバーナが、一般固体燃料には火格子が用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ebbd2136-a13a-428a-832b-724cf0de1d34',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$炉筒煙管ボイラーに関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問4'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ebbd2136-a13a-428a-832b-724cf0de1d34', $c$加圧燃焼方式を採用し、燃焼室熱負荷を高くして燃焼効率を高めたものがある。$c$, false, 1),
  ('ebbd2136-a13a-428a-832b-724cf0de1d34', $c$水管ボイラーに比べ、蒸気使用量の変動による圧力変動が小さい。$c$, false, 2),
  ('ebbd2136-a13a-428a-832b-724cf0de1d34', $c$戻り燃焼方式を採用し、燃焼効率を高めたものがある。$c$, false, 3),
  ('ebbd2136-a13a-428a-832b-724cf0de1d34', $c$炉筒は、他の部分より高温になるので、胴にブリージングスペースを設けて応力を緩和する。$c$, true, 4),
  ('ebbd2136-a13a-428a-832b-724cf0de1d34', $c$煙管には、伝熱効果の高いスパイラル管を使用しているものが多い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '867b012c-4e1e-4877-9f44-ed534831c7cc',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$貫流ボイラーに関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問5'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('867b012c-4e1e-4877-9f44-ed534831c7cc', $c$水管ボイラーに分類され、一連の長い管系で構成されており、水循環がない。$c$, false, 1),
  ('867b012c-4e1e-4877-9f44-ed534831c7cc', $c$暖房用、業務用及び工場プロセス用の小形低圧ボイラーとして、単管式及び多管式が多く使われる。$c$, false, 2),
  ('867b012c-4e1e-4877-9f44-ed534831c7cc', $c$細い管内で給水のほとんどが蒸発するので、十分な処理を行った水を使用しなければならない。$c$, false, 3),
  ('867b012c-4e1e-4877-9f44-ed534831c7cc', $c$伝熱面積当たりの保有水量が著しく小さいので、起動から所要蒸気を発生するまでの時間が短い。$c$, false, 4),
  ('867b012c-4e1e-4877-9f44-ed534831c7cc', $c$同容量の丸ボイラーに比べ、一般に据付面積が大きくなる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '916f1da8-986b-4678-9bd6-a52556e98eef',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$暖房用鋳鉄製蒸気ボイラーにハートフォード式連結法により返り管を取り付ける主な目的として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問6'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('916f1da8-986b-4678-9bd6-a52556e98eef', $c$蒸気圧力の異常な昇圧を防止する。$c$, false, 1),
  ('916f1da8-986b-4678-9bd6-a52556e98eef', $c$水の自然循環を良くする。$c$, false, 2),
  ('916f1da8-986b-4678-9bd6-a52556e98eef', $c$不純物のボイラーへの混入を防止する。$c$, false, 3),
  ('916f1da8-986b-4678-9bd6-a52556e98eef', $c$低水位事故を防止する。$c$, true, 4),
  ('916f1da8-986b-4678-9bd6-a52556e98eef', $c$湿り蒸気を乾き飽和蒸気にする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '8dfb5953-490a-4d2c-9b32-8d6ed24d6e48',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの胴に設けるマンホールなどの穴に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問7'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8dfb5953-490a-4d2c-9b32-8d6ed24d6e48', $c$マンホールの大きさは、だ円の場合は長径375mm以上、短径275mm以上とし、円形の場合は直径375mm以上とすることが、JISで定められている。$c$, false, 1),
  ('8dfb5953-490a-4d2c-9b32-8d6ed24d6e48', $c$だ円形又は長方形の穴をボイラーの胴に設ける場合には、短径又は短い辺を胴の軸方向に配置する。$c$, false, 2),
  ('8dfb5953-490a-4d2c-9b32-8d6ed24d6e48', $c$掃除穴は、ボイラー内部を掃除するための穴で、だ円形又は円形とする。$c$, false, 3),
  ('8dfb5953-490a-4d2c-9b32-8d6ed24d6e48', $c$検査穴は、ボイラー内部の点検用として設けられるもので、普通、だ円形とする。$c$, true, 4),
  ('8dfb5953-490a-4d2c-9b32-8d6ed24d6e48', $c$穴を設けた場所は、強度が減少するので、強め材を取り付けたり、フランジを打ち出したりして補強する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '0e0f7a6d-0819-4cd1-8efd-42ecac1b4722',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$温水ボイラー及び蒸気ボイラーの附属品に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問8'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0e0f7a6d-0819-4cd1-8efd-42ecac1b4722', $c$水高計は、温水ボイラーの圧力を測る計器であり、蒸気ボイラーの圧力計に相当する。$c$, false, 1),
  ('0e0f7a6d-0819-4cd1-8efd-42ecac1b4722', $c$温水ボイラーの温度計は、ボイラー水が最高温度となる箇所の見やすい位置に取り付ける。$c$, false, 2),
  ('0e0f7a6d-0819-4cd1-8efd-42ecac1b4722', $c$温水ボイラーの逃がし管は、ボイラー水の膨張分を逃がすためのもので、高所に設けた密閉型膨張タンクに直結させる。$c$, true, 3),
  ('0e0f7a6d-0819-4cd1-8efd-42ecac1b4722', $c$温水ボイラーの逃がし弁は、水の膨張により圧力が設定した圧力を超えると、弁体を押し上げ、水を逃がすものである。$c$, false, 4),
  ('0e0f7a6d-0819-4cd1-8efd-42ecac1b4722', $c$暖房用蒸気ボイラーの真空給水ポンプは、受水槽内を真空にして返り管途中の凝縮水を受水槽に吸引するとともに、ボイラーに給水するために用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '92bb1a8d-f134-4f20-a005-248c4f308a73',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$ボイラーの蒸気トラップの分類を示すＡからＤまでの方式のうち、作動原理が蒸気とドレンの温度差を利用するもののみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ バイメタル式 Ｂ ベローズ式 Ｃ オリフィス式 Ｄ ディスク式$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問9'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('92bb1a8d-f134-4f20-a005-248c4f308a73', $c$Ａ，Ｂ$c$, true, 1),
  ('92bb1a8d-f134-4f20-a005-248c4f308a73', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('92bb1a8d-f134-4f20-a005-248c4f308a73', $c$Ａ，Ｃ，Ｄ$c$, false, 3),
  ('92bb1a8d-f134-4f20-a005-248c4f308a73', $c$Ｂ，Ｃ$c$, false, 4),
  ('92bb1a8d-f134-4f20-a005-248c4f308a73', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'fe77a816-7060-4df1-9f97-4e41b48dc893',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの構造に関する知識'),
  $q$温水ボイラーの温度制御に用いるオンオフ式温度調節器(電気式)に関するＡからＤまでの記述のうち、適切なもののみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ 感温体内の液体は、温度の上昇・下降によって膨張・収縮し、ベローズやダイヤフラムの変位により、マイクロスイッチを開閉させる。
Ｂ 感温体内の液体には、一般にトルエン、エーテル、アルコールなどが用いられる。
Ｃ 保護管を用いて感温体を取り付ける場合は、保護管内にシリコングリスを挿入してはならない。
Ｄ 温度調節器は、一般に調節温度及び比例帯の設定を行う。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問10'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fe77a816-7060-4df1-9f97-4e41b48dc893', $c$Ａ，Ｂ$c$, true, 1),
  ('fe77a816-7060-4df1-9f97-4e41b48dc893', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('fe77a816-7060-4df1-9f97-4e41b48dc893', $c$Ａ，Ｂ，Ｄ$c$, false, 3),
  ('fe77a816-7060-4df1-9f97-4e41b48dc893', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('fe77a816-7060-4df1-9f97-4e41b48dc893', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '61dd40e7-735e-4029-8483-6451a77eb67a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$油だきボイラーの点火時に発生する逆火の発生原因となる事象に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問11'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('61dd40e7-735e-4029-8483-6451a77eb67a', $c$噴霧蒸気(空気)の圧力が強すぎるとき。$c$, true, 1),
  ('61dd40e7-735e-4029-8483-6451a77eb67a', $c$煙道ダンパの開度が不足しているとき。$c$, false, 2),
  ('61dd40e7-735e-4029-8483-6451a77eb67a', $c$点火の際に着火遅れが生じたとき。$c$, false, 3),
  ('61dd40e7-735e-4029-8483-6451a77eb67a', $c$空気より先に燃料を供給したとき。$c$, false, 4),
  ('61dd40e7-735e-4029-8483-6451a77eb67a', $c$複数のバーナを有するボイラーで、燃焼中のバーナの火炎を利用して次のバーナに点火したとき。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '61100c88-7aa6-48d2-a3ea-9ff602161d9c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーをたき始めるときの、各種の弁又はコックとその開閉の組合せとして、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問12'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('61100c88-7aa6-48d2-a3ea-9ff602161d9c', $c$主蒸気弁…………………………………………………閉$c$, false, 1),
  ('61100c88-7aa6-48d2-a3ea-9ff602161d9c', $c$水面計とボイラー間の連絡管の弁又はコック…………………………………………………閉$c$, true, 2),
  ('61100c88-7aa6-48d2-a3ea-9ff602161d9c', $c$胴の空気抜弁…………………………………………………開$c$, false, 3),
  ('61100c88-7aa6-48d2-a3ea-9ff602161d9c', $c$吹出し弁又は吹出しコック…………………………………………………閉$c$, false, 4),
  ('61100c88-7aa6-48d2-a3ea-9ff602161d9c', $c$圧力計のコック…………………………………………………開$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c637652d-1c81-4616-b4ad-48f1c59b1b42',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$油だきボイラーの燃焼の維持及び調節などに関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問13'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c637652d-1c81-4616-b4ad-48f1c59b1b42', $c$燃焼時に火炎の流れの方向を監視し、ボイラー本体及びれんが壁に火炎が触れないようにする。$c$, false, 1),
  ('c637652d-1c81-4616-b4ad-48f1c59b1b42', $c$蒸気圧力又は温水温度を一定に保つように、負荷の変動に応じて燃焼量を増減する。$c$, false, 2),
  ('c637652d-1c81-4616-b4ad-48f1c59b1b42', $c$燃焼中に突然消火の可能性があるため、監視を怠らない。$c$, false, 3),
  ('c637652d-1c81-4616-b4ad-48f1c59b1b42', $c$燃焼用空気量の過不足は、計測して得た燃焼ガス中のＣＯ２、ＣＯ又はＯ２の値により判断する。$c$, false, 4),
  ('c637652d-1c81-4616-b4ad-48f1c59b1b42', $c$燃焼用空気量が適量の場合は、炎が輝白色で、炉内の見通しがきく。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'f352b9e8-849a-4c57-9c8a-05baa8a310ea',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーにキャリオーバが発生した場合の処置に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問14'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f352b9e8-849a-4c57-9c8a-05baa8a310ea', $c$燃焼量を下げる。$c$, false, 1),
  ('f352b9e8-849a-4c57-9c8a-05baa8a310ea', $c$主蒸気弁を急開して蒸気圧力を下げる。$c$, true, 2),
  ('f352b9e8-849a-4c57-9c8a-05baa8a310ea', $c$ボイラー水位が高いときは、一部を吹出しする。$c$, false, 3),
  ('f352b9e8-849a-4c57-9c8a-05baa8a310ea', $c$ボイラー水の水質試験を行う。$c$, false, 4),
  ('f352b9e8-849a-4c57-9c8a-05baa8a310ea', $c$ボイラー水が過度に濃縮されたときは、吹出し量を増し、その分を給水する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '6baf51f5-caf4-4c66-9f07-1fee22f2de18',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラー水位が安全低水面以下にあると気付いたときの措置に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問15'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6baf51f5-caf4-4c66-9f07-1fee22f2de18', $c$炉筒煙管ボイラーでは、水面が煙管のある位置より低下した場合は、まず第一に、徐々に給水を行い煙管を冷却する。$c$, true, 1),
  ('6baf51f5-caf4-4c66-9f07-1fee22f2de18', $c$鋳鉄製ボイラーでは、いかなる場合であっても給水しない。$c$, false, 2),
  ('6baf51f5-caf4-4c66-9f07-1fee22f2de18', $c$燃料の供給を止めて、燃焼を停止する。$c$, false, 3),
  ('6baf51f5-caf4-4c66-9f07-1fee22f2de18', $c$燃焼系統の換気を行い、炉を冷却する。$c$, false, 4),
  ('6baf51f5-caf4-4c66-9f07-1fee22f2de18', $c$ボイラーが冷却してから、原因及び各部の損傷の有無を調査する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '2badc16c-892b-415f-a827-bcd5927fb78d',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーのガラス水面計の機能試験を行う時期に関するＡからＤまでの記述で、必要性の高い時期のみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ ガラス管の取替えなどの補修を行ったとき。
Ｂ 水位が絶えず上下にかすかに動いているとき。
Ｃ 取扱い担当者が交替し、次の者が引き継いだとき。
Ｄ プライミングやホーミングが生じたとき。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問16'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2badc16c-892b-415f-a827-bcd5927fb78d', $c$Ａ，Ｃ$c$, false, 1),
  ('2badc16c-892b-415f-a827-bcd5927fb78d', $c$Ａ，Ｃ，Ｄ$c$, true, 2),
  ('2badc16c-892b-415f-a827-bcd5927fb78d', $c$Ａ，Ｄ$c$, false, 3),
  ('2badc16c-892b-415f-a827-bcd5927fb78d', $c$Ｂ，Ｃ$c$, false, 4),
  ('2badc16c-892b-415f-a827-bcd5927fb78d', $c$Ｂ，Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ec6180ae-92d8-4d2c-905a-bf4ce9563f74',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーのばね安全弁に蒸気漏れが生じる原因となる事項として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問17'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ec6180ae-92d8-4d2c-905a-bf4ce9563f74', $c$弁体と弁座の間に、ごみなどの異物が付着している。$c$, false, 1),
  ('ec6180ae-92d8-4d2c-905a-bf4ce9563f74', $c$弁体と弁座のすり合わせが悪くなっている。$c$, false, 2),
  ('ec6180ae-92d8-4d2c-905a-bf4ce9563f74', $c$弁体と弁座の中心がずれて、当たり面の接触圧力が不均一になっている。$c$, false, 3),
  ('ec6180ae-92d8-4d2c-905a-bf4ce9563f74', $c$ばねが腐食して、弁体を押し下げる力が弱くなっている。$c$, false, 4),
  ('ec6180ae-92d8-4d2c-905a-bf4ce9563f74', $c$蒸気による熱膨張などにより、弁体円筒部と弁体ガイド部が密着している。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '214bc724-75b7-41f6-bb25-5450839e0be5',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラーの休止中の満水保存法に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問18'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('214bc724-75b7-41f6-bb25-5450839e0be5', $c$ボイラーの燃焼側及び煙道は、すすや灰を完全に除去して、防錆油、防錆剤などを塗布する。$c$, false, 1),
  ('214bc724-75b7-41f6-bb25-5450839e0be5', $c$休止期間が３か月程度以内の場合に採用される。$c$, false, 2),
  ('214bc724-75b7-41f6-bb25-5450839e0be5', $c$凍結のおそれがあるときは、採用できない。$c$, false, 3),
  ('214bc724-75b7-41f6-bb25-5450839e0be5', $c$満水保存剤は、所定の濃度になるようにボイラーに連続注入するか、又は間欠的に注入する。$c$, false, 4),
  ('214bc724-75b7-41f6-bb25-5450839e0be5', $c$保存水の管理のため、水素イオン指数(pＨ)のみ月に１～２回測定し、所定の値を維持する。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '5ad63c65-fc72-46c3-9be2-9eb14e881cf8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$ボイラー水中の不純物に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問19'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5ad63c65-fc72-46c3-9be2-9eb14e881cf8', $c$溶存しているＯ２は、鋼材の腐食の原因となる。$c$, false, 1),
  ('5ad63c65-fc72-46c3-9be2-9eb14e881cf8', $c$溶存しているＣＯ２は、鋼材の腐食の原因となる。$c$, false, 2),
  ('5ad63c65-fc72-46c3-9be2-9eb14e881cf8', $c$スケールは、溶解性蒸発残留物が濃縮され、ドラム底部などに沈積した軟質沈殿物である。$c$, true, 3),
  ('5ad63c65-fc72-46c3-9be2-9eb14e881cf8', $c$スケールの熱伝導率は、炭素鋼の熱伝導率より低い。$c$, false, 4),
  ('5ad63c65-fc72-46c3-9be2-9eb14e881cf8', $c$懸濁物には、りん酸カルシウムなどの不溶物質、エマルジョン化された鉱物油などがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'e06c85eb-c460-4ed6-bac0-9a193396cef7',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = 'ボイラーの取扱いに関する知識'),
  $q$単純軟化法における残留硬度と処理水量の関係を示す次のグラフにおいて、Ａ(横軸)、Ｂ(縦軸)に入る語句及びＰ点(名称)について、適切な組合せは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問20'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e06c85eb-c460-4ed6-bac0-9a193396cef7', $c$Ａ：処理水量 Ｂ：残留硬度 Ｐ点：臨界点$c$, false, 1),
  ('e06c85eb-c460-4ed6-bac0-9a193396cef7', $c$Ａ：処理水量 Ｂ：残留硬度 Ｐ点：貫流点$c$, true, 2),
  ('e06c85eb-c460-4ed6-bac0-9a193396cef7', $c$Ａ：処理水量 Ｂ：残留硬度 Ｐ点：飽和点$c$, false, 3),
  ('e06c85eb-c460-4ed6-bac0-9a193396cef7', $c$Ａ：残留硬度 Ｂ：処理水量 Ｐ点：臨界点$c$, false, 4),
  ('e06c85eb-c460-4ed6-bac0-9a193396cef7', $c$Ａ：残留硬度 Ｂ：処理水量 Ｐ点：貫流点$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '114253f1-d40e-4789-847b-2f27d5fdb614',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$次の文中の〔　〕内に入れるＡからＣまでの語句の組合せとして、適切なものは(１)～(５)のうちどれか。
「燃料を空気中で加熱し、他から点火しないで自然に燃え始める最低の温度をＡという。Ａは、燃料が加熱されてＢ反応によって発生する熱量と、外気に放散される熱量とのＣによって決まる。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問21'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('114253f1-d40e-4789-847b-2f27d5fdb614', $c$Ａ：着火温度 Ｂ：酸化 Ｃ：合計$c$, false, 1),
  ('114253f1-d40e-4789-847b-2f27d5fdb614', $c$Ａ：着火温度 Ｂ：酸化 Ｃ：平衡$c$, true, 2),
  ('114253f1-d40e-4789-847b-2f27d5fdb614', $c$Ａ：着火温度 Ｂ：還元 Ｃ：差$c$, false, 3),
  ('114253f1-d40e-4789-847b-2f27d5fdb614', $c$Ａ：引火点 Ｂ：酸化 Ｃ：平衡$c$, false, 4),
  ('114253f1-d40e-4789-847b-2f27d5fdb614', $c$Ａ：引火点 Ｂ：還元 Ｃ：差$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '23b416ad-6993-4db2-87dc-4670b40ce94b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$重油に含まれる水分及びスラッジによる障害に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問22'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('23b416ad-6993-4db2-87dc-4670b40ce94b', $c$水分が多いと、熱損失が増加する。$c$, false, 1),
  ('23b416ad-6993-4db2-87dc-4670b40ce94b', $c$水分が多いと、いきづき燃焼を起こす。$c$, false, 2),
  ('23b416ad-6993-4db2-87dc-4670b40ce94b', $c$水分が多いと、油管内でベーパロックを起こす。$c$, true, 3),
  ('23b416ad-6993-4db2-87dc-4670b40ce94b', $c$スラッジは、弁、ろ過器、バーナチップなどを閉塞させる。$c$, false, 4),
  ('23b416ad-6993-4db2-87dc-4670b40ce94b', $c$スラッジは、ポンプ、流量計、バーナチップなどを摩耗させる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'bb8adf6b-4a2c-4deb-b7bc-d567a2902ada',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーにおける燃料の燃焼の基礎的な事項に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問23'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bb8adf6b-4a2c-4deb-b7bc-d567a2902ada', $c$燃焼には、燃料、空気及び温度の三つの要素が必要である。$c$, false, 1),
  ('bb8adf6b-4a2c-4deb-b7bc-d567a2902ada', $c$燃焼室における燃焼温度は、特別な場合を除き、高温維持することが望ましい。$c$, false, 2),
  ('bb8adf6b-4a2c-4deb-b7bc-d567a2902ada', $c$実際空気量に対する理論空気量の比を空気比という。$c$, true, 3),
  ('bb8adf6b-4a2c-4deb-b7bc-d567a2902ada', $c$燃焼ガスの成分割合は、燃料の成分、空気比及び燃焼の方法によって変わる。$c$, false, 4),
  ('bb8adf6b-4a2c-4deb-b7bc-d567a2902ada', $c$燃焼ガスの成分には、燃焼中の水分などによるＨ₂Ｏがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '69e9c037-ed94-4769-a93a-f56db0f5a714',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$油だきボイラーにおける重油の加熱に関するＡからＤまでの記述のうち、適切なもののみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ Ａ重油や軽油は、一般に50～60℃に加熱する必要がある。
Ｂ 加熱温度が高すぎると、いきづき燃焼となる。
Ｃ 加熱温度が低すぎると、すすが発生する。
Ｄ 加熱温度が低すぎると、バーナ管内でベーパロックを起こす。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問24'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('69e9c037-ed94-4769-a93a-f56db0f5a714', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('69e9c037-ed94-4769-a93a-f56db0f5a714', $c$Ａ，Ｃ$c$, false, 2),
  ('69e9c037-ed94-4769-a93a-f56db0f5a714', $c$Ａ，Ｄ$c$, false, 3),
  ('69e9c037-ed94-4769-a93a-f56db0f5a714', $c$Ｂ，Ｃ$c$, true, 4),
  ('69e9c037-ed94-4769-a93a-f56db0f5a714', $c$Ｂ，Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4ce0a855-a961-4d57-b2fb-939a727ea1ac',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの液体燃料の供給装置に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問25'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4ce0a855-a961-4d57-b2fb-939a727ea1ac', $c$燃料油タンクは、用途により貯蔵タンクとサービスタンクに分類される。$c$, false, 1),
  ('4ce0a855-a961-4d57-b2fb-939a727ea1ac', $c$貯蔵タンクの貯油量は、１週間から１か月間の使用量が一般的である。$c$, false, 2),
  ('4ce0a855-a961-4d57-b2fb-939a727ea1ac', $c$サービスタンクには、油面計、温度計、自動油面調節装置などを取り付ける。$c$, false, 3),
  ('4ce0a855-a961-4d57-b2fb-939a727ea1ac', $c$油加熱器は、燃料油を加熱し、燃料油を噴霧に適した粘度とする装置である。$c$, false, 4),
  ('4ce0a855-a961-4d57-b2fb-939a727ea1ac', $c$油ストレーナには、オートクリーナがあり、油中の水分を除去することができる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '64e44050-fce9-42b1-a156-7268705f7b38',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$霧化媒体を必要とするボイラーの油バーナは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問26'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('64e44050-fce9-42b1-a156-7268705f7b38', $c$プランジャ式圧力噴霧バーナ$c$, false, 1),
  ('64e44050-fce9-42b1-a156-7268705f7b38', $c$戻り油式圧力噴霧バーナ$c$, false, 2),
  ('64e44050-fce9-42b1-a156-7268705f7b38', $c$回転式バーナ$c$, false, 3),
  ('64e44050-fce9-42b1-a156-7268705f7b38', $c$ガンタイプバーナ$c$, false, 4),
  ('64e44050-fce9-42b1-a156-7268705f7b38', $c$空気噴霧式バーナ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4bf4c9a6-350c-427d-a49c-40a9333d1015',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーにおける気体燃料の燃焼方式に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問27'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4bf4c9a6-350c-427d-a49c-40a9333d1015', $c$拡散燃焼方式は、ガスと空気を別々にバーナに供給し、燃焼させる方法である。$c$, false, 1),
  ('4bf4c9a6-350c-427d-a49c-40a9333d1015', $c$拡散燃焼方式は、バーナ内に可燃性混合気を作らないため逆火のおそれがない。$c$, false, 2),
  ('4bf4c9a6-350c-427d-a49c-40a9333d1015', $c$拡散燃焼方式は、火炎の広がり、長さなどの調節が難しい。$c$, true, 3),
  ('4bf4c9a6-350c-427d-a49c-40a9333d1015', $c$予混合燃焼方式は、安定した火炎を作りやすい。$c$, false, 4),
  ('4bf4c9a6-350c-427d-a49c-40a9333d1015', $c$予混合燃焼方式は、気体燃料に特有な燃焼方式である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '426e05d8-f260-4cc9-bfd9-6637f7c065a3',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの燃料の燃焼により発生するＮＯＸの抑制方法に関するＡからＤまでの記述のうち、適切なもののみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ 窒素の少ない燃料を使用する。
Ｂ 燃焼温度を低くし、特に局所的高温域が生じないようにする。
Ｃ 炉内燃焼ガス中の酸素濃度を高くする。
Ｄ 排煙脱硝装置を設置する。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問28'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('426e05d8-f260-4cc9-bfd9-6637f7c065a3', $c$Ａ，Ｂ$c$, false, 1),
  ('426e05d8-f260-4cc9-bfd9-6637f7c065a3', $c$Ａ，Ｂ，Ｄ$c$, true, 2),
  ('426e05d8-f260-4cc9-bfd9-6637f7c065a3', $c$Ａ，Ｃ$c$, false, 3),
  ('426e05d8-f260-4cc9-bfd9-6637f7c065a3', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('426e05d8-f260-4cc9-bfd9-6637f7c065a3', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの燃焼における一次空気及び二次空気に関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問29'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4', $c$油・ガスだき燃焼における一次空気は、噴射された燃料の周辺に供給され、初期燃焼を安定させる。$c$, false, 1),
  ('c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4', $c$油・ガスだき燃焼における二次空気は、旋回又は交差流によって燃料と空気の混合を良好にして、燃焼を完結させる。$c$, false, 2),
  ('c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4', $c$微粉炭バーナ燃焼における二次空気は、微粉炭と予混合してバーナに送入される。$c$, true, 3),
  ('c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4', $c$火格子燃焼における一次空気は、一般的な上向き通風の場合、火格子下から送入される。$c$, false, 4),
  ('c4e3e0f2-3898-4d9f-86bb-bbc0004e31c4', $c$火格子燃焼における二次空気は、燃料層上の可燃性ガスの火炎中に送入される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'ceea1e78-1872-41e9-a577-e931848cc90a',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '燃料及び燃焼に関する知識'),
  $q$ボイラーの人工通風に用いられるファンに関する記述のうち、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問30'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ceea1e78-1872-41e9-a577-e931848cc90a', $c$多翼形ファンは、羽根車の外周近くに、幅長で前向きの羽根を多数設けたものである。$c$, false, 1),
  ('ceea1e78-1872-41e9-a577-e931848cc90a', $c$多翼形ファンは、大形で重量は大きいが、効率が高い。$c$, true, 2),
  ('ceea1e78-1872-41e9-a577-e931848cc90a', $c$後向き形ファンは、高温、高圧及び大容量のボイラーに適する。$c$, false, 3),
  ('ceea1e78-1872-41e9-a577-e931848cc90a', $c$ラジアル形ファンは、中央の回転軸から放射状に６～12枚の羽根を設けたものである。$c$, false, 4),
  ('ceea1e78-1872-41e9-a577-e931848cc90a', $c$ラジアル形ファンは、形状が簡単で羽根の取替えが容易である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c550890b-d02d-4e18-8381-205e46df1063',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの伝熱面積に算入する部分について、法令上、該当しないのは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問31'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c550890b-d02d-4e18-8381-205e46df1063', $c$管寄せ$c$, false, 1),
  ('c550890b-d02d-4e18-8381-205e46df1063', $c$煙管$c$, false, 2),
  ('c550890b-d02d-4e18-8381-205e46df1063', $c$水管$c$, false, 3),
  ('c550890b-d02d-4e18-8381-205e46df1063', $c$炉筒$c$, false, 4),
  ('c550890b-d02d-4e18-8381-205e46df1063', $c$過熱器管$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'c446e71b-b691-4d82-aa8c-d51e1537b0da',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文中の〔　〕内に入れるＡ及びＢの語句の組合せとして、該当する法令の内容と一致するものは(１)～(５)のうちどれか。
「溶接によるボイラー(小型ボイラーを除く。)については、Ａ検査に合格した後でなければ、Ｂ検査を受けることができない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問32'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c446e71b-b691-4d82-aa8c-d51e1537b0da', $c$Ａ：溶接 Ｂ：使用$c$, false, 1),
  ('c446e71b-b691-4d82-aa8c-d51e1537b0da', $c$Ａ：溶接 Ｂ：構造$c$, true, 2),
  ('c446e71b-b691-4d82-aa8c-d51e1537b0da', $c$Ａ：使用 Ｂ：構造$c$, false, 3),
  ('c446e71b-b691-4d82-aa8c-d51e1537b0da', $c$Ａ：使用 Ｂ：溶接$c$, false, 4),
  ('c446e71b-b691-4d82-aa8c-d51e1537b0da', $c$Ａ：構造 Ｂ：溶接$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '7ca8c8a6-d280-4de8-b03e-742ab983e67b',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー室に設置されている胴の内径が500mmで、その長さが1000mmの本体を被覆していないボイラー(小型ボイラーを除く。)の場合、その外壁から壁、配管その他のボイラーの側部にある構造物(検査及びそうじに支障のない物を除く。)までの距離として、法令上、許容される最小の数値は次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問33'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7ca8c8a6-d280-4de8-b03e-742ab983e67b', $c$0.15ｍ$c$, false, 1),
  ('7ca8c8a6-d280-4de8-b03e-742ab983e67b', $c$0.30ｍ$c$, true, 2),
  ('7ca8c8a6-d280-4de8-b03e-742ab983e67b', $c$0.45ｍ$c$, false, 3),
  ('7ca8c8a6-d280-4de8-b03e-742ab983e67b', $c$1.20ｍ$c$, false, 4),
  ('7ca8c8a6-d280-4de8-b03e-742ab983e67b', $c$2.00ｍ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '58fe3bed-fca1-457f-bb3b-cbc65b0758ad',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$原則として、ボイラー技士でなければ取り扱うことができないボイラーは、法令上、次のうちどれか。
ただし、温水ボイラーは、木質バイオマス温水ボイラーではないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問34'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('58fe3bed-fca1-457f-bb3b-cbc65b0758ad', $c$伝熱面積が19ｍ２の温水ボイラー$c$, true, 1),
  ('58fe3bed-fca1-457f-bb3b-cbc65b0758ad', $c$伝熱面積が３ｍ２の蒸気ボイラーで、胴の内径が750㎜、かつ、その長さが1300㎜のもの$c$, false, 2),
  ('58fe3bed-fca1-457f-bb3b-cbc65b0758ad', $c$伝熱面積が30ｍ２の気水分離器を有しない貫流ボイラー$c$, false, 3),
  ('58fe3bed-fca1-457f-bb3b-cbc65b0758ad', $c$伝熱面積が３ｍ２の蒸気ボイラーで、最高使用圧力が0.1ＭPaのもの$c$, false, 4),
  ('58fe3bed-fca1-457f-bb3b-cbc65b0758ad', $c$最大電力設備容量が75kＷの電気ボイラー$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '33fff362-9966-4a07-944f-de8a773ae6f2',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラー(小型ボイラーを除く。)の定期自主検査に関する項目及びその具体的な検査対象の装置等を示すＡからＤまでの記述のうち、該当する法令の内容と一致するもののみを全て挙げた組合せは、(１)～(５)のうちどれか。
Ａ 項目：ボイラー本体／具体的な検査対象：バーナタイル及び炉壁
Ｂ 項目：自動制御装置／具体的な検査対象：火炎検出装置
Ｃ 項目：燃焼装置／具体的な検査対象：ストレーナ
Ｄ 項目：附属装置及び附属品／具体的な検査対象：煙道$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問35'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('33fff362-9966-4a07-944f-de8a773ae6f2', $c$Ａ，Ｂ$c$, false, 1),
  ('33fff362-9966-4a07-944f-de8a773ae6f2', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('33fff362-9966-4a07-944f-de8a773ae6f2', $c$Ａ，Ｄ$c$, false, 3),
  ('33fff362-9966-4a07-944f-de8a773ae6f2', $c$Ｂ，Ｃ$c$, true, 4),
  ('33fff362-9966-4a07-944f-de8a773ae6f2', $c$Ｂ，Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '4e6394ec-9802-4111-8e9a-11d402843ac2',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$法令上、ボイラー(小型ボイラーを除く。)の変更検査を受けなければならない場合は、次のうちどれか。
ただし、所轄労働基準監督署長が当該検査の必要がないと認めたボイラーではないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問36'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4e6394ec-9802-4111-8e9a-11d402843ac2', $c$ボイラーの空気予熱器に変更を加えたとき。$c$, false, 1),
  ('4e6394ec-9802-4111-8e9a-11d402843ac2', $c$ボイラーの給水装置に変更を加えたとき。$c$, false, 2),
  ('4e6394ec-9802-4111-8e9a-11d402843ac2', $c$ボイラーの過熱器に変更を加えたとき。$c$, true, 3),
  ('4e6394ec-9802-4111-8e9a-11d402843ac2', $c$使用を廃止したボイラーを再び設置しようとするとき。$c$, false, 4),
  ('4e6394ec-9802-4111-8e9a-11d402843ac2', $c$構造検査を受けた後、１年以上設置されなかったボイラーを設置しようとするとき。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  '1b59b88f-c9d9-4aaf-838b-58f21a0b229c',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ボイラーの検査証に関する記述のうち、その内容が法令と一致しないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問37'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1b59b88f-c9d9-4aaf-838b-58f21a0b229c', $c$所轄労働基準監督署長は、落成検査に合格したボイラー又は落成検査の必要がないと認めたボイラーについて、ボイラー検査証を交付する。$c$, false, 1),
  ('1b59b88f-c9d9-4aaf-838b-58f21a0b229c', $c$原則として、ボイラー検査証の有効期間は１年とする。$c$, false, 2),
  ('1b59b88f-c9d9-4aaf-838b-58f21a0b229c', $c$ボイラー検査証の有効期間の更新を受けようとする者は、登録性能検査機関の性能検査を受けなければならない。$c$, false, 3),
  ('1b59b88f-c9d9-4aaf-838b-58f21a0b229c', $c$性能検査の結果により、登録性能検査機関はボイラー検査証の有効期間を、１年未満又は１年を超え２年以内の期間を定めて更新することができる。$c$, false, 4),
  ('1b59b88f-c9d9-4aaf-838b-58f21a0b229c', $c$事業者に変更があったときは、その変更後30日以内に、所轄労働基準監督署長にボイラー検査証書替申請書を提出し、その書替えを受けなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$鋳鉄製温水ボイラー(小型ボイラーを除く。)に取り付けなければならない附属品として法令に定められているものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問38'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0', $c$温度計$c$, true, 1),
  ('fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0', $c$ガラス水面計$c$, false, 2),
  ('fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0', $c$験水コック$c$, false, 3),
  ('fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0', $c$吹出しコック$c$, false, 4),
  ('fe0b7fd2-3ed2-4df7-a16c-b7ab31a0e7a0', $c$水柱管$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'cb205782-d09a-4016-b49c-0c7475f2d679',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$貫流ボイラー(小型ボイラーを除く。)の附属品に関する記述について、その内容が法令に合致しないものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問39'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cb205782-d09a-4016-b49c-0c7475f2d679', $c$過熱器には、ドレン抜きを備えなければならない。$c$, false, 1),
  ('cb205782-d09a-4016-b49c-0c7475f2d679', $c$ボイラーの最大蒸発量以上の吹出し量の安全弁を、ボイラー本体ではなく過熱器の入口付近に取り付けることができる。$c$, true, 2),
  ('cb205782-d09a-4016-b49c-0c7475f2d679', $c$給水装置の給水管には、給水弁を取り付けなければならないが、逆止め弁は取り付けないことができる。$c$, false, 3),
  ('cb205782-d09a-4016-b49c-0c7475f2d679', $c$起動時にボイラー水が不足している場合及び運転時にボイラー水が不足した場合に、自動的に燃料の供給を遮断する装置又はこれに代わる安全装置を設けなければならない。$c$, false, 4),
  ('cb205782-d09a-4016-b49c-0c7475f2d679', $c$吹出し管は、設けないことができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note)
VALUES (
  'a0da0f22-2e55-4815-ab9b-79e25d1ddbb8',
  'boiler2',
  (SELECT id FROM exam_types WHERE exam_id = 'boiler2' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'boiler2' AND e.code = 'common' AND c.name = '関係法令'),
  $q$給水が水道その他圧力を有する水源から供給される場合に、法令上、当該水源に係る管を返り管に取り付けなければならないボイラー(小型ボイラーを除く。)は、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 二級ボイラー技士試験 問40'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a0da0f22-2e55-4815-ab9b-79e25d1ddbb8', $c$立てボイラー$c$, false, 1),
  ('a0da0f22-2e55-4815-ab9b-79e25d1ddbb8', $c$鋳鉄製ボイラー$c$, true, 2),
  ('a0da0f22-2e55-4815-ab9b-79e25d1ddbb8', $c$炉筒煙管ボイラー$c$, false, 3),
  ('a0da0f22-2e55-4815-ab9b-79e25d1ddbb8', $c$水管ボイラー$c$, false, 4),
  ('a0da0f22-2e55-4815-ab9b-79e25d1ddbb8', $c$貫流ボイラー$c$, false, 5);
