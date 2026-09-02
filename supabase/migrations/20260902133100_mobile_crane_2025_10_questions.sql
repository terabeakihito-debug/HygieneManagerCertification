-- mobile_crane 令和7年10月 過去問 questions / choices / mock_exams

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd8e1f334-e11a-4c60-8ddf-7ae10ccd8553',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンに関する用語の記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問1',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d8e1f334-e11a-4c60-8ddf-7ae10ccd8553', $c$つり上げ荷重とは、アウトリガーを有する移動式クレーンにあっては、当該アウトリガーを最大限に張り出し、ジブ長さを最短に、作業半径を最小にしたときに負荷させることができる最大の荷重をいい、フックなどのつり具分が含まれる。$c$, true, 1),
  ('d8e1f334-e11a-4c60-8ddf-7ae10ccd8553', $c$作業半径とは、ジブフートピンの中心からジブポイントまでの距離をいい、ジブの傾斜角を変えると作業半径が変化する。$c$, false, 2),
  ('d8e1f334-e11a-4c60-8ddf-7ae10ccd8553', $c$定格速度とは、つり上げ荷重に相当する荷重の荷をつって、つり上げ、旋回などの作動を行う場合の、それぞれの最高の速度をいう。$c$, false, 3),
  ('d8e1f334-e11a-4c60-8ddf-7ae10ccd8553', $c$ジブの起伏とは、ジブが取り付けられたピンを支点として傾斜角を変える運動をいい、傾斜角を変える運動には、起伏シリンダの作動によるものと、巻上げ用ワイヤロープの巻取り、巻戻しによるものがある。$c$, false, 4),
  ('d8e1f334-e11a-4c60-8ddf-7ae10ccd8553', $c$総揚程とは、ジブ長さを最長に、傾斜角を最大にしたときのつり具の上限位置と、ジブ長さを最短に、傾斜角を最小にしたときのつり具の上限位置との間の垂直移動距離をいう。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1d6c3e86-335c-48ef-932c-d6c934fe48b5',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの種類、型式などに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問2',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1d6c3e86-335c-48ef-932c-d6c934fe48b5', $c$オールテレーンクレーンは、ホイールクレーンに含まれるもので、特殊な操向機構とハイドロニューマチック・サスペンション(油空圧式サスペンション)装置を有し、不整地の走行や狭所進入性に優れている。$c$, false, 1),
  ('1d6c3e86-335c-48ef-932c-d6c934fe48b5', $c$積載形トラッククレーンには、通常、「ＰＴＯ」と呼ばれるクレーン作業専用の原動機が走行用原動機とは別に搭載されており、クレーン作動は「ＰＴＯ」から動力が伝達された油圧装置により行われる。$c$, false, 2),
  ('1d6c3e86-335c-48ef-932c-d6c934fe48b5', $c$ラフテレーンクレーンの下部走行体には、２軸から４軸の車軸を装備する専用のキャリアが用いられ、駆動方式には常時全軸駆動方式及びパートタイム駆動方式がある。$c$, true, 3),
  ('1d6c3e86-335c-48ef-932c-d6c934fe48b5', $c$浮きクレーンは、長方形の箱形などの台船上にクレーン装置を搭載した型式のものであるが、台船の構造上自ら航行するものはない。$c$, false, 4),
  ('1d6c3e86-335c-48ef-932c-d6c934fe48b5', $c$トラッククレーン及びホイールクレーンのキャリアには、通常、張出しなどの作動をラックピニオン方式で行うＨ形又はＭ形のアウトリガーが備え付けられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '14736c5f-c4ef-4e43-9e18-a9ae7a956673',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンのフロントアタッチメントに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問3',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('14736c5f-c4ef-4e43-9e18-a9ae7a956673', $c$箱形構造ジブの伸縮方式としては、２段目、３段目、４段目と順次に伸縮する方式と、各段が同時に伸縮する方式がある。$c$, false, 1),
  ('14736c5f-c4ef-4e43-9e18-a9ae7a956673', $c$ペンダントロープは、ジブ上端と上部ブライドルをつなぐワイヤロープである。$c$, false, 2),
  ('14736c5f-c4ef-4e43-9e18-a9ae7a956673', $c$補助ジブのうち取付角(オフセット)を油圧シリンダなどにより無段階に設定できる構造のジブをラッフィングジブという。$c$, false, 3),
  ('14736c5f-c4ef-4e43-9e18-a9ae7a956673', $c$リフティングマグネットは、電磁石を応用したつり具で、金、銀、銅、アルミニウムなど、あらゆる金属を引きつけることができるので、スクラップなどの荷役に用いられる。$c$, true, 4),
  ('14736c5f-c4ef-4e43-9e18-a9ae7a956673', $c$グラブバケットは、ばら物の荷をつかむ装置で、複索式二線型にはタグラインを備えることが多い。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3cbe1b73-f723-4ad2-a641-bec17aebc245',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$クローラクレーンに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問4',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3cbe1b73-f723-4ad2-a641-bec17aebc245', $c$クローラクレーン用下部走行体は、走行フレームの前方に起動輪、後方に遊動輪を配置してクローラベルトを巻いたもので、起動輪を動力で回転させて走行する。$c$, false, 1),
  ('3cbe1b73-f723-4ad2-a641-bec17aebc245', $c$鋳鋼又は鍛鋼製のクローラベルトには、シューをリンクにボルトで取り付ける一体型と、シューをピンでつなぎ合わせる組立型がある。$c$, false, 2),
  ('3cbe1b73-f723-4ad2-a641-bec17aebc245', $c$クローラクレーン用下部走行体の起動輪の軸中心から遊動輪の軸中心までの距離をクローラ中心距離といい、この距離が長いほど左右の安定が良いため、クローラクレーンは、一般に、クローラ中心距離を長くすることができる構造になっている。$c$, false, 3),
  ('3cbe1b73-f723-4ad2-a641-bec17aebc245', $c$平均接地圧(kＰa又はkＮ/ｍ２)は、一般に、全装備質量(ｔ)に9.8(ｍ/ｓ２)を掛けた数値を、クローラベルトの総面積(ｍ２)で割ったもので表される。$c$, false, 4),
  ('3cbe1b73-f723-4ad2-a641-bec17aebc245', $c$クローラベルトのシューには、幅の広いものと狭いものがあり、シューを取り換えることにより接地圧を変えることができる。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '57b27c19-f1ef-4368-b7be-c0b8ef14361b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの上部旋回体に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問5',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('57b27c19-f1ef-4368-b7be-c0b8ef14361b', $c$ラフテレーンクレーンの上部旋回体に設置された運転室には、クレーン操作装置が装備されており、走行用操縦装置は下部走行体に装備されている。$c$, false, 1),
  ('57b27c19-f1ef-4368-b7be-c0b8ef14361b', $c$トラス(ラチス)構造ジブのクローラクレーンのＡフレームは、作業時は高い位置にセットするが、長尺ジブを引き起こす場合は、低い位置にセットする。$c$, false, 2),
  ('57b27c19-f1ef-4368-b7be-c0b8ef14361b', $c$ボールベアリング式の旋回装置は、下部走行体に取り付けられた旋回ベアリングの旋回ギヤと上部旋回体に設けられたピニオンがかみ合う構造で、上部旋回体に取り付けられた旋回モータでピニオンを回転させることにより、上部旋回体側を旋回させる。$c$, true, 3),
  ('57b27c19-f1ef-4368-b7be-c0b8ef14361b', $c$トラス(ラチス)構造ジブのクローラクレーンの旋回フレームには、補助ジブを使用する際に取り付けるための補助ブラケットが装備されているものがある。$c$, false, 4),
  ('57b27c19-f1ef-4368-b7be-c0b8ef14361b', $c$オールテレーンクレーンの旋回フレーム上には、巻上装置、クレーン操作用の運転室などが設置され、カウンタウエイトは下部走行体に取り付けられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$下記に掲げるワイヤロープのより方を表した図において、ＡからＣまでのより方の組合せとして、適切なものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問6',
  '/exam-figures/mobile_crane/2025-10/q06.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b', $c$Ａ：ラングＳより　Ｂ：普通Ｚより　Ｃ：ラングＺより$c$, false, 1),
  ('9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b', $c$Ａ：ラングＳより　Ｂ：ラングＺより　Ｃ：普通Ｚより$c$, true, 2),
  ('9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b', $c$Ａ：普通Ｓより　Ｂ：ラングＺより　Ｃ：ラングＳより$c$, false, 3),
  ('9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b', $c$Ａ：ラングＺより　Ｂ：ラングＳより　Ｃ：普通Ｚより$c$, false, 4),
  ('9b4df53b-14ad-4eeb-ba0a-18aed1cf9a9b', $c$Ａ：普通Ｚより　Ｂ：普通Ｓより　Ｃ：ラングＺより$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの巻上装置に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問7',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae', $c$巻上装置の減速機は、歯車を用いて油圧モータの回転数を減速して必要なトルクを得るためのもので、一般に、平歯車減速式又は遊星歯車減速式のものが使用されている。$c$, false, 1),
  ('b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae', $c$巻上装置の巻上げドラムのロック機構には、一般に、ウォーム歯車が用いられている。$c$, true, 2),
  ('b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae', $c$巻上装置のクラッチは、巻上げドラムに回転を伝達したり遮断したりするものである。$c$, false, 3),
  ('b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae', $c$巻上装置のブレーキには、クラッチドラムの外側をブレーキバンドで締め付け、摩擦力で制動する構造のものがある。$c$, false, 4),
  ('b7a5d8cd-ed67-4ee7-9b9f-1926c7b488ae', $c$巻上装置のブレーキは、一般に、運転者が巻上げ下げの操作をしたときだけ自動的に圧油を送りブレーキを解除し、操作をしていないときはスプリング力を利用し、常時ブレーキが効いている自動ブレーキ方式が用いられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '1aa9c39e-b749-45d1-bde3-6581316bd87b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの取扱いに関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問8',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('1aa9c39e-b749-45d1-bde3-6581316bd87b', $c$トラッククレーンは、荷をつって旋回する場合、一般に、後方領域が最も安定が良く、前方領域は、側方領域及び後方領域よりも安定が悪い。$c$, true, 1),
  ('1aa9c39e-b749-45d1-bde3-6581316bd87b', $c$箱形構造ジブの場合は、ジブを伸ばすとフックブロックが巻下げの状態になるので、巻上げドラムでワイヤロープが乱巻きにならないよう、ジブの伸ばしに合わせて巻上げを行う。$c$, false, 2),
  ('1aa9c39e-b749-45d1-bde3-6581316bd87b', $c$クローラクレーンは、側方領域に比べ前方領域及び後方領域の定格総荷重が小さい。$c$, false, 3),
  ('1aa9c39e-b749-45d1-bde3-6581316bd87b', $c$つり荷を下ろしたときに玉掛け用ワイヤロープが挟まり手で抜けなくなった場合は、周囲に人がいないことを確認してから、移動式クレーンの巻上げ運転で玉掛け用ワイヤロープを荷から引き抜く。$c$, false, 4),
  ('1aa9c39e-b749-45d1-bde3-6581316bd87b', $c$巻上げ操作による荷の横引きを行うときは、周囲に人がいないことを確認してから行う。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '674d2e4f-d1d1-447a-914a-69f2d7af5be7',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$移動式クレーンの安全装置などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問9',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('674d2e4f-d1d1-447a-914a-69f2d7af5be7', $c$油圧回路の安全弁は、過負荷や衝撃荷重により油圧回路内に異常に高い圧力が発生するのを防止するための装置である。$c$, false, 1),
  ('674d2e4f-d1d1-447a-914a-69f2d7af5be7', $c$巻過警報装置は、巻上げ、ジブ伸ばしなどの作動時にフックブロックが上限の高さまで巻き上がると、警報を発する装置である。$c$, false, 2),
  ('674d2e4f-d1d1-447a-914a-69f2d7af5be7', $c$過負荷防止装置には、ジブの各傾斜角において、つり荷の荷重が定格荷重をこえようとしたときに警報を発して注意を喚起し、定格荷重をこえたときに転倒する危険性が高くなるジブの伏せ及び伸ばし、並びにつり荷の巻上げの作動を自動的に停止させる装置がある。$c$, false, 3),
  ('674d2e4f-d1d1-447a-914a-69f2d7af5be7', $c$箱形構造ジブの起こし過ぎにより、ジブ起伏シリンダが戻らなくなることを防止するジブ起伏停止装置は、ジブ起伏シリンダ下部に設けられ、ジブの起こし角が操作限界になったとき、運転士がそのまま操作レバーを引き続けても、自動的にジブの作動を停止させる装置である。$c$, true, 4),
  ('674d2e4f-d1d1-447a-914a-69f2d7af5be7', $c$旋回警報装置は、旋回中に挟まれる災害などを防止するため、周囲の作業者に危険を知らせる装置で、通常、そのスイッチは旋回操作レバーに取り付けられている。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f880d719-7c96-4498-bc4f-224a61655e9e',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンに関する知識'),
  $q$下表１は、一般的なラフテレーンクレーンのアウトリガー最大張出しの場合における定格総荷重表を模したもので、表１には、このラフテレーンクレーンの「機体の強度」(構造部材が破損するかどうか。)によって定められた荷重の値と、「機体の安定」(転倒するかどうか。)によって定められた荷重の値の境界線が階段状の太線で示されている。表１のジブ長さと作業半径の作業条件におけるラフテレーンクレーンの定格総荷重を求めるため、ジブ長さと作業半径の組合せを選び出したものが下表２であるが、表２のＡからＤまでの作業条件によって定まる定格総荷重の値が、「機体の安定」によって定められた荷重の値であるもののみを全てあげた組合せは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問10',
  '/exam-figures/mobile_crane/2025-10/q10.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f880d719-7c96-4498-bc4f-224a61655e9e', $c$Ａ，Ｂ$c$, false, 1),
  ('f880d719-7c96-4498-bc4f-224a61655e9e', $c$Ａ，Ｄ$c$, false, 2),
  ('f880d719-7c96-4498-bc4f-224a61655e9e', $c$Ｂ，Ｃ$c$, true, 3),
  ('f880d719-7c96-4498-bc4f-224a61655e9e', $c$Ｂ，Ｃ，Ｄ$c$, false, 4),
  ('f880d719-7c96-4498-bc4f-224a61655e9e', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$エンジンに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問11',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60', $c$ディーゼルエンジンは、高温高圧の空気の中に軽油や重油を噴射して燃焼させる。$c$, false, 1),
  ('6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60', $c$ディーゼルエンジンは、燃焼に使用される燃料の引火点が高いため、ガソリンエンジンに比べ火災による危険度は少ないが、冬期の始動性はやや悪い。$c$, false, 2),
  ('6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60', $c$移動式クレーンには、直接噴射式ディーゼルエンジンが多く搭載されている。$c$, false, 3),
  ('6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60', $c$４サイクルエンジンは、吸入、圧縮、燃焼、排気の行程順の１循環で１回の動力を発生する。$c$, false, 4),
  ('6bddb4bd-b1b0-4f37-afe2-a00ae61c4b60', $c$ディーゼルエンジンは、ガソリンエンジンに比べ、一般に、運転経費は安いが熱効率が悪い。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '5fadac43-4790-4171-adf4-681ccc2a5a1a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンのディーゼルエンジンに取り付けられる補機、装置などに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問12',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('5fadac43-4790-4171-adf4-681ccc2a5a1a', $c$燃料噴射ノズルは、燃料の噴射量を加減して負荷の変動による回転速度を調整するものである。$c$, true, 1),
  ('5fadac43-4790-4171-adf4-681ccc2a5a1a', $c$フライホイールは、燃焼行程のエネルギーを一時的に蓄えてクランク軸の回転を円滑にするもので、クランク軸の後端部に取り付けられる。$c$, false, 2),
  ('5fadac43-4790-4171-adf4-681ccc2a5a1a', $c$エアクリーナは、燃料の燃焼に必要な空気をシリンダに吸い込むとき、じんあいを吸い込まないようにろ過するものである。$c$, false, 3),
  ('5fadac43-4790-4171-adf4-681ccc2a5a1a', $c$タイミングギヤは、カム軸とクランク軸の間に組み込まれたギヤで、エンジンの各行程が必要とする時期に吸排気バルブの開閉や燃料の噴射を行わせるためのものである。$c$, false, 4),
  ('5fadac43-4790-4171-adf4-681ccc2a5a1a', $c$４サイクルエンジンの過給器は、エンジンの出力を増加するため、高い圧力の空気をシリンダ内に強制的に送り込むものである。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '960b5bff-dc79-4d89-8fc2-af7a2fc4c143',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置に関する次の文中の〔　〕内に入れるＡからＤまでの語句の組合せとして、適切なものは(１)～(５)のうちどれか。
「移動式クレーンの油圧装置は、他の動力などによって油圧Ａを駆動し、これでＢされた作動油が方向切換弁などの油圧制御弁を経て、ジブの起伏、巻上げなどのクレーン作動を行うそれぞれの油圧シリンダ又は油圧Ｃに流れ、油圧シリンダが伸縮又は油圧Ｃが回転して各装置を駆動させる。油圧シリンダ又は油圧Ｃを駆動させＤとなった作動油は、油圧回路の配管を経て作動油タンクに戻る。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問13',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('960b5bff-dc79-4d89-8fc2-af7a2fc4c143', $c$Ａ：ポンプ　Ｂ：減圧　Ｃ：モータ　Ｄ：低圧$c$, false, 1),
  ('960b5bff-dc79-4d89-8fc2-af7a2fc4c143', $c$Ａ：ポンプ　Ｂ：加圧　Ｃ：モータ　Ｄ：高圧$c$, false, 2),
  ('960b5bff-dc79-4d89-8fc2-af7a2fc4c143', $c$Ａ：ポンプ　Ｂ：加圧　Ｃ：モータ　Ｄ：低圧$c$, true, 3),
  ('960b5bff-dc79-4d89-8fc2-af7a2fc4c143', $c$Ａ：モータ　Ｂ：加圧　Ｃ：ポンプ　Ｄ：低圧$c$, false, 4),
  ('960b5bff-dc79-4d89-8fc2-af7a2fc4c143', $c$Ａ：モータ　Ｂ：減圧　Ｃ：ポンプ　Ｄ：高圧$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'ac52fab4-bba2-4ffb-b584-fa6ab5fd391a',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧発生装置の油圧ポンプに関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問14',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('ac52fab4-bba2-4ffb-b584-fa6ab5fd391a', $c$歯車ポンプはケーシング内でかみ合う歯車によって、吸込み口から吸い込んだ油を吐出し口に押し出す機構である。$c$, false, 1),
  ('ac52fab4-bba2-4ffb-b584-fa6ab5fd391a', $c$歯車ポンプは、キャビテーションが発生しない構造で、騒音、振動が少ないため、プランジャポンプに比べて、大容量かつ脈動のない圧油が効率良く得られる。$c$, true, 2),
  ('ac52fab4-bba2-4ffb-b584-fa6ab5fd391a', $c$歯車ポンプには内接形と外接形があり、移動式クレーンでは外接形が使用されている。$c$, false, 3),
  ('ac52fab4-bba2-4ffb-b584-fa6ab5fd391a', $c$プランジャポンプは、プランジャの往復運動により油の吸込み、吐出しを行う機構である。$c$, false, 4),
  ('ac52fab4-bba2-4ffb-b584-fa6ab5fd391a', $c$可変容量形のプランジャポンプは、吐出量を加減することができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'a707d5d8-314e-489e-84a5-d6286c8d4be2',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンのジブの伸縮回路に用いられる、次の図の油圧制御弁の名称は、(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問15',
  '/exam-figures/mobile_crane/2025-10/q15.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('a707d5d8-314e-489e-84a5-d6286c8d4be2', $c$減圧弁$c$, false, 1),
  ('a707d5d8-314e-489e-84a5-d6286c8d4be2', $c$リリーフ弁$c$, false, 2),
  ('a707d5d8-314e-489e-84a5-d6286c8d4be2', $c$パイロットチェック弁$c$, false, 3),
  ('a707d5d8-314e-489e-84a5-d6286c8d4be2', $c$シーケンス弁$c$, true, 4),
  ('a707d5d8-314e-489e-84a5-d6286c8d4be2', $c$絞り弁$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9369291e-7b27-4c2f-a733-abbf6606879b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の付属機器及び配管類に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問16',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9369291e-7b27-4c2f-a733-abbf6606879b', $c$アキュムレータは、シェル内をゴム製の隔壁(ブラダ)などにより油室とガス室に分け、ガスの圧縮性により作動油の油圧を調整する機器で、常に浄化冷却されたガスが適切に供給されるよう、ガス室にエアブリーザを備えている。$c$, true, 1),
  ('9369291e-7b27-4c2f-a733-abbf6606879b', $c$ラインフィルタは、油圧回路を流れる作動油をろ過してごみを取り除くもので、圧力管路用のものと戻り管路用のものがある。$c$, false, 2),
  ('9369291e-7b27-4c2f-a733-abbf6606879b', $c$油圧装置の各部を接続する配管には鋼管、高圧用ゴムホースなどが使用されているが、高圧用ゴムホースは鋼管の配管取付けが困難な場所や、装置の可動部分の配管連結用に使用される。$c$, false, 3),
  ('9369291e-7b27-4c2f-a733-abbf6606879b', $c$配管類の継手には密封性が要求されるので、ねじ継手、フランジ管継手、フレア管継手、くい込み継手などが使用される。$c$, false, 4),
  ('9369291e-7b27-4c2f-a733-abbf6606879b', $c$作動油の油温が高温になると障害が起こるので、発熱量が多い使用状況の場合は、強制的に冷却するためにオイルクーラーが用いられる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c383ef44-1633-48f9-b6f0-858b833ef4c4',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の保守に関するＡからＤまでの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 油圧ポンプの点検項目としては、ポンプを停止した状態での異音及び発熱の有無、接合部及びシール部の油漏れの有無の検査などがあげられる。
Ｂ 油圧配管系統の接続部は、特に緩みやすいので、圧油の漏れの有無を毎日点検する。
Ｃ 油圧配管系統の分解整備後、配管内に空気が残った場合は、ポンプの焼付きを防止するため、油圧ポンプを全負荷運転し配管内の空気を除去する。
Ｄ フィルタエレメントの洗浄は、一般的には、溶剤を含ませたブラシで異物を払い落とし、エレメントの外側から内側へ圧縮空気で吹く。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問17',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c383ef44-1633-48f9-b6f0-858b833ef4c4', $c$Ａ，Ｂ$c$, false, 1),
  ('c383ef44-1633-48f9-b6f0-858b833ef4c4', $c$Ａ，Ｂ，Ｃ$c$, false, 2),
  ('c383ef44-1633-48f9-b6f0-858b833ef4c4', $c$Ａ，Ｃ，Ｄ$c$, true, 3),
  ('c383ef44-1633-48f9-b6f0-858b833ef4c4', $c$Ｂ，Ｄ$c$, false, 4),
  ('c383ef44-1633-48f9-b6f0-858b833ef4c4', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '12d5bc00-3970-432c-a1bd-3403d6ffe57d',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$移動式クレーンの油圧装置の作動油に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問18',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('12d5bc00-3970-432c-a1bd-3403d6ffe57d', $c$作動油の温度が使用限界温度の上限より高くなると、潤滑性が悪くなるほか、劣化を促進する。$c$, false, 1),
  ('12d5bc00-3970-432c-a1bd-3403d6ffe57d', $c$作動油の温度が使用限界温度の下限より低くなると、油の粘度が高くなり、ポンプの運転に大きな力が必要となる。$c$, false, 2),
  ('12d5bc00-3970-432c-a1bd-3403d6ffe57d', $c$作動油は、運転中、高温で空気などに接し、かくはん状態で使用されるので酸化しやすい。$c$, false, 3),
  ('12d5bc00-3970-432c-a1bd-3403d6ffe57d', $c$作動油の引火点は、180～240℃程度である。$c$, false, 4),
  ('12d5bc00-3970-432c-a1bd-3403d6ffe57d', $c$一般に用いられる作動油の比重は、1.85～1.95程度である。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'c7f66943-b450-4b1f-8442-7caa0d419725',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$電気に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問19',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('c7f66943-b450-4b1f-8442-7caa0d419725', $c$直流はＡＣ、交流はＤＣと表される。$c$, false, 1),
  ('c7f66943-b450-4b1f-8442-7caa0d419725', $c$変電所、開閉所などから家庭、工場などに電力を送ることを配電という。$c$, true, 2),
  ('c7f66943-b450-4b1f-8442-7caa0d419725', $c$工場の動力用電源には、一般に、200Ｖ級又は400Ｖ級の単相交流が使用されている。$c$, false, 3),
  ('c7f66943-b450-4b1f-8442-7caa0d419725', $c$電力として配電される交流は、地域によらず、家庭用は50Ｈz、工場の動力用は60Ｈzの周波数で供給されている。$c$, false, 4),
  ('c7f66943-b450-4b1f-8442-7caa0d419725', $c$単相交流を三つ集め、電流及び電圧の大きさ並びに電流の方向が時間の経過に関係なく一定となるものを三相交流という。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e782b5fe-7eb9-419e-9326-96a6da4229b3',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '原動機及び電気に関する知識'),
  $q$感電及びその防止に関するＡからＤまでの記述について、適切でないもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 電気によるやけどには、高圧の電源に接触した際のアークなどの高熱による熱傷のほか、電流通過によるジュール熱によって生じる皮膚や内部組織の傷害がある。
Ｂ 感電による危険を電流と時間の積によって評価する基準によれば、一般に、50Ａの電流が人体を流れた場合、安全率を考慮して１秒以内の通電時間が安全限界とされている。
Ｃ 市街地の電柱上に設けられた6600Ｖの高圧架空配電線の直近で移動式クレーンを用いた作業を行う場合であっても、移動式クレーンのジブが電線に直接接触するおそれの少ない作業方法であれば、電線防護管を設ける必要はない。
Ｄ 移動式クレーンのジブが電路に接触した場合であっても、運転席に乗っている運転士は、運転席から離れない限り身体には電気が流れないので感電しないが、ジブが電路に接触した状態で移動式クレーンを離れなければならないときは、機体からの放電による感電を防ぐため、機体から身体が離れないよう慎重に地上に降りなければならない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問20',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e782b5fe-7eb9-419e-9326-96a6da4229b3', $c$Ａ，Ｂ，Ｃ$c$, false, 1),
  ('e782b5fe-7eb9-419e-9326-96a6da4229b3', $c$Ａ，Ｄ$c$, false, 2),
  ('e782b5fe-7eb9-419e-9326-96a6da4229b3', $c$Ｂ，Ｃ$c$, false, 3),
  ('e782b5fe-7eb9-419e-9326-96a6da4229b3', $c$Ｂ，Ｃ，Ｄ$c$, true, 4),
  ('e782b5fe-7eb9-419e-9326-96a6da4229b3', $c$Ｃ，Ｄ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '26a7adaf-e285-491f-ab52-18614a90e536',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重20ｔの移動式クレーン(以下、本問において「移動式クレーン」という。)に係る許可又は検査に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問21',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('26a7adaf-e285-491f-ab52-18614a90e536', $c$移動式クレーンを製造しようとする者は、原則として、あらかじめ、所轄労働基準監督署長の製造許可を受けなければならない。$c$, false, 1),
  ('26a7adaf-e285-491f-ab52-18614a90e536', $c$移動式クレーンを製造した者は、所轄労働基準監督署長が行う製造検査を受けなければならない。$c$, false, 2),
  ('26a7adaf-e285-491f-ab52-18614a90e536', $c$移動式クレーンを輸入した者は、原則として都道府県労働局長が行う使用検査を受けなければならない。$c$, true, 3),
  ('26a7adaf-e285-491f-ab52-18614a90e536', $c$移動式クレーンのジブに変更を加えた者は、所轄都道府県労働局長が検査の必要がないと認めたものを除き、所轄都道府県労働局長が行う変更検査を受けなければならない。$c$, false, 4),
  ('26a7adaf-e285-491f-ab52-18614a90e536', $c$使用を廃止した移動式クレーンを再び使用しようとする者は、所轄労働基準監督署長が行う使用再開検査を受けなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '071e65c7-a9db-4961-9b47-7fdfbc55b6ca',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重３ｔ以上の移動式クレーン及び当該移動式クレーンに係る「移動式クレーン検査証」(以下、本問において「検査証」という。)に関する記述として、法令上、誤っているものは次のうちどれか。
ただし、計画の届出に係る免除認定を受けていない場合とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問22',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('071e65c7-a9db-4961-9b47-7fdfbc55b6ca', $c$移動式クレーンを設置した事業者は、設置後14日以内に、移動式クレーン設置報告書に移動式クレーン明細書及び検査証を添えて、所轄労働基準監督署長に提出しなければならない。$c$, true, 1),
  ('071e65c7-a9db-4961-9b47-7fdfbc55b6ca', $c$移動式クレーンを設置している者に異動があったときは、移動式クレーンを設置している者は、当該異動後10日以内に、検査証書替申請書に検査証を添えて、所轄労働基準監督署長を経由し検査証の交付を受けた都道府県労働局長に提出し、書替えを受けなければならない。$c$, false, 2),
  ('071e65c7-a9db-4961-9b47-7fdfbc55b6ca', $c$登録性能検査機関は、移動式クレーンに係る性能検査に合格した移動式クレーンについて、検査証の有効期間を更新するものとするが、性能検査の結果により２年未満又は２年をこえ３年以内の期間を定めて有効期間を更新することができる。$c$, false, 3),
  ('071e65c7-a9db-4961-9b47-7fdfbc55b6ca', $c$移動式クレーンを設置している者が移動式クレーンの使用を休止しようとする場合において、その休止しようとする期間が検査証の有効期間を経過した後にわたるときは、当該検査証の有効期間中にその旨を所轄労働基準監督署長に報告しなければならない。$c$, false, 4),
  ('071e65c7-a9db-4961-9b47-7fdfbc55b6ca', $c$移動式クレーンを設置している者が当該移動式クレーンについて、その使用を廃止したときは、その者は、遅滞なく、検査証を所轄労働基準監督署長に返還しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '387dcd10-30cc-4a46-a00d-a551680dcfbe',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの運転(道路上を走行させる運転を除く。)及び玉掛けの業務に関する記述として、法令上、正しいものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問23',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('387dcd10-30cc-4a46-a00d-a551680dcfbe', $c$小型移動式クレーン運転技能講習の修了では、つり上げ荷重4.9ｔのラフテレーンクレーンの運転の業務に就くことができない。$c$, false, 1),
  ('387dcd10-30cc-4a46-a00d-a551680dcfbe', $c$移動式クレーンの運転の業務に係る特別の教育の受講で、つり上げ荷重0.9ｔの積載形トラッククレーンの運転の業務に就くことができる。$c$, true, 2),
  ('387dcd10-30cc-4a46-a00d-a551680dcfbe', $c$移動式クレーン運転士免許では、つり上げ荷重100ｔの浮きクレーンの運転の業務に就くことができない。$c$, false, 3),
  ('387dcd10-30cc-4a46-a00d-a551680dcfbe', $c$玉掛け技能講習の修了では、つり上げ荷重10ｔのクローラクレーンで行う7ｔの荷の玉掛けの業務に就くことができない。$c$, false, 4),
  ('387dcd10-30cc-4a46-a00d-a551680dcfbe', $c$玉掛けの業務に係る特別の教育の受講で、つり上げ荷重2.9ｔのトラッククレーンで行う0.9ｔの荷の玉掛けの業務に就くことができる。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'b4d2bc48-c186-451f-8aef-e9aa4d489c7e',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$次の文章は移動式クレーンの使用に係る法令条文であるが、この文中の〔　〕内に入れるＡからＣまでの語句又は数値の組合せが、当該法令の内容と一致するものは(１)～(５)のうちどれか。
「事業者は、移動式クレーンについては、移動式クレーンＡに記載されているＢ(つり上げ荷重がＣ未満の移動式クレーンにあっては、これを製造した者が指定したＢ)の範囲をこえて使用してはならない。」$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問24',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('b4d2bc48-c186-451f-8aef-e9aa4d489c7e', $c$Ａ：設置報告書　Ｂ：ジブの傾斜角　Ｃ：５ｔ$c$, false, 1),
  ('b4d2bc48-c186-451f-8aef-e9aa4d489c7e', $c$Ａ：設置報告書　Ｂ：定格荷重　Ｃ：３ｔ$c$, false, 2),
  ('b4d2bc48-c186-451f-8aef-e9aa4d489c7e', $c$Ａ：検査証　Ｂ：定格荷重　Ｃ：５ｔ$c$, false, 3),
  ('b4d2bc48-c186-451f-8aef-e9aa4d489c7e', $c$Ａ：明細書　Ｂ：定格荷重　Ｃ：３ｔ$c$, false, 4),
  ('b4d2bc48-c186-451f-8aef-e9aa4d489c7e', $c$Ａ：明細書　Ｂ：ジブの傾斜角　Ｃ：３ｔ$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '7b187b7c-b388-43d1-a4a3-05e44be966be',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの使用に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問25',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('7b187b7c-b388-43d1-a4a3-05e44be966be', $c$地盤が軟弱であるため移動式クレーンが転倒するおそれのある場所においては、原則として、移動式クレーンを用いて作業を行ってはならない。$c$, false, 1),
  ('7b187b7c-b388-43d1-a4a3-05e44be966be', $c$労働者から移動式クレーンの安全装置の機能が失われている旨の申出があったときは、すみやかに、適当な措置を講じなければならない。$c$, false, 2),
  ('7b187b7c-b388-43d1-a4a3-05e44be966be', $c$油圧を動力として用いる移動式クレーンの安全弁については、原則として、つり上げ荷重に相当する荷重をかけたときの油圧に相当する圧力以下で作用するように調整しておかなければならない。$c$, true, 3),
  ('7b187b7c-b388-43d1-a4a3-05e44be966be', $c$移動式クレーンを用いて作業を行うときは、移動式クレーンの運転者及び玉掛けをする者が当該移動式クレーンの定格荷重を常時知ることができるよう、表示その他の措置を講じなければならない。$c$, false, 4),
  ('7b187b7c-b388-43d1-a4a3-05e44be966be', $c$移動式クレーンを使用する作業場においては、原則として、作業に従事する者を、移動式クレーンにより運搬し、又はつり上げて作業させてはならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '3d77e34a-0f4a-4860-857b-1e04cd653e1b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンに係る作業を行う場合であって、当該作業場において作業に従事する者がつり上げられている荷の下に立ち入ることについて、法令上、禁止とされていないものは（１）～（５）のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問26',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('3d77e34a-0f4a-4860-857b-1e04cd653e1b', $c$つりチェーンを用いて、荷に設けられた穴又はアイボルトを通さず、１箇所に玉掛けをした荷がつり上げられているとき$c$, false, 1),
  ('3d77e34a-0f4a-4860-857b-1e04cd653e1b', $c$複数の荷が一度につり上げられている場合であって、当該複数の荷が結束され、箱に入れられる等により固定されていないとき$c$, false, 2),
  ('3d77e34a-0f4a-4860-857b-1e04cd653e1b', $c$陰圧により吸着させるつり具を用いて玉掛けをした荷がつり上げられているとき$c$, false, 3),
  ('3d77e34a-0f4a-4860-857b-1e04cd653e1b', $c$つりクランプ２個を用いて玉掛けをした荷がつり上げられているとき$c$, true, 4),
  ('3d77e34a-0f4a-4860-857b-1e04cd653e1b', $c$ハッカー２個を用いて玉掛けをした荷がつり上げられているとき$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '9014e487-acc1-401d-894e-64c2ab3fab7d',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの玉掛けに用いる玉掛用具として、法令上、その使用が禁止とされていないものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問27',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('9014e487-acc1-401d-894e-64c2ab3fab7d', $c$ワイヤロープ１よりの間において素線(フィラ線を除く。以下同じ。)の数の11％の素線が切断したワイヤロープ$c$, false, 1),
  ('9014e487-acc1-401d-894e-64c2ab3fab7d', $c$直径の減少が公称径の９％のワイヤロープ$c$, false, 2),
  ('9014e487-acc1-401d-894e-64c2ab3fab7d', $c$伸びが製造されたときの長さの４％のつりチェーン$c$, true, 3),
  ('9014e487-acc1-401d-894e-64c2ab3fab7d', $c$使用する際の安全係数が５となるワイヤロープ$c$, false, 4),
  ('9014e487-acc1-401d-894e-64c2ab3fab7d', $c$エンドレスでないワイヤロープで、その両端にフック、シャックル、リング又はアイのいずれも備えていないもの$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'd040aaff-174b-4daf-a16c-61e8853dd2d7',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーンの自主検査及び点検に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問28',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('d040aaff-174b-4daf-a16c-61e8853dd2d7', $c$１年以内ごとに１回行う定期自主検査においては、つり上げ荷重に相当する荷重の荷をつって行う荷重試験を実施しなければならない。$c$, true, 1),
  ('d040aaff-174b-4daf-a16c-61e8853dd2d7', $c$１か月以内ごとに１回行う定期自主検査においては、ブレーキの異常の有無について検査を行わなければならない。$c$, false, 2),
  ('d040aaff-174b-4daf-a16c-61e8853dd2d7', $c$作業開始前の点検においては、コントローラーの機能について点検を行わなければならない。$c$, false, 3),
  ('d040aaff-174b-4daf-a16c-61e8853dd2d7', $c$定期自主検査の結果は、記録し、これを３年間保存しなければならない。$c$, false, 4),
  ('d040aaff-174b-4daf-a16c-61e8853dd2d7', $c$定期自主検査又は作業開始前の点検を行い、異常を認めたときは、直ちに補修しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e5546b76-ec45-4316-b503-429cbe0f1fd5',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$つり上げ荷重20ｔの移動式クレーン(以下、本問において「移動式クレーン」という。)の検査に関する記述として、法令上、誤っているものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問29',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e5546b76-ec45-4316-b503-429cbe0f1fd5', $c$製造検査における安定度試験は、定格荷重の1.27倍に相当する荷重の荷をつって、安定に関し最も不利な条件で地切りすることにより行うものとする。$c$, false, 1),
  ('e5546b76-ec45-4316-b503-429cbe0f1fd5', $c$使用検査における荷重試験は、定格荷重に相当する荷重の荷をつって、つり上げ、旋回、走行等の作動を行うものとする。$c$, true, 2),
  ('e5546b76-ec45-4316-b503-429cbe0f1fd5', $c$性能検査においては、移動式クレーンの各部分の構造及び機能について点検を行うほか、荷重試験を行うものとする。$c$, false, 3),
  ('e5546b76-ec45-4316-b503-429cbe0f1fd5', $c$変更検査においては、移動式クレーンの各部分の構造及び機能について点検を行うほか、荷重試験及び安定度試験を行うものとする。$c$, false, 4),
  ('e5546b76-ec45-4316-b503-429cbe0f1fd5', $c$使用再開検査を受ける者は、荷重試験及び安定度試験のための荷及び玉掛用具を準備しなければならない。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'f8292273-f803-45e1-916f-75fcfb4ac91c',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '関係法令'),
  $q$移動式クレーン運転士免許及び免許証に関するＡからＥまでの記述について、法令上、正しいもののみを全てあげた組合せは(１)～(５)のうちどれか。
Ａ 免許に係る業務に従事するときは、当該業務に係る免許証を携帯しなければならない。ただし、屋外作業等、作業の性質上、免許証を滅失するおそれのある業務に従事するときは、免許証に代えてその写しを携帯することで差し支えない。
Ｂ 故意により、免許に係る業務について重大な事故を発生させたときは、免許の取消し又は効力の一時停止の処分を受けることがある。
Ｃ 免許証を他人に譲渡又は貸与したときは、免許の取消し又は効力の一時停止の処分を受けることがある。
Ｄ 免許に係る業務に現に就いている者は、氏名を変更したときは、免許証の書替えを受けなければならない。ただし、変更後の氏名を確認することができる他の技能講習修了証等を携帯するときは、この限りでない。
Ｅ 労働安全衛生法違反により免許を取り消され、その取消しの日から起算して１年を経過しない者は、免許を受けることができない。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問30',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('f8292273-f803-45e1-916f-75fcfb4ac91c', $c$Ａ，Ｂ，Ｅ$c$, false, 1),
  ('f8292273-f803-45e1-916f-75fcfb4ac91c', $c$Ａ，Ｄ$c$, false, 2),
  ('f8292273-f803-45e1-916f-75fcfb4ac91c', $c$Ｂ，Ｃ，Ｄ$c$, false, 3),
  ('f8292273-f803-45e1-916f-75fcfb4ac91c', $c$Ｂ，Ｃ，Ｅ$c$, true, 4),
  ('f8292273-f803-45e1-916f-75fcfb4ac91c', $c$Ｃ，Ｄ，Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'df115f13-dd82-49d6-a967-d8bba28af1e5',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のようにＯ点に同一平面上の三つの力Ｐ１、Ｐ２、Ｐ３が作用しているとき、これらの合力に最も近いものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問31',
  '/exam-figures/mobile_crane/2025-10/q31.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('df115f13-dd82-49d6-a967-d8bba28af1e5', $c$Ａ$c$, false, 1),
  ('df115f13-dd82-49d6-a967-d8bba28af1e5', $c$Ｂ$c$, false, 2),
  ('df115f13-dd82-49d6-a967-d8bba28af1e5', $c$Ｃ$c$, false, 3),
  ('df115f13-dd82-49d6-a967-d8bba28af1e5', $c$Ｄ$c$, true, 4),
  ('df115f13-dd82-49d6-a967-d8bba28af1e5', $c$Ｅ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'eaad35eb-3919-460a-8323-2815988fe196',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のような天びん棒で荷Ｗをワイヤロープでつり下げ、つり合うとき、天びん棒を支えるための力Ｆの値は(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ２とし、天びん棒及びワイヤロープの質量は考えないものとする。
(天びん棒の支点からワイヤロープの位置までの距離は2ｍ、荷Ｗ(40kg)の位置までの距離は2.5ｍ)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問32',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('eaad35eb-3919-460a-8323-2815988fe196', $c$392Ｎ$c$, false, 1),
  ('eaad35eb-3919-460a-8323-2815988fe196', $c$490Ｎ$c$, false, 2),
  ('eaad35eb-3919-460a-8323-2815988fe196', $c$882Ｎ$c$, true, 3),
  ('eaad35eb-3919-460a-8323-2815988fe196', $c$980Ｎ$c$, false, 4),
  ('eaad35eb-3919-460a-8323-2815988fe196', $c$1960Ｎ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '2476f8eb-7d2c-4130-89be-215cf53a487e',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$下記に掲げる物体の体積を求める計算式として、適切なものは(１)～(５)のうちどれか。
ただし、πは円周率とする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問33',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('2476f8eb-7d2c-4130-89be-215cf53a487e', $c$球：直径３×π×(4/3)$c$, false, 1),
  ('2476f8eb-7d2c-4130-89be-215cf53a487e', $c$円錐体：半径２×π×高さ×(1/3)$c$, true, 2),
  ('2476f8eb-7d2c-4130-89be-215cf53a487e', $c$直方体：縦×横×高さ×(1/2)$c$, false, 3),
  ('2476f8eb-7d2c-4130-89be-215cf53a487e', $c$円柱：半径２×π×高さ×(1/2)$c$, false, 4),
  ('2476f8eb-7d2c-4130-89be-215cf53a487e', $c$三角柱：縦×横×高さ×(1/2)×(1/3)$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e0ecea79-0923-462e-b064-a7ef9baba93f',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$均質な材料でできた固体の物体(以下、本問において「物体」という。)の重心に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問34',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e0ecea79-0923-462e-b064-a7ef9baba93f', $c$直方体の物体の置き方を変える場合、重心の位置が低くなるほど安定性は悪くなる。$c$, false, 1),
  ('e0ecea79-0923-462e-b064-a7ef9baba93f', $c$重心が物体の外部にある物体は、置き方を変えると重心が物体の内部に移動する場合がある。$c$, false, 2),
  ('e0ecea79-0923-462e-b064-a7ef9baba93f', $c$複雑な形状の物体の重心は、二つ以上の点になる場合があるが、重心の数が多いほどその物体の安定性は良くなる。$c$, false, 3),
  ('e0ecea79-0923-462e-b064-a7ef9baba93f', $c$水平面上に置いた直方体の物体を傾けた場合、重心からの鉛直線がその物体の底面を通るときは、その物体は元の位置に戻らないで倒れる。$c$, false, 4),
  ('e0ecea79-0923-462e-b064-a7ef9baba93f', $c$円柱の物体の重心の位置は、円柱の上下の底面の円の中心を結んだ線分の中点の位置にある。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'e28de816-affa-493e-8917-9ae6fc2d6411',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$移動式クレーンのジブが作業半径11ｍで２分間に１回転する速度で旋回を続けているとき、このジブの先端の速度の値に最も近いものは(１)～(５)のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問35',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('e28de816-affa-493e-8917-9ae6fc2d6411', $c$0.6ｍ/ｓ$c$, true, 1),
  ('e28de816-affa-493e-8917-9ae6fc2d6411', $c$0.8ｍ/ｓ$c$, false, 2),
  ('e28de816-affa-493e-8917-9ae6fc2d6411', $c$0.9ｍ/ｓ$c$, false, 3),
  ('e28de816-affa-493e-8917-9ae6fc2d6411', $c$1.2ｍ/ｓ$c$, false, 4),
  ('e28de816-affa-493e-8917-9ae6fc2d6411', $c$1.7ｍ/ｓ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '0d4bbbb8-8ad7-4969-bf66-18d3c086e953',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$物体に働く摩擦力に関する記述として、適切でないものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問36',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('0d4bbbb8-8ad7-4969-bf66-18d3c086e953', $c$他の物体に接触し、その接触面に沿う方向の力が作用している物体が静止しているとき、接触面に働いている摩擦力を静止摩擦力という。$c$, false, 1),
  ('0d4bbbb8-8ad7-4969-bf66-18d3c086e953', $c$物体に働く最大静止摩擦力は、運動摩擦力より大きい。$c$, false, 2),
  ('0d4bbbb8-8ad7-4969-bf66-18d3c086e953', $c$運動摩擦力の大きさは、物体の接触面に作用する垂直力の大きさに比例するが、接触面積には関係しない。$c$, false, 3),
  ('0d4bbbb8-8ad7-4969-bf66-18d3c086e953', $c$最大静止摩擦力の大きさは、静止摩擦係数に比例する。$c$, false, 4),
  ('0d4bbbb8-8ad7-4969-bf66-18d3c086e953', $c$円柱状の物体を動かす場合に生じる転がり摩擦力は、滑り摩擦力に比べると大きい。$c$, true, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '11134623-ae83-427f-b61c-6c2827814d27',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$荷重に関する記述として、適切なものは次のうちどれか。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問37',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('11134623-ae83-427f-b61c-6c2827814d27', $c$移動式クレーンのフックには、主に圧縮荷重がかかる。$c$, false, 1),
  ('11134623-ae83-427f-b61c-6c2827814d27', $c$片振り荷重は、大きさは同じであるが、向きが時間とともに変わる荷重である。$c$, false, 2),
  ('11134623-ae83-427f-b61c-6c2827814d27', $c$移動式クレーンの巻上げドラムには、曲げ荷重とねじり荷重がかかる。$c$, true, 3),
  ('11134623-ae83-427f-b61c-6c2827814d27', $c$荷をつり上げる際に玉掛け用ワイヤロープが緩んでいる状態から全速で巻上げ動作を行うと、玉掛け用ワイヤロープには、圧縮荷重とせん断荷重がかかる。$c$, false, 4),
  ('11134623-ae83-427f-b61c-6c2827814d27', $c$荷重が繰返し作用すると、比較的小さな荷重であっても機械や構造物が破壊することがあるが、このような現象を引き起こす荷重を静荷重という。$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '498c316b-2743-4994-8c69-bfe6eec7a77b',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$下記に掲げるＡからＣまでの図のとおり、同一形状で質量が異なる三つの荷を、それぞれ同じ長さの２本の玉掛け用ワイヤロープ(以下、本問において「ワイヤロープ」という。)を用いて、それぞれ異なるつり角度でつり上げるとき、これらの荷を、１本のワイヤロープにかかる張力の値が小さい順に並べたものは(１)～(５)のうちどれか。
ただし、いずれも荷の左右のつり合いは取れており、左右のワイヤロープの張力は同じとし、ワイヤロープの質量は考えないものとする。
(Ａ：荷3t、つり角度60°／Ｂ：荷4t、つり角度90°／Ｃ：荷2t、つり角度120°)$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問38',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('498c316b-2743-4994-8c69-bfe6eec7a77b', $c$Ａ　Ｂ　Ｃ$c$, false, 1),
  ('498c316b-2743-4994-8c69-bfe6eec7a77b', $c$Ａ　Ｃ　Ｂ$c$, true, 2),
  ('498c316b-2743-4994-8c69-bfe6eec7a77b', $c$Ｂ　Ａ　Ｃ$c$, false, 3),
  ('498c316b-2743-4994-8c69-bfe6eec7a77b', $c$Ｂ　Ｃ　Ａ$c$, false, 4),
  ('498c316b-2743-4994-8c69-bfe6eec7a77b', $c$Ｃ　Ａ　Ｂ$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  '8824c49a-7c67-4981-95a4-1e28b8991f35',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$垂直につるした直径２cmの丸棒の先端に質量400㎏の荷をつり下げるとき、丸棒に生じる引張応力の値に最も近いものは(１)～(５)のうちどれか。
ただし、重力の加速度は9.8ｍ/ｓ２とし、丸棒の質量は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問39',
  NULL
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('8824c49a-7c67-4981-95a4-1e28b8991f35', $c$12Ｎ/mm２$c$, true, 1),
  ('8824c49a-7c67-4981-95a4-1e28b8991f35', $c$25Ｎ/mm２$c$, false, 2),
  ('8824c49a-7c67-4981-95a4-1e28b8991f35', $c$31Ｎ/mm２$c$, false, 3),
  ('8824c49a-7c67-4981-95a4-1e28b8991f35', $c$50Ｎ/mm２$c$, false, 4),
  ('8824c49a-7c67-4981-95a4-1e28b8991f35', $c$62Ｎ/mm２$c$, false, 5);

INSERT INTO questions (id, exam_id, exam_type_id, category_id, question_text, explanation, source_type, source_note, figure_url)
VALUES (
  'cad1271c-961e-4a4f-af7a-66758965e397',
  'mobile_crane',
  (SELECT id FROM exam_types WHERE exam_id = 'mobile_crane' AND code = 'common'),
  (SELECT c.id FROM categories c JOIN exam_types e ON e.id = c.exam_type_id WHERE e.exam_id = 'mobile_crane' AND e.code = 'common' AND c.name = '移動式クレーンの運転のために必要な力学に関する知識'),
  $q$図のような滑車を用いて、質量Ｗの荷をつり上げるとき、荷を支えるために必要な力Ｆを求める式がそれぞれの図の下部に記載してあるが、これらの力Ｆを求める式として、適切なものは(１)～(５)のうちどれか。
ただし、ｇは重力の加速度とし、滑車及びワイヤロープの質量並びに摩擦は考えないものとする。$q$,
  '(解説は今後追加予定)',
  'past_exam',
  '公益財団法人安全衛生技術試験協会 令和7年10月公表 移動式クレーン運転士試験 問40',
  '/exam-figures/mobile_crane/2025-10/q40.jpg'
);

INSERT INTO choices (question_id, choice_text, is_correct, sort_order)
VALUES
  ('cad1271c-961e-4a4f-af7a-66758965e397', $c$Ｆ＝Ｗｇ／５$c$, false, 1),
  ('cad1271c-961e-4a4f-af7a-66758965e397', $c$Ｆ＝Ｗｇ／３$c$, false, 2),
  ('cad1271c-961e-4a4f-af7a-66758965e397', $c$Ｆ＝Ｗｇ／２$c$, false, 3),
  ('cad1271c-961e-4a4f-af7a-66758965e397', $c$Ｆ＝Ｗｇ／４$c$, true, 4),
  ('cad1271c-961e-4a4f-af7a-66758965e397', $c$Ｆ＝Ｗｇ／２$c$, false, 5);

do $$
declare
  mc_2025_10 int;
begin
  select count(*) into mc_2025_10
  from questions
  where source_type = 'past_exam'
    and source_note like '%令和7年10月公表 移動式クレーン運転士試験%';

  if mc_2025_10 <> 40 then
    raise exception 'mobile_crane 2025-10 sitting must be 40 questions (got %)', mc_2025_10;
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
  '移動式クレーン運転士模擬試験(令和7年10月)',
  150,
  40,
  '令和7年10月公表 移動式クレーン運転士試験'
from exam_types
where exam_types.exam_id = 'mobile_crane'
  and exam_types.code = 'common'
  and not exists (
    select 1
    from mock_exams
    where exam_id = 'mobile_crane'
      and source_filter = '令和7年10月公表 移動式クレーン運転士試験'
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
  '移動式クレーン運転士模擬試験(令和7年10月)【力学免除】',
  120,
  30,
  '令和7年10月公表 移動式クレーン運転士試験',
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
      and name = '移動式クレーン運転士模擬試験(令和7年10月)【力学免除】'
  );
