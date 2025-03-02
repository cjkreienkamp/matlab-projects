function y = showGameF(handles,iComputerPlay, iHumanPlay,gameResult)
%% Homework 7, Problem 3 (Chapter 10, Problem 6)
% function  y = showGame(iComputerPlay, iHumanPlay, gameResult)
% Author: Chris Kreienkamp

if iHumanPlay == 1
    handles.humanChoice.String = 'Human played rock.';
    if iComputerPlay == 1
        handles.computerChoice.String = 'Computer played rock.';
    elseif iComputerPlay == 3
        handles.computerChoice.String = 'Computer played scissors.';
    else
        handles.computerChoice.String = 'Computer played paper.';
    end
    
elseif iHumanPlay == 2 %paper
    handles.humanChoice.String = 'Human played paper.';
    if iComputerPlay == 2
        handles.computerChoice.String = 'Computer played paper.';
    elseif iComputerPlay == 1
        handles.computerChoice.String = 'Computer played rock.';
    else
       handles.computerChoice.String = 'Computer played scissors.';
    end
    
elseif iHumanPlay == 3 %scissors
    handles.humanChoice.String = 'Human played scissors.';
    if iComputerPlay == 3
        handles.computerChoice.String = 'Computer played scissors.';
    elseif iComputerPlay == 2
        handles.computerChoice.String = 'Computer played paper.';
    else
       handles.computerChoice.String = 'Computer played rock.';
    end

end

%% SWITCH STATEMENT

switch gameResult
    case 'tie'
        handles.winner.String = ('Tie');
        b = str2double(handles.ties.String);
        handles.ties.String = num2str(b+1);
        
    case 'humanWon'
        handles.winner.String = ('Human Wins');
        b = str2double(handles.humanWins.String);
        handles.humanWins.String = num2str(b+1);      
        
    case 'computerWon'
        handles.winner.String = ('Computer Wins');
        b = str2double(handles.computerWins.String);
        handles.computerWins.String = num2str(b+1);      
end   
