#!/usr/bin/env python3
"""Resolve REWRITE/REPHRASE leftovers and rewrite low-review artifacts.

Does not copy past-exam stems. Does not touch git.
"""

from __future__ import annotations

import csv
import json
from collections import Counter
from pathlib import Path

ROOT = Path("/home/cursorworker/dev/HygieneManagerCertification")
DIR = ROOT / "inventory" / "similarity-audit" / "low-review"
CSV_PATH = DIR / "low-review-results.csv"
JSON_PATH = DIR / "low-review-results.json"

# query_id -> (new_class, statutory_or_general, fix_needed, fix_applied, rationale)
# Every former REWRITE/REPHRASE must land here.
UPDATES: dict[str, tuple[str, str, str, str, str]] = {}


def add(qid: str, klass: str, kind: str, needed: str, applied: str, rationale: str) -> None:
    if qid in UPDATES:
        raise SystemExit(f"duplicate update {qid}")
    UPDATES[qid] = (klass, kind, needed, applied, rationale)


# --- 14 REWRITE_REQUIRED (all already edited; remaining overlap is statutory/general) ---
add(
    "1ce601b3-74b7-428f-bffb-6230dfd84e05",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "比較先と同型だった『調整器なし・圧縮機能力→最大水深』をやめ、水深25 mで必要な水面換算能力を問う形に変えた。残る一致は高気圧則28条の60 L/minと換算式60×(D+10)/10だけ。独立再計算: 60×35/10=210。正答210 L（3番目）・誤答150/180/240/300。法令値は未変更。",
)
add(
    "blood-composition",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "血球・血漿の教科書説明を『運ぶ・守る・固める』の機能順に組み替えた。残る一致はヘマトクリット約40％、赤血球寿命約120日、好中球・リンパ球の一般割合だけ。数値は教科書値で変更不可。",
)
add(
    "muscle-movement",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "骨格筋・平滑筋・心筋の対比を収縮様式と酸化の行き先から書き直した。残る一致は等張性／等尺性の一般定義とグリコーゲン酸化だけ。法令値なし。",
)
add(
    "food-poisoning",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "感染型／毒素型の菌名リスト歩きをやめ、予防の共通項から入る構成にした。残る一致はカンピロバクター・黄色ブドウ球菌・ノロウイルスの一般分類だけ。特定問題の誤肢順は残していない。",
)
add(
    "xray-shielding-scatter-reduction",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "散乱低減の誤肢ミラーを肯定の遮蔽手順に書き直した。残る一致は距離・遮蔽・時間の防護三原則と利用線錐の法令用語。数値は変えていない。",
)
add(
    "xray-controlled-area-marking",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "管理区域標識の誤文反転を義務の肯定文にした。残る一致は電離則の管理区域標識・立入禁止の条文用語。標識の法定要件は言い換え不能。",
)
add(
    "cg-types-structure",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "型式五文の並びを構造の見方（ブーム・旋回・走行）に組み替えた。残る一致はデリック／クレーンの一般分類語だけ。",
)
add(
    "cg-lifting-gear-hooks",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "『本試験の誤り文』型のつり具リストを、掴む力・吸える物・フック形の対比に変えた。残る一致はグリッパー／マグネット／グラブの教科書定義。",
)
add(
    "cg-rated-load-angle",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "制限荷重とジブ角度の説明順を変えた。残る一致は制限荷重の定義と角度による荷重変化という法令・構造の一般関係。創作数値は増やしていない。",
)
add(
    "cg-derrick-gooseneck",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "グースネック周辺の誤肢歩きを部材の役割説明に変えた。残る一致はグースネック・ガイの一般名称。",
)
add(
    "cg-license-qualifications",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "資格境界の五文キーを、総トン数と制限荷重の確認手順に組み替えた。残る一致は700トン未満・2トン以上など安衛則の閾値。閾値は変更不可。",
)
add(
    "cg-handling-rules",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "取扱いの誤肢セットを開始前点検・ハッチ直下・離席禁止の肯定義務に変えた。残る一致は安衛則の取扱い条項そのもの。",
)
add(
    "cg-hydraulic-motor",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "油圧モータの誤肢並びを作動原理の説明に変えた。残る一致は容積式・回転運動という教科書用語。",
)
add(
    "cg-motor-accessories",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "附属装置の項目型リストを機能説明に変えた。残る一致はリリーフ弁・フィルタの一般名称。",
)

