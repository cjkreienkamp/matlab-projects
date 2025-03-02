%% Homework 4, Problem 6 (Chapter 6, Problem 7)
%      epicycles.m
%      Program that draws circular motion with one epicycle
%      Author: Chris Kreienkamp
clear
clc
 
 
%% SET PARAMETERS

% Variable used for the epicycle period
tratio = 9.25;

% Primary orbit
T1 = 1;                     % Period
R = 5;                      % Radius
omega1 = 2*pi/T1;           % Frequency]
Nc = 10;                    % Number of cycles

% Epicycle
T2 = T1 / tratio;           % Period
r = 2;                      % Radius
omega2 = 2*pi/T2;           % Frequency

% Number of time points per cycle
Ntpc = 200;

% Total time
totalTime = Nc*T1;

% Total number of times for which you calculate the position
Nt = Nc*Ntpc;

% Create an array of evenly spaced points between 0 and Nt
t = linspace(0,totalTime,Nt);
    
show=input('Do you want to animate the plot? (yes=1 no=0) ');
%% PLOT POSITION OF OBJECT

% Create the smaller circle
x = R*cos(omega1*t) + r*cos(omega2*t);
y = R*sin(omega1*t) + r*sin(omega2*t);

% Construct FOR loop with counter variable "it"
for it = 1:Nt
    if show == true;
        % Plot position and adjust plot
        plot(x(it),y(it),'ro',...
            x(1:it),y(1:it),'b-')
        
        % Update our axis
        axis([-1.1*(R+r) 1.1*(R+r) -1.1*(R+r) 1.1*(R+r)])
        
        % Update figure for animation
        drawnow
        
    elseif show == false;
         % Plot position and adjust plot
        plot(x(it),y(it),'ro', ...
            x(1:it),y(1:it),'b-')
        
        % Update our axis
        axis([-1.1*(R+r) 1.1*(R+r) -1.1*(R+r) 1.1*(R+r)])
      
    end
    
end

% With assistance from Tait McGlinn