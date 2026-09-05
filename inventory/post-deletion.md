# 削除後集計（現行ソース）

`questions-inventory.json` / `totals.json` / 本ディレクトリの旧 README 表は **削除前スナップショット** です。ここに書いた件数が、今のリポジトリソースの値です。

調査日: 2026-09-05  
commit / push / リモート DB 適用はしていない。

## 現行ソース

| 指標 | 件数 |
|---|---:|
| `INSERT INTO questions` | 368 |
| original | 368 |
| past_exam_suspected | 0 |
| in_use（画面表示） | 344 |
| unused original（衛生 0009 のみ） | 24 |
| 五肢 | 344 |
| 四肢 | 24 |
| `/learn` トピック | 296 |
| in-use 模試 INSERT | 15 |
| ソース上の未使用公表模試 | 0 |
| `data/past-exams/*.txt` | 0 |
| `data/heading-maps/*.json` | 0 |

機械可読版: `post-deletion-totals.json`。

## リモート / 共有 DB

削除 migration `supabase/migrations/20260905120000_delete_inventory_past_exam_suspected_questions.sql` は作成済みで、**未適用**です。公開・共有 DB には削除前の 708 問が残っている想定です。

適用前に必要なこと:

1. `questions` / `choices` / `user_answers` / `review_list` / `mock_exams` / `mock_exam_results` のバックアップ
2. 708 UUID リストと、模試 30 件の `(exam_id, name)` リストの SQL レビュー
3. 件数ガードの確認（問題は 0 または 708、模試は 0 または 30。それ以外は停止）

新規構築では現行 migration が 708 を投入しないため、問題行は最初から 0 件になり、当該 DELETE は no-op です。
