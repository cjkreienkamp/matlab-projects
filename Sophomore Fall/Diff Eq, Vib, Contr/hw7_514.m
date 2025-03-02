clc
clf
clear

t = linspace(0,10,100);
xEstimate = 1-t+t.^2;

time_period = [0 10];
initial = [1,-1];
[time,x] = ode45(@ode45fun, time_period, initial);
plot(time,x(:,1))
hold on
% plot (t, xEstimate)
% axis([0 10 -.4 1.2])
xlabel('t')
ylabel('x')


