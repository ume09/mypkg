#!/bin/bash
# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
ource /opt/ros/humble/setup.bash

timeout 10 ros2 launch mypkg study_timer.launch.py > /tmp/mypkg.log

sleep 10

cat /tmp/mypkg.log |
grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/mypkg.log && echo "テスト成功" || echo "テスト失敗"
