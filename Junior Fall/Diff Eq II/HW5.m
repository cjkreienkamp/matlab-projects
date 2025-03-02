% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #5 - 28 Feb 2019

clear
clc
clf


%% CALCULATIONS
syms x(t)
eqn = 2*diff(x) + 3*x == exp(-3*t);
ic = x(0) == 0;
soln(t) = dsolve(eqn,ic)

syms y(t2)
dy = diff(y);
eqn2 = diff(y,t2,2) + 5*diff(y,t2) + 6*y == 0;
ic2 = y(0) == 2;
ic2prime = dy(0) == -5;
soln2(t2) = dsolve(eqn2,[ic2 ic2prime])