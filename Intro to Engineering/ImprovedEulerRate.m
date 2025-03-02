%% Homework 7, Problem 2
% ImprovedEulerRate.m
% Newton's Law of Cooling equation: dy/dt = k(y-T)
% y is the temperature of the liquid
% t is time
% T is a constant representing ambient temperature
% Approximate the temperature as a function of time
% Author: Chris Kreienkamp
clear
clc

%% SET INITIAL PARAMETERS

tmin = 0;       % Range of t-values
tmax = 180;

Nt = 1000;       % Number of t-values

k = -0.028;     % min^-1
T = 60;         % degrees F


%% INITIALIZE VECTORS

t = linspace(tmin,tmax,Nt);     % Vector of x-values

dt = t(2) - t(1);               % Increment of the approximation (dx)

y = zeros(1,Nt);                % Vector of y-values

y(1) = 100;                       % Initial condition in degrees F


%% CALCULATIONS - EULER METHOD

% Use FOR loop for domain marching of approximate solution
% Use "current" value (it) to determine "future" value (it+1)

for it = 1:Nt-1
    y(it+1) = y(it)*[(1+k*dt/2)/(1-k*dt/2)];
end

%% GENERATE PLOT

% Plot approximate solution
plot(t,y,'b-')

% Enhance plots with labels
xlabel('Time (minutes)')
ylabel('Temperature (degrees Fahrenheit)')
title('Plot of dy/dt = k(y-T)')
grid on
axis([tmin tmax 0*min(y) 1.05*max(y)])