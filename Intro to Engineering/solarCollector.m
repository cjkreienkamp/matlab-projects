% Chris Kreienkamp
% Section 10
% 4/11/17

clear
clc

% Write a program to calculate the total heat absorbed
% Need to take the integral for a tabulated data set


%% SET INTIAL PARAMETERS

% Coefficients
A = 150000;             % Surface area of panels (in cm^2)
eff = 0.45;             % Efficiency

% Tabulated Data
t = 0:2:14;                                 % Time points in hours
q = [0.1 5.32 7.8 8 8.03 6.27 3.54 0.2];    % Values in cal/cm^2/hr


%% FIND INTEGRAL USING "TRAPZ" COMMAND

% Find integral
integral = trapz(t,q);
disp(integral);

% Find the information needed for plotting integral
%   - Use a FOR loop because we want to plot integral at each time step
%   - Apply "TRAPZ" to each time step of integral (like domain marching)

Nt = length(t);         % Number of time points (COUNTER variable for loop)
for it = 2:Nt    % Loop runs for the number of "spaces" between time points
    h(it) = (A*eff) * trapz(t(1:it),q(1:it));   % Calculate integral
end


%% PLOT OUTPUT

plot(t,h)
xlabel('Time (hrs)')
ylabel('Heat Absorbed (cal)')
title('Heat Absorbed v. Time')
grid on

