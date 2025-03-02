% Chris Kreienkamp - 901965168
% AME 34334 - Heat Transfer
% Homework #9 - 25 Apr 2019

clear
clc
clf

%% SET PARAMETERS
u_inf = linspace(0,10^-3,100000);
D = 0.001;
Bi_one = 0.25*(0.3 + 124.2.*(u_inf.*D).^(1/2) .* [1+0.3959.*(u_inf.*D).^(5/8)].^(4/5));
D = 0.005;
Bi_five = 0.25*(0.3 + 124.2.*(u_inf.*D).^(1/2) .* [1+0.3959.*(u_inf.*D).^(5/8)].^(4/5));


%% PLOT
plot(u_inf,Bi_one,'b-','LineWidth',3); hold on
plot(u_inf,Bi_five,'r-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('airspeed (m/s)'); ylabel('Biot number')
legend('D = 0.001 m','D = 0.005 m','Location','Best')