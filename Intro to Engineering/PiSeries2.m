 %% Homework 3, Problem 4 (Chapter 5, Problem 10)
%      PiSeries2.m
%      Calculate an approximation to pi using the Gregory-Leibniz series
%      Compute sum for N=100, 1000, 1*10^6 , and 1*10^7
%      Author: Chris Kreienkamp
clear
 
 
%% Set Parameters
N= [100 1000 1000000 10000000];
 
 
%% calculate finite sum
% "iN" is counter variable
% "k" refers to the entry in N
% "S" is the Gregory-Leibniz equation
for iN = 1:4
    S=0;
    for k=0:N(iN)-1
        S=S+(-1)^k/(2*k+1);
    end
    piApprox = S*4;
    disp(['For N=',num2str(N(iN)),', the Gregory-Leibniz series approximates '...
        'pi to equal ',num2str(piApprox, 9),'.'])
    disp(' ')
end
 
% With assistance from Michael Moynihan
