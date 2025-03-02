% Chris Kreienkamp
% Section 10
% 4/11/17

clear
clc

% Write a program to take the derivative of a function

%% SET INTIAL PARAMETERS

% Coefficients in logistics function
y0 = 0;
a = 0.25;

% Determine y-values
ymin = -2;
ymax = 2;
Ny = 100;
y = linspace(ymin,ymax,Ny);


%% TABULATE FUNCTION

% Remember to use "./" for element-by-element operations
p = 1./ (1 + exp(-(y-y0)/a));     % Logistic function


%% FIND THE DERIVATIVE USING "GRADIENT" FUNCTION

dy = y(2) - y(1);               % Step of derivative
dpdy =  gradient(p,dy);         % Derivative using GRADIENT function


%% PLOT OUTPUT

plot(y,p,'b-',...
    y,dpdy,'k--')
xlabel('Y-Values')
ylabel('Logistic Function')
grid on


