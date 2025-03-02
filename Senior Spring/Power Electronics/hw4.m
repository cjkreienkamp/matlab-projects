% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 4 - 14 Feb 2020

clear
clc
clf



%% 4-29
theta1=atan(120*pi*0.1/5); wtau1=120*pi*0.02; const1=7.039977;
syms x1 x2
eq1 = sin(x2-theta1)-sin(x1-theta1)*exp((x1-x2)/wtau1);
eq2 = cos(x1-theta1)-cos(x2-theta1) + ...
    wtau1*sin(x1-theta1)* (exp((x1-x2)/wtau1)-1) - const1;
sol1 = vpasolve([eq1 eq2],[x1 x2],[0 2*pi]);



%% SUPPLEMENTAL (b)
Vdc=180; Vm=240*sqrt(2); w=120*pi; R=6;
alpha = asin(Vdc/Vm);
L = fzero(@(L) fun(Vm,R,w,L,alpha,Vdc), 0.2);


%% FUNCTIONS
% SUPPLEMENTAL (b)
function y = fun(Vm,R,w,L,alpha,Vdc)
    y = Vm/sqrt(R^2+(w*L)^2)*sin(alpha+pi-atan(w*L/R)) - Vdc/R...
        + ( -Vm/sqrt(R^2+(w*L)^2) * sin(alpha-atan(w*L/R)) + Vdc/R )...
        *exp(-pi/(w*L/R));
end