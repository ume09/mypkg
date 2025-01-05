# robosys2024_ROS2

- ロボットシステム学 ROS2練習用リポジトリ
- このリポジトリはROS2のパッケージです。
- このパッケージにはstudy_timerというノードが含まれます。

## study_timer

ポモドーロ勉強法という考えから現在時刻と開始から25分後の時刻までの残り時間を求め、出力する。

## 実行方法

２つの端末(ターミナル)を立ち上げる

以下の２つのコマンドを別々の端末で実行する

```
ros2 run mypkg study_timer
```

```
ros2 topic echo /time_info
```

## 起動例

端末1

```
$ ros2 run mypkg study_timer
```

(何も表示されない)


端末2

```
ros2 topic echo /time_info
```

```
---
data: '現在時刻: 23:02:35, 残り時間: 5分'
---
data: '現在時刻: 23:02:36, 残り時間: 5分'
---
data: '現在時刻: 23:02:36, 残り時間: 5分'
```

## 必要なソフトウェア
* Ubuntu 20.04.5 LTS　以上
* Python 3.8.10 以上
* ROS2 Humble

## テスト環境
- Ubuntu 22.04.5 LTS
- Python 3.10.12
- ROS2 Humble

## ライセンス
- このソフトウェアパッケージは、３条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージの一部のコードは、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
  - https://github.com/ryuichiueda/slides_marp/tree/master/robosys2024
  - https://github.com/ryuichiueda/emcl2

 © 2025 Hidetaka Umehara

## 参考資料

- 「いちばんやさしいPython入門教室」著:大澤文孝 2019/8/10初版第６刷発行
- [.bash_profileと.bashrcのまとめ](https://qiita.com/tockey/items/021b804b9957fe65e093)
- [【ROS×Python】ROSタイマー(Timer)を実装しよう！](https://takilog.com/ros-python-timer-implement/)
- [Pythonで現在時刻・日付・日時を取得](https://note.nkmk.me/python-datetime-now-today/)

## ポモドーロ勉強法が気になる人はこちら

-  [作業効率が上がるポモドーロ・テクニックとは？その効果や実践方法を紹介！](https://mynavi-job20s.jp/howto/pomodoro_technique)
