from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='my_robot_package',
            executable='motor_control_node',
            name='motor_control_node',
            output='screen'
        )
    ])
