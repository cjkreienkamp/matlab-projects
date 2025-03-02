clc
close all

x = [10 20 30 40 50]*0.01;                  % distance, m
t = [0.5252 0.8042 1.0056 1.13 1.2964];     % time, s
Ut = [0.0093 0.0140 0.0349 0.0353 0.04732]; % uncertainty, s

figure(1)
plot(t,x,'o')
xlabel('time, t(s)')
ylabel('distance, x(m)')

figure(2)
errorbar(t,x,Ut,'horizontal','o','LineWidth',1.5,'MarkerSize',8)
xlabel('time, t(s)')
ylabel('distance, x(m)')
axis([0 1.5 0 .55])
set(gca,'FontSize',16)