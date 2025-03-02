function y = processRPSF(handles,iHumanPlay)

%% Homework 7, Problem 3 (Chapter 10, Problem 6)
% processRPSF.m
% Sets a variable iHumanPlay to 1, 2, or 3, representing choices rock,
% paper, or scissors
% Picks the computer's choice, represented by iComputerPlay using randi
% Decides who won based on the usual rules and sets a string variable
% gameResult to either computerWon, humanWon, or tie
% Calls the function showGame
% Author: Chris Kreienkamp

iComputerPlay = randi([1,3]);

if iHumanPlay == 1 %rock
    if iComputerPlay == 1
        gameResult = ('tie');
    elseif iComputerPlay == 3
        gameResult = ('humanWon');
    else
        gameResult = ('computerWon');
    end
    
elseif iHumanPlay == 2 %paper
    if iComputerPlay == 2
        gameResult = ('tie');
    elseif iComputerPlay == 1
        gameResult = ('humanWon');
    else
       gameResult = ('computerWon');
    end
    
elseif iHumanPlay == 3 %scissors
    if iComputerPlay == 3
        gameResult = ('tie');
    elseif iComputerPlay == 2
        gameResult = ('humanWon');
    else
       gameResult = ('computerWon');
    end

end

showGameF(handles,iComputerPlay,iHumanPlay,gameResult)