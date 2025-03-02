% Chris Kreienkamp
% Section 10
% 1/31/17

% Write a program that simulates N rolls of a pair of dice and creates
% a bar chart with the percent frequency of each roll score
clear
clc

%% Set Parameters

% "N" keeps track of how many times the two dice are rolled
N = 200;

% Create 1x12 array keeping track of how many times you roll the dice
sumTracker = zeros(1,12);

%% Keep track of how many times each sum is rolled

% Use FOR loop to track the accumulation of "diceSum"
% "iroll" is the counter variable
for iroll = 1:N
    dice1 = randi(6);            % simulate one dice roll
    dice2 = randi(6);            % simulate a second dice roll
    diceSum = dice1 + dice2;     % find the sum of the two dice
    sumTracker(diceSum) = sumTracker(diceSum) + 1;
end

%% Calculate percent frequency and plot

% percent frequency is the number of times a sum is rolled divided by the
% total number of rolls
sumTracker = sumTracker / N;

% Plot data as a bar chart
bar(sumTracker)

% label axes, title, grid
xlabel('Dice Pair Score')
ylabel('Frequency (%)')
title('200 runs')
grid on

% set the y-axis to only go up to 22 percent
axis([0,13,0,.22])




