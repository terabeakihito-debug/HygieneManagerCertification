# 機械的類似度監査（読み取り専用）

調査日: 2026-09-05  
対象リポジトリ: `HygieneManagerCertification`  
方針: 自動判定は類似候補の抽出であり、著作権侵害の断定ではない。  
初回走査および再監査とも CRITICAL / HIGH は 0 件。近傍コピー未検出であり、法的クリアランスではない。

## 再実行

比較元だった過去問疑い SQL 708件と `data/past-exams/` 原文18ファイルは、現行作業ツリーから削除済みです。既存の `summary.json` / `candidates.csv` / `review-queue.md` は削除時点までの初回監査証跡として残します。

現行ソースに対して `run_similarity_audit.py` をそのまま走らせると、比較コーパスが空になり件数チェックで失敗します。再監査するときは、比較元を作業ツリーへ戻さず、削除前の Git オブジェクトから一時領域へ読み取り専用展開します。

```bash
# 比較元が残る最後のコミット（past-exam-source-removal の親）
REV=72d259b8f0178a6eac3591ad42dcd56e4540a723
rm -rf /tmp/audit-source
mkdir -p /tmp/audit-source/data /tmp/audit-source/supabase
git archive "$REV" data/past-exams data/heading-maps supabase/migrations \
  | tar -x -C /tmp/audit-source
echo "PARENT=$REV" > /tmp/audit-source/SOURCE_REV.txt

# クエリは現行作業ツリー、ピアは一時展開
python3 inventory/similarity-audit/scripts/run_reaudit_from_temp.py /tmp/audit-source

# 終了後は必ず削除
rm -rf /tmp/audit-source
```

標準ライブラリのみ。成果物の再監査側は `low-review/reaudit-summary.json` と `low-review/reaudit-candidates.csv` で、初回の `candidates.csv` は上書きしない。

LOW 179件の確定結果は `low-review/` を見ること。

## 対象件数と処理件数

| 集合 | 予定 | 処理 |
|---|---:|---:|
| オリジナル択一 | 368 | 368 |
| うち使用中 | 344 | 344 |
| うち未使用 | 24 | 24 |
| /learn 説明例 | 296 | 296 |
| 過去問疑い SQL | 708 | 708 |
| 過去問テキスト | 18 ファイル | 18 ファイル / 708 問 |
| 検査対象の処理漏れ | 0 | 0 |

検査対象は全件、比較コーパス（SQL 708 + txt 問単位）と照合した。

## 比較単位

択一: 問題文、選択肢、正答位置、解説、数値列、問題文+選択肢の結合。  
/learn: タイトル、本文、計算例（数値+計算語を含む文）、図の `alt`。

## 正規化

- Unicode NFKC、全角数字・英数の半角化
- 改行・連続空白の圧縮
- 選択肢番号 `(1)` `（１）` `○（４）` の除去
- Markdown 装飾の除去
- 句読点を除いた比較
- 数字保持版と `NUM` プレースホルダー版の両方

定型文（「次のうちどれか」等）は構造比較から外し、それ単独では高リスクにしない。

## 指標

- 完全一致 / 長い包含
- 文字 3-gram Jaccard（保持・除外）
- 文字 3-gram TF-IDF cosine（コーパス IDF）
- `SequenceMatcher` 比
- 最長共通ブロック長と比率
- 数値列の full / subset / partial
- 選択肢の 3-gram 対応一致数
- 正答位置の一致（参考。単独では上げない）

## しきい値と採用理由

ドライランで同一科目の法令・力学は Jaccard 0.18–0.28 に集中し、場面を共有する書換えは 0.32–0.50、近傍コピーは 0.60 超に乗った。

