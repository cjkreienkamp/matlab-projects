% Chris Kreienkamp
% Section 10
% 2/2/17

% Create a 5x4 array of random integers between 1 and 50
% Find all the prime numbers in the array
clear
clc

%% SET PARAMETERS

% Define our array size
rowNum = 5;
colNum = 4;

% Generate the array
myArray = randi(50, [rowNum,colNum]);
disp('The values of my array are: ')
disp(myArray)


%% LOOK THROUGH OUR ARRAY

% Use Nested FOR loop to find prime numbers in an array
% The counter variables are "irow" and "icol"
% Use ISPRIME to identify if the numbers are prime
% Using an IF statement, track the quantity of prime numbers
% The accumulation variable is "nprime"
% This will track the quantity of prime numbers

% Inititalize the accumulation variable
nprime = 0;

for irow = 1:rowNum
    for icol = 1:colNum
        if isprime(myArray(irow,icol))
            nprime = nprime + 1;
        
        end
    end
end


%% DISPLAY OUR RESULTS

disp(['The number of prime numbers in the array is ',...
    num2str(nprime),'.'])




