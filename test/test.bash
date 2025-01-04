#!/bin/bash

DIR=~
[ "$1" != "" ] && DIR="$1" 

cd $DIR/ros2_ws
colcon build
source $DIR/.bashrc

timeout 10 python3 ros2_time_publisher.py > /tmp/ros2_time_publisher.log

# ログに特定の文字列が含まれているか確認
cat /tmp/ros2_time_publisher.log |
grep -E '現在時刻: .*?, 残り時間: [0-9]+分'
