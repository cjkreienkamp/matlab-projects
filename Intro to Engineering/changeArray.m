% Chris Kreienkamp
% Section 10
% 2/2/17

% Create a 100x50 array of random integers between 1 and 100
% Check each element, and if it is less than nMin, change the value in the
% array to twice its original value
clear
clc

%% SET PARAMETERS

% Define our array size
rowNum = 100;
colNum = 50;

% Define nMin
nMin = 20;

% Generate the array
M = randi(100, [rowNum,colNum]);


%% LOOK THROUGH OUR ARRAY

% Use Nested FOR loop to find numbers less than nMin in an array
% The counter variables are "irow" and "icol"

for irow = 1:rowNum
    for icol = 1:colNum
        if M(irow,icol) < nMin
            M(irow,icol)= 2 * M(irow,icol);
        end
    end
end