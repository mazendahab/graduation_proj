cmake_minimum_required(VERSION 3.5)
project(my_project)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

# Manually specify the path to WiringPi
set(WIRINGPI_DIR "/usr/local/lib")
find_library(WIRINGPI_LIB wiringPi HINTS ${WIRINGPI_DIR})

if(NOT WIRINGPI_LIB)
    message(FATAL_ERROR "Could not find wiringPi library")
endif()

include_directories(/usr/local/include)

add_executable(motor_control_node src/motor_control.cpp)
target_link_libraries(motor_control_node ${WIRINGPI_LIB})

ament_target_dependencies(motor_control_node rclcpp sensor_msgs geometry_msgs)

install(TARGETS motor_control_node
  DESTINATION lib/${PROJECT_NAME})

ament_package()
