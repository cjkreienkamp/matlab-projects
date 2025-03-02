% Chris Kreienkamp
% Section 10
% 1/26/17

clear
clc

% Ask user for the distance to their destination
% Determine if they can ride a bike
% Print out a suggested mode of transportation

%% Get user input

userDistance = input('How many miles away is your destination?   ');


%% Determine if they can ride a bike

% Can ride a bike if they are within 50 miles
if userDistance <= 50
    disp ('You can ride a bike to your destination.')
else
    disp ('Your destination is too far away to ride a bike.')
end 

%% Suggest a mode of transportation

if userDistance <= 2
    % Walking response
    disp('Suggested mode of transportation: Walking')
elseif userDistance <= 20
    % Biking response
    disp('Suggested mode of transportation: Biking')
elseif userDistance <= 350
    % Driving (car) response
    disp('Suggested mode of transportation: Driving')
else
    % Flying (plane) response
    disp('Suggested mode of transportation: Flying')
end