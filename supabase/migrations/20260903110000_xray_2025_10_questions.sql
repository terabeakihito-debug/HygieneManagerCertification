-- xray 基盤登録 (exams / exam_types / exam_categories / categories)
-- および令和7年10月 過去問 questions / choices / mock_exams

INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT 'xray', 'エックス線作業主任者', '公益財団法人安全衛生技術試験協会', false
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = 'xray');

INSERT INTO exam_types (exam_id, code, name)
SELECT 'xray', 'common', 'エックス線作業主任者'
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = 'xray' AND code = 'common'
);

INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT 'xray', 'common', 'エックス線作業主任者', 1
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = 'xray' AND code = 'common'
);

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の管理に関する知識', 1
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の管理に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', '関係法令', 2
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の測定に関する知識', 3
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の測定に関する知識'
  );

INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, 'xray', 'エックス線の生体に与える影響に関する知識', 4
FROM exam_types et
WHERE et.exam_id = 'xray'
  AND et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = 'エックス線の生体に与える影響に関する知識'
  );