# --- REPHRASE already fixed in first pass ---
add(
    "c50d6f57-3b80-4402-ba57-d949664bb3ef",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "貫流ボイラーの水位・燃焼連動はボイラー則の安全装置要件。正解肢をインターロック表現に差し替えたあと、残る一致は『水位喪失時に燃焼を止める』という法定機能だけ。正答は1番目のインターロック肢。他4肢は連動禁止・水面計義務の取り違え・手動給水のみ・送風機停止後の燃料継続でいずれも誤り。",
)
add(
    "27d942e3-03ea-40b1-9bcc-9a38c64ae299",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "使用禁止の直前％セットをやめ、『まだ使えるもの』に反転。正答は直径減6％（2番目）。キンク・形崩れ・鎖伸び6％・リンク減12％は安衛則471/472の禁止側。残る一致は10％素線切れ・7％超径減・5％超伸び・10％超リンク減の法令値だけ。6％<7％超なので使用可、独立判定済み。",
)
add(
    "thermoregulation",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "100 g・70 kg・1℃の気化冷却例は教科書の概算で数値は維持。文の切り出しだけ変えた。残る一致はその概算と視床下部という一般生理。比較先の五肢束は残していない。",
)
add(
    "noise-health",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "発生源→経路→受音者は騒音管理の一般枠。『試験で問われます』をガイドライン実施の肯定文に変えた。残る一致はこの三層枠だけ。",
)
add(
    "lifting-posture",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "18歳・体重40％・6か月は腰痛予防指針の目安で変更不可。持ち上げ手順を『荷に近づき股関節を曲げる』に変えた。残る一致は指針値と膝を伸ばした前屈が負担、という一般指導。",
)

# --- hygiene 3 newly rewritten ---
add(
    "heart-circulation",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "伝導系→体循環／肺循環→動脈硬化の比較先順を、左右心室の出口→肺動静脈の中身→内膜沈着に組み替えた。残る一致は左心室＝大動脈、右心室＝肺動脈という解剖の定義だけ。特定問題の誤肢（左心室→肺動脈）は教材の結論列に置いていない。",
)
add(
    "nervous-system",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "皮質／髄質の対と交感ペアの試験向け分岐をやめ、機能（随意／生命維持）から入る構成にした。残る一致は中枢＝脳と脊髄、交感＝心拍増加という教科書定義。延髄＝随意運動、という比較先誤肢は残していない。",
)
add(
    "wbgt",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "『基準値未満でリスクが高まる』という逆記述ミラーを削除し、WBGTを気温の別名ではない熱ストレス指標として説明した。残る一致は湿球・黒球・乾球という指標の定義要素だけ。基準値の法令・指針値は変えていない（式の暗記もしていない）。",
)

# --- cargo 4 newly rewritten ---
add(
    "cg-fittings-shackle-rope",
    "KEEP_GENERAL",
    "general",
    "yes",
    "yes",
    "名称と形を逆にする、という項目型トラップをやめ、ピンを荷重と直角に通す実務から入った。残る一致はバウ＝ふくらみ、ストレート＝D形、シーブ接触120度以上という装具の一般定義。120度は教科書目安で法令閾値ではないが、定義そのものなので維持。",
)
add(
    "cg-ship-cargo-chief",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "比較先と同じ600トン例を削除。残る一致は技能講習修了者からの選任、直接指揮、総トン数500トン未満かつ揚貨装置なしは対象外、という安衛則の選任要件。500トン境は変更不可。",
)
add(
    "cg-operation-signals",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "『船舶ごと指名』『運転士の自己指名』を結論の対パンチラインにしない構成へ変えた。残る一致は事業者が合図を定め、揚貨装置ごとに指名する、という安衛則467条の主語。条文の主語は変更不可。",
)
add(
    "cg-license-card",
    "KEEP_STATUTORY",
    "statutory",
    "yes",
    "yes",
    "遅滞なく都道府県労働局長へ返還、取消し後1年は再取得不可は免許行政の共有ルール。残る一致はこの法定手続だけ。14日／30日／監督署長という創作期限は使っていない。",
)

