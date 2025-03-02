% hwS23.m 
% Chris Kreienkamp
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to S23

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

% define symbolic variables
syms va2s vbx2s vby2s vc2s

% Use the LIM equation in the x direction:
eq1 = 10-vbx2s-vc2s;
eq1m = vpa(eq1,4)

% Use the LIM equation in the y direction:
eq2 = va2s+vby2s;
eq2m = vpa(eq2,4)

% Use the WE equation:
eq3 = 100-va2s^2-vbx2s^2-vby2s^2-vc2s^2;
eq3m = vpa(eq3,4)

% Use the AIM equation:
eq4 = 20+8*va2s+7*vby2s-3*vc2s;
eq4m = vpa(eq4,4)

% Use MATLAB's solver to solve for the two unknowns, vos and thetas
s1 = solve(eq1,eq2,eq3,eq4,va2s,vbx2s,vby2s,vc2s);

% s1 is a structured variable containing the solution. It turns out
% that there are more than 1 solutions possible mathematically, but
% only 1 solution possible physically

% Set vo based on the solution
va2 = vpa(s1.va2s(1),4)
vbx2 = vpa(s1.vbx2s(1),4)
vby2 = vpa(s1.vby2s(1),4)
vc2 = vpa(s1.vc2s(1),4)