function [j,M]=Josephus(N,k)
%% Homework 6, Problem 1 (Chapter 7, Problem 12)
% Josephus.m
% Determines which person in a group of N people will remain living if
% every third person is killed
% N is the number of people in the circle
% k is the position of the first person to die
% j = Josephus(N,k)
%   Author: Chris Kreienkamp


% ipoint is the position of the last person to die in the chain
% alive is an array that marks 1's as those alive and 0's as those dead

alive = ones(1,N);          % create an array
trackProgress = ones(N,N);  % create an array
trackProgress(2:end,k) = 0;

Nalive = N-1;
ipoint = k;
alive(k) = 0;

while Nalive > 1
    youDead = findNextAlive(alive, ipoint, 2);
    alive(youDead) = 0;
    Nalive = Nalive - 1;
    ipoint = youDead;
    
    Mcol = N - Nalive + 1;
    trackProgress(Mcol:end,ipoint) = 0;
end

M = trackProgress;
j = findNextAlive(alive,ipoint,2);
