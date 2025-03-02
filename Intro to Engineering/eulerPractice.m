% Chris Kreienkamp
% Section 10
% 3/28/17

% Use the Euler Method to find an approximate solution for the equation:
% dy/dx = cos(x)

clear
clc

%% SET INITIAL PARAMETERS

% Range of x-values
xmin = 0;
xmax = 5*pi;

% Number of points
Nx = 50;

%% INITIALIZE VECTORS

% Vector of x-values
x = linspace(xmin,xmax,Nx);

% Increment of the approximation (dx)
dx = x(2) - x(1);

% Vector of y-values
y = zeros(1,Nx);

% Initial condition
y(1) = 0;

%% CALCULATIONS - EULER METHOD

% Use FOR loop for domain marching of approximate solution
% Use "current" value (ix) to determine "future" value (ix+1)

for ix = 1:Nx-1
    
    % Euler Method General Form: y(n+1) = y(n) + a*delta_t
    % delta_t = increment
    % a = dy/dx
    % For our example: delta_t = dx and a = dy/dx = cos(x)
    
    a = cos(x(ix));
    y(ix+1) = y(ix) + a*dx;
end

%% GENERATE PLOT

% Exact solution: y = sin(x)
y_real = sin(x);

% Plot approximate and exact solution
plot(x,y,'r--',...
    x,y_real,'b-')

% Enhance plots with labels
xlabel('X')
ylabel('Y')
title('Plot of dy/dx = cos(x)')
grid on
legend('Euler Method','Exact','Location','SouthEast')
axis([xmin xmax 1.5*min(y_real) 1.5*max(y_real)])