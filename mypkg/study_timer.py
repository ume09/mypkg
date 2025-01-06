# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifire: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from datetime import datetime, timedelta

rclpy.init()
node = Node("study_timer")

pub = node.create_publisher(String, "time_info", 10)

target_time = datetime.now() + timedelta(minutes=25)

def cb():
    now = datetime.now()

    remaining_time = target_time - now
    remaining_minutes = max(0, remaining_time.total_seconds() // 60)

    msg = String()
    msg.data = f"現在時刻: {now.strftime('%H:%M:%S')}, 残り時間: {int(remaining_minutes)}分"

    pub.publish(msg)

def main():
    node.create_timer(0.5, cb)
    rclpy.spin(node)

if __name__ == "__main__":
    main()
