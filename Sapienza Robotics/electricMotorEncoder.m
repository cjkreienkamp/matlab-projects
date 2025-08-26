% absolute encoder with 11 bits e.g. [000|01101001]
%   the first 3 bits count turns
%   the following 8 bits measure a single turn
% flexspline with 120 external teeth

% input
bits_counting_turns = [0 1 1 0 1 0 0 1];
n_bits_counting_turns = 3;
n_bits_for_single_turn = 8;
external_teeth_in_flexspline = 120;

% output [rad]
ang_res_motor_side = 2*pi/2^n_bits_for_single_turn
reduction_ratio_of_harmonic_drive = external_teeth_in_flexspline / 2
ang_res_link_side = ang_res_motor_side / reduction_ratio_of_harmonic_drive
max_ang_displacement = 2*pi*2^n_bits_counting_turns - ang_res_motor_side
x_dec = grayToDec(bits_counting_turns)
measured_motor_angle = ang_res_motor_side * x_dec