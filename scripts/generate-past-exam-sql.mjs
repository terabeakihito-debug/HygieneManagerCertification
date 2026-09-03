import { randomUUID } from "node:crypto";
import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");

const QUESTION_START = /^問\s*([０-９0-9]+)\s+(.*)$/;
const SECTION = /^〔(.+)〕$/;
const CHOICE = /^(○)?（([１-５])）(.*)$/;
const FIGURE = /^図:\s+(\S+)$/;
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

function parseArgs(argv) {
  const args = {
    exam: null,
    inputs: [],
    kind: null,
    output: null,
    dumpJson: null,
  };
  for (let i = 0; i < argv.length; i += 1) {
    const flag = argv[i];
    const value = argv[i + 1];
    if (flag === "--exam") {
      args.exam = value;
      i += 1;
    } else if (flag === "--input") {
      args.inputs.push(value);
      i += 1;
    } else if (flag === "--kind") {
      args.kind = value;
      i += 1;
    } else if (flag === "--output") {
      args.output = value;
      i += 1;
    } else if (flag === "--dump-json") {
      args.dumpJson = value;
      i += 1;
    } else {
      throw new Error(`未知の引数: ${flag}`);
    }
    if (flag !== undefined && (value === undefined || value.startsWith("--"))) {
      throw new Error(`${flag} の値がありません`);
    }
  }
  if (!args.exam) {
    throw new Error("--exam が必要です");
  }
  return args;
}

function loadHeadingMap(examId) {
  const mapPath = join(root, "data/heading-maps", `${examId}.json`);
  return JSON.parse(readFileSync(mapPath, "utf8"));
}

function resolveHeading(map, kind, heading) {
  const table = map.headings?.[kind];
  if (!table) {
    throw new Error(`${map.examId} の未知の kind: ${kind}`);
  }
  const mapped = table[heading];
  if (!mapped) {
    throw new Error(`${kind} の未知の見出し: ${heading}`);
  }
  if (typeof mapped === "string") {
    return {
      examTypeCode: map.defaultExamTypeCode ?? kind,
      categoryName: mapped,
    };
  }
  return mapped;
}

function parsePublishedAt(lines) {
  for (const line of lines) {
    const match = line.match(/(令和\d+年\d+月公表)/);
    if (match) {
      return match[1];
    }
  }
  throw new Error("公表年月を抽出できません");
}

function shouldSkipLine(trimmed) {
  return (
    !trimmed ||
    trimmed.startsWith("元URL:") ||
    trimmed.startsWith("出典:") ||
    trimmed.startsWith("※") ||
    trimmed.startsWith("二ボ") ||
    trimmed.startsWith("クレ・デリ") ||
    trimmed.startsWith("次の科目の免除者") ||
    trimmed.startsWith("次の科目が免除") ||
    trimmed.includes("は解答しないでください") ||
    trimmed === "○" ||
    trimmed.startsWith("（終")
  );
}

