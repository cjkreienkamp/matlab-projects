% 65168
% Programming Problem 1
clear
clc

% values of scalar knowns (dimensions)
r1 = 4.8;   % (in)
r2 = 2.0;
r6 = 3.65;
t2 = 4.94;

% values of scalar unknowns (the remaining joint variables)
r3 = 3;
r4 = 11;
r5 = 4;
t3 = 300*3.14159/180;
t4 = 300*3.14159/180;

% define vector of initial guesses
x = [r3;r4;r5;t3;t4]
error = ones(5,1);
tolerance = 1;

while tolerance > 0.01
    % compute the necessary sines and consines of angles t2-t4
    ct2 = cos(t2);
    st2 = sin(t2);
    ct3 = cos(t3);
    st3 = sin(t3);
    ct4 = cos(t4);
    st4 = sin(t4);
    % compute the functions at the guessed value
    f1 = r2*ct2-r3*ct3+r1;
    f2 = r2*st2-r3*st3;
    f3 = r6-r4*ct4+r1;
    f4 = -r5-r4*st4;
    f5 = t4-t3;
    % define vector of functions computed at guessed solution
    f = [f1;f2;f3;f4;f5];
    % calculate the partials of f w.r.t. each element of x
    dfdr3 = [-ct3;-st3;0;0;0];
    dfdr4 = [0;0;-ct4;-st4;0];
    dfdr5 = [0;0;0;-1;0];
    dfdt3 = [r3*st3;-r3*ct3;0;0;-1];
    dfdt4 = [0;0;r4*st4;-r4*ct4;1];
    % define the A matrix
    A = [dfdr3 dfdr4 dfdr5 dfdt3 dfdt4];
    % use equation (2.67) to compute the solution x
    x = x-inv(A)*f
    % check tolerance
    error(1) = abs(r3-x(1));
    error(2) = abs(r4-x(2));
    error(3) = abs(r5-x(3));
    error(4) = abs(t3-x(4));
    error(5) = abs(t4-x(5));
    tolerance = max(error);
    % update values
    r3 = x(1,1);
    r4 = x(2,1);
    r5 = x(3,1);
    t3 = x(4,1);
    t4 = x(5,1);
end