-- 衛生管理者の不足科目マスタ。questions / choices は含まない。

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務を含む)', 1
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務を含む)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務を除く)', 1
FROM exam_types et
WHERE et.code = 'type2'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務を除く)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るもの)', 2
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るもの)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るものを除く)', 2
FROM exam_types et
WHERE et.code = 'type2'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るものを除く)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働生理', 3
FROM exam_types et
WHERE et.code = 'common'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働生理'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '関係法令(有害業務に係るもの以外のもの)', 4
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '関係法令(有害業務に係るもの以外のもの)'
  );

INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, '労働衛生(有害業務に係るもの以外のもの)', 5
FROM exam_types et
WHERE et.code = 'type1'
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = '労働衛生(有害業務に係るもの以外のもの)'
  );
