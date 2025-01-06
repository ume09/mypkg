#!/bin/bash
# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

timeout 10 ros2 launch mypkg study_timer.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep -E '現在時刻: [0-9-]+ [0-9:]+, 残り時間: [0-9]+分'
