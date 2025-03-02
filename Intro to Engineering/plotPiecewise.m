%% Homework 3, Problem 5 (Chapter 5, Problem 12)
%     plotPiecewise.m
%     Plot the piecewise function p(x) in the range x=[-2,2]
%     p(x) = 2x+3 for [-3/2,-1] ; -sin(pi*x/2) for (-1,1)
%            2x-3 for [1,3/2]   ; 0 for otherwise
%     Author: Chris Kreienkamp
clear
clc

%% Set up array x using linspace
xmin = -2; 
xmax = 2;
Nx = 100;
x = linspace(xmin,xmax,Nx);

%% Calculate coordinates
% Use FOR loop statement to break up p(x) into 4 parts
% Use "ix" as a counter variable
ix=0;
for ix = 1:Nx
if  -1.5 <= x(ix) && x(ix) <= -1
    p(ix) = 2*x(ix)+3;
elseif x(ix) < 1 && x(ix) > -1
        p(ix) = -sin(pi*x(ix)/2);
elseif x(ix) <=1.5 && x(ix) >= 1
        p(ix) = 2*x(ix)-3;
else
    p(ix) = 0;
end
end


%% Plot the function
% Plot without animation
 plot(x,p,'r-')

 % Improves for formatting
 title('Piecewise Function')
 xlabel('x')                    
 ylabel('p(x)')
 axis square
 grid on
 
 % In collaboration with Frankie Legambi