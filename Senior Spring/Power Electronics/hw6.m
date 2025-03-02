% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 6 - 6 Mar 2020

clear
clc
clf



%% 5-8
P1=75; P2=25;
sol1 = fzero(@(alpha1) fun1(P1,alpha1), pi/2);
sol2 = fzero(@(alpha2) fun1(P2,alpha2), pi/2);
alpha1 = rad2deg(sol1); alpha2 = rad2deg(sol2);



%% 5-11
w=2*pi*60; R=18; L=0.030; Vm=120*sqrt(2); alpha=pi/3;
theta=atan(w*L/R); Z=sqrt(R^2+(w*L)^2); wT=w*L/R;
sol3 = fzero(@(beta) fun2(beta,theta,alpha,wT,Vm,Z), 3*pi/2);
beta = rad2deg(sol3);



%% SUPPLEMENTAL A
f = linspace(0,300,301);
Vo = zeros(301,1); VsOverVo = zeros(301,1);
Vo1 = zeros(301,1); VsOverVo1 = zeros(301,1);
Rcheck = 3*2*pi.*f*0.005;
Vm = 100;
for i = 1:301
    if 5<Rcheck(i)
        Vo(i) = 2*Vm/pi;
        VmOverVo(i) = Vm/Vo(i);
    end
end
figure(1)
plot(f,VmOverVo,'b-','LineWidth',3)
set(gca,'FontSize',16)
xlabel('frequency (Hz)'); ylabel('Vm/Vo')


%% FUNCTION
% 5-8
function y = fun1(P,alpha)
    y = 120^2*(1-alpha/pi+sin(2*alpha)/(2*pi))-144*P;
end

% 5-11
function y = fun2(beta,theta,alpha,wT,Vm,Z)
    y = Vm/Z*sin(beta-theta)-Vm/Z*sin(alpha-theta)*exp((alpha-beta)/wT);
end