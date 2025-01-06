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

# grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/mypkg.log && echo "テスト成功" || echo "テスト失敗"

if grep -q "現在時刻" /tmp/mypkg.log; then
  echo "Talkerノードが有用なデータを発信しています。成功です。"
else
  echo "Talkerノードが有用なデータを発信していません。エラーです。"
fi
