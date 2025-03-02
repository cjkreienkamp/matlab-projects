% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #3 - 14 Feb 2019

clear
clc
clf


%% CODE TO CHECK T AND LAMBDA
A = [16 -8
    -4 -1];
[T,L] = eig(A);
T(1,1) = T(1,1)/T(2,1);
T(2,1) = 1;
T(1,2) = T(1,2)/T(2,2);
T(2,2) = 1;
Tinv = inv(T);