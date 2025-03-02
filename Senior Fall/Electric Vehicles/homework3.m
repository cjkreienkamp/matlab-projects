% Chris Kreienkamp - 901965168
% AME 40472 - Electric and Hybrid Vehicles
% Homework 3 - Mon Oct 7

clear
clc
clf



%% SET PARAMETERS
Tmax = 200;                         % [N*m]
w0 = 300;                           % [rad/s]
w = linspace(0,2*w0,1000);          % [rad/s]
T = Tmax-Tmax.*(w-w0).^2./w0^2;     % [N*m]
P = T.*w/1000;                      % [kW]



%% PLOT
% torque curve
figure(1)
plot(w,T,'LineWidth',3)
xlabel('angular speed (RPM)'); ylabel('torque (N\cdot m)')
set(gca,'FontSize',18)
axis([0 max(w) 0 max(T)+max(T)*0.1])

% power curve
figure(2)
plot(w,P,'LineWidth',3)
xlabel('angular speed (RPM)'); ylabel('power (kW)')
set(gca,'FontSize',18)
axis([0 max(w) 0 max(P)+max(P)*0.1])