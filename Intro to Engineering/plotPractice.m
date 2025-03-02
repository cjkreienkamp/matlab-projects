% Chris Kreienkamp
% Section 10
% 1/24/17

% Creates a plot of the function y=cos(2*pi*x/L) over the range of
% 0 to 6 with 100 values

clear
clc

%% Set Parameters

% Define range and number of x-values
xmin = 0;
xmax = 6;
Nx = 100;


%% Tabulate Values

% Use linspace to define theoretical x-values
x = linspace(xmin,xmax,Nx);

% Define theoretical function
L = 5;
y1 = cos(2*pi*x/L);

% Define experimental values
xexp = [1 2 3 4 5];
Trial1 = [.38 -.82 -.79 .28 .93];
Trial2 = [.36 -.8 -.88 .45 1.1];
Trial3 = [.22 -.67 -.94 .27 .98];

%% Plot theoretical and experimental data on same axis

plot(x,y1,'-m',...
    xexp,Trial1,'bo',...
    xexp,Trial2,'k^',...
    xexp,Trial3,'rx')

% Add labels, title, ...
xlabel('x')
ylabel('y')
title('Plot of Theoretical and Experimental y=cos(2*pi*x/L) Values')
grid on
legend('y=cos(2*pi*x/L)','Trial 1','Trial 2','Trial 3','Location','Northwest')
