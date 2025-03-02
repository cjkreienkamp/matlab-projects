% Chris Kreienkamp - 901965168
% AME 50542: Manufacturing
% Project - 8 May 2020

clear
clc
clf


%% CALCULATIONS
tau = 10.5;
l = 0.14;
v = 0.43;
r = 0.005/2;
E = linspace(1.5,20,10000);
phi_rad = 2*tau*l*(1+v)./(E.*1000*r);
phi_deg = rad2deg(phi_rad);

%% PLOT
plot(E,phi_deg,'b-','LineWidth',3); hold on
xlabel('modulus of elasticity (GPa)'); ylabel('angle of twist (^{\circ})');
set(gca,'FontSize',14)
