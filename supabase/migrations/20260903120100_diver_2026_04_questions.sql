-- diver 過去問 questions / choices 投入
-- 生成元: data/past-exams/*.txt
-- explanation はプレースホルダー。後続で実解説を追加する。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'diver', '潜水士', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'diver');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'diver', 'common', '潜水士'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'diver' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'diver', 'common', '潜水士', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'diver' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'diver', '潜水業務', 1
FROM exam_types et
WHERE et.exam_id = 'diver'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '潜水業務'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'diver', '送気、潜降及び浮上', 2
FROM exam_types et
WHERE et.exam_id = 'diver'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '送気、潜降及び浮上'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'diver', '高気圧障害', 3
FROM exam_types et
WHERE et.exam_id = 'diver'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '高気圧障害'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'diver', '関係法令', 4
FROM exam_types et
WHERE et.exam_id = 'diver'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '02504441-9ca0-4813-9938-1305687c0b99',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$圧力の単位に関する次の文中の[ ]内に入れるＡ及びＢの数値の組合せとして、正しいものは(１)～(５)のうちどれか。「圧力200kgf/cm²をＳＩ単位に換算するとおおむね[ Ａ ]ＭPaとなり、また、この値を気圧の単位に換算するとおおむね[ Ｂ ]atmとなる。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('02504441-9ca0-4813-9938-1305687c0b99', $c$Ａ：0.2　Ｂ：２$c$, false, 1),
  ('02504441-9ca0-4813-9938-1305687c0b99', $c$Ａ：２　Ｂ：２$c$, false, 2),
  ('02504441-9ca0-4813-9938-1305687c0b99', $c$Ａ：２　Ｂ：20$c$, false, 3),
  ('02504441-9ca0-4813-9938-1305687c0b99', $c$Ａ：20　Ｂ：20$c$, false, 4),
  ('02504441-9ca0-4813-9938-1305687c0b99', $c$Ａ：20　Ｂ：200$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$下の図のように、質量50ｇのおもりを糸でつるした、質量10ｇ、断面積４cm²、長さ30cmの細長い円柱状の浮きが、上端を水面上に出して静止している。水面から浮きの上端までの高さhに最も近いものは、次のうちどれか。ただし、糸の質量及び体積並びにおもりの体積は無視できるものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54', $c$10 cm$c$, false, 1),
  ('1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54', $c$12 cm$c$, false, 2),
  ('1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54', $c$15 cm$c$, true, 3),
  ('1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54', $c$18 cm$c$, false, 4),
  ('1ce3b7e2-b0fa-49ed-a166-9689ba3f5c54', $c$20 cm$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '466b49b4-74e4-41b2-9d57-a8496b80aafe',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$気体の性質などに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('466b49b4-74e4-41b2-9d57-a8496b80aafe', $c$溶解度の小さい気体が、一定量の液体に溶ける場合、温度が一定であれば、気体が溶解する質量は、その気体の分圧に比例する。$c$, false, 1),
  ('466b49b4-74e4-41b2-9d57-a8496b80aafe', $c$異種の気体が薄い透過膜を境として接するときは、双方が平衡となるまで過剰な分圧の気体の拡散浸透が行われる。$c$, false, 2),
  ('466b49b4-74e4-41b2-9d57-a8496b80aafe', $c$窒素は、無色・無臭で、常温・常圧では化学的に安定した不活性の気体であるが、高圧下では麻酔作用がある。$c$, false, 3),
  ('466b49b4-74e4-41b2-9d57-a8496b80aafe', $c$一酸化炭素は、無色・無臭の気体で、呼吸によって体内に入ると、赤血球のヘモグロビンと結合し、酸素の組織への運搬を阻害する。$c$, false, 4),
  ('466b49b4-74e4-41b2-9d57-a8496b80aafe', $c$ヘリウムは、密度が極めて大きく、他の元素と化合しにくい気体で、呼吸抵抗は少ない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6e606df1-e7f3-484a-b6eb-457f36eb8a5d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$0.2ＭPa(ゲージ圧力)の空気に接している20℃の水１Ｌに溶解する窒素の質量に最も近いものは、次のうちどれか。ただし、空気中に含まれる窒素の割合は80％とし、0.1ＭPa(絶対圧力)の窒素100％の気体に接している20℃の水１Ｌには0.020ｇの窒素が溶解するものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6e606df1-e7f3-484a-b6eb-457f36eb8a5d', $c$0.016 ｇ$c$, false, 1),
  ('6e606df1-e7f3-484a-b6eb-457f36eb8a5d', $c$0.024 ｇ$c$, false, 2),
  ('6e606df1-e7f3-484a-b6eb-457f36eb8a5d', $c$0.048 ｇ$c$, true, 3),
  ('6e606df1-e7f3-484a-b6eb-457f36eb8a5d', $c$0.060 ｇ$c$, false, 4),
  ('6e606df1-e7f3-484a-b6eb-457f36eb8a5d', $c$0.096 ｇ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f73ea24e-606f-40f4-a834-15be5a719884',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水中における光や音に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f73ea24e-606f-40f4-a834-15be5a719884', $c$水中で、物が青のフィルターを通したときのように見えるのは、太陽光線のうち青色が最も水に吸収されやすいためである。$c$, false, 1),
  ('f73ea24e-606f-40f4-a834-15be5a719884', $c$濁った水中では、オレンジ色や黄色で蛍光性のものが視認しやすい。$c$, true, 2),
  ('f73ea24e-606f-40f4-a834-15be5a719884', $c$光は、水と空気の境界で屈折する。$c$, false, 3),
  ('f73ea24e-606f-40f4-a834-15be5a719884', $c$澄んだ水中で顔マスクを通して近距離にある物を見た場合、物体の位置は実際より遠く見える。$c$, false, 4),
  ('f73ea24e-606f-40f4-a834-15be5a719884', $c$水中では、音は空気中に比べ約３倍の速度で伝わり、また、伝播距離が長いので両耳効果が高められる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2c3387d0-08b4-48b4-92b8-bb906c9106fb',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水の種類及び方式に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2c3387d0-08b4-48b4-92b8-bb906c9106fb', $c$硬式潜水は、潜水者が潜水深度に応じた水圧を直接受けて潜水する方法で、送気方法により送気式と自給気式に分類される。$c$, false, 1),
  ('2c3387d0-08b4-48b4-92b8-bb906c9106fb', $c$全面マスク式潜水は、応需送気式の潜水で、デマンド式レギュレーターとして、専用の潜水呼吸器又はスクーバ式潜水用のセカンドステージレギュレーターが利用される。$c$, true, 2),
  ('2c3387d0-08b4-48b4-92b8-bb906c9106fb', $c$ヘルメット式潜水は、応需送気式の潜水で、一般に船上のコンプレッサーによって送気し、比較的長時間の水中作業が可能である。$c$, false, 3),
  ('2c3387d0-08b4-48b4-92b8-bb906c9106fb', $c$ヘルメット式潜水は、金属製のヘルメットとゴム製の潜水服により構成された潜水器を使用し、操作は比較的簡単で、複雑な浮力調整が必要ない。$c$, false, 4),
  ('2c3387d0-08b4-48b4-92b8-bb906c9106fb', $c$自給気式潜水は、一般に、リブリーザーを使用した閉鎖循環式スクーバで、潜水者の行動を制限する送気ホースなどが無いので作業の自由度が高い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bd788ddc-9ff2-46ce-aab6-7e3de8d06a32',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水業務の危険性に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bd788ddc-9ff2-46ce-aab6-7e3de8d06a32', $c$潮流のある場所における水中作業で潜水者が潮流によって受ける抵抗は、スクーバ式潜水が最も小さく、全面マスク式潜水、ヘルメット式潜水の順に大きくなる。$c$, true, 1),
  ('bd788ddc-9ff2-46ce-aab6-7e3de8d06a32', $c$水中での溶接・溶断作業では、空気がないのでガス爆発の危険はないが、水は空気よりも電気をよく通すので感電する危険がある。$c$, false, 2),
  ('bd788ddc-9ff2-46ce-aab6-7e3de8d06a32', $c$視界の良いときより、海水が濁って視界の悪いときの方が、サメやシャチのような海の生物による危険性が低い。$c$, false, 3),
  ('bd788ddc-9ff2-46ce-aab6-7e3de8d06a32', $c$海中の生物による危険には、サンゴ、フジツボなどによる切り傷、タコ、ウツボなどによる刺し傷のほか、イモガイ類、ガンガゼなどによるかみ傷がある。$c$, false, 4),
  ('bd788ddc-9ff2-46ce-aab6-7e3de8d06a32', $c$潜水作業中、海上衝突を予防するため、潜水作業船に下の図に示す国際信号書Ａ旗板(青色・白色)を掲揚する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '05bb3ede-81c3-481e-8a6c-faa87bbf420b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水墜落又は吹き上げに関し、正しいものは次のうちどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('05bb3ede-81c3-481e-8a6c-faa87bbf420b', $c$潜水墜落は、潜水服内部の圧力と水圧の平衡が崩れ、内部の圧力が水圧より高くなったときに起こる。$c$, false, 1),
  ('05bb3ede-81c3-481e-8a6c-faa87bbf420b', $c$吹き上げ時の対応を誤ると、潜水墜落を起こすことがあるが、潜水墜落時の対応を誤っても、吹き上げを起こすことはない。$c$, false, 2),
  ('05bb3ede-81c3-481e-8a6c-faa87bbf420b', $c$ヘルメット式潜水においては、潜水服のベルトの締め付け不足は、吹き上げの原因となる。$c$, true, 3),
  ('05bb3ede-81c3-481e-8a6c-faa87bbf420b', $c$流れの速い場所でのヘルメット式潜水においては、送気ホースや信号索をたるませず、まっすぐに張るようにして潜水すると吹き上げになりにくい。$c$, false, 4),
  ('05bb3ede-81c3-481e-8a6c-faa87bbf420b', $c$スクーバ式潜水は、送気式ではないので、潜水服としてウエットスーツ又はドライスーツのいずれを使用する場合も、吹き上げの危険性はない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '128b911a-e2d8-4776-9b8b-594b698ece5e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水中拘束又は溺れに関し、正しいものは次のうちどれか｡$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('128b911a-e2d8-4776-9b8b-594b698ece5e', $c$ヘルメット式潜水では、溺れを予防するため、救命胴衣又はＢＣを必ず着用する。$c$, false, 1),
  ('128b911a-e2d8-4776-9b8b-594b698ece5e', $c$送気ホースを使用しないスクーバ式潜水では、ロープなどに絡まる水中拘束のおそれはない。$c$, false, 2),
  ('128b911a-e2d8-4776-9b8b-594b698ece5e', $c$沈船、洞窟などの狭い場所では、ガイドロープを使うと絡む危険があるので、使わないようにする。$c$, false, 3),
  ('128b911a-e2d8-4776-9b8b-594b698ece5e', $c$ダムの取水口付近で足が吸い込まれ、動けなくなって水中拘束になることがある。$c$, true, 4),
  ('128b911a-e2d8-4776-9b8b-594b698ece5e', $c$水中拘束によって水中滞在時間が延長した場合には、延長した時間に応じて浮上時間を短縮する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cc7f5b61-b39e-496c-b054-ea16e6d8bf06',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$特殊な環境下における潜水に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cc7f5b61-b39e-496c-b054-ea16e6d8bf06', $c$河川での潜水では、流れの速さに特に注意する必要があるので、命綱を使用したり、装着するウエイト重量を増やしたりする。$c$, false, 1),
  ('cc7f5b61-b39e-496c-b054-ea16e6d8bf06', $c$淡水よりも海水の方がわずかに浮力が大きいため、湖で行う潜水に比べて、海で行う潜水にはより多くのウエイトが必要となる。$c$, false, 2),
  ('cc7f5b61-b39e-496c-b054-ea16e6d8bf06', $c$冷水域での潜水では、潜水呼吸器のデマンドバルブ部分が凍結することがあるので、凍結防止対策が施された潜水呼吸器を使用する。$c$, false, 3),
  ('cc7f5b61-b39e-496c-b054-ea16e6d8bf06', $c$山岳部のダムなど高所域での潜水では、通常の海洋での潜水よりも長い減圧浮上時間が必要となる。$c$, false, 4),
  ('cc7f5b61-b39e-496c-b054-ea16e6d8bf06', $c$暗渠内では、送気ホースが絡まって水中拘束となるおそれがあるため、送気式潜水を行ってはならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4374870d-b9a4-4dd8-9954-15922b87664c',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$全面マスク式潜水の送気系統を示した下の図において、ＡからＣの設備の名称の組合せとして、正しいものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問11',
  '/exam-figures/diver/2026-04/q11.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4374870d-b9a4-4dd8-9954-15922b87664c', $c$Ａ：ストレーナ　Ｂ：圧力調整装置　Ｃ：空気清浄装置$c$, false, 1),
  ('4374870d-b9a4-4dd8-9954-15922b87664c', $c$Ａ：ストレーナ　Ｂ：圧力調整装置　Ｃ：予備ボンベ$c$, false, 2),
  ('4374870d-b9a4-4dd8-9954-15922b87664c', $c$Ａ：コンプレッサー　Ｂ：圧力調整装置　Ｃ：空気清浄装置$c$, false, 3),
  ('4374870d-b9a4-4dd8-9954-15922b87664c', $c$Ａ：コンプレッサー　Ｂ：調節用空気槽　Ｃ：空気清浄装置$c$, false, 4),
  ('4374870d-b9a4-4dd8-9954-15922b87664c', $c$Ａ：コンプレッサー　Ｂ：調節用空気槽　Ｃ：予備ボンベ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '80bbf70f-ab00-420f-bfb2-83e2c024cb1b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に用いるコンプレッサーに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('80bbf70f-ab00-420f-bfb2-83e2c024cb1b', $c$予備空気槽は、コンプレッサーの故障などの事故が発生した場合に備えて、必要な空気をあらかじめ蓄えておくためのものである。$c$, false, 1),
  ('80bbf70f-ab00-420f-bfb2-83e2c024cb1b', $c$コンプレッサーの機能・性能を保持するためには、原動機とコンプレッサーとの伝動部分をはじめ、冷却装置、圧縮部、潤滑油部などについて保守・点検を行う必要がある。$c$, false, 2),
  ('80bbf70f-ab00-420f-bfb2-83e2c024cb1b', $c$潜水作業船に設置する固定式のコンプレッサーの空気取入口は、機関室の外に設置する。$c$, false, 3),
  ('80bbf70f-ab00-420f-bfb2-83e2c024cb1b', $c$コンプレッサーの圧縮効率は、圧力の上昇に伴い増加する。$c$, true, 4),
  ('80bbf70f-ab00-420f-bfb2-83e2c024cb1b', $c$スクーバ式潜水のボンベの充塡に用いる高圧コンプレッサーの最高充塡圧力は、一般に約20ＭPaであるが約30ＭPaの機種もある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '98fd4bd3-6ddc-4263-9b74-cb0200ce0868',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$送気式潜水に使用する設備又は器具に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('98fd4bd3-6ddc-4263-9b74-cb0200ce0868', $c$全面マスク式潜水では、通常、送気ホースは、呼び径が13㎜のものが使われている。$c$, false, 1),
  ('98fd4bd3-6ddc-4263-9b74-cb0200ce0868', $c$送気ホースには、比重により沈用、半浮用及び浮用の３種類のホースがあり、作業内容によって使い分けられる。$c$, true, 2),
  ('98fd4bd3-6ddc-4263-9b74-cb0200ce0868', $c$流量計は、コンプレッサーと調節用空気槽の間に取り付けて、潜水者に送られる空気量を測る計器である。$c$, false, 3),
  ('98fd4bd3-6ddc-4263-9b74-cb0200ce0868', $c$フェルトを使用した空気清浄装置は、潜水者に送る圧縮空気に含まれる水分と油分のほか、二酸化炭素と一酸化炭素を除去する。$c$, false, 4),
  ('98fd4bd3-6ddc-4263-9b74-cb0200ce0868', $c$終業後、調節用空気槽には、内部に0.1ＭPa(ゲージ圧力)程度の空気を残すようにしておく。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'aaa41051-65e9-4700-9cce-29937752aec9',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水における浮力調整具の操作などに関する次の文中の[ ]内に入れるＡからＣの語句の組合せとして、正しいものは(１)～(５)のうちどれか。「潜降に当たっては、まず、レギュレーターのマウスピースに空気を吹き込み、セカンドステージの低圧室と[ Ａ ]内の水を押し出してから呼吸を開始する。浮力調整具を装着している場合[ Ｂ ]を肩より上に上げて[ Ｃ ]を押して潜降を始める。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('aaa41051-65e9-4700-9cce-29937752aec9', $c$Ａ：マウスピース　Ｂ：中圧ホース　Ｃ：給気ボタン$c$, false, 1),
  ('aaa41051-65e9-4700-9cce-29937752aec9', $c$Ａ：マウスピース　Ｂ：インフレーター　Ｃ：給気ボタン$c$, false, 2),
  ('aaa41051-65e9-4700-9cce-29937752aec9', $c$Ａ：マウスピース　Ｂ：インフレーター　Ｃ：排気ボタン$c$, true, 3),
  ('aaa41051-65e9-4700-9cce-29937752aec9', $c$Ａ：マスク　Ｂ：中圧ホース　Ｃ：給気ボタン$c$, false, 4),
  ('aaa41051-65e9-4700-9cce-29937752aec9', $c$Ａ：マスク　Ｂ：インフレーター　Ｃ：排気ボタン$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '65d78fa7-3926-4d3d-9bf8-5a6d280be73d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$ヘルメット式潜水における浮上の方法(緊急時の措置を含む。)に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('65d78fa7-3926-4d3d-9bf8-5a6d280be73d', $c$浮上の際には、さがり綱(潜降索)は使用しないようにする。$c$, true, 1),
  ('65d78fa7-3926-4d3d-9bf8-5a6d280be73d', $c$緊急浮上の場合以外は、毎分10ｍを超えない速度で浮上する。$c$, false, 2),
  ('65d78fa7-3926-4d3d-9bf8-5a6d280be73d', $c$無減圧潜水の範囲内の潜水の場合でも、緊急浮上の場合以外は、水深３ｍ前後で安全のため、５分ほど浮上停止を行うようにする。$c$, false, 3),
  ('65d78fa7-3926-4d3d-9bf8-5a6d280be73d', $c$緊急浮上を要する場合は、所定の浮上停止を省略し、又は所定の浮上停止時間を短縮し、水面まで浮上する。$c$, false, 4),
  ('65d78fa7-3926-4d3d-9bf8-5a6d280be73d', $c$吹き上げにより急速に浮上した場合には、無減圧潜水の範囲内の潜水であっても、直ちに再圧処置を行うようにする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4041a1e1-3e27-4c5a-bef7-2879e8ef758e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$生体の組織をいくつかの半飽和組織に分類して不活性ガスの分圧の計算を行うビュールマンのＺＨ-Ｌ16モデルにおける半飽和時間及び半飽和組織に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4041a1e1-3e27-4c5a-bef7-2879e8ef758e', $c$半飽和時間とは、ある組織に不活性ガスが飽和するまでにかかる時間の半分の時間のことである。$c$, true, 1),
  ('4041a1e1-3e27-4c5a-bef7-2879e8ef758e', $c$生体の組織を、半飽和時間の違いにより16の半飽和組織に分類し、不活性ガスの分圧を計算する。$c$, false, 2),
  ('4041a1e1-3e27-4c5a-bef7-2879e8ef758e', $c$半飽和組織は、理論上の概念として考える組織(生体の構成要素)であり、特定の個々の組織を示すものではない。$c$, false, 3),
  ('4041a1e1-3e27-4c5a-bef7-2879e8ef758e', $c$不活性ガスの半飽和時間が短い組織は血流が豊富であり、不活性ガスの半飽和時間が長い組織は血流が乏しい。$c$, false, 4),
  ('4041a1e1-3e27-4c5a-bef7-2879e8ef758e', $c$全ての半飽和組織の半飽和時間は、ヘリウムより窒素の方が長い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ec8fc772-1377-4625-ad19-ba122ca38091',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$ヘルメット式潜水器などに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ec8fc772-1377-4625-ad19-ba122ca38091', $c$排気弁(キリップ)は、潜水者自身が頭で押して操作するほか、手を使って外部から操作することもできる。$c$, false, 1),
  ('ec8fc772-1377-4625-ad19-ba122ca38091', $c$ヘルメット式潜水器は、ヘルメット本体とかぶと台で構成され、使用時には、着用した潜水服の襟ゴム部分にかぶと台を取り付け、押え金と蝶ねじで固定する。$c$, false, 2),
  ('ec8fc772-1377-4625-ad19-ba122ca38091', $c$ヘルメットの送気ホース取付口には、逆止弁が組み込まれていて、この弁で送気された圧縮空気の逆流を防ぐ。$c$, false, 3),
  ('ec8fc772-1377-4625-ad19-ba122ca38091', $c$ドレーンコックは、潜水者が唾をヘルメットの外に排出するときに使用する。$c$, false, 4),
  ('ec8fc772-1377-4625-ad19-ba122ca38091', $c$腰バルブには減圧弁が組み込まれていて、潜水者の呼吸量に応じて自動的に送気空気量を調節する。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8f780635-0d58-421f-b4b3-b6be46455ee4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水の装備に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8f780635-0d58-421f-b4b3-b6be46455ee4', $c$ボンベは、一般に、内容積が10～14Ｌで、最高充塡圧力が19.6ＭPa(ゲージ圧力)である。$c$, false, 1),
  ('8f780635-0d58-421f-b4b3-b6be46455ee4', $c$空気専用ボンベは、ボンベの表面積の２分の１以上がねずみ色に塗色されている。$c$, false, 2),
  ('8f780635-0d58-421f-b4b3-b6be46455ee4', $c$ボンベは、終業後十分に水洗いを行い、錆の発生、キズ、破損などがないかを確認し、内部に空気を残さないようにして保管する。$c$, true, 3),
  ('8f780635-0d58-421f-b4b3-b6be46455ee4', $c$ボンベ内の空気残量を把握するため取り付ける残圧計には、ボンベの高圧空気が送られる。$c$, false, 4),
  ('8f780635-0d58-421f-b4b3-b6be46455ee4', $c$圧力調整器は、高圧空気を１ＭPa(ゲージ圧力)前後に減圧するファーストステージと、更に潜水深度の圧力まで減圧するセカンドステージで構成される。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'efbc7be3-013e-4c24-aa08-d1002851dbd5',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$全面マスク式潜水の装備に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('efbc7be3-013e-4c24-aa08-d1002851dbd5', $c$全面マスク式潜水器では、ヘルメット式潜水器に比べて少ない送気量で潜水することができる。$c$, false, 1),
  ('efbc7be3-013e-4c24-aa08-d1002851dbd5', $c$全面マスク式潜水器には、全面マスクにスクーバ用のセカンドステージレギュレーターを取り付ける簡易なタイプがある。$c$, false, 2),
  ('efbc7be3-013e-4c24-aa08-d1002851dbd5', $c$全面マスク式潜水では、小型のボンベを携行して潜水することがある。$c$, false, 3),
  ('efbc7be3-013e-4c24-aa08-d1002851dbd5', $c$全面マスク式潜水で使用する水中電話機用のイヤホンは、潜水中に外れることがないよう、外耳道にイヤーピースを差し込むものが一般的である。$c$, true, 4),
  ('efbc7be3-013e-4c24-aa08-d1002851dbd5', $c$混合ガス潜水に使われる全面マスク式潜水器には、バンドマスクタイプとヘルメットタイプがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0b8af73d-a09a-4793-91cb-b3b19a347d75',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に使用する装備又は器具に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0b8af73d-a09a-4793-91cb-b3b19a347d75', $c$水中時計には、現在時刻や潜水経過時間を表示するだけでなく、潜水深度の時間的経過の記録が可能なものもある。$c$, false, 1),
  ('0b8af73d-a09a-4793-91cb-b3b19a347d75', $c$さがり綱(潜降索)は、丈夫で耐候性のある素材で作られたロープで、太さ１～２cm程度のものを使用する。$c$, false, 2),
  ('0b8af73d-a09a-4793-91cb-b3b19a347d75', $c$全面マスク式潜水用ドライスーツは、ブーツと一体となっており、潜水靴を必要としない。$c$, false, 3),
  ('0b8af73d-a09a-4793-91cb-b3b19a347d75', $c$スクーバ式潜水で使用するオープンヒルタイプの足ヒレは、爪先だけを差し込み、踵をストラップで固定する方式である。$c$, false, 4),
  ('0b8af73d-a09a-4793-91cb-b3b19a347d75', $c$ヘルメット式潜水の場合、ヘルメット及び潜水服に重量があり、移動の際に大きな推進力が必要なので、スクーバ式潜水に比べて大きな足ヒレを用いる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '55e3d2d5-eb37-4b61-989e-7b23e66a7924',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$肺及び呼吸に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('55e3d2d5-eb37-4b61-989e-7b23e66a7924', $c$肺の表面と胸郭内側の面は、胸膜で覆われており、両者間の空間を胸膜腔という。$c$, false, 1),
  ('55e3d2d5-eb37-4b61-989e-7b23e66a7924', $c$肺は、肺胞と胸膜の協調運動によって膨らんだり縮んだりして、空気を出し入れしている。$c$, true, 2),
  ('55e3d2d5-eb37-4b61-989e-7b23e66a7924', $c$胸郭内容積が増し、内圧が低くなるにつれ、鼻腔、気管などの気道を経て肺内へ流れ込む空気が吸気である。$c$, false, 3),
  ('55e3d2d5-eb37-4b61-989e-7b23e66a7924', $c$肺胞内の空気と肺胞を取り巻く毛細血管中の血液との間で行われるガス交換を外呼吸という。$c$, false, 4),
  ('55e3d2d5-eb37-4b61-989e-7b23e66a7924', $c$二酸化炭素濃度は、通常の空気中では0.04％程度であるが、呼気中では４％程度となる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$正面から見た人体の血液循環経路の一部を模式的に表した下の図について、次の記述のうち誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問22',
  '/exam-figures/diver/2026-04/q22.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc', $c$血管Ａは、肺静脈である。$c$, true, 1),
  ('6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc', $c$心臓のＢの部分は、右心房である。$c$, false, 2),
  ('6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc', $c$血管Ｃは、大静脈である。$c$, false, 3),
  ('6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc', $c$心臓のＤの部分は、左心室である。$c$, false, 4),
  ('6f647e6e-6cd9-479c-b7df-ee41cbcaa4fc', $c$血管Ｅでの血液の流れる方向は、bである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9f568f76-7fb9-4b04-9981-da930f934f9d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$神経系に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9f568f76-7fb9-4b04-9981-da930f934f9d', $c$神経系は、身体を環境に順応させたり動かしたりするために、身体の各部の動きや連携の統制をつかさどる。$c$, false, 1),
  ('9f568f76-7fb9-4b04-9981-da930f934f9d', $c$神経系は、中枢神経系と末梢神経系に大別される。$c$, false, 2),
  ('9f568f76-7fb9-4b04-9981-da930f934f9d', $c$中枢神経系は、脳と脊髄から成り、脳は特に多くのエネルギーを消費するため、脳への酸素供給が数分間途絶えると修復困難な損傷を受ける。$c$, false, 3),
  ('9f568f76-7fb9-4b04-9981-da930f934f9d', $c$末梢神経は、体性神経と自律神経に分類される。$c$, false, 4),
  ('9f568f76-7fb9-4b04-9981-da930f934f9d', $c$感覚器官からの情報を中枢に伝える神経を体性神経といい、中枢からの命令を運動器官に伝える神経を自律神経という。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e99bed04-1220-4295-a62b-1ae5919fe88b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$人体に及ぼす水温の作用及び体温に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e99bed04-1220-4295-a62b-1ae5919fe88b', $c$体温は、代謝によって生じる産熱と、人体と外部環境の温度差に基づく放熱のバランスによって一定に保たれる。$c$, false, 1),
  ('e99bed04-1220-4295-a62b-1ae5919fe88b', $c$水の熱伝導率は空気の約10倍あるので、水中では、体温が奪われやすい。$c$, true, 2),
  ('e99bed04-1220-4295-a62b-1ae5919fe88b', $c$一般に、深部体温が35℃以下の状態を低体温症という。$c$, false, 3),
  ('e99bed04-1220-4295-a62b-1ae5919fe88b', $c$体温が低下し始めると、筋肉の緊張の増強、酸素摂取量の増加などの症状が現れる。$c$, false, 4),
  ('e99bed04-1220-4295-a62b-1ae5919fe88b', $c$水中で体温が低下すると、震え、意識の混濁や消失などを起こし、死に至ることもある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7015f1ca-f1f9-42f8-9f91-26d69b7d65de',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水によって生じる圧外傷に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7015f1ca-f1f9-42f8-9f91-26d69b7d65de', $c$圧外傷は、潜降又は浮上いずれのときでも生じ、潜降時のものをブロック、浮上時のものをスクィーズと呼ぶ。$c$, false, 1),
  ('7015f1ca-f1f9-42f8-9f91-26d69b7d65de', $c$潜降時の圧外傷は、潜降による圧力変化のために体腔内の空気の体積が増えることにより生じ、中耳腔、副鼻腔、面マスクの内部や潜水服と皮膚の間などで生じる。$c$, false, 2),
  ('7015f1ca-f1f9-42f8-9f91-26d69b7d65de', $c$浮上時の圧外傷は、浮上による圧力変化のために体腔内の空気の体積が減少することにより生じ、副鼻腔、肺などで生じる。$c$, false, 3),
  ('7015f1ca-f1f9-42f8-9f91-26d69b7d65de', $c$深さ２ｍ程度の浅い場所での潜水からの浮上でも、圧外傷が生じることがある。$c$, true, 4),
  ('7015f1ca-f1f9-42f8-9f91-26d69b7d65de', $c$潜降時の耳の圧外傷を防ぐためには、耳栓をするとよい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7e8091ef-701b-4711-b401-f95dae17c21b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水によって生じる空気塞栓症に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7e8091ef-701b-4711-b401-f95dae17c21b', $c$空気塞栓症は、急浮上などによる肺の過膨張が原因となって発症する。$c$, false, 1),
  ('7e8091ef-701b-4711-b401-f95dae17c21b', $c$空気塞栓症は、肺胞の毛細血管に侵入した空気が、動脈系の末梢血管を閉塞することにより起こる。$c$, false, 2),
  ('7e8091ef-701b-4711-b401-f95dae17c21b', $c$空気塞栓症は、脳においてはほとんど認められず、ほぼ全てが心臓において発症する。$c$, true, 3),
  ('7e8091ef-701b-4711-b401-f95dae17c21b', $c$空気塞栓症は、一般的には浮上してすぐに意識障害、痙攣発作などの重篤な症状を示す。$c$, false, 4),
  ('7e8091ef-701b-4711-b401-f95dae17c21b', $c$空気塞栓症を予防するには、浮上速度を守り、常に呼吸を続けながら浮上する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '13619d5e-63b7-4f68-b5db-f6705fb785f4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水業務における二酸化炭素中毒又は酸素中毒に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('13619d5e-63b7-4f68-b5db-f6705fb785f4', $c$二酸化炭素中毒は、二酸化炭素が血液中の赤血球に含まれるヘモグロビンと強く結合し、酸素の運搬ができなくなるために起こる。$c$, false, 1),
  ('13619d5e-63b7-4f68-b5db-f6705fb785f4', $c$スクーバ式潜水では、二酸化炭素中毒は生じないが、ヘルメット式潜水では、ヘルメット内に吐き出した呼気により二酸化炭素濃度が高くなって中毒を起こすことがある。$c$, false, 2),
  ('13619d5e-63b7-4f68-b5db-f6705fb785f4', $c$酸素中毒は、酸素分圧の高いガスの吸入によって生じ、呼吸ガス中に二酸化炭素が多いときには起こりにくい。$c$, false, 3),
  ('13619d5e-63b7-4f68-b5db-f6705fb785f4', $c$脳酸素中毒は、50kPa程度の酸素分圧の呼吸ガスを長時間呼吸したときに生じ、肺酸素中毒は、140～160kPa程度の酸素分圧の呼吸ガスを短時間呼吸したときに生じる。$c$, false, 4),
  ('13619d5e-63b7-4f68-b5db-f6705fb785f4', $c$肺酸素中毒は、致命的になることは通常は考えられないが、肺機能の低下をもたらし、肺活量が減少することがある。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ef376363-a36b-487a-a191-bafc73810228',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水によって生じる骨壊死に関する次の文中の[ ]内に入れるＡからＣの語句の組合せとして、正しいものは(１)～(５)のうちどれか。「骨壊死は、[ Ａ ]に罹患した潜水者に多くみられる。症状は発症の部位によって異なり、[ Ｂ ]に発症した場合には大きな障害がみられないが、[ Ｃ ]に出現した場合には歩行障害等を訴えることが多い。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ef376363-a36b-487a-a191-bafc73810228', $c$Ａ：ベンズ　Ｂ：骨端(骨頭)　Ｃ：骨幹部$c$, false, 1),
  ('ef376363-a36b-487a-a191-bafc73810228', $c$Ａ：酸素中毒　Ｂ：骨幹部　Ｃ：骨端(骨頭)$c$, false, 2),
  ('ef376363-a36b-487a-a191-bafc73810228', $c$Ａ：減圧症　Ｂ：骨端(骨頭)　Ｃ：骨幹部$c$, false, 3),
  ('ef376363-a36b-487a-a191-bafc73810228', $c$Ａ：減圧症　Ｂ：骨幹部　Ｃ：骨端(骨頭)$c$, true, 4),
  ('ef376363-a36b-487a-a191-bafc73810228', $c$Ａ：低体温症　Ｂ：骨幹部　Ｃ：骨端(骨頭)$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd35d2aaf-d150-41f8-8022-ee62263a8fc6',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水業務における健康管理に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d35d2aaf-d150-41f8-8022-ee62263a8fc6', $c$潜水業務に常時従事する労働者に対する健康診断では、四肢の運動機能などの検査のほか、必要な場合は、作業条件調査などを行う。$c$, false, 1),
  ('d35d2aaf-d150-41f8-8022-ee62263a8fc6', $c$健康診断において行われる関節部のエックス線直接撮影による検査は、骨壊死のチェックのためで、通常、股関節、肩関節、膝関節など侵されやすい部位が対象となる。$c$, false, 2),
  ('d35d2aaf-d150-41f8-8022-ee62263a8fc6', $c$前日の飲酒により体内にアルコールが残った状態で潜水すると、減圧症や低体温症の発症リスクが高くなる。$c$, false, 3),
  ('d35d2aaf-d150-41f8-8022-ee62263a8fc6', $c$減圧症の再圧治療が終了した後しばらくは、体内にまだ余分な窒素が残っているので、そのまま再び潜水すると減圧症を再発するおそれがある。$c$, false, 4),
  ('d35d2aaf-d150-41f8-8022-ee62263a8fc6', $c$空気塞栓症のリスクを評価する指標としてＵＰＴＤ(肺酸素毒性量単位)があり、１日のばく露量が一定の値以下となるように管理する必要がある。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$一次救命処置に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9', $c$傷病者の反応の有無を確認し、反応がない場合には、大声で叫んで周囲の注意を喚起し、協力を求める。$c$, false, 1),
  ('c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9', $c$反応はないが普段どおりの呼吸をしている傷病者は、回復体位をとらせて安静にして、経過を観察する。$c$, false, 2),
  ('c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9', $c$しゃくりあげるような途切れ途切れの呼吸がみられる場合は、心停止の直後にみられる死戦期呼吸と判断し、胸骨圧迫を開始する。$c$, false, 3),
  ('c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9', $c$胸骨圧迫を行うときは、傷病者を柔らかいふとんの上に寝かせて行う。$c$, true, 4),
  ('c95f1673-ed20-49ba-ba0f-8c25aa3f2aa9', $c$胸骨圧迫は、胸が約５cm沈む強さで胸骨の下半分を圧迫し、１分間に100～120回のテンポで行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '643342af-708e-4ce8-b921-58c5c635d3ca',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$全面マスク式潜水で空気圧縮機により送気し、最高深度20ｍの潜水業務を行う場合、潜水業務従事者ごとに設ける予備空気槽の内容積Ｖ(Ｌ)として最小限必要な値に最も近いものは、法令上、(１)～(５)のうちどれか。ただし、イ又はロのうち適切な式を用いて算定すること。なお、Ｄは最高の潜水深度(ｍ)であり、Ｐは予備空気槽内の空気圧力で0.7ＭPa(ゲージ圧力)とする。
イ Ｖ＝40（0.03Ｄ＋0.4）／Ｐ
ロ Ｖ＝60（0.03Ｄ＋0.4）／Ｐ$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('643342af-708e-4ce8-b921-58c5c635d3ca', $c$58 Ｌ$c$, true, 1),
  ('643342af-708e-4ce8-b921-58c5c635d3ca', $c$65 Ｌ$c$, false, 2),
  ('643342af-708e-4ce8-b921-58c5c635d3ca', $c$75 Ｌ$c$, false, 3),
  ('643342af-708e-4ce8-b921-58c5c635d3ca', $c$86 Ｌ$c$, false, 4),
  ('643342af-708e-4ce8-b921-58c5c635d3ca', $c$112 Ｌ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ff1ac540-530e-4beb-9913-6ab2a4579f4b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$再圧室を操作する業務(再圧室操作業務)及び潜水作業者への送気の調節を行うためのバルブ又はコックを操作する業務(送気調節業務)に従事する労働者に対して行う特別の教育に関し、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ff1ac540-530e-4beb-9913-6ab2a4579f4b', $c$再圧室操作業務に従事する労働者に対して行う特別の教育の教育事項には、「高気圧障害の知識に関すること」、「救急再圧法に関すること」及び「関係法令」が含まれている。$c$, false, 1),
  ('ff1ac540-530e-4beb-9913-6ab2a4579f4b', $c$再圧室操作業務に従事する労働者に対して行う特別の教育の教育事項には、「救急そ生法に関すること」及び「再圧室の操作及び救急そ生法に関する実技」が含まれている。$c$, false, 2),
  ('ff1ac540-530e-4beb-9913-6ab2a4579f4b', $c$送気調節業務に従事する労働者に対して行う特別の教育の教育事項には、「潜水業務に関する知識に関すること」、「高気圧障害の知識に関すること」及び「関係法令」が含まれている。$c$, false, 3),
  ('ff1ac540-530e-4beb-9913-6ab2a4579f4b', $c$送気調節業務に従事する労働者に対して行う特別の教育の教育事項には、「送気設備の構造に関すること」及び「空気圧縮機の運転に関する実技」が含まれている。$c$, true, 4),
  ('ff1ac540-530e-4beb-9913-6ab2a4579f4b', $c$特別の教育の科目の全部又は一部について、十分な知識及び技能を有していると認められる労働者については、その科目についての教育を省略することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e143f09d-16a6-4b9b-8af8-b8822e4af274',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$携行させたボンベ(非常用のものを除く。)からの給気を受けて行う潜水業務に関し、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e143f09d-16a6-4b9b-8af8-b8822e4af274', $c$潜降直前に、潜水業務従事者に対し、当該潜水業務に使用するボンベの現に有する給気能力を知らせなければならない。$c$, false, 1),
  ('e143f09d-16a6-4b9b-8af8-b8822e4af274', $c$潜水業務従事者に異常がないかどうかを監視するための者を置かなければならない。$c$, false, 2),
  ('e143f09d-16a6-4b9b-8af8-b8822e4af274', $c$圧力１ＭPa(ゲージ圧力)以上の気体を充塡したボンベからの給気を受けさせるときは、２段以上の減圧方式による圧力調整器を潜水業務従事者に使用させなければならない。$c$, false, 3),
  ('e143f09d-16a6-4b9b-8af8-b8822e4af274', $c$潜水深度が10ｍ未満の潜水業務でも、潜水業務従事者に、さがり綱(潜降索)を使用させなければならない。$c$, false, 4),
  ('e143f09d-16a6-4b9b-8af8-b8822e4af274', $c$潜水業務従事者の潜降速度は、毎分10ｍ以下としなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9395648d-45b7-45cc-9742-7b44e872b9db',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$ヘルメット式潜水で空気圧縮機により送気する潜水業務を行うとき、法令上、潜水前の点検が義務付けられていない潜水器具は次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9395648d-45b7-45cc-9742-7b44e872b9db', $c$水深計$c$, true, 1),
  ('9395648d-45b7-45cc-9742-7b44e872b9db', $c$さがり綱（潜降索）$c$, false, 2),
  ('9395648d-45b7-45cc-9742-7b44e872b9db', $c$信号索$c$, false, 3),
  ('9395648d-45b7-45cc-9742-7b44e872b9db', $c$送気管$c$, false, 4),
  ('9395648d-45b7-45cc-9742-7b44e872b9db', $c$潜水器$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd308a75e-30c9-4f3f-8e91-59be319d2c65',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$送気式潜水による潜水業務における連絡員に関し、法令上、定められていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d308a75e-30c9-4f3f-8e91-59be319d2c65', $c$連絡員の配置は、潜水業務従事者２人以下ごとに１人とする。$c$, false, 1),
  ('d308a75e-30c9-4f3f-8e91-59be319d2c65', $c$連絡員は、潜水業務従事者と連絡して、その者の潜降及び浮上を適正に行わせる。$c$, false, 2),
  ('d308a75e-30c9-4f3f-8e91-59be319d2c65', $c$連絡員は、ヘルメット式潜水器を用いて行う潜水業務にあっては、潜降直後に、潜水業務従事者のヘルメットがかぶと台に結合され空気漏れがないことを水中の泡により確認する。$c$, true, 3),
  ('d308a75e-30c9-4f3f-8e91-59be319d2c65', $c$連絡員は、潜水業務従事者への送気の調節を行うためのバルブ又はコックを操作する業務に従事する者と連絡して、潜水業務従事者に必要な量の空気を送気させる。$c$, false, 4),
  ('d308a75e-30c9-4f3f-8e91-59be319d2c65', $c$連絡員は、送気設備の故障その他の事故により、潜水業務従事者に危険又は健康障害の生ずるおそれがあるときは、速やかに潜水業務従事者に連絡する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6a15162f-ee17-47b1-9402-ebfc8a2b8a8d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水作業者と連絡員とが通話することができる通話装置がない場合における、潜水作業者の携行物に関する次の文中の[ ]内に入れるＡ及びＢの語句の組合せとして、法令上、正しいものは(１)～(５)のうちどれか。「空気圧縮機により送気して行う潜水業務を行うときは、潜水作業者に[ Ａ ]、水中時計、[ Ｂ ]及び鋭利な刃物を携行させなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6a15162f-ee17-47b1-9402-ebfc8a2b8a8d', $c$Ａ：コンパス　Ｂ：水深計$c$, false, 1),
  ('6a15162f-ee17-47b1-9402-ebfc8a2b8a8d', $c$Ａ：コンパス　Ｂ：水中ライト$c$, false, 2),
  ('6a15162f-ee17-47b1-9402-ebfc8a2b8a8d', $c$Ａ：水中ライト　Ｂ：信号索$c$, false, 3),
  ('6a15162f-ee17-47b1-9402-ebfc8a2b8a8d', $c$Ａ：信号索　Ｂ：水深計$c$, true, 4),
  ('6a15162f-ee17-47b1-9402-ebfc8a2b8a8d', $c$Ａ：水深計　Ｂ：残圧計$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務に常時従事する労働者に対して行う高気圧業務健康診断に関し、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a', $c$健康診断は、雇入れの際、潜水業務への配置替えの際及び潜水業務についた後６か月以内ごとに１回、定期に、行わなければならない。$c$, false, 1),
  ('914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a', $c$健康診断の対象者は、水深10ｍ以上の場所で行う潜水業務に常時従事する労働者であり、水深10ｍ未満の場所で行う潜水業務のみに常時従事する労働者は対象ではない。$c$, true, 2),
  ('914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a', $c$事業場において実施した健康診断の結果、異常の所見があると診断された労働者については、健康診断が行われた日から３か月以内に医師からの意見聴取を行わなければならない。$c$, false, 3),
  ('914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a', $c$健康診断結果に基づいて、高気圧業務健康診断個人票を作成し、これを５年間保存しなければならない。$c$, false, 4),
  ('914f1735-a033-4a4a-9fd6-1e5c8d4d9a0a', $c$定期の健康診断を行ったときは、遅滞なく、高気圧業務健康診断結果報告書を所轄労働基準監督署長に提出しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9711588c-fc1e-48cd-b6fa-8db9bd776fe1',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$再圧室に関する次のＡからＤの記述について、法令上、正しいものの組合せは(１)～(５)のうちどれか。
Ａ 再圧室を設置した場所及び再圧室を操作する場所に、必要のある者以外の者が立ち入ることを禁止しなければならない。
Ｂ 再圧室を使用するときは、再圧室の操作を行う者に加圧及び減圧の状態その他異常の有無について常時監視させなければならない。
Ｃ 再圧室は、出入りに必要な場合を除き、主室と副室との間の扉を閉じ、かつ、副室の圧力は主室の圧力よりも低く保たなければならない。
Ｄ 再圧室については、設置時及びその後３か月をこえない期間ごとに一定の事項について点検しなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9711588c-fc1e-48cd-b6fa-8db9bd776fe1', $c$Ａ，Ｂ$c$, true, 1),
  ('9711588c-fc1e-48cd-b6fa-8db9bd776fe1', $c$Ａ，Ｃ$c$, false, 2),
  ('9711588c-fc1e-48cd-b6fa-8db9bd776fe1', $c$Ａ，Ｄ$c$, false, 3),
  ('9711588c-fc1e-48cd-b6fa-8db9bd776fe1', $c$Ｂ，Ｃ$c$, false, 4),
  ('9711588c-fc1e-48cd-b6fa-8db9bd776fe1', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8bbff369-ad81-4268-927d-3cd41bd2ac4c',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水士免許に関する次のＡからＤの記述について、法令上、誤っているものの組合せは(１)～(５)のうちどれか。
Ａ 潜水器を用い、かつ、空気圧縮機による送気又はボンベからの給気を受けて、水中において行う業務は、潜水士免許を受けた者でなければ、就くことができない。
Ｂ 満20歳に満たない者は、免許を受けることができない。
Ｃ 故意又は重大な過失により、潜水業務について重大な事故を発生させたときは、免許の取消しの処分を受けることがある。
Ｄ 免許を受けることができる者は、潜水士免許試験に合格した者に限られる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8bbff369-ad81-4268-927d-3cd41bd2ac4c', $c$Ａ，Ｂ$c$, false, 1),
  ('8bbff369-ad81-4268-927d-3cd41bd2ac4c', $c$Ａ，Ｃ$c$, false, 2),
  ('8bbff369-ad81-4268-927d-3cd41bd2ac4c', $c$Ａ，Ｄ$c$, false, 3),
  ('8bbff369-ad81-4268-927d-3cd41bd2ac4c', $c$Ｂ，Ｄ$c$, true, 4),
  ('8bbff369-ad81-4268-927d-3cd41bd2ac4c', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '85ad687d-ede4-4716-9b6a-2d2c5249a8f4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水作業における酸素分圧の制限に関する次の文中の[ ]に入れるＡからＣの数値の組合せとして、法令上、正しいものは(１)～(５)のうちどれか。「潜水作業者が吸入する時点の酸素の分圧は、[ Ａ ]キロパスカル以上[ Ｂ ]キロパスカル以下でなければならない。ただし、潜水作業者が溺水しないよう必要な措置を講じて浮上を行わせる場合にあっては、[ Ａ ]キロパスカル以上[ Ｃ ]キロパスカル以下でなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 潜水士試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('85ad687d-ede4-4716-9b6a-2d2c5249a8f4', $c$Ａ：18　Ｂ：160　Ｃ：220$c$, true, 1),
  ('85ad687d-ede4-4716-9b6a-2d2c5249a8f4', $c$Ａ：18　Ｂ：160　Ｃ：320$c$, false, 2),
  ('85ad687d-ede4-4716-9b6a-2d2c5249a8f4', $c$Ａ：18　Ｂ：180　Ｃ：360$c$, false, 3),
  ('85ad687d-ede4-4716-9b6a-2d2c5249a8f4', $c$Ａ：20　Ｂ：180　Ｃ：220$c$, false, 4),
  ('85ad687d-ede4-4716-9b6a-2d2c5249a8f4', $c$Ａ：20　Ｂ：200　Ｃ：360$c$, false, 5);

do $$
declare
  diver_2026_04 int;
  scoped int;
begin
  select count(*) into diver_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 潜水士試験%';

  if diver_2026_04 <> 40 then
    raise exception 'diver 2026-04 sitting must be 40 questions (got %)', diver_2026_04;
  end if;

  select count(*) into scoped
  from mock_exams
  where exam_id = 'diver'
    and category_scope is not null;

  if scoped <> 0 then
    raise exception 'diver mocks must not use category_scope (got %)', scoped;
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
  'diver',
  exam_types.id,
  '潜水士模擬試験(令和8年4月)',
  240,
  40,
  '令和8年4月公表 潜水士試験'
from exam_types
where exam_types.exam_id = 'diver'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'diver'
      and source_filter = '令和8年4月公表 潜水士試験'
      and category_scope is null
  );
