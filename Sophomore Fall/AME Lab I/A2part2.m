% Experiment A2 - Galileo's Inclined Plane
% Part II: The Brachistochrone

clear
clc
clf


%% INPUT DATA

N = 5;                              % # of times each measurement repeated

% distance between photogates (m)
x = [.180 .410 .636 .850 1.000 1.230];

% Time for ball to roll through photogates
t = [.3837 .3976 .3822 .3934 .3935;...                      % .180 m
    .4901 .5030 .4970 .4973 .5091;...                       % .410 m
    .5357 .5502 .5441 .5537 .5500;...                       % .636 m
    .5667 .5636 .5647 .5609 .5632;...                       % .850 m
    .5866 .5905 .5834 .5802 .5836;...                       % 1.000 m
    .6080 .6157 .6146 .6265 .6127];                         % 1.230 m

t1ave = mean(t(1,:));                                       % .180 Average
t2ave = mean(t(2,:));                                       % .410 Average
t3ave = mean(t(3,:));                                       % .636 Average
t4ave = mean(t(4,:));                                       % .850 Average
t5ave = mean(t(5,:));                                       % 1.000 Average
t6ave = mean(t(6,:));                                       % 1.230 Average
tave = [t1ave t2ave t3ave t4ave t5ave t6ave];   % Array of Averages
s = std(t,0,2);                                 % Standard Deviation
u = s./sqrt(N-1);                               % Repeatability Uncertainty

%% PLOT 
 
errorbar(tave,x,u,'horizontal','o','LineWidth',1.5,'MarkerSize',8)
xlabel('time, t (s)')
ylabel('distance, x (m)')
%axis([0 1.4 0 0.55])
set(gca,'FontSize',16)