% Chris Kreienkamp
% Section 10
% 2/23/17

% plots the two points and draws a line defined by the parameters from
% lineVals
% should call the function and use its outputs to then plot the line

clear
clc

%% SET INITIAL PARAMETERS

x1 = 2;
y1 = 3;
x2 = 6;
y2 = 4;


%% CALCULATIONS

% Find the slope and the y-intercept by calling function LINEVALS
[m,b] = lineVals(x1,y1,x2,y2);

xmin = 0;
xmax = abs(x1) + abs(x2);
ymin = 0;
ymax = m*xmax + b + 1;

% Create the x and y values
Nx = 100;
x = linspace(xmin,xmax,Nx);
y = m*x + b;


%% PLOT

% Plot the two original points and dotted line between them
plot (x1, y1,'ko',...
    x2, y2,'ko',...
    x,y,'b--')

% Labels, title, etc.
xlabel('x')
ylabel('y')
title('Line between Two Points')
grid on
axis ([xmin, xmax, ymin, ymax])