% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #8 - 25 Apr 2019

clear
clc
clf

%% SET PARAMETERS
figure(1)
g = tf([1,-1],[1,1,2]);
rlocus(g)
set(gca,'FontSize',18)

figure(2)
h = tf([1,1.2,36.2,36],[5,61.2,230.4,2592,0,0]);
rlocus(h)
set(gca,'FontSize',18)

figure(3)
rlto