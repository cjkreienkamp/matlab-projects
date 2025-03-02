% Chris Kreienkamp
% Section 10
% 1/24/17

% Plot the parabolic equation

clear
clc


%% Set Parameters

%Define the coefficients for the equation
a = 1;
b = 5;
c = 6;

% Define range and number of x-values
xmin = -3;
xmax = 3;
Nx = 20;


%% Tabulate Values

% Use linspace to define x-values
x = linspace(xmin,xmax,Nx);

% Define our y-values
% Remember element by element operation
% Need "dot" before "^"
y = a*x.^2 + b*x + c;


%% Plot Values

% Basic plot command
plot(x,y)

% Add labels, title, ...
% Do this AFTER the plot command
xlabel ('x')
ylabel ('y')
grid on
title('f(x) = ax^2 + bx + c')