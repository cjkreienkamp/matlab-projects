% Chris Kreienkamp - 901965168
% AME 54533 - Nuclear Science
% Homework #8 - 17 Apr 2019

clear
clc
clf



%% PROBLEM 1 (9.1)
rho = 11;                       % g/cm^3
D = 1.1;                        % cm
gamma = 0.0061 + 0.0047*(4/rho/D);
p = 0.63;
T_f = linspace(300,1000,10000);
alpha_f = -gamma/2./sqrt(T_f)*log(1/p);

plot(T_f,alpha_f,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('Fuel Temperature (K)'); ylabel('\alpha_f');
