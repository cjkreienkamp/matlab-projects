%% Homework 1, Problem 1 (Chapter 1, Problem 5)
%      gforce.m
%      Find the gravitational force (in Newtons) between any two people
%      Author: Chris Kreienkamp
clear
clc

%% Set parameters

% Gravitational constant G in m*m/kg/kg
G = 6.67300e-11;


%% Get input from user

% Opening statment that tells us what to expect
disp(['This program finds the gravitational force between any two people.']);
disp([' ']);

% Ask for user input
mass1 = input('Please input the kg mass of the first person: ');
mass2 = input('Please input the kg mass of the second person: ');
distance = input('Please input the meter distance between the two people: ');


%% Calculations

%Equation for gravitational force
gravforce = G*mass1*mass2/distance^2;


%% Report Value

% Empty line
disp([' ']);

% Reshow user input
disp(['For two people ',num2str(distance),...
    ' meter(s) apart with masses of ',num2str(mass1),...
    ' kg and ',num2str(mass2),' kg,'])

disp(['The gravitational force is ',num2str(gravforce),' N.'])