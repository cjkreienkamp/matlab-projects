%% Homework 2, Problem 5 (Chapter 5, Problem 9)
%      PiSeries1.m
%      Calculate an approximation to pi using pi^2 / 6 = sum of 1/k^2 from
%      k=1 to N
%      Author: Chris Kreienkamp
clear

%% ask user input for N
N= input('N= ');


%% calculate finite sum
S=0;
for k=1:N
    S=S+1/(k^2);
end

piApprox = sqrt(S*6);

%% display results

disp(['For N=',num2str(N),', the Basel problem approximates '...
    'pi to equal ',num2str(piApprox, 9),'.'])
disp(' ')
