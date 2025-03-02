% Chris Kreienkamp
% Section 10
% 1/31/17

% Creat a program that takes an initial balance and accrues interest
% yearly
% We will find the balance of the account over 30 years
% Plot our results

clear

clc


%% Set Parameters

% Total years that account will exist
totalYears = 30;

% Create an array that's "1 x totalYears"
years = 1:totalYears;

% Annual interest
rate = 0.08;

% Set our initial balance
initialBalance = 1000;


%% Initialize Array

% Create an array of all 0's as the initial balance
% This will be the acccumulation variable
% Let's call this "balance"
Balance = zeros(1,totalYears);

% Set our initial balance
Balance(1) = initialBalance;


%% Calculate Balances

% Use FOR loop to track the accumulation of "Balance"
% Loop starts with "2" because ...
% "iyears" is the counter variable

for iyears = 2:totalYears
    Balance(iyears) = Balance(iyears-1) + rate*Balance(iyears-1);
end


%% Plot Results

% Basic Plot
plot(years,Balance,'o-')
xlabel('Time (years)')
ylabel('Total Balance ($)')
title('My Money')
grid on