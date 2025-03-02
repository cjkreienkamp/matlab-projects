function [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est)
% [t3(rad),t4(rad)] = newton4bar(r1,r2,r3,r4,t2(rad),t3est(deg),t4est(deg))
% Gives theta_3 and theta_4 given the dimensions of the four
% bars and estimates for theta_3 and theta_4.

% define vector of initial guesses
t3 = deg2rad(t3est);
t4 = deg2rad(t4est);
x = [t3;t4];

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
    f1 = r2*st2+r3*st3-r4*st4;
    f2 = r2*ct2+r3*ct3-r4*ct4-r1;
    % define vector of functions computed at guessed solution
    f = [f1;f2];
    % calculate the partials of f w.r.t. each element of x
    dfdt3 = [r3*ct3;-r3*st3];
    dfdt4 = [-r4*ct4;r4*st4];
    % define the A matrix
    A = [dfdt3 dfdt4];
    % use equation (2.67) to compute the solution x
    x = x-inv(A)*f;
    % check tolerance
    tolerance = norm(-inv(A)*f);
    % update values
    t3 = x(1);
    t4 = x(2);
end

end


