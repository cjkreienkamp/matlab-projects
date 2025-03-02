% Chris Kreienkamp
% Section 10
% 3/28/17

% Use the Euler Method to find an approximate solution for the equation:
% dp/dt = G*(pmax - p)*p

clear
clc

%% SET INITIAL PARAMETERS

% Range of t-values
tmin = 0;
tmax = 20;

% Number of points
Nt = 50;

% Constants
pmax = 10000;
G = 0.00005;


%% INITIALIZE VECTORS

% Vector of x-values
t = linspace(tmin,tmax,Nt);

% Increment of the approximation (dx)
dt = t(2) - t(1);

% Vector of y-values
p = zeros(1,Nt);

% Initial condition
p(1) = 800;

%% CALCULATIONS - EULER METHOD

% Use FOR loop for domain marching of approximate solution
% Use "current" value (ix) to determine "future" value (ix+1)

for it = 1:Nt-1
    
    % Euler Method General Form: p(n+1) = p(n) + a*delta_t
    % delta_t = increment
    % a = dp/dt
    % For our example: delta_t = dt and a = dp/dt = G*(pmax - p)*p
    
    a = G*(pmax - p(it))*p(it);
    p(it+1) = p(it) + a*dt;
end

%% GENERATE PLOT

% Plot approximate solution
plot(t,p,'b-')

% Enhance plots with labels
xlabel('Time (years)')
ylabel('Population of the Community (people)')
title('Plot of dp/dt = G*(pmax - p)*p')
grid on
axis([tmin tmax 0 1.05*max(p)])