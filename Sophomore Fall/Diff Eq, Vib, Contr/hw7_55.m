clc
clf
clear

t = linspace(0,10,100);
xEstimate = 1-t+t.^2-t.^3/3-t.^4/3+t.^5*11/30;
time_period = [0 20];
initial = [1,0];
[time,x] = ode45(@ode45fun, time_period, initial);
plot(time,x(:,1))
hold on
% plot (t, xEstimate)
% axis([0 3 0.4 1])
xlabel('t')
ylabel('x')


