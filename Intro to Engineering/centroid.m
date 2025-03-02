% Chris Kreienkamp
% Section 10
% 4/11/17

clear
clc

% Write a program to calculate the centroid of a triangle


%% SET INTIAL PARAMETERS

% Triangle features
base = 3;
height = 2;
Area = 0.5*base*height;

% Find coordinates of triangle
x = linspace(0,base,100);           % X-coordinates for triangle
y = -2/3*x + height;                % Y-coordinates for triangle


%% FIND CENTROID FOR X-POSITION

% Limits for integration
a = 0;
b = base;

% Find integral to determine centroid
xBarFunc = @(x) x.*(-2*x/3+2)/Area;     % Create function to find x-bar
xBar = integral(xBarFunc,a,b);          % Use of INTEGRAL command


%% FIND CENTROID FOR Y-POSITION

% Find integral to determine centroid
yBarFunc = @(x) (-2*x/3+2).^2/(2*Area); % Creates function to find y-bar
yBar = integral(yBarFunc,a,b);          % Use of INTEGRAL command


%% PLOT OUTPUT

plot(x,y,'b-',...
    xBar,yBar,'ro')
xlabel('X-Distance (in)')
ylabel('Y-Distance (in)')
title('Centroid of Triangle')
legend('Triangle','Location of Centroid')
grid on


