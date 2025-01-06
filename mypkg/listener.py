# SPDX-FileCopyrightText: 2025 Hidetaka Umehara
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class ListenerNode(Node):
    def __init__(self):
        super().__init__('listener')
        self.subscription = self.create_subscription(
            String,
            'time_info', 
            self.cb,  
            10
        )
        self.get_logger().info('Listener node has been started.')

    def cb(self, msg):
    
        self.get_logger().info(f"Received message: {msg.data}")

def main():
    rclpy.init()
    node = ListenerNode()
    rclpy.spin(node)

if __name__ == '__main__':
    main()
