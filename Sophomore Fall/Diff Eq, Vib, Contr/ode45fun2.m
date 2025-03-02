% time_period = [start finish];
% initial = [x(0),xdot(0)];
% ode45(@ode45fun, time_period, initial);
function output = ode45fun2(t,y)
% y = y(1)
% ydot = y(2)
% ydotdot = y(3) = put in terms of y(2) and y(1)
% output = [ydot;ydotdot]
output = [y(2); pi^2*y(1)*-9];