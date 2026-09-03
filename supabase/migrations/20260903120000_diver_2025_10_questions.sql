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
  '622a4f6b-3ed2-4e87-bff1-91afb5e469b5',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$空気をゲージ圧力0.3MPaに加圧したとき、窒素の分圧(絶対圧力)に最も近いものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('622a4f6b-3ed2-4e87-bff1-91afb5e469b5', $c$0.06 MPa$c$, false, 1),
  ('622a4f6b-3ed2-4e87-bff1-91afb5e469b5', $c$0.20 MPa$c$, false, 2),
  ('622a4f6b-3ed2-4e87-bff1-91afb5e469b5', $c$0.23 MPa$c$, false, 3),
  ('622a4f6b-3ed2-4e87-bff1-91afb5e469b5', $c$0.31 MPa$c$, true, 4),
  ('622a4f6b-3ed2-4e87-bff1-91afb5e469b5', $c$0.40 MPa$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9b5139de-6bde-4b07-a5aa-673e2ad4768e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$深さ10ｍの水中において中性浮力の状態で静止している、体積500cm³で質量４kgの重りをつるした空気入りのゴム風船を、水面上まで浮上させたときのゴム風船の体積に最も近いものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9b5139de-6bde-4b07-a5aa-673e2ad4768e', $c$4 L$c$, false, 1),
  ('9b5139de-6bde-4b07-a5aa-673e2ad4768e', $c$4.5 L$c$, false, 2),
  ('9b5139de-6bde-4b07-a5aa-673e2ad4768e', $c$5 L$c$, false, 3),
  ('9b5139de-6bde-4b07-a5aa-673e2ad4768e', $c$7 L$c$, true, 4),
  ('9b5139de-6bde-4b07-a5aa-673e2ad4768e', $c$9 L$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'fe0a1125-55cb-4a1d-aa25-35dc0097d20d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$気体の性質などに関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('fe0a1125-55cb-4a1d-aa25-35dc0097d20d', $c$窒素は、無色・無臭で、常温・常圧では化学的に安定した不活性の気体である。$c$, true, 1),
  ('fe0a1125-55cb-4a1d-aa25-35dc0097d20d', $c$ヘリウムは、密度が極めて大きく、他の元素と化合しにくい気体で、呼吸抵抗は少ない。$c$, false, 2),
  ('fe0a1125-55cb-4a1d-aa25-35dc0097d20d', $c$酸素は、無色・無臭の気体で、生命維持に必要不可欠なものであり、空気中の酸素濃度が高いほど人体に良い。$c$, false, 3),
  ('fe0a1125-55cb-4a1d-aa25-35dc0097d20d', $c$一酸化炭素は、物質の不完全燃焼などによって生じる無色の有毒な気体であり、物が焦げたような異臭がある。$c$, false, 4),
  ('fe0a1125-55cb-4a1d-aa25-35dc0097d20d', $c$二酸化炭素は、無色・無臭の気体で、空気中に約0.3％の割合で含まれている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '83290bec-3f8d-4305-81ea-38de6cb27c6b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$気体の液体への溶解に関する次の文中の〔　〕内に入れるＡ及びＢの語句の組合せとして、正しいものは(１)～(５)のうちどれか。
ただし、その気体のその液体に対する溶解度は小さく、また、その気体はその液体と反応する気体ではないものとする。
「温度が一定のとき、一定量の液体に溶解する気体の〔Ａ〕は、その気体の圧力に〔Ｂ〕。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('83290bec-3f8d-4305-81ea-38de6cb27c6b', $c$Ａ：体積　Ｂ：かかわらず一定である$c$, true, 1),
  ('83290bec-3f8d-4305-81ea-38de6cb27c6b', $c$Ａ：体積　Ｂ：反比例する$c$, false, 2),
  ('83290bec-3f8d-4305-81ea-38de6cb27c6b', $c$Ａ：体積　Ｂ：比例する$c$, false, 3),
  ('83290bec-3f8d-4305-81ea-38de6cb27c6b', $c$Ａ：質量　Ｂ：かかわらず一定である$c$, false, 4),
  ('83290bec-3f8d-4305-81ea-38de6cb27c6b', $c$Ａ：質量　Ｂ：反比例する$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3ad421c2-8c9b-4448-8df9-53522cf5b997',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水中における光や音に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3ad421c2-8c9b-4448-8df9-53522cf5b997', $c$水分子による光の吸収の度合いは、光の波長によって異なり、波長の長い青色は、波長の短い赤色より吸収されやすい。$c$, false, 1),
  ('3ad421c2-8c9b-4448-8df9-53522cf5b997', $c$水中では、音に対する両耳効果が増すので、音源の方向探知が容易になる。$c$, false, 2),
  ('3ad421c2-8c9b-4448-8df9-53522cf5b997', $c$光は、水と空気の境界で屈折し、顔マスクを通して水中の物体を見た場合、実際よりも大きく見える。$c$, false, 3),
  ('3ad421c2-8c9b-4448-8df9-53522cf5b997', $c$水中での音の伝播速度は、毎秒約1,400～1,500ｍである。$c$, true, 4),
  ('3ad421c2-8c9b-4448-8df9-53522cf5b997', $c$水は、空気と比べ密度が大きいので、水中では音は長い距離を伝播することができない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6d7c2b35-cf95-46f2-973a-4f551e506aee',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水の種類及び方式に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6d7c2b35-cf95-46f2-973a-4f551e506aee', $c$自給気式潜水で一般的に使用されている潜水器は、開放回路型スクーバ式潜水器である。$c$, false, 1),
  ('6d7c2b35-cf95-46f2-973a-4f551e506aee', $c$スクーバ式潜水は、軟式潜水であり、潜水者は直接人体に水圧を受ける。$c$, false, 2),
  ('6d7c2b35-cf95-46f2-973a-4f551e506aee', $c$全面マスク式潜水は、スクーバ式潜水と比べ、長時間の潜水作業が可能である。$c$, false, 3),
  ('6d7c2b35-cf95-46f2-973a-4f551e506aee', $c$全面マスク式潜水は、船上のコンプレッサーなどによって送気を行う潜水で、潜水者がボンベを携行することはない。$c$, true, 4),
  ('6d7c2b35-cf95-46f2-973a-4f551e506aee', $c$ヘルメット式潜水は、常時、連続的に潜水者に送気が行われる定量送気式の潜水方式である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '40cdfc53-72b7-482c-b5c4-744edc7b1b28',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水業務の危険性に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('40cdfc53-72b7-482c-b5c4-744edc7b1b28', $c$海中の生物による危険性としては、タコ、ウツボなどによりかまれること、ガンガゼ、ゴンズイなどにより刺されることなどがある。$c$, false, 1),
  ('40cdfc53-72b7-482c-b5c4-744edc7b1b28', $c$潮流の速い水域でスクーバ式潜水により潜水作業を行うときは、命綱を使用する。$c$, false, 2),
  ('40cdfc53-72b7-482c-b5c4-744edc7b1b28', $c$潜水作業中、海上衝突を予防するため、潜水作業船に国際信号書Ａ旗板(青色・白色の柄)を掲揚する。$c$, true, 3),
  ('40cdfc53-72b7-482c-b5c4-744edc7b1b28', $c$水中での溶接・溶断作業では、ガス爆発や感電の危険がある。$c$, false, 4),
  ('40cdfc53-72b7-482c-b5c4-744edc7b1b28', $c$水中作業による事故には、潜水ホースが潜水作業船のスクリューへ接触したり、巻き込まれることなどがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b15b9e9f-4076-4978-8116-28a06ef87668',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$潜水墜落又は吹き上げに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b15b9e9f-4076-4978-8116-28a06ef87668', $c$吹き上げは、潜水服内部の圧力と水圧の平衡が崩れ、内部の圧力が水圧より高くなったときに起こる。$c$, false, 1),
  ('b15b9e9f-4076-4978-8116-28a06ef87668', $c$潜水墜落では、一たび浮力が減少して沈降が始まると、水圧が増して浮力が更に減少するという悪循環を繰り返す。$c$, false, 2),
  ('b15b9e9f-4076-4978-8116-28a06ef87668', $c$ヘルメット式潜水では、潜水者が頭部を胴体より下にする姿勢をとり、逆立ちの状態になってしまったときに潜水墜落を起こすことがある。$c$, true, 3),
  ('b15b9e9f-4076-4978-8116-28a06ef87668', $c$ヘルメット式潜水では、潜水者に常に大量の空気が送気されており、排気弁の操作を誤ると吹き上げを起こすことがある。$c$, false, 4),
  ('b15b9e9f-4076-4978-8116-28a06ef87668', $c$吹き上げ時の対応を誤ると、潜水墜落を起こすことがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b9a9bc96-0947-4348-9fec-e5f5c1dd79c8',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$水中拘束又は溺れに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b9a9bc96-0947-4348-9fec-e5f5c1dd79c8', $c$気管支や肺にまで水が入ってしまい窒息状態になって溺れる場合だけでなく、水が気管に入っただけで呼吸が止まって溺れる場合がある。$c$, false, 1),
  ('b9a9bc96-0947-4348-9fec-e5f5c1dd79c8', $c$スクーバ式潜水では、些細なトラブルからパニック状態に陥り、正常な判断ができなくなり、自らくわえている潜水器を外してしまって溺れることがある。$c$, false, 2),
  ('b9a9bc96-0947-4348-9fec-e5f5c1dd79c8', $c$送気式潜水では、溺れに対する予防法として、送気ホース切断事故を生じないよう、潜水作業船にクラッチ固定装置やスクリュー覆いを取り付ける。$c$, false, 3),
  ('b9a9bc96-0947-4348-9fec-e5f5c1dd79c8', $c$ヘルメット式潜水では、溺れを予防するため、救命胴衣又はBCを必ず着用する。$c$, true, 4),
  ('b9a9bc96-0947-4348-9fec-e5f5c1dd79c8', $c$送気式潜水では、水中拘束を予防するため、障害物を通過するときは、周囲を回ったり、下をくぐり抜けたりせずに、その上を越えていくようにする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9a115d1b-adc7-4bdb-9baf-50d3ad2e656f',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '潜水業務'),
  $q$特殊な環境下における潜水に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問10',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9a115d1b-adc7-4bdb-9baf-50d3ad2e656f', $c$暗渠内は潮流の影響などを受けにくいため、十分な照度を確保することにより、安全に潜水作業を行うことができる。$c$, true, 1),
  ('9a115d1b-adc7-4bdb-9baf-50d3ad2e656f', $c$河川での潜水では、流れの速さに特に注意する必要があるので、命綱を使用したり、装着するウエイト重量を増やしたりする。$c$, false, 2),
  ('9a115d1b-adc7-4bdb-9baf-50d3ad2e656f', $c$淡水よりも海水の方がわずかに浮力が大きいため、湖で行う潜水に比べて、海で行う潜水にはより多くのウエイトが必要となる。$c$, false, 3),
  ('9a115d1b-adc7-4bdb-9baf-50d3ad2e656f', $c$冷水中での潜水で体温が低下すると、人体の運動機能が低下するとともに、減圧症にかかりやすくなる。$c$, false, 4),
  ('9a115d1b-adc7-4bdb-9baf-50d3ad2e656f', $c$山岳部のダムなど高所域での潜水では、通常の海洋での潜水よりも長い減圧浮上時間が必要となる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bdff313d-5b6a-49bc-a831-14a179045f46',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に用いるコンプレッサーに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bdff313d-5b6a-49bc-a831-14a179045f46', $c$コンプレッサーには、固定式と移動式があるが、固定式は潜水作業船に設置される場合が多い。$c$, false, 1),
  ('bdff313d-5b6a-49bc-a831-14a179045f46', $c$移動式のコンプレッサーは、空気槽を分離式とすることにより、重量を100kg程度にし、小型・軽量となっている。$c$, true, 2),
  ('bdff313d-5b6a-49bc-a831-14a179045f46', $c$コンプレッサーの圧縮効率は、圧力の上昇に伴い低下する。$c$, false, 3),
  ('bdff313d-5b6a-49bc-a831-14a179045f46', $c$ストレーナーは、コンプレッサーに吸入される外気をろ過し、ゴミなどの侵入を防ぐための装置である。$c$, false, 4),
  ('bdff313d-5b6a-49bc-a831-14a179045f46', $c$大出力化した原動機(主機)を備える潜水作業船は、コンプレッサー専用の原動機(補機)を設置して駆動するものが多い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '91fe17fa-db7d-4ebb-b536-2587393891f4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$毎分20Lの呼吸を行う潜水者が、水深10ｍにおいて、内容積12L、空気圧力19MPa(ゲージ圧力)の空気ボンベを使用してスクーバ式潜水により潜水業務を行う場合の潜水可能時間に最も近いものは次のうちどれか。
ただし、空気ボンベの残圧が5MPa(ゲージ圧力)になったら浮上するものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('91fe17fa-db7d-4ebb-b536-2587393891f4', $c$37 分$c$, false, 1),
  ('91fe17fa-db7d-4ebb-b536-2587393891f4', $c$42 分$c$, true, 2),
  ('91fe17fa-db7d-4ebb-b536-2587393891f4', $c$47 分$c$, false, 3),
  ('91fe17fa-db7d-4ebb-b536-2587393891f4', $c$52 分$c$, false, 4),
  ('91fe17fa-db7d-4ebb-b536-2587393891f4', $c$57 分$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd1bd1333-ac7a-4834-b0ac-5cf6250436c1',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$送気式潜水に使用する空気槽に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d1bd1333-ac7a-4834-b0ac-5cf6250436c1', $c$コンプレッサーから送られる圧縮空気は脈流であるが、調節用空気槽により緩和される。$c$, false, 1),
  ('d1bd1333-ac7a-4834-b0ac-5cf6250436c1', $c$調節用空気槽は、送気に含まれる水分や油分を分離する機能をもっている。$c$, false, 2),
  ('d1bd1333-ac7a-4834-b0ac-5cf6250436c1', $c$予備空気槽は、コンプレッサーの故障などの事故が発生した場合に備えて、必要な空気をあらかじめ蓄えておくための設備である。$c$, false, 3),
  ('d1bd1333-ac7a-4834-b0ac-5cf6250436c1', $c$始業前には、空気槽内の汚物を圧縮空気と一緒にドレーンコックから排出させる。$c$, false, 4),
  ('d1bd1333-ac7a-4834-b0ac-5cf6250436c1', $c$終業後、調節用空気槽の内部には0.1MPa(ゲージ圧力)程度の空気を残すようにしておく。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3dee9042-66c6-48b8-b754-9771b9156e5c',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水における潜降の方法などに関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3dee9042-66c6-48b8-b754-9771b9156e5c', $c$船の舷から水面までの高さが１～1.5ｍ程度であれば、片手でマスクを押さえ、足を先にして水中に飛び込んでも支障はない。$c$, false, 1),
  ('3dee9042-66c6-48b8-b754-9771b9156e5c', $c$潜降の際は、口にくわえたレギュレーターのマウスピースに空気を吹き込み、セカンドステージの低圧室とマウスピース内の水を押し出してから、呼吸を開始する。$c$, false, 2),
  ('3dee9042-66c6-48b8-b754-9771b9156e5c', $c$BCを装着している場合、インフレーターを肩より上に上げ、給気ボタンを押して潜降を始める。$c$, true, 3),
  ('3dee9042-66c6-48b8-b754-9771b9156e5c', $c$潜水中の遊泳は、通常は両腕を伸ばして体側につけて行うが、視界のきかないときは、腕を前方に伸ばして障害物の有無を確認しながら行う。$c$, false, 4),
  ('3dee9042-66c6-48b8-b754-9771b9156e5c', $c$マスクの中に水が入ってきたときは、深く息を吸い込んでマスクの上端を顔に押し付け、鼻から強く息を吹き出してマスクの下端から水を排出する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9db75fac-6ae9-4226-b7b3-46913ffa8eb2',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$ヘルメット式潜水における浮上の方法(緊急時の措置を含む。)に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問15',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9db75fac-6ae9-4226-b7b3-46913ffa8eb2', $c$浮上の際には、さがり綱(潜降索)は使用しないようにする。$c$, true, 1),
  ('9db75fac-6ae9-4226-b7b3-46913ffa8eb2', $c$緊急浮上の場合以外は、毎分10ｍを超えない速度で浮上する。$c$, false, 2),
  ('9db75fac-6ae9-4226-b7b3-46913ffa8eb2', $c$無減圧潜水の範囲内の潜水の場合でも、緊急浮上の場合以外は、水深３ｍ前後で安全のため、５分ほど浮上停止を行うようにする。$c$, false, 3),
  ('9db75fac-6ae9-4226-b7b3-46913ffa8eb2', $c$緊急浮上を要する場合は、所定の浮上停止を省略し、又は所定の浮上停止時間を短縮し、水面まで浮上する。$c$, false, 4),
  ('9db75fac-6ae9-4226-b7b3-46913ffa8eb2', $c$吹き上げにより急速に浮上した場合には、無減圧潜水の範囲内の潜水であっても、直ちに再圧処置を行うようにする。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '87df1657-e609-4a82-88c6-d4e7c0799091',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$生体の組織をいくつかの半飽和組織に分類して不活性ガスの分圧の計算を行うビュールマンのZH-L16モデルに基づく減圧方法に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('87df1657-e609-4a82-88c6-d4e7c0799091', $c$M値とは、ある環境圧力に対して、身体が許容できる各半飽和組織における最大の不活性ガス分圧をいう。$c$, false, 1),
  ('87df1657-e609-4a82-88c6-d4e7c0799091', $c$所定の計算により求めた全ての半飽和組織での体内不活性ガス分圧が対応するM値を超えないように、必要な減圧停止時間を設定する。$c$, false, 2),
  ('87df1657-e609-4a82-88c6-d4e7c0799091', $c$減圧計算において、ある浮上停止深度で、不活性ガス分圧がM値を上回るときは、直前の浮上停止深度での浮上停止時間を増加させる。$c$, false, 3),
  ('87df1657-e609-4a82-88c6-d4e7c0799091', $c$M値は、半飽和時間が長い組織ほど大きく、潜水者が潜っている深度が深くなるほど小さい。$c$, true, 4),
  ('87df1657-e609-4a82-88c6-d4e7c0799091', $c$繰り返し潜水において、作業終了後、次の作業まで水上で休息する時間を十分に設けなかった場合には、次の作業における減圧時間がより長くなる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'bdd01db6-bba1-4903-b3fa-783522842038',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$下の図はヘルメット式潜水器のヘルメットをスケッチしたものであるが、図中に示すＡ～Ｅの部分に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問17',
  '/exam-figures/diver/2025-10/q17.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('bdd01db6-bba1-4903-b3fa-783522842038', $c$Ａの部分はシコロで、潜水服の襟ゴム部分に取り付け、押え金と蝶ねじで固定する。$c$, false, 1),
  ('bdd01db6-bba1-4903-b3fa-783522842038', $c$Ｂの部分は排気弁で、潜水者が自分の頭部を使ってこれを操作して余剰空気や呼気を排出する。$c$, false, 2),
  ('bdd01db6-bba1-4903-b3fa-783522842038', $c$Ｃの部分は送気ホース取付部で、送気された空気が逆流することがないよう、逆止弁が設けられている。$c$, false, 3),
  ('bdd01db6-bba1-4903-b3fa-783522842038', $c$Ｄの部分はドレーンコックで、潜水者が送気中の水分や油分をヘルメットの外へ排出するときに使用する。$c$, true, 4),
  ('bdd01db6-bba1-4903-b3fa-783522842038', $c$Ｅの部分は側面窓で、金属製格子などが取り付けられて窓ガラスを保護している。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '04751156-7a32-42d1-bc4e-107b3a183513',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$スクーバ式潜水の装備に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('04751156-7a32-42d1-bc4e-107b3a183513', $c$ボンベには、クロムモリブデン鋼などの鋼合金で製造されたスチールボンベと、アルミ合金で製造されたアルミボンベがある。$c$, false, 1),
  ('04751156-7a32-42d1-bc4e-107b3a183513', $c$ボンベは、一般に、内容積が10～14Lで、最高充塡圧力が19.6MPa(ゲージ圧力)である。$c$, false, 2),
  ('04751156-7a32-42d1-bc4e-107b3a183513', $c$ボンベは、耐圧、衝撃、気密などの検査が行われ、最高充塡圧力などが刻印されている。$c$, false, 3),
  ('04751156-7a32-42d1-bc4e-107b3a183513', $c$残圧計には、圧力調整器のファーストステージからボンベの高圧空気がホースを通して送られ、ボンベ内の圧力が表示される。$c$, false, 4),
  ('04751156-7a32-42d1-bc4e-107b3a183513', $c$圧力調整器は、潜水後、ボンベから取り外し、ファーストステージのキャップを外したまま真水に浸け、水中でセカンドステージのパージボタンを押して、内部まできれいに洗い流す。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd32d7a5f-967a-4866-aa97-f390096295b3',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$全面マスク式潜水の装備に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d32d7a5f-967a-4866-aa97-f390096295b3', $c$全面マスク式潜水器では、ヘルメット式潜水器に比べて多くの送気量が必要となる。$c$, false, 1),
  ('d32d7a5f-967a-4866-aa97-f390096295b3', $c$全面マスク式潜水では、送気ホースの緩み、外れなどにつながるおそれがあるので、足ヒレを用いてはならない。$c$, false, 2),
  ('d32d7a5f-967a-4866-aa97-f390096295b3', $c$全面マスク式潜水器のマスク内には、口と鼻を覆う口鼻マスクが取り付けられており、潜水者はこの口鼻マスクを介して給気を受ける。$c$, true, 3),
  ('d32d7a5f-967a-4866-aa97-f390096295b3', $c$全面マスク式潜水で使用する水中電話機用のイヤホンは、潜水中に外れることがないよう、外耳道にイヤーピースを差し込むものが一般的である。$c$, false, 4),
  ('d32d7a5f-967a-4866-aa97-f390096295b3', $c$全面マスク式潜水では、保温のためドライスーツを着用し、ウエットスーツを着用することはない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2ebf9ec9-44cd-4447-8703-155a55c3805e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '送気、潜降及び浮上'),
  $q$潜水業務に使用する装備又は器具に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2ebf9ec9-44cd-4447-8703-155a55c3805e', $c$水中時計には、現在時刻や潜水経過時間を表示するだけでなく、潜水深度の時間的経過の記録が可能なものもある。$c$, false, 1),
  ('2ebf9ec9-44cd-4447-8703-155a55c3805e', $c$さがり綱(潜降索)は、丈夫で耐候性のある素材で作られたロープで、太さ１～２cm程度のものを使用する。$c$, false, 2),
  ('2ebf9ec9-44cd-4447-8703-155a55c3805e', $c$全面マスク式潜水用ドライスーツは、ブーツと一体となっており、潜水靴を必要としない。$c$, false, 3),
  ('2ebf9ec9-44cd-4447-8703-155a55c3805e', $c$スクーバ式潜水で使用するオープンヒルタイプの足ヒレは、爪先だけを差し込み、踵をストラップで固定する方式である。$c$, false, 4),
  ('2ebf9ec9-44cd-4447-8703-155a55c3805e', $c$ヘルメット式潜水の場合、ヘルメット及び潜水服に重量があるので、潜水靴は、できるだけ軽量のものを使用する。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b174f06f-4ddb-4473-a840-97ea749c63a7',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$肺及び肺の障害に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b174f06f-4ddb-4473-a840-97ea749c63a7', $c$肺の中で行われる、空気と血液の間での酸素と二酸化炭素の交換は、肺胞及び呼吸細気管支でのみ行われている。$c$, false, 1),
  ('b174f06f-4ddb-4473-a840-97ea749c63a7', $c$肺の表面と胸郭内側の面は、胸膜で覆われており、両者間の空間を胸膜腔という。$c$, false, 2),
  ('b174f06f-4ddb-4473-a840-97ea749c63a7', $c$肺は、筋肉活動による胸郭の拡張に伴って膨らむ。$c$, false, 3),
  ('b174f06f-4ddb-4473-a840-97ea749c63a7', $c$胸膜腔に気体が侵入し胸郭が広がっても肺が広がらない状態を、肺気腫という。$c$, true, 4),
  ('b174f06f-4ddb-4473-a840-97ea749c63a7', $c$潜水によって生じる肺の過膨張は、浮上時に起こりやすい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '55356525-5892-402e-9877-360be5ee937a',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$心臓及び血液循環等に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('55356525-5892-402e-9877-360be5ee937a', $c$末梢組織から二酸化炭素を受け取った血液は、毛細血管から静脈、大静脈を通って心臓の右心房に戻る。$c$, false, 1),
  ('55356525-5892-402e-9877-360be5ee937a', $c$心臓は左右の心室及び心房、すなわち四つの部屋に分かれており、血液は左心房から大動脈を通って体全体に送り出される。$c$, true, 2),
  ('55356525-5892-402e-9877-360be5ee937a', $c$心臓の右心房に戻った静脈血は、右心室から肺動脈を通って肺に送られ、そこでガス交換が行われる。$c$, false, 3),
  ('55356525-5892-402e-9877-360be5ee937a', $c$心臓の左右の心房の間が卵円孔開存で通じていると、減圧障害を引き起こすおそれがある。$c$, false, 4),
  ('55356525-5892-402e-9877-360be5ee937a', $c$大動脈の根元から出た冠動脈は、心臓の表面を取り巻き、心筋に酸素と栄養を供給する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6d639189-9b4b-4bdc-9f2b-121b22329fe4',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$神経系に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6d639189-9b4b-4bdc-9f2b-121b22329fe4', $c$大脳は外側の皮質と内側の髄質からなり、大脳皮質には、運動機能中枢、感覚中枢、記憶中枢などの機能がある。$c$, false, 1),
  ('6d639189-9b4b-4bdc-9f2b-121b22329fe4', $c$小脳は、随意運動、平衡機能などの調整に関与しており、小脳が侵されると運動失調が生じる。$c$, false, 2),
  ('6d639189-9b4b-4bdc-9f2b-121b22329fe4', $c$延髄には、生命の維持に重要な呼吸中枢がある。$c$, false, 3),
  ('6d639189-9b4b-4bdc-9f2b-121b22329fe4', $c$感覚器官からの情報を中枢に伝える神経を体性神経といい、中枢からの命令を運動器官に伝える神経を自律神経という。$c$, true, 4),
  ('6d639189-9b4b-4bdc-9f2b-121b22329fe4', $c$交感神経系と副交感神経系は、各種臓器において双方の神経が分布し、相反する作用を有している。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e3018eb8-7368-45da-9afa-a06cfce49c67',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$人体に及ぼす水温の作用及び体温に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e3018eb8-7368-45da-9afa-a06cfce49c67', $c$体温は、代謝によって生じる産熱と、人体と外部環境の温度差に基づく放熱のバランスによって一定に保たれる。$c$, false, 1),
  ('e3018eb8-7368-45da-9afa-a06cfce49c67', $c$体温が低下し始めると、筋肉の緊張の増強、酸素摂取量の増加などの症状が現れる。$c$, false, 2),
  ('e3018eb8-7368-45da-9afa-a06cfce49c67', $c$水中で体温が低下すると、震え、意識の混濁や消失などを起こし、死に至ることもある。$c$, false, 3),
  ('e3018eb8-7368-45da-9afa-a06cfce49c67', $c$一般に、深部体温が35℃以下の状態を低体温症という。$c$, false, 4),
  ('e3018eb8-7368-45da-9afa-a06cfce49c67', $c$重度の低体温症に陥った者への処置としては、できるだけ早く体温を回復させるため、温かいシャワーか風呂に入れるようにする。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '78ccbd9a-63fa-4770-a6fc-b48a1870d37e',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水によって生じる圧外傷に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('78ccbd9a-63fa-4770-a6fc-b48a1870d37e', $c$圧外傷は、潜降又は浮上いずれのときでも生じ、潜降時のものをブロック、浮上時のものをスクィーズと呼ぶ。$c$, false, 1),
  ('78ccbd9a-63fa-4770-a6fc-b48a1870d37e', $c$潜降時の圧外傷は、潜降による圧力変化のために体腔内の空気の体積が増えることにより生じ、中耳腔、副鼻腔、面マスクの内部や潜水服と皮膚の間などで生じる。$c$, false, 2),
  ('78ccbd9a-63fa-4770-a6fc-b48a1870d37e', $c$浮上時の圧外傷は、浮上による圧力変化のために体腔内の空気の体積が減少することにより生じ、副鼻腔、肺などで生じる。$c$, false, 3),
  ('78ccbd9a-63fa-4770-a6fc-b48a1870d37e', $c$深さ２ｍ程度の浅い場所での潜水からの浮上でも、圧外傷が生じることがある。$c$, true, 4),
  ('78ccbd9a-63fa-4770-a6fc-b48a1870d37e', $c$浮上時の肺圧外傷を防ぐためには、息を止めたまま浮上するとよい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '09e52987-e0a7-42fe-9a35-d87433ed5a65',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水による副鼻腔や耳の障害に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('09e52987-e0a7-42fe-9a35-d87433ed5a65', $c$潜降の途中で耳が痛くなるのは、外耳道と中耳腔との間に圧力差が生じるためである。$c$, false, 1),
  ('09e52987-e0a7-42fe-9a35-d87433ed5a65', $c$中耳腔は、耳管によって咽頭と通じているが、この管は通常は閉じている。$c$, false, 2),
  ('09e52987-e0a7-42fe-9a35-d87433ed5a65', $c$耳の障害による症状には、耳の痛み、閉塞感、難聴、めまいなどがある。$c$, false, 3),
  ('09e52987-e0a7-42fe-9a35-d87433ed5a65', $c$前頭洞、上顎洞などの副鼻腔は、管によって鼻腔と通じており、耳抜きによってこの管を開いて圧力調整を行う。$c$, true, 4),
  ('09e52987-e0a7-42fe-9a35-d87433ed5a65', $c$副鼻腔の障害による症状には、額の周りや目・鼻の根部の痛み、鼻出血などがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f954b887-c3ac-47ff-a984-ee81e2a32e9d',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$潜水業務における二酸化炭素中毒又は酸素中毒に関し、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f954b887-c3ac-47ff-a984-ee81e2a32e9d', $c$二酸化炭素中毒は、二酸化炭素が血液中の赤血球に含まれるヘモグロビンと強く結合し、酸素の運搬ができなくなるために起こる。$c$, false, 1),
  ('f954b887-c3ac-47ff-a984-ee81e2a32e9d', $c$スクーバ式潜水では、二酸化炭素中毒は生じないが、ヘルメット式潜水では、ヘルメット内に吐き出した呼気により二酸化炭素濃度が高くなって中毒を起こすことがある。$c$, false, 2),
  ('f954b887-c3ac-47ff-a984-ee81e2a32e9d', $c$酸素中毒は、酸素分圧の高いガスの吸入によって生じ、呼吸ガス中に二酸化炭素が多いときには起こりにくい。$c$, false, 3),
  ('f954b887-c3ac-47ff-a984-ee81e2a32e9d', $c$脳酸素中毒は、50kPa程度の酸素分圧の呼吸ガスを長時間呼吸したときに生じ、肺酸素中毒は、140～160kPa程度の酸素分圧の呼吸ガスを短時間呼吸したときに生じる。$c$, false, 4),
  ('f954b887-c3ac-47ff-a984-ee81e2a32e9d', $c$大深度潜水では、酸素中毒を防止するため、潜水深度に応じて酸素濃度を低くした混合ガスを用いる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '914575a7-9197-4abf-a406-629ac26a3209',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$減圧症に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('914575a7-9197-4abf-a406-629ac26a3209', $c$減圧症は、通常、浮上後24時間以上経過した後に発症するが、長時間の潜水や飽和潜水では24時間以内に発症することがある。$c$, true, 1),
  ('914575a7-9197-4abf-a406-629ac26a3209', $c$減圧症は、皮膚の痒み、関節の痛みなどを呈する比較的軽症の減圧症と、脳、肺などが冒される比較的重症の減圧症とがある。$c$, false, 2),
  ('914575a7-9197-4abf-a406-629ac26a3209', $c$規定の浮上速度や浮上停止時間を順守しても減圧症にかかることがある。$c$, false, 3),
  ('914575a7-9197-4abf-a406-629ac26a3209', $c$減圧症は、高齢者、最近外傷を受けた人、脱水症状の人などが罹患しやすい。$c$, false, 4),
  ('914575a7-9197-4abf-a406-629ac26a3209', $c$作業量が多く、血流量の増える重筋作業の潜水では、減圧症に罹患しやすくなる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7b51c8bf-3de4-43aa-9f81-f49a67a86d64',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$医師が必要と認める期間、潜水業務への就業が禁止される疾病に該当しないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7b51c8bf-3de4-43aa-9f81-f49a67a86d64', $c$貧血症$c$, false, 1),
  ('7b51c8bf-3de4-43aa-9f81-f49a67a86d64', $c$白内障$c$, true, 2),
  ('7b51c8bf-3de4-43aa-9f81-f49a67a86d64', $c$メニエル病$c$, false, 3),
  ('7b51c8bf-3de4-43aa-9f81-f49a67a86d64', $c$バセドー病$c$, false, 4),
  ('7b51c8bf-3de4-43aa-9f81-f49a67a86d64', $c$関節炎$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3cbfb406-3773-4b4b-b0f3-a475ed36a571',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '高気圧障害'),
  $q$一次救命処置に関し、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3cbfb406-3773-4b4b-b0f3-a475ed36a571', $c$一次救命処置は、できる限り単独で行うことは避ける。$c$, false, 1),
  ('3cbfb406-3773-4b4b-b0f3-a475ed36a571', $c$傷病者に反応がある場合は、回復体位をとらせて安静にして、経過を観察する。$c$, false, 2),
  ('3cbfb406-3773-4b4b-b0f3-a475ed36a571', $c$呼吸を確認して普段どおりの息(正常な呼吸)がない場合や約１分間観察しても判断できない場合は、心肺停止とみなし、心肺蘇生を開始する。$c$, true, 3),
  ('3cbfb406-3773-4b4b-b0f3-a475ed36a571', $c$胸骨圧迫は、胸が約５cm沈む強さで、１分間に100～120回のテンポで行う。$c$, false, 4),
  ('3cbfb406-3773-4b4b-b0f3-a475ed36a571', $c$AED(自動体外式除細動器)を用いた場合、電気ショックを行った後や電気ショック不要の音声メッセージが出たときは、胸骨圧迫を再開し心肺蘇生を続ける。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0f602acb-cc9f-407a-b2eb-716acd6e597b',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$空気圧縮機による送気式潜水における空気槽に関し、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0f602acb-cc9f-407a-b2eb-716acd6e597b', $c$送気を調節するための空気槽は、潜水業務従事者ごとに設けなければならない。$c$, false, 1),
  ('0f602acb-cc9f-407a-b2eb-716acd6e597b', $c$予備空気槽を設ける場合は、潜水業務従事者ごとに設けなければならない。$c$, false, 2),
  ('0f602acb-cc9f-407a-b2eb-716acd6e597b', $c$送気を調節するための空気槽が予備空気槽の内容積等の基準に適合するものであるときは、予備空気槽を設けることを要しない。$c$, false, 3),
  ('0f602acb-cc9f-407a-b2eb-716acd6e597b', $c$予備空気槽の内容積等の基準に適合する予備ボンベを潜水業務従事者に携行させるときは、予備空気槽を設けることを要しない。$c$, false, 4),
  ('0f602acb-cc9f-407a-b2eb-716acd6e597b', $c$予備空気槽内の空気の圧力は、常時、最高の潜水深度に相当する圧力以上でなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ff875c0c-1d05-4323-b8c0-790944645193',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務に係る特別の教育に関し、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ff875c0c-1d05-4323-b8c0-790944645193', $c$水深10ｍ未満の場所における潜水業務に就かせるときは、特別の教育を行わなければならない。$c$, true, 1),
  ('ff875c0c-1d05-4323-b8c0-790944645193', $c$潜水作業者への送気の調節を行うためのバルブ又はコックを操作する業務に就かせるときは、特別の教育を行わなければならない。$c$, false, 2),
  ('ff875c0c-1d05-4323-b8c0-790944645193', $c$再圧室を操作する業務に就かせるときは、特別の教育を行わなければならない。$c$, false, 3),
  ('ff875c0c-1d05-4323-b8c0-790944645193', $c$特別の教育を行ったときは、その記録を作成して、これを３年間保存しなければならない。$c$, false, 4),
  ('ff875c0c-1d05-4323-b8c0-790944645193', $c$特別の教育の科目の全部又は一部について十分な知識及び技能を有していると認められる労働者については、その科目についての教育を省略することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '061050d5-ee39-4ba5-9135-cee2ec923ec1',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務従事者に圧力調整器を使用させない潜水方式の場合、大気圧下で送気量が毎分240Lの空気圧縮機を用いて送気するとき、法令上、潜水できる最高の水深に最も近いものは、次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('061050d5-ee39-4ba5-9135-cee2ec923ec1', $c$10 ｍ$c$, false, 1),
  ('061050d5-ee39-4ba5-9135-cee2ec923ec1', $c$15 ｍ$c$, false, 2),
  ('061050d5-ee39-4ba5-9135-cee2ec923ec1', $c$20 ｍ$c$, false, 3),
  ('061050d5-ee39-4ba5-9135-cee2ec923ec1', $c$30 ｍ$c$, true, 4),
  ('061050d5-ee39-4ba5-9135-cee2ec923ec1', $c$40 ｍ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1a37395b-a16c-4ec5-af85-6be27ace12a3',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$法令上、空気圧縮機による送気式の潜水業務を行うときは、特定の設備・器具について一定期間ごとに１回以上点検しなければならないと定められているが、次の設備・器具とその期間との組合せのうち、誤っているものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1a37395b-a16c-4ec5-af85-6be27ace12a3', $c$空気圧縮機 …………………………………… １週$c$, false, 1),
  ('1a37395b-a16c-4ec5-af85-6be27ace12a3', $c$水深計 ………………………………………… １か月$c$, false, 2),
  ('1a37395b-a16c-4ec5-af85-6be27ace12a3', $c$水中時計 ……………………………………… ３か月$c$, false, 3),
  ('1a37395b-a16c-4ec5-af85-6be27ace12a3', $c$送気する空気を清浄にするための装置 …… ３か月$c$, true, 4),
  ('1a37395b-a16c-4ec5-af85-6be27ace12a3', $c$送気量を計るための流量計 ………………… ６か月$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ec6060ad-5543-472c-9a12-e4bff9615421',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$送気式潜水による潜水業務における連絡員に関し、法令上、定められていないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ec6060ad-5543-472c-9a12-e4bff9615421', $c$連絡員の配置は、潜水業務従事者２人以下ごとに１人とする。$c$, false, 1),
  ('ec6060ad-5543-472c-9a12-e4bff9615421', $c$連絡員は、潜水業務従事者と連絡して、その者の潜降及び浮上を適正に行わせる。$c$, false, 2),
  ('ec6060ad-5543-472c-9a12-e4bff9615421', $c$連絡員は、潜水業務従事者への送気の調節を行うためのバルブ又はコックを操作する業務に従事する者と連絡して、潜水業務従事者に必要な量の空気を送気させる。$c$, false, 3),
  ('ec6060ad-5543-472c-9a12-e4bff9615421', $c$連絡員は、送気設備の故障その他の事故により、潜水業務従事者に危険又は健康障害の生ずるおそれがあるときは、速やかにバルブ又はコックを操作する業務に従事する者に連絡する。$c$, true, 4),
  ('ec6060ad-5543-472c-9a12-e4bff9615421', $c$連絡員は、ヘルメット式潜水器を用いて行う潜水業務にあっては、潜降直前に潜水業務従事者のヘルメットがかぶと台に結合されているかどうかを確認する。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'da75c341-4af0-44a7-ad27-64d7c614bbdf',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務とこれに対応して潜水作業者に携行又は着用させなければならない物との組合せとして、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('da75c341-4af0-44a7-ad27-64d7c614bbdf', $c$スクーバ式潜水器による潜水業務……水中時計、水深計、コンパス、救命胴衣$c$, false, 1),
  ('da75c341-4af0-44a7-ad27-64d7c614bbdf', $c$ボンベ(潜水作業者に携行させたボンベを除く。)からの給気を受けて行う潜水業務(通話装置がある場合)……信号索、水中時計、コンパス、救命胴衣$c$, false, 2),
  ('da75c341-4af0-44a7-ad27-64d7c614bbdf', $c$ボンベ(潜水作業者に携行させたボンベを除く。)からの給気を受けて行う潜水業務(通話装置がない場合)……信号索、水中時計、鋭利な刃物、コンパス$c$, false, 3),
  ('da75c341-4af0-44a7-ad27-64d7c614bbdf', $c$空気圧縮機により送気して行う潜水業務(通話装置がある場合)……水中時計、水深計、鋭利な刃物、救命胴衣$c$, false, 4),
  ('da75c341-4af0-44a7-ad27-64d7c614bbdf', $c$空気圧縮機により送気して行う潜水業務(通話装置がない場合)……信号索、水中時計、水深計、鋭利な刃物$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a6842acf-3e18-4e74-b26e-dbfbad75f8e6',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水業務に常時従事する労働者に対して行う高気圧業務健康診断において、法令上、実施することが義務付けられていない項目は次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a6842acf-3e18-4e74-b26e-dbfbad75f8e6', $c$既往歴及び高気圧業務歴の調査$c$, false, 1),
  ('a6842acf-3e18-4e74-b26e-dbfbad75f8e6', $c$四肢の運動機能の検査$c$, false, 2),
  ('a6842acf-3e18-4e74-b26e-dbfbad75f8e6', $c$鼓膜及び聴力の検査$c$, false, 3),
  ('a6842acf-3e18-4e74-b26e-dbfbad75f8e6', $c$肺活量の測定$c$, false, 4),
  ('a6842acf-3e18-4e74-b26e-dbfbad75f8e6', $c$血液中の尿酸の量の検査$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '74032f7a-923e-4a63-b876-fda09813e348',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$再圧室の点検事項に関する次の文中の〔　〕内に入れるＡ及びＢの語句の組合せとして、法令上、正しいものは(１)～(５)のうちどれか。
「再圧室については、設置時及びその後１か月をこえない期間ごとに、「送気設備及び排気設備の作動の状況」、「通話装置及び〔Ａ〕の作動の状況」、「電路の〔Ｂ〕の有無」、「電気機械器具及び配線の損傷その他異常の有無」について点検し、異常を認めたときは、直ちに補修し、又は取り替えなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('74032f7a-923e-4a63-b876-fda09813e348', $c$Ａ：空気清浄装置　Ｂ：接触防止装置の異常$c$, false, 1),
  ('74032f7a-923e-4a63-b876-fda09813e348', $c$Ａ：空気清浄装置　Ｂ：漏電遮断装置の異常$c$, false, 2),
  ('74032f7a-923e-4a63-b876-fda09813e348', $c$Ａ：警報装置　Ｂ：漏電$c$, true, 3),
  ('74032f7a-923e-4a63-b876-fda09813e348', $c$Ａ：警報装置　Ｂ：接触防止装置の異常$c$, false, 4),
  ('74032f7a-923e-4a63-b876-fda09813e348', $c$Ａ：主室と副室間の扉　Ｂ：漏電$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1c8d17f8-636a-499d-a0ca-8f3043cfbd3f',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水士免許に関する次のＡからＤの記述について、法令上、誤っているものの組合せは(１)～(５)のうちどれか。
Ａ 潜水器を用い、かつ、空気圧縮機による送気又はボンベからの給気を受けて、水中において行う業務は、免許を受けた者でなければ、就くことができない。
Ｂ 満20歳に満たない者は、免許を受けることができない。
Ｃ 故意又は重大な過失により、潜水業務について重大な事故を発生させたときは、免許の取消しの処分を受けることがある。
Ｄ 免許を受けることができる者は、潜水士免許試験に合格した者に限られる。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1c8d17f8-636a-499d-a0ca-8f3043cfbd3f', $c$Ａ，Ｂ$c$, false, 1),
  ('1c8d17f8-636a-499d-a0ca-8f3043cfbd3f', $c$Ａ，Ｃ$c$, false, 2),
  ('1c8d17f8-636a-499d-a0ca-8f3043cfbd3f', $c$Ａ，Ｄ$c$, false, 3),
  ('1c8d17f8-636a-499d-a0ca-8f3043cfbd3f', $c$Ｂ，Ｄ$c$, true, 4),
  ('1c8d17f8-636a-499d-a0ca-8f3043cfbd3f', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '913e4883-8588-4f81-90a2-20a643029132',
  'diver',
  (SELECT id FROM exam_types WHERE exam_id = 'diver' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'diver' AND e.code = 'common' AND c.name = '関係法令'),
  $q$潜水作業において一定の範囲内に収めなければならないとされている、潜水作業者が吸入する時点のガス分圧に関し、法令上、誤っているものは次のうちどれか。
ただし、潜水作業者が溺水しないよう必要な措置を講じて浮上を行わせる場合を除く。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 潜水士試験 問40',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('913e4883-8588-4f81-90a2-20a643029132', $c$窒素の分圧は、400kPaを超えてはならない。$c$, false, 1),
  ('913e4883-8588-4f81-90a2-20a643029132', $c$ヘリウムの分圧は、300kPaを超えてはならない。$c$, true, 2),
  ('913e4883-8588-4f81-90a2-20a643029132', $c$酸素の分圧は、18kPa未満であってはならない。$c$, false, 3),
  ('913e4883-8588-4f81-90a2-20a643029132', $c$酸素の分圧は、160kPaを超えてはならない。$c$, false, 4),
  ('913e4883-8588-4f81-90a2-20a643029132', $c$炭酸ガスの分圧は、0.5kPaを超えてはならない。$c$, false, 5);

do $$
declare
  diver_2025_10 int;
begin
  select count(*) into diver_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 潜水士試験%';

  if diver_2025_10 <> 40 then
    raise exception 'diver 2025-10 sitting must be 40 questions (got %)', diver_2025_10;
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
  '潜水士模擬試験(令和7年10月)',
  240,
  40,
  '令和7年10月公表 潜水士試験'
from exam_types
where exam_types.exam_id = 'diver'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'diver'
      and source_filter = '令和7年10月公表 潜水士試験'
      and category_scope is null
  );
