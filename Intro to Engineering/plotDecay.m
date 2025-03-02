% Chris Kreienkamp
% Section 10
% 2/7/17

% Program that plot a circle in decaying motion
% Animate the plot with a trailing line

clear     % Clear Workspace
clc       % Clear Command Window
clf       % Clear Figure

%% Set Parameters

% Parameter of circle
R = 1;         % Initial Radius of Motion (m)
T = 1;         % Period of Circular Motion (sec)
omega = 2*pi/T;      % Angular velocity (rad/sec)
tau = 5;       % decay time (sec)

% Elapsed Time
tmin =0;     % Start time (sec)
tmax =8;     % Final time (sec)
Nt = 300;    % Number of data points
t = linspace(tmin, tmax, Nt);


%% Calculate Coordinates for Circle

% Use FOR loop to calculate the coordinates (x,y)
% This is DOMAIN MARCHING as a function of time (t)
% "it" is the COUNTER VARIABLE

for it = 1:Nt
    r(it) = R * exp(-t(it)/tau);     % Decaying radius equation
    x(it) = r(it) * cos(omega*t(it));   % x-coordinate of equation
    y(it) = r(it) * sin(omega*t(it));   % y-coordinate of equation
end


%% Animate Plot

% Use FOR loop to plot with animation

for it = 1:Nt
    % Plot both the new point LINE 47 and the trailing line LINE 46
    plot (x(1:it),y(1:it),'b-',...
        x(it),y(it),'ro')
    
    % Improve formatting of the plot
    axis square     % Makes figure window square
    grid on         % Add grid
    axis(1.2*[-R R -R R])   % Define our axis (slightly bigger than radius)
    
    %Animation
    drawnow
end