| 区分 | 目安 | 理由 |
|---|---|---|
| CRITICAL | 完全一致・長文包含、または Jaccard≥0.78 かつ seq≥0.78 かつ（選択肢≥4 または特徴的数値が2つ以上） | 問題文と選択肢・数値が同時にほぼ同一 |
| HIGH | Jaccard≥0.52 かつ seq≥0.5 かつ（選択肢≥3 または特徴的数値≥2） | 文章構造と誤答肢または固有数値が強く重なる |
| MEDIUM | Jaccard≥0.34 または seq≥0.42 または TF-IDF≥0.48 または特徴的数値≥3 | 人の目が必要 |
| LOW | Jaccard≥0.24 または法令値・公式・用語のみ | 高リスクにしない |
| NO_MATCH | それ未満 | 実質候補なし |

法令値・公式・「適切なものはどれか」・選択肢番号だけでは CRITICAL/HIGH にしない。  
固有の場面+数値、語順+複数肢、特徴的誤答肢、解説順の複合一致を優先する。

特徴的数値 = コーパス DF が低く、法定の定番値セットに入らない数。

## 択一オリジナルの最良候補区分

| 区分 | CRITICAL | HIGH | MEDIUM | LOW | NO_MATCH | 合計 |
|---|---|---|---|---|---|---|
| in_use | 0 | 0 | 1 | 30 | 313 | 344 |
| unused | 0 | 0 | 0 | 1 | 23 | 24 |
| all | 0 | 0 | 1 | 31 | 336 | 368 |

| 資格 | CRITICAL | HIGH | MEDIUM | LOW | NO_MATCH |
|---|---:|---:|---:|---:|---:|
| hygiene | 0 | 0 | 0 | 7 | 81 |
| boiler2 | 0 | 0 | 0 | 1 | 39 |
| crane_all | 0 | 0 | 0 | 3 | 37 |
| mobile_crane | 0 | 0 | 0 | 7 | 33 |
| xray | 0 | 0 | 0 | 3 | 37 |
| diver | 0 | 0 | 1 | 6 | 33 |
| pressure_chamber | 0 | 0 | 0 | 3 | 37 |
| cargo_gear | 0 | 0 | 0 | 1 | 39 |

## /learn 説明例の最良候補区分

| 区分 | CRITICAL | HIGH | MEDIUM | LOW | NO_MATCH | 合計 |
|---|---|---|---|---|---|---|
| in_use | 0 | 0 | 1 | 148 | 147 | 296 |
| unused | 0 | 0 | 0 | 0 | 0 | 0 |
| all | 0 | 0 | 1 | 148 | 147 | 296 |

| 資格 | CRITICAL | HIGH | MEDIUM | LOW | NO_MATCH |
|---|---:|---:|---:|---:|---:|
| hygiene | 0 | 0 | 0 | 14 | 12 |
| boiler2 | 0 | 0 | 0 | 0 | 38 |
| crane_all | 0 | 0 | 0 | 17 | 18 |
| mobile_crane | 0 | 0 | 0 | 28 | 9 |
| xray | 0 | 0 | 0 | 6 | 34 |
| diver | 0 | 0 | 0 | 31 | 9 |
| pressure_chamber | 0 | 0 | 1 | 36 | 3 |
| cargo_gear | 0 | 0 | 0 | 16 | 24 |

## 限界

- 本番 DB は見ていない。リポジトリ上の SQL / テキストとの比較である。
- 言い換えが強いと MEDIUM 以下に落ちることがある。逆に同じ法令テーマは LOW が出やすい。
- TF-IDF は文字 3-gram であり、単語意味の埋め込みではない。
- 成果物に過去問本文は複製していない。相手は ID とファイル:行で参照する。
- txt と SQL は同一回の二重コーパスなので、同じ問が両方に出る場合がある。

## 成果物

| ファイル | 内容 |
|---|---|
| `summary.json` | 件数集計と処理検証 |
| `candidates.csv` / `candidates.json` | LOW 以上の候補（本文なし） |
| `review-queue.md` | MEDIUM 以上の確認順（削除前） |
| `low-review.md` / `low-review.tsv` | 初回 LOW 169 の人による精査（比較元は `git show HEAD`） |
| `scripts/run_similarity_audit.py` | 再実行用（現行ソースでは不可） |
