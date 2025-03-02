%% Homework 3, Problem 6 (Chapter 5, Problem 17)
%     Countem.m
%     Program that types out a line with N integers starting with n0
%     separated by commas and spaces
%     Author: Chris Kreienkamp
clear
clc

%% Set Parameters
n0 = 5;     % initial value of countem
N = 10;     % number of integers in countem


% Create an array of zeroes
%x = zeros(1,size);


%% Create Array

% Define initial value of counter
x = num2str(n0);

% create FOR loop with counter variable "ix"
% create the array "x"
for ix = 1:1:N-1
    x = [x,', ',num2str(n0 + ix)];
end


%% Display the new matrix
disp(['n0= ',num2str(n0),', N= ',num2str(N)])
disp(x)