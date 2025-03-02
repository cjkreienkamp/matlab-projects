% hw02074
% Chris Kreienkamp
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to 2/74

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
t0 = 0;         % s
v0 = 14;        % m/s
rx = 11;        % m
ry0p = 1.65;    % m
ry0a = 9;       % m
ta = .215;      % s

% define symbolic variables time, ry, and theta
syms times rys thetas real

% Use the position equation in the x direction:
eq1 = v0*cos(thetas)*times - rx;

% Use the position equation in the y direction for the projectile:
eq2 = ry0p + v0*sin(thetas)*times - gm/2*times^2 - rys;

% Use the position equation in the y direction for the apple:
eq3 = ry0a - gm/2*(times + ta)^2 - rys;

% Use MATLAB's solver to solve for the three unknowns
s1 = solve(eq1,eq2,eq3,times,rys,thetas);

% s1 is a structured variable containing the solution. It turns out
% that there are more than 1 solutions possible mathematically, but
% only 1 solution possible physically

% Set time based on the solution
time = vpa(s1.times(1),4)

% Set theta in Degrees (not the s1 has it in radians)
theta = vpa(s1.thetas(1),4)

% Set ry based on the solution
ry = vpa(s1.rys(1),4)

% Find the final answer
ds = ry0a - (tan(theta)*rx + ry0p);
d = vpa(ds,3)