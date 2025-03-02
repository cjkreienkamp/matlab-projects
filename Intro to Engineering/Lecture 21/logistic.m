function p = logistic(y, y0, a)

% logistic(y, y0, a) takes the inputs to the logistic function and
% returns the p(y) values for p(y) = 1/(1+exp(-(y-y0)/a))

p = 1 ./ ( 1 + exp( -(double(y)-y0) / a ) );