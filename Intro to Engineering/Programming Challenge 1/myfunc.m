function [x,y] = myfunc(t)
% Chris Kreienkamp
% Section 10
% Test Version B
% x(t) = 20t
% y(t) = 20t - 1/2gt^2
% g is a constant with the value of 9.81
% t can be a scalar or a vector input

g = 9.81;
x = 20*t;
y = 20*t - 1/2*g*t.^2;