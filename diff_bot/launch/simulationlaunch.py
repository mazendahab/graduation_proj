import os

from ament_index_python.packages import get_package_share_directory 
from launch import LaunchDescription
from launch.substitutions import Command 
from launch_ros.actions import Node 

def generate_launch_description():
    gazebo_pkg="gazebo_ros"
    execu