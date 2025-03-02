% Chris Kreienkamp, 901965168
% EE 40472 - Electric and Hybrid Electric Vehicles
% Homework 2

clear
clc



%% SET PARAMETERS
CdA = 1;
rho = 1.2;
v = linspace(0,80,1000);
x = 100;
m = 2000;
g = 9.8;
f_r = 0.1;
E = 1/2*CdA*rho*v.^2*x + m*g*f_r*x;



%% PLOT
plot(v,E,'b-','Linewidth',3)
set(gca,'FontSize',18)
xlabel('velocity (m/s)'); ylabel('E(v) J');

figure(2)
plot(v(80:end),E(80:end)./v(80:end),'b-','Linewidth',3)
set(gca,'FontSize',18)
xlabel('velocity (m/s)'); ylabel('E(v)/v');