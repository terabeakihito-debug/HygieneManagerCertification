-- 資格・科目マスタのみ。questions / choices は含まない。

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
