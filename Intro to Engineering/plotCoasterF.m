function plotCoasterF(handles)
% plotCoaster2.m
% Uses the coasterFunc function to find the position and
% velocity on a roller coaster.  Plots the position, velocity,
% or both (depending on plotChoice).
% Author: Victoria Goodrich
% Edited: 2/28/2017

%% Set Parameters
d = handles.dSlider.Value;   % d (damping factor) should be between 0.05 and 0.3
tmin = 0;   % start time (seconds)
tmax = 60;  % end time (seconds)
Nt = 200;   % Number of points

doGrid = handles.gridCheckbox.Value;   % True = Grid on for plot or False = Grid off
plotChoice = handles.plotPopUp.Value;  % Determines what is shown in the figure
                  %Plots: 1-position, 2-velocity, or 3-both

%% Calculate Values
% Calculate the time points and then use coasterFunc to find the
% position and velocity at each time.

t = linspace(tmin, tmax, Nt);
[y, v] = coasterFunc(t, d);  % position (y) and velocity (v) found using
                             % user-defined function, coasterFunc

%% Plot Position and/or Velocity
% Use a switch statement with the previously defined plotChoice to
% plot either position, velocity, or both in the figure window.

switch plotChoice
    case 1  % plot the function (position) only
        plot(handles.plotAxes, t, y)
        ylabel(handles.plotAxes,'Height (ft)')
    case 2  % plot the derivative (velocity) only
        plot(handles.plotAxes, t,v)
        ylabel(handles.plotAxes,'Velocity (mph)')
    case 3  % plot both (position and velocity)
        plot(handles.plotAxes, t, y, t, v, '--');
        ylabel(handles.plotAxes,'Height or Velocity')
        legend(handles.plotAxes,'Height (ft)', 'Velocity (mph)')
end
xlabel(handles.plotAxes,'Time (sec)')  % same x label for all 3 plots
                      % axis is left to autoscale

if doGrid      % only adds a grid to the plot if doGrid = true
    grid (handles.plotAxes, 'on')
else
    grid (handles.plotAxes, 'off')
end
