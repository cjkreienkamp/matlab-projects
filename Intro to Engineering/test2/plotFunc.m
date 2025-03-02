% plotFunc.m
%  Plots the sinc function of the form 
%    f(x) = sin(a*pi*x)/x;

%% set parameters
xmin=-5;   % Minimum value of x being plotted
xmax=5;    % Maximum value of x being plotted
Nx=300;    % Number of points plotted
a = 0.75;  % Coefficient a of the equation f(x)=(a*pi*x)/x

doGrid = true;  % Boolean variable to control if the grid is on or off

%% calculate function values - DO NOT CHANGE
x=linspace(xmin,xmax,Nx);   % Calculate x points
y = sin(a*pi*x)./x;         % Calculate y points of function

%% calculate derivative values - DO NOT CHANGE
dx = 1*10^-6*a;  % set step size
xp = x + dx;  
xm = x - dx;
yp = sin(a*pi*xp)./xp;
ym = sin(a*pi*xm)./xm;
dydx = (yp - ym)/(2*dx);  % Approximate Derivative

%% Plot the function

plot(x,y);               % Plots the function
xlabel('X');             % Label on the x-axis
ylabel('Y');             % Label on the y-axis
title('Sinc Function');  % Title of the figure

if doGrid         % The If statement will add the grid if the variable 
    grid on;      % doGrid is set to be true.  Othewise, the grid will
end               % not appear

%% Plot of the derivative

plot(x, dydx);             % Plots the derivative
xlabel('X');               % Label on the x-axis
ylabel('dy/dx');           % Label on the y-axis
title('Sinc Derviative');  % Title of the figure

if doGrid         % The If statement will add the grid if the variable 
    grid on;      % doGrid is set to be true.  Othewise, the grid will
end               % not appear

