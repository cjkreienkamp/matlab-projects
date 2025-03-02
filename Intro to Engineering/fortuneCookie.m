% Chris Kreienkamp
% Section 10
% 2/16/17

% Write a program that randomly selects 1 of 5 messages
% Display a message each time the program runs

clear
clc
rng('shuffle')  % Good programming practice when using rand or randi

%% SET PARAMETERS

% Cell array with 5 entries
% Using a cell array because the 5 strings are different lengths

message = {'Pursue your wishes aggressively',...
    'You will be successful in love',...
    'You will be rewarded for your efforts',...
    'The greatest risk is not taking a risk',...
    'Wealth awaits you very soon'};

%% SELECT AND DISPLAY MESSAGE

% Determine the size of the cell array
sizeMessage = length(message);

% Generate that many random numbers
N = randi(sizeMessage);

% Display the message that is selected
disp(message(N))