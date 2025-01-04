import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from datetime import datetime, timedelta

# ノードの初期化
rclpy.init()
node = Node("time_talker")

# パブリッシャーの作成
pub = node.create_publisher(String, "time_info", 10)

# 25分後のターゲット時刻を計算
target_time = datetime.now() + timedelta(minutes=25)

def cb():
    # 現在時刻を取得
    now = datetime.now()

    # 残り時間を計算
    remaining_time = target_time - now
    remaining_minutes = max(0, remaining_time.total_seconds() // 60)  # 0未満にならないようにする

    # メッセージを作成
    msg = String()
    msg.data = f"現在時刻: {now.strftime('%H:%M:%S')}, 残り時間: {int(remaining_minutes)}分"

    # メッセージをパブリッシュ
    pub.publish(msg)

# メイン関数
def main():
    # タイマーを作成して0.5秒ごとにcb関数を呼び出す
    node.create_timer(0.5, cb)
    rclpy.spin(node)

if __name__ == "__main__":
    main()
