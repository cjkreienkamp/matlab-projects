%% mikeshw9
clear;clc;

num = [42.715 626.67 17798.027];
den = [1 17.894 596.74 733.388 5626.36];
p = tf(num,den);
bode(p)