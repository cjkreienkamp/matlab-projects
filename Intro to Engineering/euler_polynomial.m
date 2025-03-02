%% Homework 7, Problem 1
% euler_polynomial.m
% Rate equation: dy/dx = 3x^2-20x+10 and y(0) = 0
% Using (unimproved) Euler?s method, express y(x + ?x) in terms of y(x)
% Use Euler's method to calculate y(x) over the range 0<=x<=10 with step
% size 0.1 and plot results
% Author: Chris Kreienkamp
clear
clc

%% SET INITIAL PARAMETERS

xmin = 0;       % Range of x-values
xmax = 10;

Nx = 100;       % Number of x-values


%% INITIALIZE VECTORS

x = linspace(xmin,xmax,Nx);     % Vector of x-values

dx = x(2) - x(1);               % Increment of the approximation (dx)

y = zeros(1,Nx);                % Vector of y-values

y(1) = 0;                       % Initial condition


%% CALCULATIONS - EULER METHOD

% Use FOR loop for domain marching of approximate solution
% Use "current" value (ix) to determine "future" value (ix+1)

for ix = 1:Nx-1
    a = 3*x(ix)^2-20*x(ix)+10;
    y(ix+1) = y(ix) + a*dx;
end

%% GENERATE PLOT

% Plot approximate solution
plot(x,y,'b-')

% Enhance plots with labels
xlabel('X')
ylabel('Y')
title('Plot of dy/dx = 3x^2-20x+10')
grid on
axis([xmin xmax 1.5*min(y) 1.5*max(y)])