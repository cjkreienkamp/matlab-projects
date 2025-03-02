%% Mechanics I
% Homework 4 - Due 9/22/17
% 901965168 - Chris Kreienkamp
% Problem 2/192

% Determine and plot the required motor torque M as a function of theta,
% where M acts such that the net moment about O is always zero.
clear
clc
clf

%% SET PARAMETERS
ihat = [1;0;0];
jhat = [0;1;0];
khat = [0;0;1];
k = 600;                            % spring constant (N/m)                       
xUn = .65;                          % Unstretched spring length
N = 1000;                           % Number of angles plotted
theta = linspace(0,180,N);          % Create array of angle values
thetaUn = asind(.275);              % Angle where spring is unstretched
xx = 0.5.*cosd(theta);              % x component of spring length
xy = 0.3+0.5.*sind(theta);          % y component of spring length
x = sqrt(xx.^2 + xy.^2);            % spring length at different thetas
    
%% FOR STATEMENT
% Determine the spring force
% Determine moment about O
for i = 1:1:N
    FaMag(i) = k.*(xUn-x(i));                   % Spring Force magnitude
    AwrtB = (xx(i)*ihat) + (xy(i)*jhat);        % Vector from A to B
    AwrtBhat = AwrtB / x(i);                    % Unit Vector A to B
    Fa = FaMag(i)*(AwrtBhat);                   % Spring Force
    AwrtO = [0.5*cosd(theta(i)) 0.5*sind(theta(i)) 0];% Vector from O to A
    momentO = cross(AwrtO,Fa);                      % Moment about O
    M(i) = -momentO*khat;                           % Motor torque
end

%% PLOT
plot(theta,M,'-')
xlabel('\Theta (degrees)','FontSize',24),...
ylabel('M (N)','FontSize',24),...
axis([0 180 -50 50]),...
set(gca,'FontSize',20)