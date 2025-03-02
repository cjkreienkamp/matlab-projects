% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 2 - 31 Jan 2020

clear
clc
clf



%% 3-5
omega=2*pi*60; L=0.015; R=10; wtau=omega*L/R; Vm=120*sqrt(2);
Z=sqrt(R^2+(omega*L)^2); theta=atan(omega*L/R);
beta = fzero(@(beta) fun(beta,wtau,theta), pi);
IrmsFun = @(t) (14.77.*sin(t-0.515)+7.27.*exp(-t./0.565)).^2;
Irms = sqrt(1/(2*pi).*integral(IrmsFun,0,beta));
P=Irms^2*R;



%% 3-10
beta2 = fzero(@(beta2) three10(beta2), pi);



%% 3-43
syms beta3 R3
eq1 = -cos(beta3-atan(12*pi/R3)) + ...
    12*pi/R3*sin(atan(12*pi/R3))*(1-exp(-beta3*R3/12/pi)) + ...
    cos(atan(12*pi/R3)) - ...
    4*pi*sqrt(R3^2+(12*pi)^2)/(120*sqrt(2));
eq2 = sin(beta3-atan(12*pi/R3)) + ...
    sin(atan(12*pi/R3))*exp(-beta3*R3/(12*pi));
sol = solve(eq1,eq2);



%% FUNCTION
% 3-5
function y = fun(beta, wtau, theta)
    y = sin(beta-theta)+sin(theta)*exp(-beta/wtau);
end
% 3-10
function y = three10(beta2)
    y = 4.68-4.50*cos(beta2)-1.27*beta2;
end