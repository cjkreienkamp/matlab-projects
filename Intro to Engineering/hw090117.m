%% Mechanics I Homework 9/1/17
% 901965168
% Chris Kreienkamp

%% Set Vectors
A = [-2; -5; 1];
B = [5; 1; -6];
C = [3; -8; 3];
D = [-5; 0; 4];
E = [-4; 6; -1];
F = [6; -3; 7];
G = [0; 5; 2];


%% Problem 10
tenA = A+B;
tenB = C+D;
tenC = D-E;
tenD = B+G;
tenE = A+(F-G);

%% Problem 11
% Name includes extra letter from here forward to account for easier
% reading in the workspace through alphabetization
uelevenA = dot(A,B);
uelevenB = dot(C,D);
uelevenC = dot(D,E);
uelevenD = dot(B,-G);

%% Problem 12
vtwelveA = cross(A,B);
vtwelveB = cross(C,D);
vtwelveC = cross(D,E);
vtwelveD1 = cross(F,B);
vtwelveD = cross(vtwelveD1,-G);

%% Problem 13
% As in problem 12D, cross product must be taken two vectors at a time.
thirteenA1 = cross(A,B);
thirteenA2 = cross(thirteenA1,C);
thirteenA3 = cross(thirteenA2,G);
thirteenA4 = cross(thirteenA3,F);
thirteenA5 = cross(thirteenA4,D);
wthirteenA = cross(thirteenA5,E);

thirteenB1 = cross(D,-C);
thirteenB2 = cross(thirteenB1,B);
thirteenB3 = cross(thirteenB2,F);
thirteenB4 = cross(thirteenB3,G);
thirteenB5 = cross(thirteenB4,-D);
wthirteenB = cross(thirteenB5,E);


%% CLEAR UNEEDED ENTRIES IN WORKSPACE
clear A B C D E F G
clear vtwelve D1
clear thirteenA1 thirteenA2 thirteenA3 thirteenA4 thirteenA5
clear thirteenB1 thirteenB2 thirteenB3 thirteenB4 thirteenB5