# crane_all 14
add("crane-types-structure", "KEEP_GENERAL", "general", "yes", "yes",
    "天井／ジブ等の型式語を一列の五語束から、用途と構造の対比へ崩した。残る一致は天井クレーン・ジブクレーンというJIS/教科書の型式名だけ。型式名は変更できない。")
add("derrick-types-structure", "KEEP_GENERAL", "general", "yes", "yes",
    "ガイ／スチフレッグ／ジンポール／鳥居／二又の分類を、マストの支え方から説明する順にした。残る一致は型式名と旋回範囲の慣用（約240°）。型式名は一般分類。")
add("hoist-and-brake", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "制動トルク150％は構造規格の数値で維持。装置5種の歩き方を、巻上経路とブレーキ位置の説明に変えた。残る一致は150％と巻過防止の法令用語。")
add("lubrication-daily-check", "KEEP_GENERAL", "general", "yes", "yes",
    "密封減速機・グリースカップ・集中給油の実務5文を、給油箇所の見方に組み替えた。残る一致は密封減速機は日常給油しない、という一般取扱い。法定周期ではない。")
add("operator-license", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "5 t境界と取消し後1年は安衛法・クレーン則。30日返還などの誤記キーを本文の結論列から外した。残る一致は5 tと1年欠格だけ。")
add("periodic-self-inspection", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "年次1年・月次1月・記録3年はクレーン則の法定周期。誤記4＋正1の並びを周期ごとの肯定説明に変えた。残る一致はこの3つの年限だけ。")
add("ac-dc-basics", "KEEP_GENERAL", "general", "yes", "yes",
    "交直流の定義を、向きが変わるか／整流後は脈流か、から説明した。特別高圧送電と三相の誤定義並びは外した。残る一致は交流＝向きが変わる、という教科書定義。")
add("motor-types", "KEEP_GENERAL", "general", "yes", "yes",
    "すべり15–20％を誤記として出す項目型をやめ、誘導電動機の回転磁界から入った。残る一致は三相誘導電動機という一般用語。すべり数値の誤肢ミラーは残していない。")
add("controllers-switches", "KEEP_GENERAL", "general", "yes", "yes",
    "ゼロノッチとコースチングの定義順を、操作位置と惰行の意味に分けて書いた。残る一致はこの二つの用語定義。用語そのものは変更不可。")
add("electric-shock", "KEEP_GENERAL", "general", "yes", "yes",
    "電流×時間×波形の一般整理を残し、内部熱傷の特徴句を結論の核にしない構成にした。残る一致は感電の重症度が電流・通電時間・経路に依るという安全の一般知識。")
add("insulation-grounding", "KEEP_GENERAL", "general", "yes", "yes",
    "トロリ線・キャブタイヤ・金属管の給電5文を、絶縁と接地の役割から書き直した。残る一致はこれらの給電部材名。部材名は一般用語。")
add("center-of-gravity", "KEEP_GENERAL", "general", "yes", "yes",
    "重心の鉛直線と底面の関係は物理の定義。直方体／円柱のチェックリスト順を安定判定の手順に変えた。残る一致は鉛直線が底面内なら復元、という力学。")
add("load-types", "KEEP_GENERAL", "general", "yes", "yes",
    "ガーダ曲げ・ロープ引張曲げ・両振りの定義束を、どの部材にどの荷重が載るかの見方に崩した。残る一致は曲げ／引張／両振りという材料力学の用語。")
add("stress-strain", "KEEP_GENERAL", "general", "yes", "yes",
    "σ=P/Aは公式で維持。質量／比重の立方体トラップ付録を外し、応力とひずみの定義から入った。残る一致は公式と単位換算。")

# mobile 22
add("mobile-types-models", "KEEP_GENERAL", "general", "yes", "yes",
    "ラフテレーン操向・PTO・H/Xアウトリガの型式5文を、走行と作業の分担から説明し直した。残る一致は型式名と操向方式の一般区別。")
add("mobile-terms-dimensions", "KEEP_GENERAL", "general", "yes", "yes",
    "つり上げ荷重・作業半径・定格速度・総揚程の定義5文を、測定の起点ごとに並べ替えた。残る一致はJIS/クレーン則の用語定義。定義文は変更不能。")
