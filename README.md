# robosys2024_ROS2

ロボットシステム学 ROS2練習用リポジトリ
このリポジトリはROS2のパッケージです。
このパッケージにはstudy_timerというノードが含まれます。

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
