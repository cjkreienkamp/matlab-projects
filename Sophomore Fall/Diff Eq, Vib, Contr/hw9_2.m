% Chris Kreienkamp
% Sat Nov 25, 2017
% Homework 9, 11.2

clear all
clc

%% 11.4.1
L = 4;
T = 2;
alpha = 1;
n = 0;
Nf1 = 5;
Nf2 = 25;
Nf3 = 1000;
Nx = 1000;
t1 = 0;
t2 = 1;
t3 = 5;
t4 = 10;
 
%% For Loop
x = linspace(0, L, Nx);
u = zeros(1, Nx);
 
for j = 1:Nx
for i = 1:Nf3
cn(i) = (8/((i*pi)^2)) * sin(i * pi/2);
u(j) = u(j) + cn(i) * sin(i * pi * x(j)/4) * exp(-(i*pi/4)^2 * 10);
end
end
 
 
%% Plot
figure(4)
plot(x,u,'m'); hold on
legend('t = 0','t = 1','t = 2','t = 4','t = 10')