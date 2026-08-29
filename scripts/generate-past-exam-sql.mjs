import { randomUUID } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");

const FILES = [
  {
    path: "data/past-exams/type1_2026-04.txt",
    kind: "type1",
    examLabel: "第一種衛生管理者試験",
  },
  {
    path: "data/past-exams/type1_2025-10.txt",
    kind: "type1",
    examLabel: "第一種衛生管理者試験",
  },
  {
    path: "data/past-exams/type2_2026-04.txt",
    kind: "type2",
    examLabel: "第二種衛生管理者試験",
  },
  {
    path: "data/past-exams/type2_2025-10.txt",
    kind: "type2",
    examLabel: "第二種衛生管理者試験",
  },
];

/** @type {Record<string, { examTypeCode: string; categoryName: string }>} */
const TYPE1_HEADINGS = {
  "関係法令（有害業務に係るもの）": {
    examTypeCode: "type1",
    categoryName: "関係法令(有害業務に係るもの)",
  },
  "労働衛生（有害業務に係るもの）": {
    examTypeCode: "type1",
    categoryName: "労働衛生(有害業務を含む)",
  },
  "関係法令（有害業務に係るもの以外のもの）": {
    examTypeCode: "type1",
    categoryName: "関係法令(有害業務に係るもの以外のもの)",
  },
  "労働衛生（有害業務に係るもの以外のもの）": {
    examTypeCode: "type1",
    categoryName: "労働衛生(有害業務に係るもの以外のもの)",
  },
  労働生理: {
    examTypeCode: "common",
    categoryName: "労働生理",
  },
};

/** @type {Record<string, { examTypeCode: string; categoryName: string }>} */
const TYPE2_HEADINGS = {
  関係法令: {
    examTypeCode: "type2",
    categoryName: "関係法令(有害業務に係るものを除く)",
  },
  労働衛生: {
    examTypeCode: "type2",
    categoryName: "労働衛生(有害業務を除く)",
  },
  労働生理: {
    examTypeCode: "common",
    categoryName: "労働生理",
  },
};

const EXISTING_CATEGORIES = [
  { examTypeCode: "type1", name: "労働衛生(有害業務を含む)", sortOrder: 1 },
  { examTypeCode: "type2", name: "労働衛生(有害業務を除く)", sortOrder: 1 },
  { examTypeCode: "type1", name: "関係法令(有害業務に係るもの)", sortOrder: 2 },
  {
    examTypeCode: "type2",
    name: "関係法令(有害業務に係るものを除く)",
    sortOrder: 2,
  },
  { examTypeCode: "common", name: "労働生理", sortOrder: 3 },
];

const NEW_CATEGORIES = [
  {
    examTypeCode: "type1",
    name: "関係法令(有害業務に係るもの以外のもの)",
    sortOrder: 4,
  },
  {
    examTypeCode: "type1",
    name: "労働衛生(有害業務に係るもの以外のもの)",
    sortOrder: 5,
  },
];

const QUESTION_START = /^問\s*([０-９0-9]+)\s+(.*)$/;
const SECTION = /^〔(.+)〕$/;
const CHOICE = /^(○)?（([１-５])）(.*)$/;
const FULLWIDTH_DIGITS = {
  "０": "0",
  "１": "1",
  "２": "2",
  "３": "3",
  "４": "4",
  "５": "5",
  "６": "6",
  "７": "7",
  "８": "8",
  "９": "9",
};

function toAsciiDigits(value) {
  return value.replace(/[０-９]/g, (ch) => FULLWIDTH_DIGITS[ch] ?? ch);
}

function parsePublishedAt(sourceLine) {
  const match = sourceLine.match(/(令和\d+年\d+月公表)/);
  if (!match) {
    throw new Error(`公表年月を抽出できません: ${sourceLine}`);
  }
  return match[1];
}

