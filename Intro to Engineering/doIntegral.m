%% Homework 8, Problem 3
% integralIntegration.m
% Evaluate the following definite integrals using integral.
% integral from -1 to 1 of exp(-x^2)dx
% integral from 0 to infinity of x^2*exp(-x^2)dx
% integral from 0 to infinity of x^2*cos(x)*exp(-x^2)dx
% integral from 0 to infinity of 1/[sqrt(2pi)]*exp[(-x^2)/2]dx
% Author: Chris Kreienkamp
clear
clc

N = 2000;           % Number of grid points


%% FIRST INTEGRAL
x4min = -1;
x4max = 1;
f4 = @(x4) exp(-x4.^2);
I4 = integral(f4, x4min, x4max);
disp(['The integral from -1 to 1 of exp(-x^2)dx is ', num2str(I4),'.'])


%% SECOND INTEGRAL
x5min = 0;
x5max = inf;
f5 = @(x5) x5.^2.*exp(-x5.^2);
I5 = integral(f5, x5min, x5max);
disp(['The integral from 0 to infinity of x^2*exp(-x^2)dx is ', num2str(I5),'.'])


%% THIRD INTEGRAL
x6min = 0;
x6max = inf;
f6 = @(x6) x6.^2.*cos(x6).*exp(-x6.^2);
I6 = integral(f6, x6min, x6max);
disp(['The integral from 0 to infinity of x^2*cos(x)*exp(-x^2)dx is ', num2str(I6),'.'])


%% FOURTH INTEGRAL
x7min = 0;
x7max = inf;
f7 = @(x7) 1/(sqrt(2*pi)).*exp((-x7.^2)/2);
I7 = integral(f7, x7min, x7max);
disp(['The integral from 0 to infinity of 1/[sqrt(2pi)]*exp[(-x^2)/2]dx is ', num2str(I7),'.'])