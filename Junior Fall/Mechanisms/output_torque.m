function [T_gearmotor] = output_torque(ratio, stall_torque, output_speed, max_speed)
% [T_gearmotor] = torque(ratio, stall_torque, output_speed, max_speed)
% Gives the output torque of the gearbox as a function of the output
% speed of the motor.

T_gearmotor = stall_torque*ratio*(1-output_speed/max_speed);

