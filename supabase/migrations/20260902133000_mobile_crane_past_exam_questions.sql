-- mobile_crane 基盤登録 (exams / exam_types / exam_categories / categories)

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'mobile_crane', '移動式クレーン運転士', '公益財団法人安全衛生技術試験協会', true
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'mobile_crane');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'mobile_crane', 'common', '移動式クレーン運転士'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'mobile_crane', 'common', '移動式クレーン運転士', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'mobile_crane' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'mobile_crane', '移動式クレーンに関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'mobile_crane'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '移動式クレーンに関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'mobile_crane', '原動機及び電気に関する知識', 2
FROM exam_types et
WHERE et.exam_id = 'mobile_crane'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '原動機及び電気に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'mobile_crane', '関係法令', 3
FROM exam_types et
WHERE et.exam_id = 'mobile_crane'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'mobile_crane', '移動式クレーンの運転のために必要な力学に関する知識', 4
FROM exam_types et
WHERE et.exam_id = 'mobile_crane'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'
  );
