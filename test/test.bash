#!/bin/bash
# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
ource /opt/ros/humble/setup.bash

# timeout 10 ros2 launch mypkg study_timer.launch.py > /tmp/mypkg.log
# timeout 10 ros2 run mypkg study_timer > /tmp/mypkg.log
timeout 10 python3 study_timer.py > /dev/null 2>&1 &
timeout 10 ros2 topic echo /time_info > /tmp/study_timer.log &
# timeout 10 ros2 topic echo /time_info > /tmp/mypkg.log

sleep 10

if grep -q "現在時刻" /tmp/mypkg.log; then
  echo "成功"
else
  echo "エラー"
fi