function mapHeading(kind, heading) {
  const table = kind === "type1" ? TYPE1_HEADINGS : TYPE2_HEADINGS;
  const mapped = table[heading];
  if (!mapped) {
    throw new Error(`${kind} の未知の見出し: ${heading}`);
  }
  return mapped;
}

function parseFile(relPath, kind, examLabel) {
  const text = readFileSync(join(root, relPath), "utf8").replace(/\r\n/g, "\n");
  const lines = text.split("\n");
  const sourceLine = lines[0] ?? "";
  const publishedAt = parsePublishedAt(sourceLine);

  /** @type {Array<{
   *   number: number;
   *   examTypeCode: string;
   *   categoryName: string;
   *   questionText: string;
   *   choices: Array<{ sortOrder: number; text: string; isCorrect: boolean }>;
   *   sourceNote: string;
   * }>} */
  const questions = [];

  let heading = null;
  let current = null;

  const flush = () => {
    if (!current) {
      return;
    }
    current.questionText = current.questionLines.join("\n").trim();
    if (!current.questionText) {
      throw new Error(`${relPath} 問${current.number}: 問題文が空です`);
    }
    if (current.choices.length !== 5) {
      throw new Error(
        `${relPath} 問${current.number}: 選択肢が${current.choices.length}件です`,
      );
    }
    const correctCount = current.choices.filter((c) => c.isCorrect).length;
    if (correctCount !== 1) {
      throw new Error(
        `${relPath} 問${current.number}: 正答が${correctCount}件です`,
      );
    }
    const orders = current.choices.map((c) => c.sortOrder).join(",");
    if (orders !== "1,2,3,4,5") {
      throw new Error(`${relPath} 問${current.number}: 選択肢順が ${orders}`);
    }
    questions.push({
      number: current.number,
      examTypeCode: current.examTypeCode,
      categoryName: current.categoryName,
      questionText: current.questionText,
      choices: current.choices,
      sourceNote: `公益財団法人安全衛生技術試験協会 ${publishedAt} ${examLabel} 問${current.number}`,
    });
    current = null;
  };

  for (const rawLine of lines.slice(1)) {
    const line = rawLine.trimEnd();
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith("元URL:")) {
      continue;
    }

    const sectionMatch = trimmed.match(SECTION);
    if (sectionMatch) {
      flush();
      heading = sectionMatch[1];
      continue;
    }

    const questionMatch = trimmed.match(QUESTION_START);
    if (questionMatch) {
      flush();
      if (!heading) {
        throw new Error(`${relPath}: 見出しの前に問題があります`);
      }
      const mapped = mapHeading(kind, heading);
      current = {
        number: Number(toAsciiDigits(questionMatch[1])),
        examTypeCode: mapped.examTypeCode,
        categoryName: mapped.categoryName,
        questionLines: [questionMatch[2]],
        choices: [],
      };
      continue;
    }

    const choiceMatch = trimmed.match(CHOICE);
    if (choiceMatch) {
      if (!current) {
        throw new Error(`${relPath}: 問題の外に選択肢があります: ${trimmed}`);
      }
      const sortOrder = Number(toAsciiDigits(choiceMatch[2]));
      current.choices.push({
        sortOrder,
        text: choiceMatch[3].trim(),
        isCorrect: choiceMatch[1] === "○",
      });
      continue;
    }

    if (current && current.choices.length === 0) {
      current.questionLines.push(trimmed);
      continue;
    }

    if (current && current.choices.length > 0) {
      const last = current.choices[current.choices.length - 1];
      last.text = `${last.text}\n${trimmed}`;
      continue;
    }

    throw new Error(`${relPath}: 解釈できない行: ${trimmed}`);
  }

  flush();
  return questions;
}

function dollarQuote(tag, value) {
  const open = `$${tag}$`;
  if (value.includes(open)) {
    throw new Error(`ドルクォートタグ ${open} が本文に含まれています`);
  }
  return `${open}${value}${open}`;
}

function sqlString(value) {
  return `'${value.replaceAll("'", "''")}'`;
}

