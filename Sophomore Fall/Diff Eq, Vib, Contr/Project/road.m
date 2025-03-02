%% Initialization
clear all; close all; hold off; clc;
%%% put your NDND here for your own road. You can debug using the same
%%% number as others, but your design must be based on YOUR number. This
%%% seeds a random number generator that makes your own individual road
%%% profile. 
ndid = 901965168;

%%% select sk0 to change quality of the road
sk0 = 10/10^6;      % very good road
%sk0 = 40/10^6;     % good road
%sk0 = 160/10^6;    % average road
%sk0 = 640/10^6;    % poor road
%sk0 = 2560/10^6;   % very poor road

%%% DO NOT CHANGE ANY OF THESE!!!
minwaveno = -2; maxwaveno = 2;  
N = 61; wavenos = logspace(minwaveno,maxwaveno,N);
rng(ndid+floor(sk0+10^6*2)); phi = unifrnd(-pi,pi,1,N);  
%%% END OF DO NOT CHANGE ANY OF THESE

roadlength = 1000;  % 1km track

%%% The y() function returns the height of the road at location x.
%%% (Road height at location x) = y(sk0,wavenos,phi,x). Do not change the
%%% first three arguments because they are used to make the road shape.
x = linspace(0,1000,100000);

%%% This will plot the road profile. This will change if you change NDID or
%%% change sk0.
figure(1)
plot(x,y(sk0,wavenos,phi,x));
xlabel('Position (m)')
ylabel('Height (m)')

%%% Baseline suspension values
m = 250; k = 6000*9.81; b = 5370; g = 9.81;
v = 30; % units are m/s
t = linspace(0,roadlength/v,100000);

%%% This will plot the road vs time if you are driving at speed v
figure(2)
plot(t,y(sk0,wavenos,phi,t*v));
xlabel('Time (s)')
ylabel('Height (m)')