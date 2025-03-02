% Chris Kreienkamp
% Section 10
% 1/31/17

% Create a special 5x5 matrix using the magic command
% Use a FOR loop to sum all of the entries in a row, column, and diagonal

clear
clc


%% Create Matrix

% Size of the matrix
% It's better practice to declare matrix variables at the top of the
% program because the values will be used throughout the program
magicsize = 5;

% Create a 5x5 "magic" matrix
xVals = magic(magicsize);
disp('The values of the Magic Matrix are: ')
disp(xVals)
disp(' ')


%% Sum a Row

% Randomly pick a row
xrow = randi(5);

% rowSum is our accumulation variable
% Set the initial value to 0
rowSum = 0;

% FOR loop used to sum the lements of the row
% "icol" is the counter variable
for icol = 1:magicsize
    rowSum = rowSum + xVals(xrow,icol);
end

% Display Answer
disp(['The sum of row ',num2str(xrow),' is ',num2str(rowSum),'.'])


%% Sum a Column

% User pick a column
xcolumn = input('Pick a column in the matrix: ');

% Initiate the accumulation variable "colSum"
colSum = 0;

% FOR loop is used to sum the elements in a column
% "irow" the counter variable
for irow = 1:magicsize
    colSum = colSum + xVals(irow,xcolumn);
end

% Display Answer
disp(['The sum of column ',num2str(xcolumn),' is ',num2str(colSum),'.'])


%% Sum a Diagonal

% Sume elements in the top-left to bottom-right diagonal
% "diagonalSum" is the accumualation variable
% "ix" is counter variable within the FOR loop

% Initialize the accumulation variable
diagonalSum = 0;

% Make our loop
for ix = 1:magicsize
    diagonalSum = diagonalSum + xVals(ix,ix);
end

% Display Answer
disp(['The sum of the diagonal is ',num2str(diagonalSum),'.'])