function categorySelect(examTypeCode, categoryName) {
  return `(SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.code = ${sqlString(examTypeCode)} AND c.name = ${sqlString(categoryName)})`;
}

function examTypeSelect(code) {
  return `(SELECT id FROM exam_types WHERE code = ${sqlString(code)})`;
}

function categoryInsert({ examTypeCode, name, sortOrder }) {
  return `INSERT INTO categories (exam_type_id, name, sort_order)
SELECT et.id, ${sqlString(name)}, ${sortOrder}
FROM exam_types et
WHERE et.code = ${sqlString(examTypeCode)}
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = ${sqlString(name)}
  );`;
}

const allQuestions = FILES.flatMap((file) =>
  parseFile(file.path, file.kind, file.examLabel),
);

const lines = [];
lines.push("-- 過去問(令和7年10月・令和8年4月公表)の questions / choices 投入");
lines.push("-- 生成元: data/past-exams/*.txt");
lines.push("-- explanation はプレースホルダー。後続で実解説を追加する。");
lines.push("");
lines.push("-- 既存 categories (2026-08-29 確認):");
lines.push("--   労働衛生(有害業務を含む) / type1");
lines.push("--   労働衛生(有害業務を除く) / type2");
lines.push("--   関係法令(有害業務に係るもの) / type1");
lines.push("--   関係法令(有害業務に係るものを除く) / type2");
lines.push("--   労働生理 / common");
lines.push("-- 不足していた第一種の非有害業務分野のみ新規追加する。");
lines.push("");

for (const category of [...EXISTING_CATEGORIES, ...NEW_CATEGORIES]) {
  lines.push(categoryInsert(category));
  lines.push("");
}

let questionCount = 0;
let choiceCount = 0;

for (const question of allQuestions) {
  const questionId = randomUUID();
  questionCount += 1;
  lines.push(
    `INSERT INTO questions (id, exam_type_id, category_id, question_text, explanation, source_type, source_note)`,
  );
  lines.push(`VALUES (`);
  lines.push(`  '${questionId}',`);
  lines.push(`  ${examTypeSelect(question.examTypeCode)},`);
  lines.push(
    `  ${categorySelect(question.examTypeCode === "common" ? "common" : question.examTypeCode, question.categoryName)},`,
  );
  lines.push(`  ${dollarQuote("q", question.questionText)},`);
  lines.push(`  '(解説は今後追加予定)',`);
  lines.push(`  'past_exam',`);
  lines.push(`  ${sqlString(question.sourceNote)}`);
  lines.push(`);`);
  lines.push("");

  lines.push(
    `INSERT INTO choices (question_id, choice_text, is_correct, sort_order)`,
  );
  lines.push(`VALUES`);
  const choiceRows = question.choices.map((choice, index) => {
    choiceCount += 1;
    const comma = index === question.choices.length - 1 ? ";" : ",";
    return `  ('${questionId}', ${dollarQuote("c", choice.text)}, ${choice.isCorrect}, ${choice.sortOrder})${comma}`;
  });
  lines.push(choiceRows.join("\n"));
  lines.push("");
}

const outPath = join(root, "supabase/migrations/0004_past_exam_questions.sql");
writeFileSync(outPath, `${lines.join("\n").trimEnd()}\n`, "utf8");

const byFile = FILES.map((file) => {
  const questions = parseFile(file.path, file.kind, file.examLabel);
  return `${file.path}: ${questions.length}問`;
});

const byCategory = new Map();
for (const question of allQuestions) {
  const key = `${question.examTypeCode}\t${question.categoryName}`;
  byCategory.set(key, (byCategory.get(key) ?? 0) + 1);
}

console.log(byFile.join("\n"));
console.log(`TOTAL_QUESTIONS ${questionCount}`);
console.log(`TOTAL_CHOICES ${choiceCount}`);
for (const [key, count] of byCategory) {
  console.log(`CAT ${key}\t${count}`);
}
console.log(`WROTE ${outPath}`);