function parseFile(relPath, kind, examLabel, map) {
  const text = readFileSync(join(root, relPath), "utf8").replace(/\r\n/g, "\n");
  const lines = text.split("\n");
  const publishedAt = parsePublishedAt(lines);

  /** @type {Array<{
   *   number: number;
   *   examTypeCode: string;
   *   categoryName: string;
   *   questionText: string;
   *   figureUrl: string | null;
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
      figureUrl: current.figureUrl,
      choices: current.choices,
      sourceNote: `公益財団法人安全衛生技術試験協会 ${publishedAt} ${examLabel} 問${current.number}`,
    });
    current = null;
  };

  for (const rawLine of lines) {
    const line = rawLine.trimEnd();
    const trimmed = line.trim();
    if (shouldSkipLine(trimmed)) {
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
      const mapped = resolveHeading(map, kind, heading);
      current = {
        number: Number(toAsciiDigits(questionMatch[1])),
        examTypeCode: mapped.examTypeCode,
        categoryName: mapped.categoryName,
        questionLines: [questionMatch[2]],
        figureUrl: null,
        choices: [],
      };
      continue;
    }

    const figureMatch = trimmed.match(FIGURE);
    if (figureMatch) {
      if (!current) {
        throw new Error(`${relPath}: 問題の外に図指定があります: ${trimmed}`);
      }
      current.figureUrl = figureMatch[1];
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

function categorySelect(examId, examTypeCode, categoryName) {
  return `(SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = ${sqlString(examId)} AND e.code = ${sqlString(examTypeCode)} AND c.name = ${sqlString(categoryName)})`;
}

function examTypeSelect(examId, code) {
  return `(SELECT id FROM exam_types WHERE exam_id = ${sqlString(examId)} AND code = ${sqlString(code)})`;
}

function categoryInsert(examId, { examTypeCode, name, sortOrder }) {
  return `INSERT INTO categories (exam_type_id, exam_id, name, sort_order)
SELECT et.id, ${sqlString(examId)}, ${sqlString(name)}, ${sortOrder}
FROM exam_types et
WHERE et.exam_id = ${sqlString(examId)}
  AND et.code = ${sqlString(examTypeCode)}
  AND NOT EXISTS (
    SELECT 1
    FROM categories c
    WHERE c.exam_type_id = et.id
      AND c.name = ${sqlString(name)}
  );`;
}

function mastersSql(map) {
  const masters = map.masters;
  if (!masters) {
    return [];
  }
  const examId = sqlString(map.examId);
  const lines = [];
  lines.push(
    `INSERT INTO exams (id, name, organization, has_practical_exam)
SELECT ${sqlString(masters.exam.id)}, ${sqlString(masters.exam.name)}, ${sqlString(masters.exam.organization)}, ${masters.exam.hasPracticalExam}
WHERE NOT EXISTS (SELECT 1 FROM exams WHERE id = ${examId});`,
  );
  lines.push("");
  for (const examType of masters.examTypes ?? []) {
    lines.push(
      `INSERT INTO exam_types (exam_id, code, name)
SELECT ${examId}, ${sqlString(examType.code)}, ${sqlString(examType.name)}
WHERE NOT EXISTS (
  SELECT 1 FROM exam_types WHERE exam_id = ${examId} AND code = ${sqlString(examType.code)}
);`,
    );
    lines.push("");
  }
  for (const examCategory of masters.examCategories ?? []) {
    lines.push(
      `INSERT INTO exam_categories (exam_id, code, label, display_order)
SELECT ${examId}, ${sqlString(examCategory.code)}, ${sqlString(examCategory.label)}, ${examCategory.displayOrder}
WHERE NOT EXISTS (
  SELECT 1 FROM exam_categories WHERE exam_id = ${examId} AND code = ${sqlString(examCategory.code)}
);`,
    );
    lines.push("");
  }
  return lines;
}

function resolveFiles(args, map) {
  if (args.inputs.length === 0) {
    return map.files ?? [];
  }
  return args.inputs.map((path) => {
    const listed = (map.files ?? []).find((file) => file.path === path);
    return {
      path,
      kind: args.kind ?? listed?.kind ?? map.defaultKind,
      examLabel: listed?.examLabel,
    };
  });
}

const args = parseArgs(process.argv.slice(2));
const map = loadHeadingMap(args.exam);
if (map.examId !== args.exam) {
  throw new Error(`heading map の examId が一致しません: ${map.examId}`);
}

const files = resolveFiles(args, map);
if (files.length === 0) {
  throw new Error("入力ファイルがありません (--input または heading map の files)");
}
for (const file of files) {
  if (!file.kind) {
    throw new Error(`${file.path}: kind が不明です (--kind を指定してください)`);
  }
  if (!file.examLabel) {
    throw new Error(`${file.path}: examLabel が不明です`);
  }
}

const allQuestions = files.flatMap((file) =>
  parseFile(file.path, file.kind, file.examLabel, map),
);

if (args.dumpJson) {
  writeFileSync(args.dumpJson, `${JSON.stringify(allQuestions, null, 2)}\n`, "utf8");
  console.log(`DUMPED ${allQuestions.length} ${args.dumpJson}`);
}

if (!args.output) {
  if (!args.dumpJson) {
    const byFile = files.map((file) => {
      const questions = parseFile(file.path, file.kind, file.examLabel, map);
      return `${file.path}: ${questions.length}問`;
    });
    console.log(byFile.join("\n"));
    console.log(`TOTAL_QUESTIONS ${allQuestions.length}`);
  }
  process.exit(0);
}

const lines = [];
lines.push(`-- ${map.examId} 過去問 questions / choices 投入`);
lines.push("-- 生成元: data/past-exams/*.txt");
lines.push("-- explanation はプレースホルダー。後続で実解説を追加する。");
lines.push("");
lines.push(...mastersSql(map));

for (const category of map.seedCategories ?? []) {
  lines.push(categoryInsert(map.examId, category));
  lines.push("");
}

let questionCount = 0;
let choiceCount = 0;

for (const question of allQuestions) {
  const questionId = randomUUID();
  questionCount += 1;
  lines.push(
    `INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)`,
  );
  lines.push(`VALUES (`);
  lines.push(`  '${questionId}',`);
  lines.push(`  ${sqlString(map.examId)},`);
  lines.push(`  ${examTypeSelect(map.examId, question.examTypeCode)},`);
  lines.push(
    `  ${categorySelect(map.examId, question.examTypeCode === "common" ? "common" : question.examTypeCode, question.categoryName)},`,
  );
  lines.push(`  ${dollarQuote("q", question.questionText)},`);
  lines.push(`  '(解説は今後追加予定)',`);
  lines.push(`  'past_exam',`);
  lines.push(`  ${sqlString(question.sourceNote)},`);
  lines.push(`  ${question.figureUrl ? sqlString(question.figureUrl) : "NULL"}`);
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

const outPath = join(root, args.output);
writeFileSync(outPath, `${lines.join("\n").trimEnd()}\n`, "utf8");

const byFile = files.map((file) => {
  const questions = parseFile(file.path, file.kind, file.examLabel, map);
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
