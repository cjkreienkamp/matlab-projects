% Jason Grant
% University of Notre Dame
% First Year Engineering
% Spring 2014
% SimpleBlackJack.m
%
% Simple BlackJack uses a number of simplified assumptions to play
% the card game BlackJack. In this game, the Ace only can have the
% value 11 (cannot be used as a 1. Face cards have the same value. 
% Ties are treated treated as wins.

function results = SimpleBlackJackF(handles)

%% Create a deck of cards

% 2 through 10 value cards, face cards, ace for each suit
suit = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11];

% Combine four suits to make a deck
deck = [suit, suit, suit, suit];

% Use random sampling to shuffle the deck
shuffledcards = randsample(deck,52);

% iter is the iterator for the deck of cards
% its value increases after every time that it is called
iter = 1;

%% Draw Random Cards

% Set each users hand to zero
p1 = 0;
p2 = 0;
p3 = 0;

% If considering a game that doesn't shuffle on every hand,
% you would want to check to see if there are at least enough
% cards here for each player to be dealt two cards
% if 52 - iter > numPlayers * 2

% Deal each player 2 cards
for k=1:2
    
    % Card is drawn for player 1
    p1 = p1 + shuffledcards(iter);
    iter = iter + 1;
    
    % Card is drawn for player 2
    p2 = p2 + shuffledcards(iter);
    iter = iter + 1;
    
    % Card is drawn for player 3
    p3 = p3 + shuffledcards(iter);
    iter = iter + 1;
end

%% Three rules for playing

% Use a boolean variable to decide if a player wants another card or not
% Initially set them all to true. Hands will be evaluated after the first
% iteration
deal1 = true;
deal2 = true;
deal3 = true;

p1thresh = str2double(handles.player1Text.String);
p2thresh = str2double(handles.player2Text.String);
p3thresh = str2double(handles.player3Text.String);

% Continue deal until every player has enough cards
% How would you handle if the cards ran out?
while (deal1 || deal2 || deal3)
    
    % Simple Strategy 1
    % Player 1 (p1) will continue to hit while its value is less than 14
    if (p1 < p1thresh)
        % Take another Card
        p1 = p1 + shuffledcards(iter);
        iter = iter + 1;
    else
        deal1 = false;  
    end
    
    % Simple Strategy 2
    % Player 2 (p2) will continue to hit while its value is less than 15
    if (p2 < p2thresh)
        % Take another Card
        p2 = p2 + shuffledcards(iter);
        iter = iter + 1;
    else
        deal2 = false;
    end
    
    % Simple Strategy 3
    % Player 3 (p3) will continue to hit while its value is less than 16
    if (p3 < p3thresh)
        % Take another Card
        p3 = p3 + shuffledcards(iter);
        iter = iter + 1;
    else
        deal3 = false;
    end
    
end

%% Determining a winner

% Place the three hands in a array
outcomes = [p1, p2, p3];
% Eliminate values greater than 21
I = outcomes <= 21;
outcomes = outcomes(I);
% Take the max of the remaining values. Winning hand must
% be equal to that value
winValue = max(outcomes);

% Save the winning state
w1 = 0;
w2 = 0;
w3 = 0;

% Rules for Player 1 winning
if (p1 == winValue)
%    disp('Player 1 is a winner');
    w1 = 1;
end

if (p2 == winValue)
%    disp('Player 2 is a winner');
    w2 = 1;
end

if (p3 == winValue)
%    disp('Player 3 is a winner');
    w3 = 1;
end

results = [w1, w2, w3];