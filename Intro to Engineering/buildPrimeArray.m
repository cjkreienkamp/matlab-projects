1% Chris Kreienkamp
% Section 10
% 2/2/17

% This program builds array of prime number inside a FOR loop
% Within the FOR loop we generate a random integer
% If the number is prime, it will be added to an array

clear
clc

%% SET PARAMETERS

% Define the number of simulations (or loop iterations)
N = 50;

% Define the maximum value for the random number
nMax = 100;


%% BUILD ARRAY OF PRIME NUMBERS

% Need to track the quantity of prime numbers we find
% "numPrimes" is the accumulation variable
% Let's intitialize this variable as 0
numPrimes = 0;

% "iCount" is the counter variable
% This will track the number of passes thru the loop
for iCount = 1:N
    
    % Generate a random number
    randNum = randi (nMax);
    
    % Use ISPRIME to identify if the numbers are prime
    % Using an IF statement, track the quantity of prime numbers
    if isprime (randNum)
        
        % Increment accumulation variable "numPrimes"
        numPrimes = numPrimes + 1;
        
        % "primeArray" is a storage variable
        % This will store values of the prime numbers
        % MATLAB will grow "primeArray" as needed
        % This will take more computational time than initializing array
        % But remember, we don't know how big "primeArray" will be
        primeArray(numPrimes) = randNum;
    end
    
end

%% DISPLAY OUTPUT

% Display the quanitity of prime numbers found in the simulation
disp(['The quantity of prime numbers was ',num2str(numPrimes),'.'])
disp(' ')

% Display the array of prime numbers found in the simulation
disp(primeArray)