% Chris Kreienkamp
% Section 10
% 2/7/17

% Program that plots parametrically defined motion of Lissajous Curve
% Add the option to animate the motion

clear     % Clear Workspace
clc       % Clear Command Window
clf       % Clear Figure

%% Set Parameters

% Parameters of motion
T = 1;
a = 2;
b = 5;
r = 3;
phi = 4;
animateON = true;           % logic variable animates motion

% Ellapsed Time
tmin =0;     % Start time (sec)
tmax =1;     % Final time (sec)
Nt = 500;    % Number of data points
t = linspace(tmin, tmax, Nt);

%% Calculate Coordinates of Lissajous Curve

% Use FOR loop to calculate coordinates
% Use DOMAIN MARCHING as a function of time (t)
% "it" is the COUNTER VARIABLE

for it = 1:Nt
    x(it) = r*cos(a*2*pi*t(it)/T);
    y(it) = r*sin(b*2*pi*t(it)/T + phi);
end


%% Display Plot

% Use FOR loop to plot with animation
% Use IF statement to control animation on or off

if animateON   
for it = 1:Nt
    plot(x(1:it),y(1:it),...
        x(it),y(it))              % Plots both trailing line and new point
    
    % Improves for formatting
    title('Lissajous Curve')
    xlabel('x')                    
    ylabel('y')
    axis([-3 3 -3 3])
    axis square
    grid on
 
drawnow
end
else  
% Plot without animation
 plot(x,y)

 % Improves for formatting
 title('Lissajous Curve')
 xlabel('x')                    
    ylabel('y')
    axis([-3 3 -3 3])
    axis square
    grid on
end
