% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #4 - 21 Feb 2019

clear
clc
clf


%% SET PARAMETERS
m = 5;
M = 50;
l = 0.5;
g = 9.81;
omega = 10;
A = [0 1 0 0;
    0 0 g*m/M 0;
    0 0 0 1;
    0 0 g*(M+m)/M/l 0];


%% CALCULATIONS
ksi = @(t,ksi) [ksi(2); ksi(3)*g*m/M+(1-cos(omega.*t))/M; ksi(4);...
    ksi(3)*(g*m/l/M+g/l)+(1-cos(omega.*t))/l/M];

[t, ksi_] = ode45(ksi, [0,2*pi/omega],[0,0,0,0]);
[vect,val] = eig(A);


%% PLOT
plot(t,ksi_(:,1),'b','LineWidth',2); hold on
plot(t,ksi_(:,3),'r','LineWidth',2)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('displacement (m)')
legend('cart translation, x','pendulum rotation, \theta','Location','best')