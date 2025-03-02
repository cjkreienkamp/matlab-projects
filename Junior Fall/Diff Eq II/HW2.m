% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #2 - 7 Feb 2019

clear
clc
clf


%% CALCULATION
A2 = [2 0 -3;
    0 -5 0;
    3 0 2];
[V2,D2] = eig(A2);

A3 = [-1 0 0;
    0 -2 1;
    0 0 -2];
[V3,D3] = eig(A3);

A4 = [0 1 0 0 0 0;
    -25 -0.12 5 0.01 10 0.01;
    0 0 0 1 0 0;
    0.5 0.001 -0.5 -0.001 0 0;
    0 0 0 0 0 1;
    1 0.001 0 0 -1 -0.001];
[V4,D4] = eig(A4);
a = [real(V4(1,1)) imag(V4(1,1)) real(V4(1,3)) imag(V4(1,3)) real(V4(1,5)) imag(V4(1,5));
    real(V4(2,1)) imag(V4(2,1)) real(V4(2,3)) imag(V4(2,3)) real(V4(2,5)) imag(V4(2,5));
    real(V4(3,1)) imag(V4(3,1)) real(V4(3,3)) imag(V4(3,3)) real(V4(3,5)) imag(V4(3,5));
    real(V4(4,1)) imag(V4(4,1)) real(V4(4,3)) imag(V4(4,3)) real(V4(4,5)) imag(V4(4,5));
    real(V4(5,1)) imag(V4(5,1)) real(V4(5,3)) imag(V4(5,3)) real(V4(5,5)) imag(V4(5,5));
    real(V4(6,1)) imag(V4(6,1)) real(V4(6,3)) imag(V4(6,3)) real(V4(6,5)) imag(V4(6,5));];
x0 = [2; 0; -1/2; 0; -1/2; 0];
k = linsolve(a,x0);


%% PLOT
i = 0;
for t = 0:0.01:100
    i = i+1;
    t_(i) = t;
    x(:,i) = k(1).*exp(real(D4(1,1)).*t).*(real(V4(:,1)).*cos(imag(D4(1,1)).*t)-imag(V4(:,1)).*sin(imag(D4(1,1)).*t))...
        + k(2).*exp(real(D4(1,1)).*t).*(real(V4(:,1)).*sin(imag(D4(1,1)).*t)+imag(V4(:,1)).*cos(imag(D4(1,1)).*t))...
        + k(3).*exp(real(D4(3,3)).*t).*(real(V4(:,3)).*cos(imag(D4(3,3)).*t)-imag(V4(:,3)).*sin(imag(D4(3,3)).*t))...
        + k(4).*exp(real(D4(3,3)).*t).*(real(V4(:,3)).*sin(imag(D4(3,3)).*t)+imag(V4(:,3)).*cos(imag(D4(3,3)).*t))...
        + k(5).*exp(real(D4(5,5)).*t).*(real(V4(:,5)).*cos(imag(D4(5,5)).*t)-imag(V4(:,5)).*sin(imag(D4(5,5)).*t))...
        + k(6).*exp(real(D4(5,5)).*t).*(real(V4(:,5)).*sin(imag(D4(5,5)).*t)+imag(V4(:,5)).*cos(imag(D4(5,5)).*t));
end

figure(1)
plot(t_,x(1,:))
set(gca,'FontSize',20)
xlabel('time (s)'); ylabel('x_1 (m)')

figure(2)
plot(t_,x(3,:))
set(gca,'FontSize',20)
xlabel('time (s)'); ylabel('x_2 (m)')

figure(3)
plot(t_,x(5,:))
set(gca,'FontSize',20)
xlabel('time (s)'); ylabel('x_3 (m)')