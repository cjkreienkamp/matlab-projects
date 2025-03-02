%% Homework 2, Problem 3 (Chapter 5, Problem 2)
%      GoodBye.m
%      Print "Good-bye!" repeatedly by shifting it over to the right
%      Author: Chris Kreienkamp
clear
clc

%% Define FOR loop

% shift Good-bye! to the right by one space every time up to a large number
% of spaces as specified by iMax
iMax = 20;
for iblanks = 0:iMax
    disp([blanks(iblanks),'Good-bye!'])
end