% Chris Kreienkamp
% Section 10
% 2/9/17

% Computer generates a random integer between 1 and 20 and asks for guess
% If guess is not equal, the computer tells user if guess is too low or too
% high and asks for another guess
% When guess is right, the computer congratulates the user and ends the
% game

clc
clear


%% SET PARAMETERS

% Generate random integer
answer = randi([1,20],1,1);

% Ask user for first guess
guess = input('Pick a number between 1 and 20: ');


%% PLAY GUESSING GAME

while guess ~= answer
    if guess < answer
        % Too low condition
        guess = input('You guessed too LOW. Pick again! ');
        
    else
        % Too high condition
        guess = input('You guessed too HIGH. Pick again! ');
    end
end


%% CONGRATULATE USER

disp('CONGRATULATIONS! You picked the right number!');




