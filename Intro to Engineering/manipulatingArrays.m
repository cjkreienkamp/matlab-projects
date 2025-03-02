% Chris Kreienkamp
% Section 10
% 1/24/17

% Manipulating Arrays

clear
clc

%% Define Array

% Define a 4x3 array
arrayA = [24 9 25 10; 7 6 16 5; 25 17 2 6];
disp(arrayA);


%%  Display the second column

disp(arrayA(:,2));
disp(arrayA(1:3,2));


%% Display the third row

disp(arrayA(3,:));


%% Change all values of 25 to 0

clc
disp(arrayA)
arrayA(1,3) = 0;
arrayA(3,1) = 0;
disp(arrayA)


%% Create a new array "arrayB"
arrayB = arrayA(2:3,1:2);
disp(arrayB);