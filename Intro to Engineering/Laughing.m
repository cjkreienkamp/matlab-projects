%% Homework 2, Problem 4 (Chapter 5, Problem 8)
%      Laughing.m
%      Type out a line with N Ha!s separated by spaces
%      Author: Chris Kreienkamp
clear
clc

%% Define FOR loop

% Decide the number of Ha!s you want
N =15;

% Define initial value of counter
Ha = 'Ha! ';

% FOR loop used to create a 1xN matrix of Ha!s
% "iHa" is the counter variable
for iHa = 1:N-1
   Ha = [Ha,'Ha! '];
end

disp(Ha)