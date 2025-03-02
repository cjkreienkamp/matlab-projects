function runSimpleBlackJackF(handles)
% Jason Grant
% University of Notre Dame
% First Year Engineering 
% Spring 2014

%% BlackJack - determining a best strategy using multiple Simulations

% Define the number of simulations you want to run
numTrials = str2double(handles.nHandsText.String);
% Initially, each player starts the game with zero wins
wins = [0, 0, 0];

for iter=1:numTrials
    % Consider having input arguments of the deck and the iterator.
    % if iterator reaches the end of the deck, then create another
    % function to reshuffle. The deck and iter would need to returned
    wins = wins + SimpleBlackJackF(handles);
end

bar(handles.winAxes, wins);
ylabel(handles.winAxes, 'Number of Wins');

% Determines the position containing the max value
winner = find(wins == max(wins));

handles.winnerText.String = ['Player ', num2str(winner), ' had the most wins'];

%% Setting statistics 

wins_avg = round(wins./sum(wins)*100, 1);
stat_data_table = [wins;wins_avg]';
set(handles.summaryTable,'Data',stat_data_table);