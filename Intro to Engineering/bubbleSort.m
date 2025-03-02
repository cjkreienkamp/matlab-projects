function vout = bubbleSort(v)
%% Homework 6, Problem 2 (Chapter 7, Problem 18)
% bubbleSort.m
%   Examines in turn each element of the vector and it?s neighbor to the 
% right. If they?re in the wrong order, swap them. Continue going
% repeatedly through the vector in this way until the whole vector has
% been traversed once with no swaps.
%   vout = bubbleSort(v)
%   Author: Chris Kreienkamp

Nv = length(v);
swapCounter = 0;

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
        end
    end
end

vout = v;