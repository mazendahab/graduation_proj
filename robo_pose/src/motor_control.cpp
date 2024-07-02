#include "rclcpp/rclcpp.hpp"
#include "geometry_msgs/msg/pose_with_covariance_stamped.hpp"
#include <wiringPi.h>

// Define GPIO pins
#define MOTOR_PIN_DIR 11    // GPIO pin for the DC motor direction
#define MOTOR_PIN_PWM 9    // GPIO pin for the DC motor speed
#define LIMIT_SWITCH_A_PIN 14 // GPIO pin for upper limit switch
#define LIMIT_SWITCH_B_PIN 15 //GPIO pin for lower limit switch
class MotorControlNode : public rclcpp::Node
{
public:
    MotorControlNode()
    : Node("motor_control_node")
    {
        // Initialize wiringPi and set pin modes
        wiringPiSetup();
        pinMode(MOTOR_PIN_DIR, OUTPUT);     
        pinMode(MOTOR_PIN_PWM, OUTPUT);
        pinMode(LIMIT_SWITCH_A_PIN, INPUT);
        pinMode(LIMIT_SWITCH_B_PIN, INPUT);
        subscription_ = this->create_subscription<geometry_msgs::msg::PoseWithCovarianceStamped>(
            "/amcl_pose", 10,
            std::bind(&MotorControlNode::pose_callback, this, std::placeholders::_1));
    }

private:
    void pose_callback(const geometry_msgs::msg::PoseWithCovarianceStamped::SharedPtr msg)
    {
        auto position = msg->pose.pose.position;
        double loading_x = 4.0 , lodaing_y = 3.0; // Specify your loading point position
        double unloading_xa = 10.0 , unloading_ya = 9.0; // Specify your unloading A position
        double unloading_xb = 12.0 , unloading_yb = 9.0; // Specify your unloading B position

        double threshold = 0.1; // Distance threshold

        if (std::abs(position.x - loading_x) < threshold && std::abs(position.y - loading_y) < threshold)
        {
            RCLCPP_INFO(this->get_logger(), "LOADING POINT REACHED , START LOADING");
            run_motor_forward();
        }
        
        else if (std::abs(position.x - unloading_xa) < threshold && std::abs(position.y - unloading_ya) < threshold)
        {
            RCLCPP_INFO(this->get_logger(), "UNLOADING POINT A REACHED , START UNLOADING");
            run_motor_backward();
        }
         
        else if (std::abs(position.x - unloading_xb) < threshold && std::abs(position.y - unloading_yb) < threshold)
        {
            RCLCPP_INFO(this->get_logger(), "UNLOADING POINT B REACHED , START UNLOADING");
            run_motor_backward();
        }
        
    }

    void run_motor_forward()
    {
        digitalWrite(MOTOR_PIN_DIR, HIGH); // Start the motor
        pwmWrite(MOTOR_PIN_PWM, 512); // 50% duty cycle

        while (digitalRead(LIMIT_SWITCH_PIN) == LOW) // Wait for the limit switch to be triggered
        {
            rclcpp::spin_some(this->get_node_base_interface());
        }

        digitalWrite(MOTOR_PIN_PWM, LOW); // Stop the motor
        RCLCPP_INFO(this->get_logger(), "Limit switch triggered! Stopping the motor...");
    }
     
     
    void run_motor_backward()
    {
        digitalWrite(MOTOR_PIN_DIR, LOW); // Start the motor_reverse
        pwmWrite(MOTOR_PIN_PWM, 512); // 50% duty cycle

        while (digitalRead(LIMIT_SWITCH_B_PIN) == LOW) // Wait for the limit switch to be triggered
        {
            rclcpp::spin_some(this->get_node_base_interface());
        }

        digitalWrite(MOTOR_PIN_PWM, 0); // Stop the motor
        RCLCPP_INFO(this->get_logger(), "Limit switch triggered! Stopping the motor...");
    }

    rclcpp::Subscription<geometry_msgs::msg::PoseWithCovarianceStamped>::SharedPtr subscription_;
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<MotorControlNode>());
    rclcpp::shutdown();
    return 0;
}
