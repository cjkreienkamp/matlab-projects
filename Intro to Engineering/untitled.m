clf
clc
clear
omega = linspace(0,100,5000);
omegan = 3;
me = 1;
r = .01;
m = 2;
t = 1;
xpt = (me*r*omega.^2)/(m.*(omegan^2-omega.^2)).*cos(omega*t);
figure(1)
plot(omega./omegan,xpt./r);

% t1 = linspace(0,35,1000);
% a = -.332;
% b = .0177;
% y = a*cos(4*t1)+b*sin(4*t1);
% y1 = exp(-0.1*t1).*(cos(.995*t1)-.905.*sin(.995*t1))+y;
% figure (2)
% plot(t1,y); hold on;
% plot(t1,y1);