add("mobile-crawler-undercarriage", "KEEP_GENERAL", "general", "yes", "yes",
    "起動輪／遊動輪の項目型を、履帯の駆動と張りの役割に変えた。残る一致は接地圧p=m·9.8/A。9.8は物理定数。")
add("mobile-upper-slew", "KEEP_GENERAL", "general", "yes", "yes",
    "比較先と同じ五肢（ベアリング旋回・AT後部CW・RT運転室・箱型フートピン・Aフレーム高低）の並びをやめ、おもりの位置と操作室の分け方から書き直した。再監査では同一peerとの類似がMEDIUMからNO_MATCHへ下がった。残る一致は旋回・カウンタウエイトという一般名称だけ。")
add("mobile-hoist-clutch-brake", "KEEP_GENERAL", "general", "yes", "yes",
    "モータ→減速機→クラッチ→ドラムの順を残しつつ、切る位置と止める位置の役割で切った。残る一致はこの伝達経路という教科書の並び（機械の実体順なので変更不能）。")
add("mobile-jib-attachment", "KEEP_GENERAL", "general", "yes", "yes",
    "伸縮方式・ペンダント・マグネットの金属リストを、ジブに何を足すかの用途説明に変えた。残る一致は附属品の一般名称。")
add("mobile-wire-rope-lay", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "ラングより／普通よりの説明順を変えた。廃棄基準6・10％・7％超はクレーン則で維持。残る一致はこの法令％とより方の用語。")
add("mobile-safety-devices", "KEEP_GENERAL", "general", "yes", "yes",
    "過負荷・外れ止め・巻過・起伏停止・旋回警報の装置5文を、何を検知して何を止めるかで再配列した。残る一致は装置名。装置名は規格用語。")
add("mobile-rated-load-table", "KEEP_GENERAL", "general", "yes", "yes",
    "チャートの数値例は既に差し替え済み。階段状の太線の読み方を、強度線と安定線の交わりとして説明した。残る一致は『表の交点を読む』という一般読図。")
add("mobile-work-area-stability", "KEEP_GENERAL", "general", "yes", "yes",
    "後方安定・前方悪化の順位付けを、アウトリガ張出と旋回位置の関係から書いた。残る一致は前方作業が不利になりやすい、という一般安定。")
add("mobile-engine-electrical", "KEEP_GENERAL", "general", "yes", "yes",
    "24 V始動・エアヒータ・レギュレータの項目束を、始動と充電の役割に分けた。残る一致は24 Vという慣用電圧。法令値ではないが車載の一般仕様。")
add("mobile-hydraulic-actuators", "KEEP_GENERAL", "general", "yes", "yes",
    "複動シリンダとラジアル／アキシアルの対比順を、直動か回転かで切り直した。残る一致はこれらの油圧要素名。")
add("mobile-hydraulic-accessories", "KEEP_GENERAL", "general", "yes", "yes",
    "タンク・クーラ・アキュムレータの5文を、油の貯める／冷やす／蓄える機能で書いた。残る一致は附属品名。")
add("mobile-hydraulic-maintenance", "KEEP_GENERAL", "general", "yes", "yes",
    "引火点180–240℃は作動油の教科書帯で維持。油性質の5文歩きを、点検で見る性状に変えた。残る一致はこの温度帯。")
add("mobile-electricity-basics", "KEEP_GENERAL", "general", "yes", "yes",
    "特別高圧交流と200/400 Vの定義束を、電圧階級の見方に崩した。残る一致は低圧／高圧の一般区分。")
add("mobile-electric-shock", "KEEP_GENERAL", "general", "yes", "yes",
    "50 mA·1 sは安全の目安として維持。送電線シーンを一般の接近注意に平らげた。残る一致はこの目安電流。法令の離隔距離表は引用していない。")
add("mobile-use-restrictions", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "0.5 tはクレーン則の報告・制限の境界で維持。装置取り外し許可の四文キーを、許可→報告の順の肯定文にした。残る一致は0.5 tと事業者許可。")
add("mobile-license-handling", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "書替え・再交付・1年欠格は免許行政の法定。30日返還の誤記を本文から外した。残る一致は遅滞なく返還と1年欠格。")
add("mobile-work-regulations", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "フック搭乗禁止など同一コンボの再掲を、作業中の禁止事項の肯定列に変えた。残る一致はクレーン則の使用制限そのもの。")
add("mobile-motion-acceleration", "KEEP_GENERAL", "general", "yes", "yes",
    "V=L/Tは公式。数値例は既に別値。残る一致は公式と単位換算だけ。")
