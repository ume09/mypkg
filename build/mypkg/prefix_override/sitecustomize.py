import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/umetaka/ros2_ws2/src/mypkg/install/mypkg'
