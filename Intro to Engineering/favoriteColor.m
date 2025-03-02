% Chris Kreienkamp
% Section 10
% 1/31/17

% Write a program that asks for the user's favorite color
% Program will return a few comments

clear
clc


%% Ask for User Input

% Ask for user input
inputColor = input('What is your favorite color? ','s');

% Converts user input to all lowercase
% We did this to eliminate case sensitivity of input
userColor = lower(inputColor);


%% Return Comment

switch userColor
    case 'blue'
        % Comment #1
        disp('The sky is blue.')
    case 'red'
        % Comment #2
        disp('Mars looks red.')
    case 'green'
        % Comment #3
        disp('Notre Dame has special green football jerseys.')
    otherwise
        % Comment #4
        disp('Don''t you mean blue, red, or green?')
end