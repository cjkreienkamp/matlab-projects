% hwS77.m 
% Chris Kreienkamp
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to S77

%%
clc
clear

%% Standard Definitions
% Unit vectors
ihat = [1;0;0];
jhat = [0;1;0];
khat = [0;0;1];

%% Input Angles
theta1 = 90;
theta2 = 102.17;


%% Equations
v_c = -1.9*sind(theta1)*ihat + 1.9*cosd(theta1)*jhat;       % 1

r_cb = (3.4+1.9*cosd(theta1)-2.6*cosd(theta2))*ihat ...
    - (2.6*sind(theta2)-1.9*sind(theta1))*jhat;             % 2

%% Solve

% define symbolic variables
syms omega_abs omega_bcs

% Use the position equation in the x direction:
eq1 = -2.6*omega_abs*sind(theta2)-v_c(1) ...
    -(1.9*sind(theta1)-2.6*sind(theta2))*omega_bcs;         % 3
eq1m = vpa(eq1,4);

% Use the position equation in the y direction:
eq2 = 2.6*omega_abs*cosd(theta2)-v_c(2) ...
    +(3.4+1.9*cosd(theta1)-2.6*cosd(theta2))*omega_bcs;     % 4
eq2m = vpa(eq2,4);

% Use MATLAB's solver to solve for the two unknowns
s1 = solve(eq1,eq2,omega_abs,omega_bcs);

omega_ab = vpa(s1.omega_abs(1),4)

omega_bc = vpa(s1.omega_bcs(1),4)

%% Calculate v_b
v_b = -2.6*omega_ab*sind(theta2)*ihat+2.6*omega_ab*cosd(theta2)*jhat; % 5
v_b = vpa(v_b,4)
