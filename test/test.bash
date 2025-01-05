#!/bin/bash


DIR=~
[ "$1" != "" ] && DIR="$1" 

cd $DIR/ros2_ws || { echo "ディレクトリ $DIR/ros2_ws が存在しません"; exit 1; }
colcon build || { echo "ビルドに失敗しました"; exit 1; }
source install/setup.bash

timeout 10 python3 src/ros2_time_publisher.py > /tmp/ros2_time_publisher.log || { echo "プログラムの実行に失敗しました"; exit 1; }


if grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/ros2_time_publisher.log; then
    echo "テスト成功"
else
    echo "テスト失敗"
    exit 1
fi