add("mobile-friction", "KEEP_GENERAL", "general", "yes", "yes",
    "F=μNは公式で維持。転がりと滑りの対比を、走行とブレーキの役割で書いた。残る一致は公式。")
add("mobile-load-types", "KEEP_GENERAL", "general", "yes", "yes",
    "フック引張曲げ・ドラム曲げねじりの定義束を、部材ごとの荷重の種類に分けた。残る一致は材料力学の用語。")

# diver 27
add("diver-gas-properties", "KEEP_GENERAL", "general", "yes", "yes",
    "He密度反転・CO焦げ臭・CO2 0.3％の誤肢セットをやめ、窒素・酸素・ヘリウム・二酸化炭素・一酸化炭素の役割から書いた。残る一致はN2約80％、大気CO2約0.04％という一般組成。0.3％中毒閾は本文の結論列に置いていない。")
add("diver-light-sound", "KEEP_GENERAL", "general", "yes", "yes",
    "赤が先に吸収、音速1400–1500 m/sは水中物理。説明を音の方向感覚から入る場面に変えた。残る一致はこの物理値。変更すると誤りになる。")
add("diver-dive-methods", "KEEP_GENERAL", "general", "yes", "yes",
    "軟式／硬式とスクーバ分類を、空気を誰が持つか・応需か定量かで切った。残る一致は方式名。方式名は一般分類。")
add("diver-hazards", "KEEP_GENERAL", "general", "yes", "yes",
    "咬傷／刺傷とA旗の複合キーを、水域の危害の切り方から書いた。残る一致はA旗（白と青の燕尾）という国際信号の定義。旗の定義は変更不可。")
add("diver-blowup-fall", "KEEP_GENERAL", "general", "yes", "yes",
    "内外圧と吹き上げ／墜落の物理を、内圧＞水圧かその逆かで先に置いた。残る一致はこの大小関係。特定の誤操作リスト順は残していない。")
add("diver-entrapment-drowning", "KEEP_GENERAL", "general", "yes", "yes",
    "気管のみ溺死・クラッチ固定・障害物は上へ、の五肢キーを、拘束とパニックの予防手順に崩した。残る一致は溺れが肺まで水が入る場合に限らない、という一般救急。")
add("diver-special-env", "KEEP_GENERAL", "general", "yes", "yes",
    "カルバート／河川／淡鹹／低温／高所の五場面リストを、頭上が閉じる場所と流れと大気圧の三点に圧縮した。残る一致はこれらの環境名。")
add("diver-compressor", "KEEP_GENERAL", "general", "yes", "yes",
    "船上固定＋100 kg分離槽の通説を、吸気位置と油水分離の必要性として書いた。100 kgは法定ではないので結論の核にしていない。残る一致は圧縮機の一般構成。")
add("diver-air-receivers", "KEEP_GENERAL", "general", "yes", "yes",
    "脈動・油水分離・0.1 MPa残圧の誤扱いセットを、空気槽の役割（脈動吸収と予備）に変えた。残る一致は空気槽という装置名。")
add("diver-scuba-descent", "KEEP_GENERAL", "general", "yes", "yes",
    "潜降手順の説明順を変えた。ジャンプ高約0.8 mは既に創作側。残る一致は潜降前点検という一般手順。")
add("diver-helmet-ascent", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "10 m/minは高気圧則の浮上速度で維持。3 m/5分停止と吹き上げ即再圧の項目セットを、速度と連絡を保つ浮上に変えた。残る一致は10 m/min。")
add("diver-buhlmann-mvalue", "KEEP_GENERAL", "general", "yes", "yes",
    "M値定義と停止延長の五主張を、半飽和組織と許容上限という概念説明に圧縮した。残る一致はM値＝許容組織内圧という定義。")
add("diver-helmet-parts", "KEEP_GENERAL", "general", "yes", "yes",
    "部品名の図解を残し、誤肢順の列挙を外した。残る一致はヘルメット・排気弁などの部品名。")
