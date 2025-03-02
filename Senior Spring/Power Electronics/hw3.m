% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 3 - 7 Feb 2020

clear
clc
clf



%% 3-17
w=377; R=1000; C1=0.001;
wRC1 = w*R*C1;
theta1 = -atan(wRC1)+pi;
alpha1 = fzero(@(alpha) fun1(alpha,wRC1,theta1), pi/4);
deltaV0 = 200*(1-sin(alpha1));



%% 3-21
alpha2 = asin(1-2/(120*sqrt(2)));
syms x1 x2
eq1 = sin(alpha2)-sin(x1)*exp(-(2*pi+alpha2-x1)/(2*pi*60*1000*x2));
eq2 = x1-pi+atan(2*pi*60*1000*x2);
sol = solve(eq1,eq2); theta2=double(sol.x1); C2=double(sol.x2);
Vtheta = 120*sqrt(2)*sin(theta2);
Vm = 120*sqrt(2);
wRC2 = 2*pi*60*1000*C2;
Vavg = 1/(2*pi)*Vm*( (-cos(theta2)) - (-cos(alpha2)) ) ...
    + 1/(2*pi)*Vtheta*( (-wRC2*exp(-(2*pi+alpha2-theta2)/wRC2))-(-wRC2) );
Iavg = Vavg/1000;



%% SUPPLEMENTAL
alpha = linspace(0,pi,1000);
beta = 2*pi-acos(cos(alpha));
lhs = tan(beta)-beta+sqrt(2)*pi^2./(5*cos(beta));
rhs = alpha + tan(alpha);
optimize = rhs-lhs;
plot(alpha,optimize,'b-','LineWidth',3)
xlabel('\alpha'); ylabel('rhs-lhs=0 of equation (2)')
axis([0,pi,-10,10]);
set(gca,'FontSize',16);



%% FUNCTION
% 3-5
function y = fun1(alpha,wRC,theta)
    y = sin(alpha)-sin(theta)*exp(-(2*pi+alpha-theta)/wRC);
end