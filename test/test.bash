#!/bin/bash
# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

DIR=~
[ "$1" != "" ] && DIR="$1"

cd $DIR/ros2_ws
colcon build
source $DIR/.bashrc

timeout 10 python3 study_timer.py > /tmp/study_timer.log

grep -E '現在時刻: .*?, 残り時間: [0-9]+分' /tmp/study_timer.log && echo "テスト成功" || echo "テスト失敗"
