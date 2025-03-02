% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Final Exam - 6 May 2020

clear
clc
clf



%% PROBLEM 2 (a)
% Vs = 120; Po = 1400; Pmin = 600;
% R = Vs^2/Po;
% Vorms = sqrt(Pmin*R);
% alpha_rad = fzero(@(alpha) fun2a(Vorms,Vs,alpha),0.75);
% alpha_deg = rad2deg(alpha_rad);

%% PROBLEM 2 (b)
% Vs = 120; Po = 1400; Pmin = 600;
% Vm = Vs*sqrt(2);
% R = Vs^2/Po;
% Vorms = sqrt(Pmin*R);
% alpha_rad = fzero(@(alpha) fun2b(Vorms,Vm,alpha),0.75);
% alpha_deg = rad2deg(alpha_rad);

%% PROBLEM 2 (c)
% Vs = 120; f = 60; w = 2*pi*f; L = 0.0796; R = 40;
% Z = sqrt(R^2+(w*L)^2);
% theta = atan(w*L/R);
% Vm = Vs*sqrt(2);
% alpha_deg = 90; alpha_rad = deg2rad(alpha_deg);
% wT = w*L/R;
% beta_rad = fzero(@(beta) fun2c(beta,theta,alpha_rad,wT),3.5);
% beta_deg = rad2deg(beta_rad);

%% PROBLEM 2 (d)
% wt1 = linspace(0,0.644,1000);
% wt2 = linspace(0.644,3.79,1000);
% wt3 = linspace(3.79,2*pi,1000);
% plot(wt1,0,'b-','LineWidth',3); hold on
% plot(wt2,3.39*sin(wt2-0.644),'b-','LineWidth',3); hold on
% plot(wt3,0,'b-','LineWidth',3); hold off
% set(gca,'FontSize',18)
% xlabel('time (wt)'); ylabel('current (A)');

%% PROBLEM 4 (c)
% V1 = 4*100/pi;
% Q = sqrt( (1/0.3^2 - 1) / (3-1/3)^2 );
% V = ones(9,2);
% i = 0;
% THD_num = 0;
% for n = [3,5,7,9,11,13,15,17,19]
%     i = i+1;
%     V(i,1) = n;
%     V(i,2) = n/V1/sqrt(1+Q^2*(n-1/n)^2);
%     THD_num = THD_num + V(i,2)^2;
% end
% THD = sqrt(THD_num)/V1*100;



%% FUNCTIONS
% PROBLEM 2 (a)
function y = fun2a(Vorms,Vs,alpha)
    y = Vorms - Vs*sqrt(1-alpha/pi+sin(2*alpha)/(2*pi));
end

% PROBLEM 2 (b)
function y = fun2b(Vorms,Vm,alpha)
    y = Vorms - Vm/2*sqrt(1-alpha/pi+sin(2*alpha)/(2*pi));
end

% PROBLEM 2 (c)
function y = fun2c(beta,theta,alpha,wT)
    y = sin(beta-theta) - sin(alpha-theta)*exp((alpha-beta)/wT);
end