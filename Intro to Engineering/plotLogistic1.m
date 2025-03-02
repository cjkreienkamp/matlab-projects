% Chris Kreienkamp
% Section 10
% 2/21/17

% Use the user-defined logistic function to calculate
% values and create a plot

clear
clc


%% SET INITIAL PARAMETERS

% Parameters for the variable "x"
xmin = 0;
xmax = 1;
Nx = 50;
x = linspace(xmin,xmax,Nx);

% Coefficients
x0 = 2;
width = 0.3;


%% CALCULATIONS

% Call the user-defined function LOGISTIC
% Calculate "y" values for all the "x" values

y = logistic(x, x0, width);

% The local input variables were y, y0, and a (in the user-defined func)
% The global input varaibles are x, x0, and width
% The names of the local and global variables DO NOT NEED TO MATCH!!!


%% PLOT

plot(x,y)
xlabel('x')
ylabel('y')
title('Logistic Function')
grid on