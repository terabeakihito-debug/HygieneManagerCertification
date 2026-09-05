-- 資格・科目マスタのみ。questions / choices は含まない。

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'pressure_chamber', '高圧室内作業主任者', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'pressure_chamber');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'pressure_chamber', 'common', '高圧室内作業主任者'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'pressure_chamber' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'pressure_chamber', 'common', '高圧室内作業主任者', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'pressure_chamber' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '圧気工法', 1
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '圧気工法'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '送気及び排気', 2
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '送気及び排気'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '高気圧障害', 3
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '高気圧障害'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'pressure_chamber', '関係法令', 4
FROM exam_types et
WHERE et.exam_id = 'pressure_chamber'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );
