% Chris Kreienkamp
% Section 10
% 2/16/17

% Write a program that randomly assigns 1 of 5 messages to five different
% color so of 50 candy hearts
% Calculate the percentage of hearts with a certain message and color

clear
clc
rng('shuffle')  % Good programming practice when using rand or randi

%% SET PARAMETERS

% Cell array with 5 entries
% Using a cell array because the 5 strings are different lengths
messages = {'Be Mine',...
    'True Love',...
    'All Mine',...
    'BFF',...
    'You Rock'};

% Cell array with 5 entries
% Using a cell array because the 5 strings are different lengths
colors = {'white',...
    'yelow',...
    'red',...
    'purple',...
    'orange'};

numberCandies = 50;

%% CREATE STRUCTURE

% Determine the size of message cell array
sizeMessage = length(messages);

% Determine size of color cell array
sizeColor = length(colors);

% For loop to create the struct
for iCandy = 1:numberCandies
    Candy(iCandy).messages = messages(randi(sizeMessage));
    Candy(iCandy).colors = colors(randi(sizeColor));
end

%% CALCULATIONS AND DISPLAY
% Calculate the percentage of hearts with the message "Be Mine"
% Calculate the percentage of hearts that are red and "You Rock"
% Create initial variables "PofBeMine" and "PofRedandRock" to keep track of
% number of hearts

PofBeMine = 0;
PofRedandRock = 0;

for iCandy = 1:numberCandies
    if strcmp(Candy(iCandy).messages,'Be Mine')
        PofBeMine = PofBeMine + 1;
    end
end
PofBeMine = PofBeMine/numberCandies*100;
disp(['Be Mine is on, ',num2str(PofBeMine),'% of the hearts created.'])


for iCandy = 1:numberCandies
    if strcmp(Candy(iCandy).colors,'red') && ...
            strcmp(Candy(iCandy).messages,'You Rock')
        PofRedandRock = PofRedandRock + 1;
    end
end
PofRedandRock = PofRedandRock/numberCandies*100;
disp([num2str(PofRedandRock),'% of the hearts are red and have the mesage You Rock.'])


