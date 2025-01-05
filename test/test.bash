#!/bin/bash

# デフォルトディレクトリはホームディレクトリ
DIR=~
[ "$1" != "" ] && DIR="$1"  # 引数があったら、それをディレクトリとして使用

# ROS 2ワークスペースに移動してビルド
cd $DIR/ros2_ws
colcon build
source $DIR/.bashrc

# プログラムを実行して出力をログに保存
#timeout 10 python3 ros2_time_publisher.py > /tmp/ros2_time_publisher.log
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

# ログに特定の文字列が含まれているか確認
cat /tmp/ros2_time_publisher.log |
grep -E '現在時刻: .*?, 残り時間: [0-9]+分'
grep -E '現在時刻: .*?, 残り時間: [0-9]+分'
