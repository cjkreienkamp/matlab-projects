% Chris Kreienkamp
% Section 10
% 3/7/17
% Olympics.m

clear
clc


%% Part 1 -- Set up and Load Data
medalCount = load('Olympics.txt');


%% Part 2 -- Determine High Gold Percentages

gold = medalCount(:,1);
silver = medalCount(:,2);
bronze = medalCount(:,3);

N = ([sum(gold), sum(silver), sum(bronze)]);

% counts number of countries
overFiftyGold = 0;

for irow = 1:1:20
    % total number of medals for one country
    medalsCountry = gold(irow) + silver(irow)+ bronze(irow);
    % total number of gold for one country
    goldCountry = gold(irow);
    % goldCountry/medalsCountry > .50
    percentGold = goldCountry / medalsCountry;
    if percentGold > 0.50
        overFiftyGold = overFiftyGold + 1;
    end
end

disp(['The number of countries that has greater than 50% of their medals ',...
    'that are gold is ', num2str(overFiftyGold),'.']);
disp(' ')


%% Part 3 -- Reporting on Medals Awarded

userMedal = input(['What type of medal do you want to learn more about?', ...
    ' Enter g for gold, s for silver, or b for bronze. '],'s');

% this keeps track of the total number of medals for which the user
% requested
totNumResponse = 0;

for irow = 1:1:20
    % calculate # of bronze, silver, and gold medals
    if strcmp(userMedal,'g')
        totNumResponse = totNumResponse + gold(irow);
    elseif strcmp(userMedal,'s')
        totNumResponse = totNumResponse + silver(irow);
    elseif strcmp(userMedal,'b')
        totNumResponse = totNumResponse + bronze(irow);
    end
end

disp(['The total number of that medal type was ', num2str(totNumResponse),'.'])
disp(' ')


%% Part 4 -- Reporting on Medal Count for a Country

userCountry = input('Pick a number between 1 and 20 to learn about a country''s performance! ');

while userCountry < 1 || userCountry > 20
    userCountry = input('Choose a number between 1 and 20! ');
end

% Total number of gold, silver, and bronze medals for a country
countrySum = gold(userCountry) + silver(userCountry) + bronze(userCountry);

disp(['Country ',num2str(userCountry),' earned a total of ',num2str(countrySum),' gold, silver, and bronze medals.'])