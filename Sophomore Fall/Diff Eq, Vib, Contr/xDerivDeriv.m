function thetadotdot=xDerivDeriv(t,theta)
% xdotdot=xDerivDeriv(t,y)
% computes the function xdot=exp(3*t)-x
g = 9.8;
r = 2;
thetadotdot = zeros(2,1);
thetadotdot(1) = theta(2);
thetadotdot(2) = -g/r*cos(theta(1));