%% Homework 4, Problem 5
%      ComputerGuessNumber.m
%      Program that plays the guessers side of the number guessing game
%      Author: Chris Kreienkamp
clear
clc
 
 
%% Set Parameters

% Ask user to choose a number between 1 and 20
disp('Think of a number between 1 and 20, but don''t tell me!')
disp('I''m going to keep guessing a number until I get it.')
disp('Let''s play!')
disp(' ')

% Initialize WHILE statement boolean variable
computerWrong = true;

% Create two variables to help aid the computer in choosing a number
lowLimit= 0;
highLimit= 21;

% Computer takes its first guess, the middle of the range
% IF YOU CHANGE THE LIMITS keep or take out the -1 in order to get an
% integer
compGuess = (lowLimit + highLimit - 1)/2;


%% Computer Guesses
while computerWrong
    
    % Computer guesses
    disp(['I guess ',num2str(compGuess),'.'])
    
    % Ask for user input for if the answer is high, low, or right
    userResponse=input('Too low (l), too high (h), correct (c): ','s');
    
    switch userResponse
        case 'h'                            % too high
        highLimit = compGuess;
        
        case 'l'                            % too low
        lowLimit = compGuess;
        
        case 'c'                            % correct
        computerWrong = false;              % WHILE loop ends
    end
    
    % Computer adjusts limits
    compGuess=randi([lowLimit+1,highLimit-1],1);
    
end


%% Computer Celebrates
disp(' ')
disp('Yay I picked the right answer!')