% Chris Kreienkamp
% Section 10
% 1/26/17

clear
clc

% Demonstrate the use of ISPRIME

%% Get user input

userN = input('Please enter a number: ');
disp(' ')

%% Check if it's prime

%i = isprime(userN)

if isprime(userN)
  % Response #1 - Prime  
  disp('Yes it''s Prime')
else
    % Response #2 - Not Prime
    disp('No it''s not Prime')
end