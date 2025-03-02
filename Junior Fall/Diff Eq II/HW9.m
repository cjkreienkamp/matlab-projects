% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #9 - 30 Apr 2019

clear
clc
clf

%% PROBLEM 1
figure(1)
a = tf(-100,1);
bode(a,{0.01,10000})

figure(2)
b = tf(1,[1,10]);
bode(b,{0.01,10000})

figure(3)
c = tf(1,[1,100]);
bode(c,{0.01,10000})

figure(4)
s = tf('s');
d = exp(-s/4);
bode(d,{0.01,10000})

figure(5)
bode(a*b*c*d,{0.01,10000})



%% PROBLEM 2
figure(6)
wn = 0.5;
z = 0.1581;
e = tf(wn^2,[1,2*z*wn,wn^2]);
f = tf(3160,[1,1000]);
bode(e*f,{0.1,100})