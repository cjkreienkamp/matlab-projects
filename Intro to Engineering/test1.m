%% Homework 5, Problem 2 (Chapter 7, Problem 6)
% test1.m
% Use the function fymby and a FOR loop to produce a tabular output of your
% age in the years from 2009 to 2050
% Author: Chris Kreienkamp
clear
clc

%% SET PARAMETERS
firstYear = 2009;
lastYear = 2050;
yearofBirth = 1998;

%% CREATE FOR LOOP
% counter variable "iYear"
for iYear = firstYear:lastYear
    y = fymby(iYear,yearofBirth);
    disp(['In ',num2str(iYear),' I will turn ',num2str(y),'.'])
end