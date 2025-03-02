% Chris Kreienkamp - 901965168
% AME 34334 - Heat Transfer
% Homework #6 - 25 Mar 2019

clear
clc
clf



%% SET PARAMETERS
D_d = linspace(30,100,1000);
r_d = D_d/2;
r_s = 30/2;
sigma = 5.6716e-8;
T_s = 273.15;
T_d = 288.15;

deltT = (T_d^4-T_s^4);
F_ds = r_s^2./(2.*r_d.^2);
q1 = pi*r_s^2*sigma*deltT;
q1 = q1*ones(1,1000)/1000;
q2 = 2*pi.*r_d.^2*sigma.*F_ds*deltT/1000;



%% PLOT
plot(D_d,q1,D_d,q2,'LineWidth',3)
set(gca,'FontSize',18)
xlabel('dome diameter (m)'); ylabel('net radiation heat transfer rate (kW)')
legend('large surroundings assumption','calculation with view factor',...
    'Location','Best')