-- mobile_crane 令和8年4月 過去問 questions / choices / mock_exams
-- 生成元: data/past-exams/mobile_crane_2026-04.txt
-- explanation はプレースホルダー。後続で実解説を追加する。
-- 基盤(exams/exam_types/exam_categories/categories)は既存のものを使う。

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '71941b0a-63fe-4c16-a585-5545d0f98bd3',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンに関する用語の記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('71941b0a-63fe-4c16-a585-5545d0f98bd3', $c$つり上げ荷重とは、アウトリガーを有する移動式クレーンにあっては、当該アウトリガーを最大限に張り出し、ジブ長さを最短に、作業半径を最小にしたときに負荷させることができる最大の荷重をいい、フックなどのつり具分が含まれる。$c$, true, 1),
  ('71941b0a-63fe-4c16-a585-5545d0f98bd3', $c$作業半径とは、ジブフートピンの中心からジブポイントまでの距離をいい、ジブの傾斜角を変えると作業半径が変化する。$c$, false, 2),
  ('71941b0a-63fe-4c16-a585-5545d0f98bd3', $c$定格速度とは、つり上げ荷重に相当する荷重の荷をつって、つり上げ、旋回などの作動を行う場合の、それぞれの最高の速度をいう。$c$, false, 3),
  ('71941b0a-63fe-4c16-a585-5545d0f98bd3', $c$ジブの起伏とは、ジブが取り付けられたピンを支点として傾斜角を変える運動をいい、傾斜角を変える運動には、起伏シリンダの作動によるものと、巻上げ用ワイヤロープの巻取り、巻戻しによるものがある。$c$, false, 4),
  ('71941b0a-63fe-4c16-a585-5545d0f98bd3', $c$総揚程とは、ジブ長さを最長に、傾斜角を最大にしたときのつり具の上限位置と、ジブ長さを最短に、傾斜角を最小にしたときのつり具の上限位置との間の垂直移動距離をいう。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7cf3a1a5-4f9a-42e6-a95a-e024218ea623',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの種類、型式などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7cf3a1a5-4f9a-42e6-a95a-e024218ea623', $c$トラッククレーン用のキャリアは、搭載される上部旋回体の質量によって、前輪が１軸から３軸、後輪が１軸から４軸になっている。$c$, false, 1),
  ('7cf3a1a5-4f9a-42e6-a95a-e024218ea623', $c$オールテレーンクレーンは、特殊な操向機構とハイドロニューマチック(油空圧式)サスペンションを装備し、不整地の走行や狭所進入性に優れている。$c$, false, 2),
  ('7cf3a1a5-4f9a-42e6-a95a-e024218ea623', $c$ラフテレーンクレーンは、ホイールクレーンに含まれるもので、前二輪操向、後二輪操向、四輪操向、かに操向の４種類のステアリングモードを有しているため、狭隘地での機動性に優れている。$c$, false, 3),
  ('7cf3a1a5-4f9a-42e6-a95a-e024218ea623', $c$積載形トラッククレーンには、通常、「ＰＴＯ」と呼ばれるクレーン作業専用の原動機が走行用原動機とは別に搭載されており、クレーン作動は「ＰＴＯ」から動力が伝達された油圧装置により行われる。$c$, true, 4),
  ('7cf3a1a5-4f9a-42e6-a95a-e024218ea623', $c$トラッククレーン及びホイールクレーンのキャリアには、通常、張出しなどの作動を油圧方式で行うＨ形又はⅩ形のアウトリガーが備え付けられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7aba963c-67f5-48fa-b904-af1e1028f6e7',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$クローラクレーンに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7aba963c-67f5-48fa-b904-af1e1028f6e7', $c$クローラクレーン用下部走行体は、走行フレームの後方に遊動輪、前方に起動輪を配置してクローラベルトを巻いたもので、起動輪を動力で回転させて走行する。$c$, false, 1),
  ('7aba963c-67f5-48fa-b904-af1e1028f6e7', $c$鋳鋼又は鍛鋼製のクローラベルトには、シューをリンクにボルトで取り付ける一体型と、シューをピンでつなぎ合わせる組立型がある。$c$, false, 2),
  ('7aba963c-67f5-48fa-b904-af1e1028f6e7', $c$平均接地圧(kＰa又はkＮ/ｍ２)は、一般に、全装備質量 (ｔ) に9.8(ｍ/ｓ２)を掛けた数値を、 クローラベルトの接地する総面積(ｍ２)で割ったもので表される。$c$, true, 3),
  ('7aba963c-67f5-48fa-b904-af1e1028f6e7', $c$クローラクレーン用下部走行体の起動輪の軸中心から遊動輪の軸中心までの距離をクローラ中心距離といい、この距離が長いほど左右の安定が良いため、クローラクレーンは、一般に、クローラ中心距離を長くすることができる構造になっている。$c$, false, 4),
  ('7aba963c-67f5-48fa-b904-af1e1028f6e7', $c$クローラベルトのシューには、幅の広いものと狭いものがあり、シューを取り換えることにより旋回速度を変えることができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'af97a968-bfa6-4707-bba9-b0cc7694e18d',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの上部旋回体に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('af97a968-bfa6-4707-bba9-b0cc7694e18d', $c$ボールベアリング式の旋回装置は、旋回モータの動力を減速機に伝え、旋回ベアリングの旋回ギヤにかみ合っているピニオンを回転させて、上部旋回体を旋回させる。$c$, false, 1),
  ('af97a968-bfa6-4707-bba9-b0cc7694e18d', $c$オールテレーンクレーンの上部旋回体は、旋回フレーム上に巻上装置、運転室などが設置され、旋回フレームの後部にカウンタウエイトが取り付けられている。$c$, false, 2),
  ('af97a968-bfa6-4707-bba9-b0cc7694e18d', $c$ラフテレーンクレーンの上部旋回体に設置された運転室には、走行用操縦装置、クレーン操作装置などが装備されている。$c$, false, 3),
  ('af97a968-bfa6-4707-bba9-b0cc7694e18d', $c$トラス(ラチス)構造ジブのクローラクレーンのＡフレームは、作業時は高い位置にセットするが、長尺ジブを引き起こす場合は、低い位置にセットする。$c$, true, 4),
  ('af97a968-bfa6-4707-bba9-b0cc7694e18d', $c$箱型構造ジブは、旋回フレーム中央の上方端部にある機械加工した穴にフートピンで接合されている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f928f3a7-c739-46af-af03-1e6dff4ec29a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの巻上装置に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f928f3a7-c739-46af-af03-1e6dff4ec29a', $c$クラッチ装置を搭載している移動式クレーンの巻上装置は、ウインチ操作レバーを操作すると、油圧モータ、クラッチ、ドラム、減速機の順に駆動力が伝わり、荷の巻上げ、巻下げが行われる。$c$, true, 1),
  ('f928f3a7-c739-46af-af03-1e6dff4ec29a', $c$巻上装置の巻上げドラムは、ラチェットによるロック機構を備えている。$c$, false, 2),
  ('f928f3a7-c739-46af-af03-1e6dff4ec29a', $c$巻上装置の減速機は、歯車を用いて油圧モータの回転数を減速して必要なトルクを得るためのもので、一般に、平歯車減速式又は遊星歯車減速式のものが使用されている。$c$, false, 3),
  ('f928f3a7-c739-46af-af03-1e6dff4ec29a', $c$巻上装置のブレーキには、クラッチドラムの外側をブレーキバンドで締め付け、摩擦力で制動する構造のものがある。$c$, false, 4),
  ('f928f3a7-c739-46af-af03-1e6dff4ec29a', $c$巻上装置の駆動軸が回転していても、クラッチ作動用の油圧シリンダに圧油を送らなければ、巻上げドラムに回転は伝わらない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cc8d2e41-415b-4e48-a42e-7dac5807547b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンのフロントアタッチメントに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問6',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cc8d2e41-415b-4e48-a42e-7dac5807547b', $c$ジブの主要材料には、強度の確保及び軽量化のため、一般に高張力鋼が使用されている。$c$, false, 1),
  ('cc8d2e41-415b-4e48-a42e-7dac5807547b', $c$トラス(ラチス)構造のジブでは、一般に、上部ジブと下部ジブの間に継ぎジブを挿入し、作業に必要な長さを確保する。$c$, false, 2),
  ('cc8d2e41-415b-4e48-a42e-7dac5807547b', $c$箱形構造ジブの伸縮方式としては、２段目、３段目、４段目と順次に伸縮する方式と、各段が同時に伸縮する方式がある。$c$, false, 3),
  ('cc8d2e41-415b-4e48-a42e-7dac5807547b', $c$フックの代わりにグラブバケットを装備するときは、バケットの開閉を行うためのタグラインが必要である。$c$, true, 4),
  ('cc8d2e41-415b-4e48-a42e-7dac5807547b', $c$ペンダントロープは、ジブ上端と上部ブライドルをつなぐワイヤロープである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a99d833b-fe33-4891-9bca-12ba1e165787',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$ワイヤロープに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a99d833b-fe33-4891-9bca-12ba1e165787', $c$「ラングより」のワイヤロープは、ロープのよりの方向とストランドのよりの方向が反対である。$c$, true, 1),
  ('a99d833b-fe33-4891-9bca-12ba1e165787', $c$「Ｓより」のワイヤロープは、ロープを縦にして見たとき、左上側から右下方向へ、ストランドがよられている。$c$, false, 2),
  ('a99d833b-fe33-4891-9bca-12ba1e165787', $c$ワイヤロープをクリップ止めするときは、クリップの座金及びナットを引張側のワイヤロープに当てて締め付ける。$c$, false, 3),
  ('a99d833b-fe33-4891-9bca-12ba1e165787', $c$ストランド６よりのワイヤロープの径の測定は、ワイヤロープの同一断面の外接円の直径を３方向から測定し、その平均値を算出する。$c$, false, 4),
  ('a99d833b-fe33-4891-9bca-12ba1e165787', $c$新しい巻上げ用ワイヤロープを取り付けた直後は、定格荷重の半分程度の荷をつって、巻上げ及び巻下げの操作を数回行い、ワイヤロープを慣らす。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6cb3a30e-bf27-48e9-a028-62d9ddd775db',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの安全装置などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6cb3a30e-bf27-48e9-a028-62d9ddd775db', $c$過負荷防止装置には、つり荷の荷重が定格荷重をこえようとしたときに警報を発し、定格荷重をこえたときに自動的に作動を停止させる装置がある。$c$, false, 1),
  ('6cb3a30e-bf27-48e9-a028-62d9ddd775db', $c$玉掛け用ワイヤロープの外れ止め装置は、フックブロックのシーブから玉掛け用ワイヤロープが外れるのを防止するための装置である。$c$, true, 2),
  ('6cb3a30e-bf27-48e9-a028-62d9ddd775db', $c$ジブ起伏停止装置は、ジブの起こし過ぎによるジブの折損や後方への転倒を防止するための装置である。$c$, false, 3),
  ('6cb3a30e-bf27-48e9-a028-62d9ddd775db', $c$巻過防止装置は、巻上げなどの作動時にフックブロックが上限の高さまで巻き上がると、自動的にその作動を停止させる装置である。$c$, false, 4),
  ('6cb3a30e-bf27-48e9-a028-62d9ddd775db', $c$旋回警報装置は、旋回中に挟まれる災害などを防止するため、周囲の作業者に危険を知らせる装置で、通常、そのスイッチは旋回操作レバーに取り付けられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9d487d39-b7b0-40e5-94f6-71e28f7eb509',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$次の文章はアウトリガーを有する一般的なトラッククレーンの作業領域及び安定に係る記述であるが、この文中の〔　〕内に入れるＡからＣまでの語句の組合せとして、最も適切なものは(１)～(５)のうちどれか。
ただし、このトラッククレーンはアウトリガーを最大限に張り出した状態で使用するものとする。
「トラッククレーンは、荷をつって旋回する場合、一般に、Ａが最も安定が良く、ＢはＣ及びＡよりも安定が悪いが、全周で同じつり上げ性能を確保する必要がある場合は、フロントジャッキと呼ばれる装置を使用する。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9d487d39-b7b0-40e5-94f6-71e28f7eb509', $c$後方領域 前方領域 側方領域$c$, true, 1),
  ('9d487d39-b7b0-40e5-94f6-71e28f7eb509', $c$後方領域 側方領域 前方領域$c$, false, 2),
  ('9d487d39-b7b0-40e5-94f6-71e28f7eb509', $c$前方領域 側方領域 後方領域$c$, false, 3),
  ('9d487d39-b7b0-40e5-94f6-71e28f7eb509', $c$前方領域 後方領域 側方領域$c$, false, 4),
  ('9d487d39-b7b0-40e5-94f6-71e28f7eb509', $c$側方領域 後方領域 前方領域$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd70cff67-afb8-43df-8f34-8553314a6f1e',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$下記に掲げる表は、一般的なラフテレーンクレーンのアウトリガー最大張出しの場合における定格総荷重表を模したものであるが、定格総荷重表中に当該ラフテレーンクレーンの「機体の強度」(構造部材が破損するかどうか。)によって定められた荷重の値と、「機体の安定」(転倒するかどうか。)によって定められた荷重の値の境界線が階段状の太線で示されている。
下表を用いて定格総荷重を求める場合、(１)～(５)のジブ長さと作業半径の組合せのうち、その組合せによって定まる定格総荷重の値が、「機体の強度」によって定められた荷重の値であるものはどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問10',
  '/exam-figures/mobile_crane/2026-04/q10.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d70cff67-afb8-43df-8f34-8553314a6f1e', $c$9.35ｍ　6.5ｍ$c$, true, 1),
  ('d70cff67-afb8-43df-8f34-8553314a6f1e', $c$16.4ｍ　8.0ｍ$c$, false, 2),
  ('d70cff67-afb8-43df-8f34-8553314a6f1e', $c$23.45ｍ　10.0ｍ$c$, false, 3),
  ('d70cff67-afb8-43df-8f34-8553314a6f1e', $c$23.45ｍ　11.0ｍ$c$, false, 4),
  ('d70cff67-afb8-43df-8f34-8553314a6f1e', $c$30.5ｍ　12.0ｍ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6dc6e500-7dd5-4597-babc-84f688b383cd',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$ガソリンエンジンと比べた場合のディーゼルエンジンの一般的な特徴として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6dc6e500-7dd5-4597-babc-84f688b383cd', $c$熱効率が悪い。$c$, true, 1),
  ('6dc6e500-7dd5-4597-babc-84f688b383cd', $c$１馬力当たりのエンジン質量が大きい。$c$, false, 2),
  ('6dc6e500-7dd5-4597-babc-84f688b383cd', $c$騒音や振動が大きい。$c$, false, 3),
  ('6dc6e500-7dd5-4597-babc-84f688b383cd', $c$冬期の始動性がやや悪い。$c$, false, 4),
  ('6dc6e500-7dd5-4597-babc-84f688b383cd', $c$運転経費が安い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1dc0d658-f763-4dc9-b6a6-980f85b5e555',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンのディーゼルエンジンに用いられる電装品に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1dc0d658-f763-4dc9-b6a6-980f85b5e555', $c$ディーゼルエンジンは、圧縮力が大きく始動クランキングのトルクが著しく大きいので、バッテリは24Ｖを用いることが多い。$c$, false, 1),
  ('1dc0d658-f763-4dc9-b6a6-980f85b5e555', $c$始動補助装置は、エンジンを始動する前に燃焼室を暖めるか、又は吸気を暖め燃料の着火を助けるものである。$c$, false, 2),
  ('1dc0d658-f763-4dc9-b6a6-980f85b5e555', $c$オルタネータは、エンジンの回転をファンベルトから受けて駆動し、電気を発生させるものである。$c$, false, 3),
  ('1dc0d658-f763-4dc9-b6a6-980f85b5e555', $c$電熱式エアヒータは、直接噴射式エンジンのマニホールドの吸気通路に取り付けられ、発熱体に電流が流れることで吸気を均一に加熱するものである。$c$, false, 4),
  ('1dc0d658-f763-4dc9-b6a6-980f85b5e555', $c$レギュレータは、高電圧によって火花放電を行い、シリンダ内の圧縮混合気に点火するものである。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$油で満たされた二つのシリンダが連絡している図の装置で、ピストンＡ(直径１㎝)に９Ｎの力を加えるとき、ピストンＢ(直径３㎝)に加わる力は(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a', $c$３Ｎ$c$, false, 1),
  ('2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a', $c$９Ｎ$c$, false, 2),
  ('2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a', $c$18Ｎ$c$, false, 3),
  ('2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a', $c$27Ｎ$c$, false, 4),
  ('2e5ccc0d-d99d-43c3-ac86-b2a808ea3e7a', $c$81Ｎ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ea7922b2-5f6b-4a5a-8a9e-e77aa0131097',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧駆動装置に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ea7922b2-5f6b-4a5a-8a9e-e77aa0131097', $c$油圧シリンダは、油圧ポンプから送られてきた圧油の力でピストンを往復させる装置である。$c$, false, 1),
  ('ea7922b2-5f6b-4a5a-8a9e-e77aa0131097', $c$複動型シリンダは、シリンダの両側に作動油の出入口を設けた構造で、方向切換弁によってそれぞれの出入口に交互に作動油を流入、排出させて往復運動を行わせる。$c$, false, 2),
  ('ea7922b2-5f6b-4a5a-8a9e-e77aa0131097', $c$油圧モータは、圧油を油圧モータに押し込むことにより駆動軸を回転させる装置である。$c$, false, 3),
  ('ea7922b2-5f6b-4a5a-8a9e-e77aa0131097', $c$荷の巻上げ用、旋回用及び走行用の油圧モータには、一般に、プランジャモータが多く使用されている。$c$, false, 4),
  ('ea7922b2-5f6b-4a5a-8a9e-e77aa0131097', $c$ラジアル形プランジャモータは、プランジャが回転軸と同一方向に配列されている。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f294a09d-ba9a-4e2b-be17-89dc22676c3b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$下図は、移動式クレーンのジブの伸縮回路に用いられる油圧制御弁の作動の一例を簡略的に表したものであるが、この油圧制御弁の名称は(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問15',
  '/exam-figures/mobile_crane/2026-04/q15.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f294a09d-ba9a-4e2b-be17-89dc22676c3b', $c$減圧弁$c$, false, 1),
  ('f294a09d-ba9a-4e2b-be17-89dc22676c3b', $c$リリーフ弁$c$, false, 2),
  ('f294a09d-ba9a-4e2b-be17-89dc22676c3b', $c$パイロットチェック弁$c$, false, 3),
  ('f294a09d-ba9a-4e2b-be17-89dc22676c3b', $c$シーケンス弁$c$, true, 4),
  ('f294a09d-ba9a-4e2b-be17-89dc22676c3b', $c$絞り弁$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e0a2fba2-887a-4c05-95aa-ecd09d156769',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の付属機器に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e0a2fba2-887a-4c05-95aa-ecd09d156769', $c$作動油をためておく作動油タンクには、作動油が適切に供給されるようにエアブリーザ、油面計などが取り付けられている。$c$, false, 1),
  ('e0a2fba2-887a-4c05-95aa-ecd09d156769', $c$作動油を発熱量が多い状況で使用する場合は、強制的に冷却する必要があるため、オイルクーラーが用いられる。$c$, false, 2),
  ('e0a2fba2-887a-4c05-95aa-ecd09d156769', $c$アキュムレータは、シェル内をゴム製の隔壁(ブラダ)などにより油室とガス室に分け、ガスの圧縮性により作動油の油圧を調整する機器で、衝撃圧の吸収のため、油室にリターンフィルタを備えている。$c$, true, 3),
  ('e0a2fba2-887a-4c05-95aa-ecd09d156769', $c$ラインフィルタは、油圧回路を流れる作動油をろ過してごみを取り除くもので、圧力管路用のものと戻り管路用のものがある。$c$, false, 4),
  ('e0a2fba2-887a-4c05-95aa-ecd09d156769', $c$吸込み用フィルタには、そのエレメントが金網式のものとノッチワイヤ式のものがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cbb8f9fa-5ec8-416d-9363-a71423913604',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の保守に関するＡからＤまでの記述について、適切なもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 油圧ポンプの点検は、ポンプを停止した状態での異音及び発熱の有無、接合部及びシール部の油漏れの有無などを調べる。Ｂ 油圧配管系統の分解整備後、配管内に空気が残った場合は、ポンプの焼付きを防止するため、油圧ポンプを全負荷運転し配管内の空気を除去する。Ｃ 油圧配管系統の接続部は、特に緩みやすいので、圧油の漏れの有無を６か月に１回程度点検する。Ｄ フィルタエレメントの洗浄は、一般的には、溶剤に長時間浸した後、ブラシ洗いをして、エレメントの内側から外側へ圧縮空気で吹く。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cbb8f9fa-5ec8-416d-9363-a71423913604', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('cbb8f9fa-5ec8-416d-9363-a71423913604', $c$Ａ，Ｄ$c$, false, 2),
  ('cbb8f9fa-5ec8-416d-9363-a71423913604', $c$Ｂ，Ｃ$c$, false, 3),
  ('cbb8f9fa-5ec8-416d-9363-a71423913604', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('cbb8f9fa-5ec8-416d-9363-a71423913604', $c$Ｄ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c46c2377-6ac3-4ab5-b836-915a73f066e1',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の作動油に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c46c2377-6ac3-4ab5-b836-915a73f066e1', $c$作動油の温度が使用限界温度の上限より高くなると、潤滑性が悪くなるほか、劣化を促進する。$c$, false, 1),
  ('c46c2377-6ac3-4ab5-b836-915a73f066e1', $c$作動油の温度が使用限界温度の下限より低くなると、油の粘度が高くなり、ポンプの運転に大きな力が必要となる。$c$, false, 2),
  ('c46c2377-6ac3-4ab5-b836-915a73f066e1', $c$作動油は、運転中、高温で空気などに接し、かくはん状態で使用されるので酸化しやすい。$c$, false, 3),
  ('c46c2377-6ac3-4ab5-b836-915a73f066e1', $c$一般に用いられる作動油の比重は、1.85～1.95程度である。$c$, true, 4),
  ('c46c2377-6ac3-4ab5-b836-915a73f066e1', $c$作動油の引火点は、180 ～240 ℃程度である。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '57717975-392a-4124-b881-2e4c8b9f2b63',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('57717975-392a-4124-b881-2e4c8b9f2b63', $c$発電所から消費地の変電所や開閉所などへの送電には、電力の損失を少なくするため、特別高圧の交流が使用されている。$c$, true, 1),
  ('57717975-392a-4124-b881-2e4c8b9f2b63', $c$工場の動力用電源には、一般に、200Ｖ級又は400Ｖ級の単相交流が使用されている。$c$, false, 2),
  ('57717975-392a-4124-b881-2e4c8b9f2b63', $c$直流はＡＣ、交流はＤＣと表される。$c$, false, 3),
  ('57717975-392a-4124-b881-2e4c8b9f2b63', $c$交流は、常に一定の方向に電流が流れる。$c$, false, 4),
  ('57717975-392a-4124-b881-2e4c8b9f2b63', $c$電力として配電される交流は、地域によらず、家庭用は50Ｈz、工場の動力用は60Ｈzの周波数で供給されている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2ee7ed87-0b44-4600-9ebb-a7eaab272692',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2ee7ed87-0b44-4600-9ebb-a7eaab272692', $c$感電による人体への影響の程度は、電流の大きさ、通電時間、電流の種類、体質などの条件により異なる。$c$, false, 1),
  ('2ee7ed87-0b44-4600-9ebb-a7eaab272692', $c$感電による危険を電流と時間の積によって評価する場合、50ｍＡの電流が１秒間人体を流れると、心室細動を起こすおそれがあるとされている。$c$, false, 2),
  ('2ee7ed87-0b44-4600-9ebb-a7eaab272692', $c$人体は身体内部の電気抵抗が皮膚の電気抵抗よりも大きいため、電気によるやけどの影響は皮膚深部には及ばないが、皮膚表面は極めて大きな傷害を受ける。$c$, true, 3),
  ('2ee7ed87-0b44-4600-9ebb-a7eaab272692', $c$送電線に近接した場所で移動式クレーンを用いて作業を行う場合の感電災害防止対策には、柵を設ける、ポールを立てるなどにより危険範囲を明示した上で、監視員を配置し、その者の監視下で作業する方法がある。$c$, false, 4),
  ('2ee7ed87-0b44-4600-9ebb-a7eaab272692', $c$移動式クレーンのジブが電路に接触した場合であっても、運転席に乗っている運転士は、運転席から離れない限り身体には電気が流れないので感電しないが、ジブが電路に接触した状態で移動式クレーンを離れようとして身体が機体と地面に同時に接すると、感電するおそれがある。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '4dfcd866-5a5d-4be1-8529-48b15be1e2c6',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重4.9ｔの移動式クレーン(以下、本問において「移動式クレーン」という。)の検査に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('4dfcd866-5a5d-4be1-8529-48b15be1e2c6', $c$移動式クレーンを輸入した者は、製造検査を受けなければならない。$c$, true, 1),
  ('4dfcd866-5a5d-4be1-8529-48b15be1e2c6', $c$製造検査は、所轄都道府県労働局長が行う。$c$, false, 2),
  ('4dfcd866-5a5d-4be1-8529-48b15be1e2c6', $c$性能検査は、原則として登録性能検査機関が行う。$c$, false, 3),
  ('4dfcd866-5a5d-4be1-8529-48b15be1e2c6', $c$変更検査は、所轄労働基準監督署長が行う。$c$, false, 4),
  ('4dfcd866-5a5d-4be1-8529-48b15be1e2c6', $c$移動式クレーン検査証の有効期間をこえて使用を休止した移動式クレーンを再び使用しようとする者は、使用再開検査を受けなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f5b11f26-222e-47b4-a9af-5489927c2b86',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重３ｔ以上の移動式クレーン及び当該移動式クレーンに係る「移動式クレーン検査証」(以下、本問において「検査証」という。)に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f5b11f26-222e-47b4-a9af-5489927c2b86', $c$移動式クレーンを用いて作業を行うときは、当該移動式クレーンに検査証を備え付けておかなければならない。$c$, false, 1),
  ('f5b11f26-222e-47b4-a9af-5489927c2b86', $c$検査証の有効期間は、原則として２年であるが、製造検査又は使用検査の結果により２年未満とされることがある。$c$, false, 2),
  ('f5b11f26-222e-47b4-a9af-5489927c2b86', $c$移動式クレーンの性能検査に合格したときは、検査証の有効期間が更新される。$c$, false, 3),
  ('f5b11f26-222e-47b4-a9af-5489927c2b86', $c$移動式クレーンを設置している者に異動があったときは、移動式クレーンを設置している者は、当該異動後10日以内に、検査証書替申請書に検査証を添えて、所轄労働基準監督署長を経由し検査証の交付を受けた都道府県労働局長に提出し、書替えを受けなければならない。$c$, false, 4),
  ('f5b11f26-222e-47b4-a9af-5489927c2b86', $c$移動式クレーンを設置している者は、当該移動式クレーンの使用を休止したときは、検査証を返還しなければならない。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7b33f620-3071-4797-956b-3916bea6ac40',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの運転(道路上を走行させる運転を除く。)及び玉掛けの業務に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7b33f620-3071-4797-956b-3916bea6ac40', $c$移動式クレーン運転士免許で、つり上げ荷重15ｔのラフテレーンクレーンの運転の業務に就くことができる。$c$, false, 1),
  ('7b33f620-3071-4797-956b-3916bea6ac40', $c$小型移動式クレーン運転技能講習の修了で、つり上げ荷重4.9ｔのクローラクレーンの運転の業務に就くことができる。$c$, false, 2),
  ('7b33f620-3071-4797-956b-3916bea6ac40', $c$移動式クレーンの運転の業務に係る特別の教育の受講で、つり上げ荷重2.9ｔのトラッククレーンの運転の業務に就くことができる。$c$, true, 3),
  ('7b33f620-3071-4797-956b-3916bea6ac40', $c$玉掛け技能講習の修了で、つり上げ荷重20ｔの鉄道クレーンで行う４ｔの荷の玉掛けの業務に就くことができる。$c$, false, 4),
  ('7b33f620-3071-4797-956b-3916bea6ac40', $c$玉掛けの業務に係る特別の教育の受講で、つり上げ荷重0.9ｔの積載形トラッククレーンで行う0.5ｔの荷の玉掛けの業務に就くことができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cfc3dbb5-0401-42ba-baec-7f2411f8c18f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は移動式クレーンの使用に係る法令条文であるが、この文中の〔　〕内に入れるＡ及びＢの語句の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。
「事業者は、移動式クレーンについては、移動式クレーンＡに記載されているＢ(つり上げ荷重が３ｔ未満の移動式クレーンにあっては、これを製造した者が指定したＢ)の範囲をこえて使用してはならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cfc3dbb5-0401-42ba-baec-7f2411f8c18f', $c$設置報告書 つり上げ荷重$c$, false, 1),
  ('cfc3dbb5-0401-42ba-baec-7f2411f8c18f', $c$設置報告書 定格荷重$c$, false, 2),
  ('cfc3dbb5-0401-42ba-baec-7f2411f8c18f', $c$明細書 ジブの傾斜角$c$, true, 3),
  ('cfc3dbb5-0401-42ba-baec-7f2411f8c18f', $c$明細書 定格荷重$c$, false, 4),
  ('cfc3dbb5-0401-42ba-baec-7f2411f8c18f', $c$検査証 ジブの傾斜角$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c90e24b3-28ba-444c-a3a9-c91d3133a58b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの使用に関するＡからＤまでの記述について、法令上、正しいもののみを全てあげた組合せは(１)～(５)のうちどれか。Ａ 移動式クレーン運転士免許を有する労働者は、移動式クレーンの運転の業務従事中に、移動式クレーンの安全装置を臨時に取りはずす必要が生じたときは、あらかじめ事業者の許可を受けずに当該安全装置を取りはずすことができる。ただし、当該安全装置を取りはずしたときは、遅滞なく、事業者にその旨を報告しなければならない。Ｂ 事業者は、原則として、移動式クレーンを使用する作業場において作業に従事する者を、移動式クレーンにより運搬し、又はつり上げて作業させてはならない。Ｃ つり上げ荷重0.5ｔ以上の移動式クレーンについては、厚生労働大臣が定める規格(基準)又は安全装置を具備したものでなければ使用してはならない。Ｄ 移動式クレーンを用いて作業を行うときは、移動式クレーンの運転者及び玉掛けをする者が当該移動式クレーンの定格荷重を常時知ることができるよう、表示その他の措置を講じなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c90e24b3-28ba-444c-a3a9-c91d3133a58b', $c$Ａ，Ｂ$c$, false, 1),
  ('c90e24b3-28ba-444c-a3a9-c91d3133a58b', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('c90e24b3-28ba-444c-a3a9-c91d3133a58b', $c$Ｂ，Ｃ，Ｄ$c$, true, 3),
  ('c90e24b3-28ba-444c-a3a9-c91d3133a58b', $c$Ｃ，Ｄ$c$, false, 4),
  ('c90e24b3-28ba-444c-a3a9-c91d3133a58b', $c$Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '37b0c9be-4785-4234-8062-1dd1d07c8eaa',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は移動式クレーンの巻過ぎの防止に係る法令条文であるが、この文中の〔　〕内に入れるＡ及びＢの数値の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。
「事業者は、移動式クレーンの巻過防止装置については、フック、グラブバケット等のつり具の上面又は当該つり具の巻上げ用シーブの上面と、ジブの先端のシーブその他当該上面が接触するおそれのある物(傾斜したジブを除く。)の下面との間隔がＡｍ以上(直働式の巻過防止装置にあっては、Ｂｍ以上)となるように調整しておかなければならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('37b0c9be-4785-4234-8062-1dd1d07c8eaa', $c$0.05 0.15$c$, false, 1),
  ('37b0c9be-4785-4234-8062-1dd1d07c8eaa', $c$0.05 0.25$c$, false, 2),
  ('37b0c9be-4785-4234-8062-1dd1d07c8eaa', $c$0.15 0.05$c$, false, 3),
  ('37b0c9be-4785-4234-8062-1dd1d07c8eaa', $c$0.15 0.25$c$, false, 4),
  ('37b0c9be-4785-4234-8062-1dd1d07c8eaa', $c$0.25 0.05$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'af6e94bb-9a97-45bd-8a15-3fcf7080265f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの玉掛けに用いる玉掛用具として、法令上、その使用が禁止とされているものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('af6e94bb-9a97-45bd-8a15-3fcf7080265f', $c$リンクの断面の直径の減少が、製造されたときの当該直径の９％のつりチェーン$c$, false, 1),
  ('af6e94bb-9a97-45bd-8a15-3fcf7080265f', $c$ワイヤロープ１よりの間において素線(フィラ線を除く。以下同じ。)の数の８％の素線が切断したワイヤロープ$c$, false, 2),
  ('af6e94bb-9a97-45bd-8a15-3fcf7080265f', $c$直径の減少が公称径の６％のワイヤロープ$c$, false, 3),
  ('af6e94bb-9a97-45bd-8a15-3fcf7080265f', $c$伸びが製造されたときの長さの４％のつりチェーン$c$, false, 4),
  ('af6e94bb-9a97-45bd-8a15-3fcf7080265f', $c$使用する際の安全係数が４となるシャックル$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '75bb0c07-4a24-49b2-95cf-429a5c817af8',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの自主検査に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('75bb0c07-4a24-49b2-95cf-429a5c817af8', $c$１年以内ごとに１回、定期に行う自主検査においては、つり上げ荷重に相当する荷重の荷をつって、つり上げ、旋回、走行等の作動を定格速度により行う荷重試験を実施しなければならない。$c$, false, 1),
  ('75bb0c07-4a24-49b2-95cf-429a5c817af8', $c$１か月以内ごとに１回、定期に行う自主検査においては、巻過防止装置その他の安全装置の異常の有無について検査を行わなければならない。$c$, true, 2),
  ('75bb0c07-4a24-49b2-95cf-429a5c817af8', $c$１か月をこえる期間使用せず、当該期間中に１か月以内ごとに１回、定期に行う自主検査を行わなかった移動式クレーンについては、その使用を再び開始した後１か月以内に、所定の事項について自主検査を行わなければならない。$c$, false, 3),
  ('75bb0c07-4a24-49b2-95cf-429a5c817af8', $c$１か月以内ごとに１回、定期に行う自主検査を行った場合において、異常を認めたときは、次回の定期に行う自主検査までに補修しなければならない。$c$, false, 4),
  ('75bb0c07-4a24-49b2-95cf-429a5c817af8', $c$１年以内ごとに１回、定期に行う自主検査の結果の記録は３年間保存し、１か月以内ごとに１回、定期に行う自主検査の結果の記録は１年間保存しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a94060d5-d979-4db9-bc54-dd1d0a2cc052',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重20ｔの移動式クレーン(以下、本問において「移動式クレーン」という。)の検査に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a94060d5-d979-4db9-bc54-dd1d0a2cc052', $c$製造検査においては、移動式クレーンの各部分の構造及び機能について点検を行うほか、荷重試験及び安定度試験を行うものとする。$c$, false, 1),
  ('a94060d5-d979-4db9-bc54-dd1d0a2cc052', $c$使用検査における安定度試験は、定格荷重の1.27倍に相当する荷重の荷をつって、安定に関し最も不利な条件で地切りすることにより行うものとする。$c$, false, 2),
  ('a94060d5-d979-4db9-bc54-dd1d0a2cc052', $c$性能検査においては、移動式クレーンの各部分の構造及び機能について点検を行うほか、荷重試験を行うものとする。$c$, false, 3),
  ('a94060d5-d979-4db9-bc54-dd1d0a2cc052', $c$変更検査における荷重試験は、定格荷重に相当する荷重の荷をつって、つり上げ、旋回、走行等の作動を定格速度により行うものとする。$c$, true, 4),
  ('a94060d5-d979-4db9-bc54-dd1d0a2cc052', $c$使用再開検査を受ける者は、当該検査に立ち会わなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f0dd74e2-d9aa-477d-bca1-3260db042352',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーン運転士免許及び免許証に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f0dd74e2-d9aa-477d-bca1-3260db042352', $c$免許に係る業務に現に就いている者は、氏名を変更したときは、免許証の書替えを受けなければならない。$c$, false, 1),
  ('f0dd74e2-d9aa-477d-bca1-3260db042352', $c$免許に係る業務に現に就いている者は、免許証を損傷したときは、免許証の再交付を受けなければならない。$c$, false, 2),
  ('f0dd74e2-d9aa-477d-bca1-3260db042352', $c$重大な過失により、免許に係る業務について重大な事故を発生させたときは、免許の取消し又は効力の一時停止の処分を受けることがある。$c$, false, 3),
  ('f0dd74e2-d9aa-477d-bca1-3260db042352', $c$労働安全衛生法違反により免許の取消しの処分を受けた者は、処分を受けた日から起算して30日以内に、免許の取消しをした都道府県労働局長に免許証を返還しなければならない。$c$, true, 4),
  ('f0dd74e2-d9aa-477d-bca1-3260db042352', $c$労働安全衛生法違反により免許を取り消され、その取消しの日から起算して１年を経過しない者は、免許を受けることができない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9df5d367-6320-43f0-9d84-7e76e27ffd25',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問31',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9df5d367-6320-43f0-9d84-7e76e27ffd25', $c$小さな物体の一点に大きさが異なり向きが一直線上にない二つの力が作用して物体が動くとき、その物体は大きい力の方向に動く。$c$, true, 1),
  ('9df5d367-6320-43f0-9d84-7e76e27ffd25', $c$物体に作用する一つの力を、互いにある角度を持つ二つ以上の力に分けることを力の分解という。$c$, false, 2),
  ('9df5d367-6320-43f0-9d84-7e76e27ffd25', $c$一直線上に作用する互いに逆を向く二つの力の合力の大きさは、その二つの力の大きさの差で求められる。$c$, false, 3),
  ('9df5d367-6320-43f0-9d84-7e76e27ffd25', $c$力の大きさをＦ、回転軸の中心から力の作用線に下ろした垂線の長さをＬとすれば、力のモーメントＭは、Ｍ＝Ｆ×Ｌで求められる。$c$, false, 4),
  ('9df5d367-6320-43f0-9d84-7e76e27ffd25', $c$力が物体に作用する位置をその作用線上以外の箇所に移すと、物体に与える効果が変わる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のように三つの重りをワイヤロープによりつるした天びん棒が支点Ｏでつり合っているとき、Ｂ点につるした重りＰの質量の値は(１)～(５)のうちどれか。
ただし、天びん棒及びワイヤロープの質量は考えないものとする。
(点Ａ・支点Ｏ・点Ｂ・点Ｃがこの順に一直線上にあり、Ａ－Ｏ間30cm、Ｏ－Ｂ間20cm、Ｂ－Ｃ間20cm。天びん棒の全長は70cm。Ａ点に40kg、Ｂ点にＰ、Ｃ点に10kg)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問32',
  '/exam-figures/mobile_crane/2026-04/q32.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8', $c$20 kg$c$, false, 1),
  ('15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8', $c$30 kg$c$, false, 2),
  ('15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8', $c$40 kg$c$, true, 3),
  ('15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8', $c$50 kg$c$, false, 4),
  ('15e9ba1d-ee4b-4802-8a01-8b4bc92cd1e8', $c$60 kg$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'aa0c9860-6e6e-4238-947e-95f1c5647780',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体の質量及び比重に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('aa0c9860-6e6e-4238-947e-95f1c5647780', $c$鉛１ｍ３の質量は、約11.4ｔである。$c$, false, 1),
  ('aa0c9860-6e6e-4238-947e-95f1c5647780', $c$物体の体積をＶ、その単位体積当たりの質量をｄとすれば、その物体の質量Ｗは、Ｗ＝Ｖ×ｄで求められる。$c$, false, 2),
  ('aa0c9860-6e6e-4238-947e-95f1c5647780', $c$銅の比重は、約8.9である。$c$, false, 3),
  ('aa0c9860-6e6e-4238-947e-95f1c5647780', $c$形状が立方体で均質な材料でできている物体では、縦、横、高さ３辺の長さがそれぞれ４倍になると質量は16倍になる。$c$, true, 4),
  ('aa0c9860-6e6e-4238-947e-95f1c5647780', $c$水2.7ｍ３の質量とアルミニウム１ｍ３の質量はほぼ同じである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ed82a898-6df5-4575-b771-490f931e84f7',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$次の文中の〔　〕内に入れるＡからＣまでの語句の組合せとして、適切なものは(１)～(５)のうちどれか。
「水平面に置いてある物体が図に示すように傾いているとき、この物体の各部分に作用するＡにより生じている力の合力Ｗが重心Ｇに鉛直に作用し、回転の中心△を支点として、物体をＢとする方向にＣとして働く。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問34',
  '/exam-figures/mobile_crane/2026-04/q34.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ed82a898-6df5-4575-b771-490f931e84f7', $c$重力 元に戻そう モーメント$c$, false, 1),
  ('ed82a898-6df5-4575-b771-490f931e84f7', $c$遠心力 倒そう 引張応力$c$, false, 2),
  ('ed82a898-6df5-4575-b771-490f931e84f7', $c$復元力 元に戻そう 動荷重$c$, false, 3),
  ('ed82a898-6df5-4575-b771-490f931e84f7', $c$重力 倒そう モーメント$c$, true, 4),
  ('ed82a898-6df5-4575-b771-490f931e84f7', $c$向心力 倒そう 引張応力$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体の運動に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652', $c$運動している物体には、外から力が作用しない限り、静止している状態に戻ろうとする性質があり、この性質を慣性という。$c$, false, 1),
  ('0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652', $c$物体が円運動をしているとき、遠心力は、物体の質量が大きいほど小さくなる。$c$, false, 2),
  ('0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652', $c$物体が速さや向きを変えながら運動する場合、その変化の程度を示す量を速度という。$c$, false, 3),
  ('0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652', $c$等速直線運動をしている物体の移動した距離をＬ、その移動に要した時間をＴとすれば、その速さＶは、Ｖ＝Ｌ×Ｔで求められる。$c$, false, 4),
  ('0bdc7fdf-a0c6-4acd-a95e-4aca59d2b652', $c$物体が一定の加速度で加速し、その速度が６秒間に８ｍ/ｓから17ｍ/ｓになったときの加速度は、1.5ｍ/ｓ２である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '41aec2b5-0f4a-441a-ab6c-e1114b956963',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体に働く摩擦力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('41aec2b5-0f4a-441a-ab6c-e1114b956963', $c$水平な床面で静止している物体には、その物体を床面に沿って引っ張るなどして力を加えなければ、静止摩擦力は働かない。$c$, false, 1),
  ('41aec2b5-0f4a-441a-ab6c-e1114b956963', $c$最大静止摩擦力の大きさは、静止摩擦係数に反比例する。$c$, true, 2),
  ('41aec2b5-0f4a-441a-ab6c-e1114b956963', $c$物体が他の物体に接触しながら運動しているときに働く摩擦力を、運動摩擦力という。$c$, false, 3),
  ('41aec2b5-0f4a-441a-ab6c-e1114b956963', $c$運動摩擦力の大きさは、物体の接触面に作用する垂直力の大きさに比例するが、接触面積には関係しない。$c$, false, 4),
  ('41aec2b5-0f4a-441a-ab6c-e1114b956963', $c$円柱状の物体を動かす場合に生じる転がり摩擦力は、滑り摩擦力に比べると小さい。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '709400ed-55a7-4465-9c6b-9ede16ddc355',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('709400ed-55a7-4465-9c6b-9ede16ddc355', $c$移動式クレーンのフックには、主に圧縮荷重がかかる。$c$, false, 1),
  ('709400ed-55a7-4465-9c6b-9ede16ddc355', $c$せん断荷重は、棒状の材料を長手方向に引き伸ばすように働く荷重である。$c$, false, 2),
  ('709400ed-55a7-4465-9c6b-9ede16ddc355', $c$移動式クレーンのシーブを通る巻上げ用ワイヤロープには、主にねじり荷重とせん断荷重がかかる。$c$, false, 3),
  ('709400ed-55a7-4465-9c6b-9ede16ddc355', $c$片振り荷重は、大きさは同じであるが、向きが時間とともに変わる荷重である。$c$, false, 4),
  ('709400ed-55a7-4465-9c6b-9ede16ddc355', $c$移動式クレーンの巻上げドラムには、主に曲げ荷重とねじり荷重がかかる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8216bbc1-9e87-43f6-bf94-1a94f8833acc',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のように、直径１ｍ、高さ0.5ｍの鋳鉄製の円柱を同じ長さの２本の玉掛け用ワイヤロープ(以下、本問において「ワイヤロープ」という。)を用いてつり角度60°でつるとき、１本のワイヤロープにかかる張力の値に最も近いものは(１)～(５)のうちどれか。ただし、鋳鉄の１ｍ３当たりの質量は 7.2ｔ、重力の加速度は 9.8ｍ/ｓ２とする。また、荷の左右のつり合いは取れており、左右のワイヤロープの張力は同じとし、ワイヤロープ及び荷のつり金具の質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8216bbc1-9e87-43f6-bf94-1a94f8833acc', $c$12ｋＮ$c$, false, 1),
  ('8216bbc1-9e87-43f6-bf94-1a94f8833acc', $c$14ｋＮ$c$, false, 2),
  ('8216bbc1-9e87-43f6-bf94-1a94f8833acc', $c$16ｋＮ$c$, true, 3),
  ('8216bbc1-9e87-43f6-bf94-1a94f8833acc', $c$20ｋＮ$c$, false, 4),
  ('8216bbc1-9e87-43f6-bf94-1a94f8833acc', $c$28ｋＮ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '220d2183-d278-4279-b2d7-db9bb91e78d8',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$移動式クレーンに使用される鉄鋼材料(以下、本問において「材料」という。)の強さ、応力、変形などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('220d2183-d278-4279-b2d7-db9bb91e78d8', $c$材料に荷重が作用し変形するとき、荷重が作用する前の元の量(原形)に対する変形量の割合をひずみという。$c$, false, 1),
  ('220d2183-d278-4279-b2d7-db9bb91e78d8', $c$繰返し荷重が作用するとき、比較的小さな荷重であっても材料が破壊することがあるが、このような現象を材料の疲れによる破壊(疲労破壊)という。$c$, false, 2),
  ('220d2183-d278-4279-b2d7-db9bb91e78d8', $c$引張試験において、材料の試験片を材料試験機に取り付けて静かに引張荷重をかけると、加えられた荷重に応じて試験片に変形が生じるが、荷重の大きさが「応力－ひずみ線図」における比例限度以内であれば、荷重を取り除くと、試験片は荷重が作用する前の形状に戻る。$c$, false, 3),
  ('220d2183-d278-4279-b2d7-db9bb91e78d8', $c$材料に荷重をかけると、材料の内部にはその荷重に抵抗し、つり合いを保とうとする内力が生じる。$c$, false, 4),
  ('220d2183-d278-4279-b2d7-db9bb91e78d8', $c$圧縮応力は、材料の断面積を材料に作用する圧縮荷重で割って求められる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'dc59545c-3ce6-4c93-a42e-0cf9876b6603',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のような滑車を用いて、質量Ｗの荷をつり上げるとき、荷を支えるために必要な力Ｆを求める式がそれぞれの図の下部に記載してあるが、これらの力Ｆを求める式として、適切でないものは(１)～(５)のうちどれか。
ただし、ｇは重力の加速度とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和8年4月公表 移動式クレーン運転士試験 問40',
  '/exam-figures/mobile_crane/2026-04/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('dc59545c-3ce6-4c93-a42e-0cf9876b6603', $c$Ｆ＝Ｗｇ／５$c$, true, 1),
  ('dc59545c-3ce6-4c93-a42e-0cf9876b6603', $c$Ｆ＝Ｗｇ／２$c$, false, 2),
  ('dc59545c-3ce6-4c93-a42e-0cf9876b6603', $c$Ｆ＝Ｗｇ／４$c$, false, 3),
  ('dc59545c-3ce6-4c93-a42e-0cf9876b6603', $c$Ｆ＝Ｗｇ／２$c$, false, 4),
  ('dc59545c-3ce6-4c93-a42e-0cf9876b6603', $c$Ｆ＝Ｗｇ$c$, false, 5);

do $$
declare
  mc_2026_04 int;
begin
  select count(*) into mc_2026_04
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和8年4月公表 移動式クレーン運転士試験%';

  if mc_2026_04 <> 40 then
    raise exception 'mobile_crane 2026-04 sitting must be 40 questions (got %)', mc_2026_04;
  end if;
end $$;

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter
)
select
  'mobile_crane',
  exam_types.id,
  '移動式クレーン運転士模擬試験(令和8年4月)',
  150,
  40,
  '令和8年4月公表 移動式クレーン運転士試験'
from exam_types
where exam_types.exam_id = 'mobile_crane'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'mobile_crane'
      and source_filter = '令和8年4月公表 移動式クレーン運転士試験'
      and category_scope is null
  );

insert into mock_exams (
  exam_id,
  exam_type_id,
  name,
  time_limit_minutes,
  question_count,
  source_filter,
  category_scope
)
select
  'mobile_crane',
  exam_types.id,
  '移動式クレーン運転士模擬試験(令和8年4月)【力学免除】',
  120,
  30,
  '令和8年4月公表 移動式クレーン運転士試験',
  array[
    '移動式クレーンに関する知識',
    '原動機及び電気に関する知識',
    '関係法令'
  ]
from exam_types
where exam_types.exam_id = 'mobile_crane'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'mobile_crane'
      and name = '移動式クレーン運転士模擬試験(令和8年4月)【力学免除】'
  );
