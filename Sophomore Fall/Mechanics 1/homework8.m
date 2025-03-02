% Chris Kreienkamp
% 11/10/17
% Homework 8

clear
clc
clf

increment = 0.1;
i = 1;
V = zeros(1,34/increment);
M = zeros(1,34/increment);


for x = 0:increment:5
    V(i) = -800*x;
    M(i) = -400*x^2;
    i = i+1;
end

for x = 5.1:increment:8
    V(i) = 5868-800*x;
    M(i) = -400*x^2+5868*x-29340;
    i = i+1;
end

for x = 8.1:increment:12
    V(i) = -400*x+2668;
    M(i) = -200*x^2+2668*x-16540;
    i = i+1;
end

for x = 12.1:increment:18
    V(i) = 400*x-6932;
    M(i) = 200*x^2-6932*x+41060;
    i = i+1;
end

for x = 18.1:increment:22
    V(i) = 268;
    M(i) = 268*x-23740;
    i = i+1;
end

for x = 22.1:increment:27
    V(i) = 268;
    M(i) = 268*x-17740;
    i = i+1;
end

for x = 27.1:increment:34
    V(i) = 1500;
    M(i) = 1500*x-51004;
    i = i+1;
end

x = linspace(0,34,341);
figure(1); plot(x,V)
xlabel('x (ft)'); ylabel('V (lb)')
title('Shear Force (V) over the range of 0 < x < 34')
set(gca,'FontSize',22)
figure(2); plot(x,M)
xlabel('x (ft)'); ylabel('M (lb ft)')
title('Bending Moment (M) over the range of 0 < x < 34')
set(gca,'FontSize',22)