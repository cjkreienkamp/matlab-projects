function plotBirthDayF(handles)
% Plots the probability that a group of "N" people will 
% include at least 2 people with the same birthday.
%    
% Uses two user-defined functions:
%       1. birthDayProbability(Npeople, Ntrials)
%       2. vectorHasMatch(v)

rng('shuffle'); 

%% Set Parameters

Nmax = str2double(handles.NmaxText.String);          % Maximum number of people in the class
Narray = 1:Nmax;    % Creates array from 1 to max number of people in class
Nsamples = str2double(handles.NsamplesText.String);     % Number of samples that will be tested

%% Tabulate Probabilities

% Initialize vector used to store probabilities as an array of 0's
P = zeros(1,Nmax);    

hwb=waitbar(0,'Calculating...','Name','Time Marching');
for n = 1:Nmax
   
    waitbar(n/Nmax,hwb);
    
    % Set  number of people in  class to the current value of the loop
    Npeople = Narray(n);
    
    % Uses the user-defined function to return the probability of a match
    P(n) = birthDayProbability(Npeople,Nsamples); 

end
close(hwb)

%% Generate Plot

bar(handles.plotAxes,P)                    % Creates a bar graph of the probabilities 
axis([2 (Nmax+1) 0 1]);  % Sets the axis 
grid on                   % Adds grid 
xlabel(handles.plotAxes,'N people');       % Add appropriate labels 
ylabel(handles.plotAxes,'Probability')
title(handles.plotAxes,'Same-birthday probability');
