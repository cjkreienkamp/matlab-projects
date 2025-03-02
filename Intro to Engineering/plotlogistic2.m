%% Homework 2, Problem 2 (Chapter 3, Problem 8)
%      plotlogistic.m
%      Plot the following function: p(y)= 1 / (1+ e^ -(y-y0)/a)
%      Vary the parameters y0 and a
%      Author: Chris Kreienkamp
clear
clc

%% Set Parameters

% Define domain and number of y-values
ymin = 0;
ymax = 25;
Ny = 100;

% Define parameters y0 and a
y0 = 17;
a = 3;


%% Tabulate Values

% Use linspace to define y-values
y = linspace(ymin,ymax,Ny);

% Define function p
functionP = 1 ./ (1 + exp((y0-y)/a));

%% Plot Values

% Basic plot command
plot(y,functionP,'-r')

% Add labels, title, ...
xlabel('y')
ylabel('p(y)')
title('Plot of p(y)=1 / (1+e^-^(^y^-^y^0^)^/^a)')
legend(['y0=',num2str(y0),', a=',num2str(a)],'location','northwest')
grid on
