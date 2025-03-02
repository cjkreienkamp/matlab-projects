%% Homework 4, Problem 4 (Chapter 5, Problem 18)
%      rps3.m
%      Program that plays the game rock-paper-scissors with the user
%      Author: Chris Kreienkamp
clear
clc
 
 
%% Set Parameters

% Ask user to play
disp('Do you want to play rock, paper scissors with me?')
disp('Choose q when you want to quit playing.')
disp(' ')

% Create counter variable for keeping track of wins and losses
win = 0;
loss = 0;

% Initialize variable 'quit' for the while loop
quit = false;


%% Play the Game

% Create WHILE statement to have a continuous game until 'q' is pressed
% Create IF statement to run through different cases
% Compare to the computer choice
while ~quit
    
    % Ask user for a choice
    userChoice=input('Choose r, p, or s: ','s');
    
    % Generate computer's choice, with 1=rock, 2=paper, 3=scissors
    compChoice=randi(3);
    
if strcmp(userChoice,'r') %rock
    if compChoice == 1;
        disp('Tie')
    elseif compChoice == 3;
        disp('You win!')
        win = win+1;
    else
        disp('You lost :(')
        loss = loss+1;
    end
    
elseif strcmp(userChoice,'p') %paper
     if compChoice == 2;
        disp('Tie')
    elseif compChoice == 1;
        disp('You win!')
        win = win+1;
    else
        disp('You lost :(')
        loss = loss+1;
    end
    
elseif strcmp(userChoice,'s') %scissors
     if compChoice == 3;
        disp('Tie')
    elseif compChoice == 2;
        disp('You win!')
        win = win+1;
    else
        disp('You lost :(')
        loss = loss+1;
     end
  
elseif strcmp(userChoice,'q') %end the program
    quit = true;
     
end

% Display wins and losses
disp(['SCORE     Human: ',num2str(win),'     Computer: ',num2str(loss)])
disp(' ')

end


%% End game
disp('Game Over. Thank you for playing.')
