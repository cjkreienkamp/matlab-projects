function y = plotlogisticF(handles)
%      Plot the following function: p(y)= 1 / (1+ e^ -(y-y0)/a)
%      y = plotlogisticF(y0,a)
%      Author: Chris Kreienkamp

%% Set Parameters

% Define domain and number of y-values
ymin = 0;
ymax = 25;
Ny = 100;

% Define parameters y0 and a
y0 = str2double(handles.ySliderText.String);
a = str2double(handles.aSliderText.String);


%% Tabulate Values

% Use linspace to define y-values
y = linspace(ymin,ymax,Ny);

% Define function p
functionP = 1 ./ (1 + exp((y0-y)/a));

%% Plot Values

% Basic plot command
plot(handles.plotAxes,y,functionP,'-r')

% Add labels, title, ...
xlabel(handles.plotAxes,'y')
ylabel(handles.plotAxes,'p(y)')
title(handles.plotAxes,'Plot of p(y)=1 / (1+e^-^(^y^-^y^0^)^/^a)')
grid on
