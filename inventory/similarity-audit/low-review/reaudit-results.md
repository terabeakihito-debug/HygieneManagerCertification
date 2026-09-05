# 再監査結果（一時展開）

比較元: Git `72d259b8` を `/tmp/audit-source` へ読み取り専用展開。作業ツリーには戻していない。  
スクリプト: `inventory/similarity-audit/scripts/run_reaudit_from_temp.py`  
機械結果: `reaudit-summary.json` / `reaudit-candidates.csv`

| 検査 | 結果 |
|---|---|
| オリジナル 368 | OK |
| 使用中 344 | OK |
| /learn 296 | OK |
| 過去問 SQL 708 | OK |
| txt 18 / 708問 | OK |
| CRITICAL | 0 |
| HIGH | 0 |
| MEDIUM | 2（初回と同じ2件。法令値） |
| 修正対象の類似上昇 | なし（`mobile-upper-slew` は一時上昇後に再改稿し NO_MATCH） |
| REWRITE 残 | 0 |
| REPHRASE 残 | 0 |

MEDIUM の内訳は `low-review-summary.md` §7。過去問本文は複製していない。
