% Chris Kreienkamp
% Section 10
% 1/26/17

clear
clc

% Ask the user for their age
% Return a phrase or comment based on their age
% Four possible comments

%% Gets Input

%age = input('How old are you?   ');
%disp (' ')

% Program with a random input
age = randi([0,100]);
disp(['Your age is ', num2str(age)]);
disp(' ')

%% Respond to User

% Set up a conditional IF statement
% Four different responses - therefore we need ESLEIF

if age < 3
   % Response #1 
   disp('You are just a toddler. How can you use MATLAB?')
elseif age <= 18
    % Response #2
    disp('Do you like living with your parents?')
elseif age <= 21
    % Response #3
    disp('Are you a student at ND? You should major in engineering.')
else
    % Resonse #4
    % Because this is the ELSE - it will catch everything left over here
    disp('Oh ... you''re old like Dr. Smith!')
end
