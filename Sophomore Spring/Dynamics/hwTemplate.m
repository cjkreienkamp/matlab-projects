% p2067m 
% Mike Seelinger
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to 2/67

%%
clc
clear

%% Standard Definititions
% Acceleration due to gravity
ga = 32.2; % ft/s^2
gm = 9.81; % m/s^2

% Conversions
R2D = 180/pi;
D2R = pi/180;

% Unit vectors
ihat = [1;0;0];
jhat = [0;1;0];
khat = [0;0;1];

%% givens 
dBC = 20; % feet
dAB = 40; % feet
vB = 12; % feet/s
Ay = 5; % feet
Cy = 7; % feet

% define symbolic variables vo and theta
syms vos thetas real

% Find the time it takes for the guard to reach point B:
t = dBC/vB

% Use the position equation in the x direction:
eq1 = vos*cos(thetas)*t - (dAB+dBC);
eq1m = vpa(eq1,4)

% Use the position equation in the y direction:
eq2 = Ay + vos*sin(thetas)*t - 0.5*ga*t^2 - Cy;
eq2m = vpa(eq2,4)

% Use MATLAB's solver to solve for the two unknowns, vos and thetas
s1 = solve(eq1,eq2,vos,thetas);

% s1 is a structured variable containing the solution. It turns out
% that there are more than 1 solutions possible mathematically, but
% only 1 solution possible physically

% Set vo based on the solution
vo = vpa(s1.vos(1),4)

% Set theta in Degrees (not the s1 has it in radians)
theta = vpa(s1.thetas(1)*R2D,4)