add("diver-scuba-gear", "KEEP_GENERAL", "general", "yes", "yes",
    "キャップ外し洗浄禁止＋19.6 MPa刻印の項目型を、ボンベと調整器の取扱いとして書いた。残る一致は高圧ボンベの一般注意。19.6 MPaは慣用刻印で法令の送気量ではない。")
add("diver-fullface-gear", "KEEP_GENERAL", "general", "yes", "yes",
    "口鼻マスク・足ヒレ・イヤホンの五主張を、全面マスク式の空気経路から説明した。残る一致は装備名。")
add("diver-equipment", "KEEP_GENERAL", "general", "yes", "yes",
    "1–2 cm潜降索と重い靴の在庫リストを、索とウエイトの役割説明に変えた。残る一致は潜降索・ウエイトという一般装備。")
add("diver-respiratory", "KEEP_GENERAL", "general", "yes", "yes",
    "胸郭拡張で肺が膨らむ長文一致を、換気の流れ（気道→肺胞）から書き直した。残る一致は呼吸の教科書生理。")
add("diver-circulation", "KEEP_GENERAL", "general", "yes", "yes",
    "四腔経路は解剖の定義。説明順を左心／右心の出口からにした。残る一致は部屋と血管の対応。変更すると医学的に誤り。")
add("diver-nervous-system", "KEEP_GENERAL", "general", "yes", "yes",
    "皮質／小脳／延髄の機能対比は教科書。項目型の誤肢歩きを外した。残る一致は各部位の一般機能。")
add("diver-hypothermia", "KEEP_GENERAL", "general", "yes", "yes",
    "35℃は低体温の臨床目安で維持。発症の進み方を現場の予防から書いた。残る一致はこの温度目安。")
add("diver-barotrauma", "KEEP_GENERAL", "general", "yes", "yes",
    "2 mでも圧外傷・耳栓禁止のセットを、圧平衡が取れないときの障害として書いた。残る一致は浅い水深でも中耳に差圧が付く、という生理。耳栓禁止は安全の一般指導。")
add("diver-ear-sinus", "KEEP_GENERAL", "general", "yes", "yes",
    "耳管とバルサルバの誤対応をやめ、中耳と副鼻腔の通気経路から説明した。残る一致は耳管という解剖名。")
add("diver-co2-o2-toxicity", "KEEP_GENERAL", "general", "yes", "yes",
    "50 vs 140–160 kPaの入れ替えミラーを外し、酸素上限と二酸化炭素の分圧管理として書いた。残る一致は酸素中毒の分圧目安。教科書値は維持。")
add("diver-dcs", "KEEP_GENERAL", "general", "yes", "yes",
    "発症窓（数時間〜24時間）と軽症／重症の分けは臨床の一般整理。残る一致はこの時間窓。特定の誤肢順は残していない。")
add("diver-bls", "KEEP_GENERAL", "general", "yes", "yes",
    "胸骨圧迫約5 cm・100–120/分は救急ガイドライン。残る一致はこの数値。ガイドライン値は変更不可。")
add("diver-tender", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "連絡員2人に1人は高気圧則36条。潜降直後の泡確認という項目誤肢を、配置比と連絡の役割に圧縮した。残る一致は2人に1人。")
add("diver-license", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "18歳・大臣指定は法定。圧縮機／ボンベ業務の四文キーを、免許でできる範囲の肯定説明に変えた。残る一致は年齢と指定機関。")

# pressure_chamber 29
add("pc-caisson-overview", "KEEP_GENERAL", "general", "yes", "yes",
    "オープンケーソン訂正とヒービング／ボイリングの項目型を、函の沈下と地盤の壊れ方から書いた。残る一致はこれらの土質現象名。")
add("pc-caisson-types", "KEEP_GENERAL", "general", "yes", "yes",
    "橋脚／止水壁と水荷重セルの用途束を、函の形と使う場所から説明した。残る一致は型式名。")
add("pc-centre", "KEEP_GENERAL", "general", "yes", "yes",
    "地下水面上の据付けと鋼製セントルの説明順を変えた。刃口下50 cm以上掘らない、は施工の慣用。条例文の数字かはLEGAL_FACT_CHECK_REQUIRED。残る一致はこの慣用値とセントルという用語。")
