-- 資格・科目マスタのみ。questions / choices は含まない。

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
