#!/bin/bash

DIR=~
[ "$1" != "" ] && DIR="$1"

cd $DIR/ros2_ws
colcon build
source $DIR/.bashrc

timeout 10 python3　ros2 study_timer.py > /tmp/study_timer.log

grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/study_timer.log && echo "テスト成功" || echo "テスト失敗"
