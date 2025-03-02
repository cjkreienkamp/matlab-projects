function vout = bubbleSortVisualized(v)
%% Homework 6, Problem 2 (Chapter 7, Problem 18)
% bubbleSort.m
%   Creates a visual representation of bubbleSort in progress
%   vout = bubbleSortVisualized(v)
%   Author: Chris Kreienkamp

Nv = length(v);
swapCounter = 0;
disp(v)
pause(1)
clc

% Checks that swaps need to be made
for iCompare = 1:1:Nv-1
    if v(iCompare) > v(iCompare + 1)
        swapCounter = 1;
    else
        swapCounter = 0;
    end
end


% Makes the swaps
while swapCounter > 0
    swapCounter = 0;
    for iCompare = 1:1:Nv-1
        if v(iCompare) > v(iCompare + 1)
            getBeforeOverwrite = v(iCompare);
            v(iCompare) = v(iCompare + 1);
            v(iCompare + 1) = getBeforeOverwrite;
            swapCounter = swapCounter + 1;
            disp(v)
            pause(1)
            clc
        end
    end
end

vout = v;