add("pc-tunnel-shield", "KEEP_GENERAL", "general", "yes", "yes",
    "マンロック位置と2D/3の寸法比を、出入設備の置き方として書いた。残る一致はマンロックという設備名。")
add("pc-working-pressure", "KEEP_GENERAL", "general", "yes", "yes",
    "P＝0.01×m×(H＋1.0)は公表されている概算式。例題数値は既に別。残る一致はこの式。式を変えると計算が合わなくなる。")
add("pc-sinking-excavation", "KEEP_GENERAL", "general", "yes", "yes",
    "中央50 cm掘りと減圧沈下の項目型を、掘る順と圧力操作の区別に変えた。50 cmは施工慣用でLEGAL_FACT_CHECK_REQUIRED。残る一致はこの慣用と減圧沈下／調圧沈下の用語。")
add("pc-pressure-air-control", "KEEP_GENERAL", "general", "yes", "yes",
    "理論気圧と刃口が水面すれすれ、というセットを、刃先と水位の関係から書いた。残る一致は作業圧力の決め方という一般施工。")
add("pc-harmful-gas", "KEEP_GENERAL", "general", "yes", "yes",
    "20℃検知管と高圧下ポータブル禁止の項目型を、測定の条件として肯定文にした。残る一致は検知管という測定法。")
add("pc-electrical", "KEEP_GENERAL", "general", "yes", "yes",
    "6600 V受電と2PNCTの束を、受電とケーブル種の役割に分けた。残る一致はこれらの電気仕様の慣用。")
add("pc-oxygen-deficiency", "KEEP_GENERAL", "general", "yes", "yes",
    "三経路と刃先から20 cm、貫流1000 m、酸素16％を、経路→対策の順に書いた。1000 m／20 cm／16％は既存教材の数値で、条例との対応はLEGAL_FACT_CHECK_REQUIRED。推測で置換していない。")
add("pc-compressor", "KEEP_GENERAL", "general", "yes", "yes",
    "オイルフリーは大気油分除去ではない、という項目核を、吸気位置とろ過の役割に変えた。残る一致は圧縮機の一般構成。")
add("pc-air-pipes", "KEEP_GENERAL", "general", "yes", "yes",
    "逆止弁と吐出端レギュレータの項目型を、流れの向きと圧力調整の位置として書いた。残る一致は逆止弁という要素名。")
add("pc-air-exhaust-layout", "KEEP_GENERAL", "general", "yes", "yes",
    "作業室／ロックのバルブ配置を、給気と排気の経路図の見方に変えた。残る一致はバルブ位置という設備の一般知識。")
add("pc-oxygen-decompression", "KEEP_GENERAL", "general", "yes", "yes",
    "23％とエアブレイクを、酸素減圧の火災管理として書いた。23％は酸素濃度管理の目安として維持。残る一致はこの目安。")
add("pc-mixed-gas", "KEEP_GENERAL", "general", "yes", "yes",
    "0.3 MPa開始と7 m³×25の項目型を、混合ガスへ切り替える理由（酸素分圧）から書いた。残る一致は0.3 MPaという深度目安。")
add("pc-equipment", "KEEP_GENERAL", "general", "yes", "yes",
    "湿潤地山の天井ショベルという場面固定を、掘削機械の選び方に一般化した。残る一致はショベルという一般機械名。")
add("pc-recompression", "KEEP_GENERAL", "general", "yes", "yes",
    "主室副室同圧と換気を先に置き、0.18 MPaゲージ停止は既存の酸素再圧手順として残した。0.18 MPaと条例の対応はLEGAL_FACT_CHECK_REQUIRED。推測置換はしていない。")
add("pc-buhlmann", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "14時間は高気圧則の再潜水制限で維持。半飽和と血流の五主張を概念説明に圧縮した。残る一致は14時間。")
add("pc-fluid-properties", "KEEP_GENERAL", "general", "yes", "yes",
    "101.3 kPaとppm換算は単位の一般知識。残る一致は1％=10000 ppm、1 atm≈101.3 kPa。換算を変えると誤り。")
add("pc-oxygen-toxicity", "KEEP_GENERAL", "general", "yes", "yes",
    "600/2500 UPTDは公表されている酸素ばく露の目安。残る一致はこの限度値。創作値への置換はしていない。")
