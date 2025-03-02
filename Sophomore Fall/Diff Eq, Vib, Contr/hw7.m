clc
clf
clear

t = linspace(-10,10,100);
yEstimate = t + 5/24*t.^3 + (12-3/4)*5/4/5/4/3/2*t.^5 + (12-3/4)*(30-3/4)*7/6/5/4/5/4/3/2*t.^7 ...
            +(12-3/4)*(30-3/4)*(90-3/4)*9/8/7/6/5/4/5/4/3/2 *t.^9;
time_period = [0 -10];
initial = [0,1];
[time,y] = ode45(@ode45fun, time_period, initial);
plot(time,y(:,1),'b')
hold on

time_period = [0 10];
[time,y] = ode45(@ode45fun, time_period, initial);
plot(time,y(:,1),'b')
hold on
plot (t, yEstimate,'r')
axis([-1 5 -10 10])
xlabel('t')
ylabel('x')


