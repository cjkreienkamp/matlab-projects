% hwS78.m 
% Chris Kreienkamp
% Engineering Mechanics: Dynamics
% by Merriam, Kraige, Bolton
% 8th edition
% Solution to S78

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


%% Givens
AB = 2.6;
BC = 4.0;
CD = 1.9;
AD = 3.4;
omega_cd = 1;


%% Equations
r_ba = AB*cosd(theta2)*ihat + AD*sind(theta2)*jhat;
r_cd = CD*cosd(theta1)*ihat + CD*sind(theta1)*jhat;
r_cb = (AD+CD*cosd(theta1)-AB*cosd(theta2))*ihat + (CD*sind(theta1)-AB*sind(theta2))*jhat;
v_c = -1.9*sind(theta1)*ihat + 1.9*cosd(theta1)*jhat;   % from S77 homework
a_c = (-omega_cd^2*r_cd(1))*ihat + (-omega_cd^2*r_cd(2))*jhat;


%% Solve for omega

% define symbolic variables
syms omega_abs omega_bcs

% Use the position equation in the x direction:
eq1 = -2.6*omega_abs*sind(theta2)-v_c(1) ...
    -(1.9*sind(theta1)-2.6*sind(theta2))*omega_bcs;
eq1m = vpa(eq1,4);

% Use the position equation in the y direction:
eq2 = 2.6*omega_abs*cosd(theta2)-v_c(2) ...
    +(3.4+1.9*cosd(theta1)-2.6*cosd(theta2))*omega_bcs;
eq2m = vpa(eq2,4);

% Use MATLAB's solver to solve for the two unknowns
s1 = solve(eq1,eq2,omega_abs,omega_bcs);

omega_ab = vpa(s1.omega_abs(1),4);

omega_bc = vpa(s1.omega_bcs(1),4);



%% Solve for alpha

% define symbolic variables
syms alpha_abs alpha_bcs

% Use the position equation in the x direction:
eq1 = a_c(1)+alpha_abs*AB*sind(theta2)+AB*cosd(theta2)*omega_ab^2 + ...
    alpha_bcs*r_cb(2)+omega_bc^2*r_cb(1);
eq1m = vpa(eq1,4);

% Use the position equation in the y direction:
eq2 = a_c(2)-alpha_abs*AB*cosd(theta2)+AB*sind(theta2)*omega_ab^2 + ...
    -alpha_bcs*r_cb(1)+omega_bc^2*r_cb(2);
eq2m = vpa(eq2,4);

% Use MATLAB's solver to solve for the two unknowns
s1 = solve(eq1,eq2,alpha_abs,alpha_bcs);

alpha_ab = vpa(s1.alpha_abs(1),4)

alpha_bc = vpa(s1.alpha_bcs(1),4)


%% Acceleration of a
a_bx = -alpha_ab*AB*sind(theta2)-AB*cosd(theta2)*omega_ab^2;
a_by = alpha_ab*AB*cosd(theta2)-AB*sind(theta2)*omega_ab^2;
a_bx = vpa(a_bx,4)
a_by = vpa(a_by,4)





