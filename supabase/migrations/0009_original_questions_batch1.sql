-- 独自作成問題の追加(24問: 関係法令8問・労働衛生8問・労働生理8問)
-- source_type = 'original'
-- 関係法令・労働衛生は第二種向けカテゴリ(有害業務を除く範囲)に紐づけている。
-- 内容は基礎的な一般知識であり、第一種受験者にも共通して有用。
-- 注意: 法令の数値は改正される場合があるため、最新の公式情報も確認すること。

-- ============ 関係法令 (8問) ============

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '衛生管理者を選任すべき事由が発生した場合、法令上、何日以内に選任しなければならないか。',
    '衛生管理者の選任は、選任すべき事由が発生した日から14日以内に行わなければならないと定められている。産業医の選任も同様に14日以内である。',
    'original', '基礎問題(独自作成) 関係法令-01'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('7日以内',false,1),('14日以内',true,2),('30日以内',false,3),('60日以内',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '衛生委員会の開催頻度として、法令上正しいものはどれか。',
    '衛生委員会は毎月1回以上開催し、議事の概要を記録して一定期間保存しなければならないとされている。',
    'original', '基礎問題(独自作成) 関係法令-02'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('毎週1回以上',false,1),('毎月1回以上',true,2),('2か月に1回以上',false,3),('半年に1回以上',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '常時使用する労働者に対する一般健康診断（定期健康診断）の実施頻度として、法令上正しいものはどれか。',
    '定期健康診断は、原則として1年以内ごとに1回、定期に実施しなければならないとされている。',
    'original', '基礎問題(独自作成) 関係法令-03'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('6か月以内ごとに1回',false,1),('1年以内ごとに1回',true,2),('2年以内ごとに1回',false,3),('3年以内ごとに1回',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '労働基準法における休憩時間の付与に関する記述として、正しいものはどれか。',
    '労働時間が6時間を超える場合は少なくとも45分、8時間を超える場合は少なくとも60分の休憩時間を労働時間の途中に与えなければならない。',
    'original', '基礎問題(独自作成) 関係法令-04'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('労働時間が6時間を超える場合は少なくとも45分の休憩を与える',true,1),('労働時間の長さにかかわらず休憩は30分でよい',false,2),('休憩は始業直後にまとめて与えればよい',false,3),('休憩時間は労働時間に含まれる',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '快適な職場環境の形成のための措置に関する記述として、適切なものはどれか。',
    '快適な職場環境の形成は、労働安全衛生法上、事業者の努力義務として位置づけられている（罰則を伴う義務ではない）。作業環境や作業方法の改善、休憩施設の設置などが指針として示されている。',
    'original', '基礎問題(独自作成) 関係法令-05'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('事業者に対する努力義務として定められている',true,1),('全ての事業場に罰則付きの義務として課されている',false,2),('労働者個人の努力義務として定められている',false,3),('大企業のみに適用される',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '健康診断の結果、異常の所見があると診断された労働者について、事業者が行うべき措置に関する記述として正しいものはどれか。',
    '事業者は、健康診断の結果に異常の所見がある労働者について、原則として健康診断が行われた日から3か月以内に医師の意見を聴かなければならないとされている。',
    'original', '基礎問題(独自作成) 関係法令-06'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('原則3か月以内に医師の意見を聴く',true,1),('特に期限の定めはない',false,2),('1週間以内に配置転換しなければならない',false,3),('翌年度の健康診断まで対応不要',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '労働基準法における年次有給休暇の付与要件に関する記述として、正しいものはどれか。',
    '年次有給休暇は、雇入れの日から起算して6か月間継続勤務し、全労働日の8割以上出勤した労働者に対して付与される。',
    'original', '基礎問題(独自作成) 関係法令-07'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('雇入れ後6か月継続勤務し全労働日の8割以上出勤した場合に付与される',true,1),('雇入れ直後から無条件で10日付与される',false,2),('継続勤務1年以上でなければ付与されない',false,3),('出勤率の要件はない',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    'ストレスチェック制度に関する記述として、正しいものはどれか。',
    '常時50人以上の労働者を使用する事業場では、1年以内ごとに1回、定期にストレスチェックを実施することが義務付けられている（50人未満の事業場は当分の間、努力義務）。',
    'original', '基礎問題(独自作成) 関係法令-08'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '関係法令(有害業務に係るものを除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('常時50人以上の事業場は年1回以上の実施が義務',true,1),('全事業場が対象で罰則がある',false,2),('実施は任意でありいつ行ってもよい',false,3),('50人未満の事業場も義務である',false,4)) AS v(choice_text,is_correct,sort_order);

-- ============ 労働衛生 (8問) ============

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '事務所衛生基準規則における照度の基準に関する記述として、適切なものはどれか。',
    '事務所衛生基準規則では、作業の区分に応じて必要な照度の基準が定められており、一般的な事務作業では300ルクス以上とされている（精密な作業ではより高い照度が求められる）。',
    'original', '基礎問題(独自作成) 労働衛生-01'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('一般的な事務作業ではおよそ300ルクス以上が目安とされる',true,1),('照度の基準は定められていない',false,2),('全ての作業で100ルクス以下にすべきとされる',false,3),('自然光のみを利用することが義務付けられている',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '情報機器作業（VDT作業）における労働衛生管理に関する記述として、適切なものはどれか。',
    '情報機器作業ガイドラインでは、一連続作業時間がおおむね1時間を超えないようにし、作業の合間に小休止を取ることなどが推奨されている。',
    'original', '基礎問題(独自作成) 労働衛生-02'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('連続作業時間をおおむね1時間以内とし小休止を挟むことが望ましい',true,1),('休憩は不要で連続して作業すべきである',false,2),('画面の明るさは最大にすべきである',false,3),('椅子の高さは調整できない方がよい',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '事務室における空気環境の努力目標として、事務所衛生基準規則等で示されている室温・相対湿度の目安として、適切なものはどれか。',
    '事務所衛生基準規則等では、室温はおおむね18℃以上28℃以下、相対湿度はおおむね40%以上70%以下になるよう努めることとされている。',
    'original', '基礎問題(独自作成) 労働衛生-03'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('室温18〜28℃程度、相対湿度40〜70%程度が目安',true,1),('室温は10℃以下にすべきである',false,2),('湿度の基準は定められていない',false,3),('室温は35℃以上を推奨している',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '職場における受動喫煙防止対策に関する記述として、適切なものはどれか。',
    '健康増進法等に基づき、多数の者が利用する施設等では原則屋内禁煙とされ、喫煙をする場合は喫煙専用室等を設ける必要がある。',
    'original', '基礎問題(独自作成) 労働衛生-04'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('原則屋内禁煙とし喫煙する場合は専用室等を設ける',true,1),('屋内であれば喫煙場所の制限はない',false,2),('受動喫煙対策は事業者の義務ではない',false,3),('喫煙室の設置は禁止されている',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '職場における熱中症予防対策に関する記述として、適切なものはどれか。',
    'WBGT値を活用した作業管理、水分・塩分の適切な補給、暑熱順化の考慮などが熱中症予防対策として推奨されている。',
    'original', '基礎問題(独自作成) 労働衛生-05'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('WBGT値の活用や水分・塩分補給が有効な対策となる',true,1),('水分補給は熱中症のリスクを高めるため控えるべきである',false,2),('暑熱順化は熱中症予防と無関係である',false,3),('対策は着衣を厚くすることのみである',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '健康保持増進対策における運動指導に関する記述として、適切なものはどれか。',
    '健康測定の結果に基づく運動指導は、個々の労働者の健康状態や生活習慣を踏まえて、無理のない範囲で行うことが望ましいとされている。',
    'original', '基礎問題(独自作成) 労働衛生-06'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('個々の健康状態を踏まえ無理のない範囲で行う',true,1),('全労働者に同一の運動プログラムを強制する',false,2),('運動指導は医師以外関与できない',false,3),('健康測定の結果は運動指導に反映させない',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '職場のメンタルヘルスケアにおける「4つのケア」に含まれないものはどれか。',
    '労働者の心の健康の保持増進のための指針では、セルフケア、ラインによるケア、事業場内産業保健スタッフ等によるケア、事業場外資源によるケアの4つが基本的な取組として示されている。',
    'original', '基礎問題(独自作成) 労働衛生-07'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('セルフケア',false,1),('ラインによるケア',false,2),('事業場外資源によるケア',false,3),('行政によるケア',true,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '疲労の分類に関する記述として、適切なものはどれか。',
    '疲労は、短時間の作業後に休息で回復する急性疲労と、長期間にわたり蓄積し休息だけでは回復しにくい慢性疲労（過労）に大別される。',
    'original', '基礎問題(独自作成) 労働衛生-08'
  FROM exam_types et, categories c
  WHERE et.code = 'type2' AND c.name = '労働衛生(有害業務を除く)'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('急性疲労と慢性疲労に大別される',true,1),('疲労は身体的疲労のみを指す概念である',false,2),('慢性疲労は一晩の睡眠で必ず解消される',false,3),('疲労と睡眠は無関係である',false,4)) AS v(choice_text,is_correct,sort_order);

-- ============ 労働生理 (8問) ============

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '呼吸運動に関する記述として、誤っているものはどれか。',
    '呼吸運動は、横隔膜や肋間筋の収縮・弛緩によって胸腔内の容積を変化させ、肺を受動的に膨らませたり縮ませたりすることで行われる。肺自体には筋肉がなく自ら運動することはできない。',
    'original', '基礎問題(独自作成) 労働生理-01'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('呼吸運動は横隔膜や肋間筋の働きによって行われる',false,1),('肺自体に筋肉があり自力で伸縮する',true,2),('胸腔内の容積変化が呼吸運動の原理である',false,3),('横隔膜が下がると胸腔が広がり息を吸う',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '睡眠に関する記述として、適切なものはどれか。',
    '睡眠は、身体を休める働きの強いノンレム睡眠と、脳が活発に働き夢を見ることが多いレム睡眠が、一晩のうちに交互に繰り返される。',
    'original', '基礎問題(独自作成) 労働生理-02'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('レム睡眠とノンレム睡眠が一晩に交互に現れる',true,1),('睡眠中は脳も身体も完全に活動を停止する',false,2),('夢を見るのは主にノンレム睡眠時である',false,3),('睡眠は加齢によって変化しない',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '骨の機能に関する記述として、誤っているものはどれか。',
    '骨は身体を支える、内臓を保護する、骨髄で血球を作る（造血）、カルシウムを貯蔵するなどの機能を持つ。消化酵素を分泌する機能は持たない。',
    'original', '基礎問題(独自作成) 労働生理-03'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('身体を支持する機能を持つ',false,1),('骨髄で血球を作る造血機能を持つ',false,2),('消化酵素を分泌する機能を持つ',true,3),('カルシウムを貯蔵する機能を持つ',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '基礎代謝量に関する記述として、適切なものはどれか。',
    '基礎代謝量とは、安静・覚醒状態で生命を維持するために必要な最小限のエネルギー代謝量をいい、体格や年齢、性別によって個人差がある。',
    'original', '基礎問題(独自作成) 労働生理-04'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('安静・覚醒状態で生命維持に必要な最小のエネルギー代謝量である',true,1),('運動時のエネルギー消費量のみを指す',false,2),('全ての人で同一の値になる',false,3),('睡眠中にのみ測定される値である',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '聴覚の伝導経路に関する記述として、適切なものはどれか。',
    '音は外耳（耳介・外耳道）から鼓膜を振動させ、中耳（耳小骨）で増幅され、内耳（蝸牛）で電気信号に変換されて聴神経を通じて脳に伝わる。',
    'original', '基礎問題(独自作成) 労働生理-05'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('外耳→中耳→内耳の順に音の情報が伝わる',true,1),('音は内耳から外耳へ伝わる',false,2),('鼓膜は音を電気信号に直接変換する',false,3),('蝸牛は中耳に存在する器官である',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '体液の水分・電解質バランスの調節に関する記述として、適切なものはどれか。',
    '体内の水分が不足すると、脳下垂体から抗利尿ホルモンが分泌され、腎臓での水分の再吸収を促進することで体液量を保とうとする。',
    'original', '基礎問題(独自作成) 労働生理-06'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('抗利尿ホルモンが腎臓での水分再吸収を促進する',true,1),('水分不足時には尿量が増加し続ける',false,2),('体液調節にホルモンは関与しない',false,3),('抗利尿ホルモンは膵臓から分泌される',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '加齢に伴う消化機能の変化に関する記述として、適切なものはどれか。',
    '加齢に伴い、唾液分泌量の減少や胃酸分泌の低下などがみられ、消化機能全般が緩やかに低下する傾向がある。',
    'original', '基礎問題(独自作成) 労働生理-07'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('加齢により消化機能は緩やかに低下する傾向がある',true,1),('加齢によって消化機能はむしろ向上する',false,2),('胃酸分泌は加齢の影響を受けない',false,3),('唾液分泌量は加齢とともに増加する',false,4)) AS v(choice_text,is_correct,sort_order);

WITH q AS (
  INSERT INTO questions (exam_type_id, category_id, question_text, explanation, source_type, source_note)
  SELECT et.id, c.id,
    '運動時の呼吸・循環器系の反応に関する記述として、適切なものはどれか。',
    '運動を行うと、筋肉の酸素需要が高まるため、心拍数や呼吸数が増加し、心臓の拍出量が増大することで全身への酸素供給を高めようとする。',
    'original', '基礎問題(独自作成) 労働生理-08'
  FROM exam_types et, categories c
  WHERE et.code = 'common' AND c.name = '労働生理'
  RETURNING id
)
INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
SELECT id, v.choice_text, v.is_correct, v.sort_order FROM q,
  (VALUES ('心拍数・呼吸数が増加し酸素供給を高めようとする',true,1),('運動時には心拍数はむしろ低下する',false,2),('呼吸数は運動の強度に関係なく一定である',false,3),('運動時に心臓の拍出量は変化しない',false,4)) AS v(choice_text,is_correct,sort_order);