add("pc-co2-toxicity", "KEEP_GENERAL", "general", "yes", "yes",
    "300–400 ppmと0.3 MPa換気低下の束を、二酸化炭素の溜まり方から書いた。残る一致は大気約400 ppmという一般値。")
add("pc-nitrogen-narcosis", "KEEP_GENERAL", "general", "yes", "yes",
    "0.3 MPaで急増の長文を、分圧上昇と症状の関係に圧縮した。残る一致は窒素酔いが深度（分圧）で増える、という一般生理。")
add("pc-dcs", "KEEP_GENERAL", "general", "yes", "yes",
    "0.1 MPa以下では稀、PFO、ベンズの項目型を、発症の場と重症度から書いた。残る一致は減圧症の一般臨床。")
add("pc-barotrauma", "KEEP_GENERAL", "general", "yes", "yes",
    "0.03 MPaで鼓膜痛は臨床の目安。残る一致はこの差圧目安。圧平衡の説明順は変えた。")
add("pc-lung-rupture", "KEEP_GENERAL", "general", "yes", "yes",
    "気胸で肺は虚脱、という定義を残し、息止め浮上の危険から入る構成にした。残る一致は気胸の一般定義。")
add("pc-body-effects", "KEEP_GENERAL", "general", "yes", "yes",
    "0.3 MPaゲージでN2 4倍は分圧の計算例（絶対0.4×0.8／0.08）。残る一致はヘンリーの法則による比例。計算自体は一般。")
add("pc-bls", "KEEP_GENERAL", "general", "yes", "yes",
    "胸骨圧迫の深さ・テンポはガイドライン。残る一致はこの数値。潜水士教材と同系統だが、特定過去問の写しではない。")
add("pc-license", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "20歳・1年欠格は法定。項目型の誤記束を、免許の欠格と返還の肯定手続に変えた。残る一致はこの法定年齢と欠格。")
add("pc-safety-system", "KEEP_STATUTORY", "statutory", "yes", "yes",
    "30人・20–30人は安衛法の管理体制閾値。残る一致はこの人数境。閾値は変更不可。")


def main() -> None:
    with CSV_PATH.open(newline="", encoding="utf-8") as fh:
        rows = list(csv.DictReader(fh))
    if len(rows) != 179:
        raise SystemExit(f"expected 179 rows, got {len(rows)}")

    action_ids = {r["query_id"] for r in rows if r["classification"] in {"REWRITE_REQUIRED", "REPHRASE_RECOMMENDED"}}
    missing = action_ids - set(UPDATES)
    extra = set(UPDATES) - action_ids
    if missing or extra:
        raise SystemExit(f"update map mismatch missing={sorted(missing)[:20]} extra={sorted(extra)[:20]}")

    for r in rows:
        u = UPDATES.get(r["query_id"])
        if not u:
            continue
        klass, kind, needed, applied, rationale = u
        r["classification"] = klass
        r["statutory_or_general"] = kind
        r["fix_needed"] = needed
        r["fix_applied"] = applied
        r["rationale"] = rationale

    classes = Counter(r["classification"] for r in rows)
    if classes.get("REWRITE_REQUIRED") or classes.get("REPHRASE_RECOMMENDED"):
        raise SystemExit(f"action labels remain: {classes}")
    if sum(classes.values()) != 179:
        raise SystemExit("row count drifted")

    fields = list(rows[0].keys())
    with CSV_PATH.open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)

    json_rows = []
    for r in rows:
        obj = dict(r)
        for k in ("query_line", "peer_line", "choice_hits"):
            if obj.get(k) not in (None, ""):
                try:
                    obj[k] = int(obj[k])
                except ValueError:
                    pass
        for k in ("jaccard_stem", "jaccard_combo", "tfidf", "seq"):
            if obj.get(k) not in (None, ""):
                obj[k] = float(obj[k])
        json_rows.append(obj)
    JSON_PATH.write_text(json.dumps(json_rows, ensure_ascii=False, indent=2) + "\n")

    print("updated", len(UPDATES), "rows")
    print("final classes", dict(classes))
    print("fix_applied", Counter(r["fix_applied"] for r in rows))
    print("by exam", Counter(r["query_exam_id"] for r in rows))
    print("by kind+class")
    print(Counter((r["query_kind"], r["classification"]) for r in rows))


if __name__ == "__main__":
    main()
