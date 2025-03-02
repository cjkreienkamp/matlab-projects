% time_period = [start finish];
% initial = [x(0),xdot(0)];
% ode45(@ode45fun, time_period, initial);
function output = ode45hw10(t,x)
output = 40*x*(1-x);