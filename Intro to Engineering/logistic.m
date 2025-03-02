function p = logistic(y, y0, a)

% Chris Kreienkamp
% Section 10
% 2/21/17
%
% "p" is the output variable
% "y", "y0", and "a" are the input variables
% The name of the function and file are LOGISTIC
%
% Takes the inputs and evaluates the logistic function
% and reuturns a value: p(y) = 1/(1+exp(-(y-y0)/a))

% Logistic equation
% "y" will be a vector
% We want to make sure we're doing element by element operations
p = 1 ./ (1 + exp(-(y-y0)/a) );