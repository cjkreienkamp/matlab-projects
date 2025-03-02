%% Homework 3, Problem 7
%     findMinValue.m
%     Find and display the minimum value in an array
%     Author: Chris Kreienkamp
clear
clc

%% Set Parameters
% Create an mxn array of randomly generated integers up to nMax
nRows = 20;
nColumns = 20;
nMax = 400;
array = randi([1,nMax],nRows,nColumns);

% Create a current minimum value before checking the array
% Create an initial row and column for the minimum value
nMin = nMax;
lowrow = 0;
lowcol = 0;


%% Look through our array

% Use Nested FOR loop to find lowest number by comparing entries
% The counter variables are "irow" and "icol"
for irow = 1:nRows
    for icol = 1:nColumns
        % compare each value with variable "nMin" tracks the lowest value
        if array(irow,icol) < nMin
           nMin = array(irow,icol);
           lowrow = irow;
           lowcol = icol;
        end
    end
end


%% Display the desired output

disp(['Generated a (',num2str(nRows),' x ',num2str(nColumns),') matrix'...
    ' of integers between 1 and ',num2str(nMax),'.'])

disp(['Minimum value in the matrix was ',num2str(nMin),...
    ', which occurred at position (',num2str(lowrow),', ',...
    num2str(lowcol),').'])