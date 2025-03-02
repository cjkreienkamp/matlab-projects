% hw05134.m 
% Chris Kreienkamp
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to 5/134

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

% define symbolic variables vo and theta
syms vcs omegas

% Use the position equation in the x direction:
eq1 = vcs*cosd(15) - omegas/4*sind(30);
eq1m = vpa(eq1,4);

% Use the position equation in the y direction:
eq2 = vcs*sind(15) +2 - omegas/4*cosd(3);
eq2m = vpa(eq2,4);

% Use MATLAB's solver to solve for the two unknowns, vos and thetas
s1 = solve(eq1,eq2,vcs,omegas);

% s1 is a structured variable containing the solution. It turns out
% that there are more than 1 solutions possible mathematically, but
% only 1 solution possible physically

% Set vo based on the solution
vc = vpa(s1.vcs(1),4)

% Set theta in Degrees (not the s1 has it in radians)
omega = vpa(s1.omegas(1),4)