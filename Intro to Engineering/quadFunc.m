function [x1, x2, roots] = quadFunc(a, b, c)

% Chris Kreienkamp
% Section 10
% 2/21/17
%
% [x1, x2, 'roots'] are the output variables
% "a", "b", and "c" are the input variables (equation coefficients)
% The name of the function and file are QUADFUNC
%
% Takes the inputs solves the quadratic formula
% Returns the values of the roots
% Evaluates the value of the discriminant and from the result, returns a
% string that describes the roots as "2 real roots", "Complex roots", or
% "Equal roots"

% Find the discriminant and the roots of the equation
dscrmnt = b^2 - 4*a*c;
x1 = (-b + sqrt(dscrmnt)) / (2*a);
x2 = (-b - sqrt(dscrmnt)) / (2*a);

% Check if the roots are real, complex, or equal
if dscrmnt < 0
    roots = 'Complex roots';

elseif dscrmnt == 0
    roots = 'Equal roots';
    
elseif dscrmnt > 0
    roots = '2 real roots';
    
end


