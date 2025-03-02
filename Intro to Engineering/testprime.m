% Chris Kreienkamp
% Section 10
% 1/26/17

clear
clc

% Create a 5x5 array of random integers between 1-100
% Ask the user for row index and then for a column index
% Display the number and tell user if it is prime

%% Create random 5x5 array
array5x5 = randi(100,5);
disp(array5x5)


%% Ask user for the row index and column index

% Ask user for the row index
rowIndex = input('Row index:   ');

% Ask user for the column index
columnIndex = input('Column index:   ');
disp(' ')


%% Display the number and tell user if it is prime

% Identify number
chosenNumber = array5x5(rowIndex,columnIndex);

% Check if it's prime

if isprime(chosenNumber)
  % Response #1 - Prime  
  disp(['The (',num2str(rowIndex),',',num2str(columnIndex),...
      ') element is ',num2str(chosenNumber),' which is prime.'])
else
    % Response #2 - Not Prime
     disp(['The (',num2str(rowIndex),',',num2str(columnIndex),...
      ') element is ',num2str(chosenNumber),' which is not prime.'])
end