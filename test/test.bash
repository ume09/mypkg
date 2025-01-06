#!/bin/bash
# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

DIR=~
[ "$1" != "" ] && DIR="$1"

cd $dir/ros2_ws
colcon build
source install/setup.bash
source install/local_setup.bash
source $dir/.bashrc

timeout 10 ros2 pyson3 mypkg study_timer.py > /tmp/study_timer.log

cat /tmp/study_timer.log |
grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/study_timer.log && echo "テスト成功" || echo "テスト失敗"
