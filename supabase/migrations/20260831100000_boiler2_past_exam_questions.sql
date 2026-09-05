-- 資格・科目マスタのみ。questions / choices は含まない。

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
