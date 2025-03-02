%% Homework 8, Problem 2
% doTrapz.m
% Evaluate the following definite integrals by making a finite tabulation
% of x and f and integrate using the function trapz. Use 2000 grid points.
% integral of 0 to 1 of exp(-x^2)dx
% integral of 0 to 2 of cos(4x)*exp(-x^2)dx
% integral of 0 to 2 of [cos(4x)sin(5x)]/[3x^3 + 1]*dx
% Author: Chris Kreienkamp
clear
clc


%% INITIAL PARAMETERS
N = 2000;                   % Number of grid points


%% FIRST INTEGRAL
x1min = 0;
x1max = 1;
x1 = linspace(x1min,x1max,N);
f1 = exp(-x1.^2);
I1 = trapz(x1,f1);
disp(['The integral from 0 to 1 of exp(-x^2)dx is ', num2str(I1),'.'])


%% SECOND INTEGRAL
x2min = 0;
x2max = 2;
x2 = linspace(x2min,x2max,N);
f2 = cos(4.*x2).*exp(-x2.^2);
I2 = trapz(x2,f2);
disp(['The integral from 0 to 2 of cos(4x)*exp(-x^2)dx is ', num2str(I2),'.'])


%% THIRD INTEGRAL
x3min = 0;
x3max = 2;
x3 = linspace(x3min,x3max,N);
f3 = [cos(4.*x3).*sin(5.*x3)]./[3.*x3.^3 + 1];
I3 = trapz(x3,f3);
disp(['The integral from 0 to 2 of [cos(4x)sin(5x)]/[3x^3 + 1]*dx is ', num2str(I3),'.'])