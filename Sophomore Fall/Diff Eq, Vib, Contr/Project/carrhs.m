% time_period = [start finish];
% initial = [x(0),xdot(0)]
% ode45(@ode45fun, time_period, initial);
function z = carrhs(t,x,sk0,wavenos,phi,v,m,b,k)
% z = z(1)
% zdot = z(2)
% zdotdot = z(3) = put in terms of z(2) and z(1)
% output = [zdot;zdotdot]
z = zeros(2,1);
roady = y(sk0,wavenos,phi,v*t);
roadydot = dydx(sk0,wavenos,phi,v*t);
z(1) = x(2);
z(2) = ((b*v).*roadydot-b.*x(2)+k.*roady-k.*x(1))./m;