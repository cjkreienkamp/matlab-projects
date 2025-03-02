% Chris Kreienkamp
% Section 10
% 3/7/17
% damped.m

function y = damped(x)
% y(x) = e^(-x/4) * cos(2*pi*x/2.5)
% x can be a scalar or a vector input

y = exp(-x./4) .* cos(2*pi.*x./2.5); 