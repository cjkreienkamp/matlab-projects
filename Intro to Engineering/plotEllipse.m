% Chris Kreienkamp
% Section 10
% 2/7/17

% Program that plot an ellipse
% Animate the plot with a trailing line
% Toggle between animation and no animation

clear     % Clear Workspace
clc       % Clear Command Window
clf       % Clear Figure

%% Set Parameters

% Parameters of ellipse
R = 3;              % Radius of motion (m)
T = 5;              % Period of circular motion (sec)
omega = 2*pi/T;     % Angular velocity (rad/sec)
phi = 4;            % Angle of tilt

% Ellapsed Time
tmin =0;     % Start time (sec)
tmax =5;     % Final time (sec)
Nt = 100;    % Number of data points
t = linspace(tmin, tmax, Nt);

%% Calculate Coordinates of Ellipse

% Use FOR loop to calculate coordinates
% Use DOMAIN MARCHING as a function of time (t)
% "it" is the COUNTER VARIABLE

for it = 1:Nt
    x(it) = R*cos(2*pi*t(it)/T);
    y(it) = R*sin(2*pi*t(it)/T + phi);
end


%% Display Plot

% Use FOR loop to plot with animation
% Use IF statment to control animation on or off
% Define variable "animateOn" as logic variable
animateOn = true;

if animateOn
    
for it = 1:Nt
    plot(x(1:it),y(1:it),...
        x(it),y(it))              % Plots both trailing line and new point
    xlabel('x')                    % Improves for formatting
    ylabel('y')
    axis(1.5*[-R R -R R])
    axis square
    grid on

    
drawnow

end

else
    
% Plot without animation
 plot(x,y)

 xlabel('x')                    % Improves for formatting
    ylabel('y')
    axis(1.5*[-R R -R R])
    axis square
    grid on



end




