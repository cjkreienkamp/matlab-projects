% Chris Kreienkamp
% Section 10
% 2/9/17

% Simulate roulette game betting always on black
% We'll track the number of spins of the wheel (making money up to spin x)
% We'll also track the "stash" or the money available BEFORE the spin
% We'll plot stash vs. spin

% The variable "stash(k)" is the remaining money BEFORE the k-th spin
% For example:
% Stash - 100 90 80 90
% Spin -  1   2  3  4

clc
clear
rng('shuffle')  % Way of "seeding" random numbers based on current time


%% SET INITIAL PARAMETERS

% Probability of winning if you bet on black
Pwin = 18/38;

% Set initial stash and wager
stash = 100;    % dollars
bet = 10;       % dollars

% Initialize variables used to spin the wheel
spin = 1;       % Storage Variable - tabulate number of spins of wheel
ispin = 1;      % Counter Variable - Used for condition statements in loop


%% PLAY ROULETTE

% WHILE statement used to play the game
% Checking to see if there is enough money available to bet
% If WHILE loop is TRUE - continue playing
% If WHILE loop is FALSE - stop playing and game ends
% The WHILE loop will end when the conditional is false
while stash(ispin) >= bet
   
    % Spin the wheel
    r = rand;               % Generate number between 0 and 1
    ispin = ispin + 1;      % Increase or increment COUNTER variable 
    spin(ispin) = ispin;    % Increase size of "spin" array to track spins
    
    % Determine the result of the spin (win or lose)
    if r <= Pwin
        % WINNING CONDITION
        % Purpose - add money bet to available stash
        % Logic - because "ispin" is updated before the IF statement
        %         the "ispin-1" is the stash available before current spin
        %         and "ispin" is the stash available after current spin
        stash(ispin) = stash(ispin-1) + bet;
        
    else
        % LOSING CONDITIION
        % Purpose - sutract money bet from available stash
        stash(ispin) = stash(ispin-1) - bet;
        
    end
    
    % Plot results
    % LINE 62 is plotting current spin/stash
    plot(spin(ispin),stash(ispin),'ro',...
        spin(1:ispin),stash(1:ispin),'b-')
    
    % Control of plot and labels
    xlabel('Spin Number')
    ylabel('Stash ($$$)')
    title('Roulette Simulator')
    
    % Update our axis
    axis([0 1.1*ispin 0 inf])   % "inf" will autoscale (ymax for this case)
    
    % Add a line for initial stash
    line([0 ispin],[stash(1) stash(1)],'Color','r')
    
    % Update a figure for animation ... duh Dr. Smith
    drawnow
    
end






% Use an IF statement to determine if we won
% IF TRUE - 