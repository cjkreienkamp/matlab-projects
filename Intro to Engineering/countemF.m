function y = countemF(n0, N)

% Function that types out a line with N integers starting with n0
% separated by commas and spaces
% y = countemF(n0, N)
% Author: Chris Kreienkamp

% Define first integer
x = num2str(n0);

% create FOR loop with counter variable "ix"
% create the array "x"
for ix = 1:1:N-1
    x = [x,', ',num2str(n0 + ix)];
end

% Display the new matrix
disp(['n0= ',num2str(n0),', N= ',num2str(N)])
disp(x)