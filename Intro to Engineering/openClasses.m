%% Homework 5, Problem 5
%       openClasses.m
%       Creates a structured array of school classes
%       Checks if a class has at least 5 open spots
%       Author: Chris Kreienkamp
clear
clc

%% Set Up Values

% Create Structured Array called "class"
% There are 4 "fields" associated with the structured array:
% Fields:  title, number, maxSeats, and enrolled

class(1).title = 'Introduction to Engineering';
class(1).number = 10111;
class(1).maxSeats = 45;
class(1).enrolled = 32;

class(2).title = 'Computers in Psychology';
class(2).number = 20000;
class(2).maxSeats = 28;
class(2).enrolled = 25;

class(3).title = 'Writing and Rhetoric';
class(3).number = 12100;
class(3).maxSeats = 14;
class(3).enrolled = 14;

class(4).title = 'Beginning Spanish';
class(4).number = 10101;
class(4).maxSeats = 19;
class(4).enrolled = 13;

class(5).title = 'Introduction to Africana Studies';
class(5).number = 20082;
class(5).maxSeats = 36;
class(5).enrolled = 32;

%% Display Output #1

% Display all classes with at least 5 open spots;
% Use FOR loop to run through the entire structured array (all 5 entries)
% Use IF to search through fields (maxSeats, enrolled)
% For TRUE condition, output the field (title, number) for that class

Nclasses = 5;
disp('Classes with at least 5 open spots are:')
disp(' ')
for iC = 1:Nclasses
    openSeats=class(iC).maxSeats - class(iC).enrolled;
   if openSeats >= 5
       disp([class(iC).title,'    ',num2str(class(iC).number)])
   end
end