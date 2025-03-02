% Experiment A2 - Galileo's Inclined Plane
% Part I: Galileo's Inclined Plane

clear
clc
clf


%% INPUT DATA

N = 5;                              % # of times each measurement repeated

% theta = 4.64 degrees
t464 = [.4686 .4764 .4664 .4660 .4651;...           % x = .10
    .7455 .7292 .7388 .7418 .7413;...               % x = .20
    .9939 .9797 .9807 .9835 .9733;...               % x = .30
    1.1776 1.1810 1.2121 1.1486 1.1473;...          % x = .40
    1.3396 1.3345 1.3394 1.3316 1.3281];            % x = .50
t1ave = mean(t464(1,:));                            % .10m Average
t2ave = mean(t464(2,:));                            % .20m Average
t3ave = mean(t464(3,:));                            % .30m Average
t4ave = mean(t464(4,:));                            % .40m Average
t5ave = mean(t464(5,:));                            % .50m Average
t464ave = [t1ave t2ave t3ave t4ave t5ave];          % Array of Averages
s464 = std(t464,0,2);                               % Standard Deviation
u464 = s464./sqrt(N-1);                         % Repeatability Uncertainty

% theta = 7.39 degrees
t739 = [.3573 .3642 .3637 .3617 .3622;...           % x = .10
    .5767 .5586 .5725 .5648 .5580;...               % x = .20
    .7491 .7602 .7510 .7323 .7444;...               % x = .30
    .8880 .9052 .8910 .8884 .8925;...               % x = .40
    1.0198 1.0242 1.0199 1.0108 1.0274];            % x = .50
t6ave = mean(t739(1,:));                            % .10m Average
t7ave = mean(t739(2,:));                            % .20m Average
t8ave = mean(t739(3,:));                            % .30m Average
t9ave = mean(t739(4,:));                            % .40m Average
t10ave = mean(t739(5,:));                           % .50m Average
t739ave = [t6ave t7ave t8ave t9ave t10ave];         % Array of Averages
s739 = std(t739,0,2);                               % Standard Deviation
u739 = s739./sqrt(N-1);                         % Repeatability Uncertainty

% distance between photogates
x = [.10 .20 .30 .40 .50];


%% FIT

f464 = fit(t464ave',x','Poly2');                    % Create fit
c464 = coeffvalues(f464);                           % Extract coefficients
e464 = confint(f464,.90);                           % 90% Fit Confidence
f739 = fit(t739ave',x','Poly2');                    % Create fit
c739 = coeffvalues(f739);                           % Extract coefficients
e739 = confint(f739,.90);                           % 90% Fit Confidence

g464 = c464(1)*14/(5*sind(4.64));                   % Value of Gravity
ee464 = (e464(2,1)-c464(1))/c464(1)*g464;           % G Uncertainty
g739 = c739(1)*14/(5*sind(7.39));                   % Value of Gravity
ee739 = (e739(2,1)-c739(1))/c739(1)*g739;           % G Uncertainty

t = linspace(0,1.4,1000);                           % Array of points
x464theor = c464(1)*t.^2 + c464(2)*t + c464(3);     % 4.64 Curve Fit
x739theor = c739(1)*t.^2 + c739(2)*t + c739(3);     % 7.39 Curve Fit


%% PLOT

% Errorbars
figure(1)  
errorbar(t464ave,x,u464,'horizontal','o','LineWidth',1.5,'MarkerSize',8)
hold on
errorbar(t739ave,x,u739,'horizontal','s','LineWidth',1.5,'MarkerSize',8)
hold off
xlabel('time, t (s)')
ylabel('distance, x (m)')
axis([0 1.4 0 0.55])
set(gca,'FontSize',16)
legend('\theta = 4.64\circ','\theta = 7.39\circ','Location', 'Northwest')

% Curve fit
figure(2)
plot(t,x464theor,t,x739theor)
hold on
errorbar(t464ave,x,u464,'horizontal','bo','LineWidth',1.5,'MarkerSize',8)
errorbar(t739ave,x,u739,'horizontal','rs','LineWidth',1.5,'MarkerSize',8)
hold off
xlabel('time, t (s)')
ylabel('distance, x (m)')
axis([0 1.4 0 0.55])
set(gca,'FontSize',16)
legend('\theta = 4.64\circ','\theta = 7.39\circ','Location', 'Northwest')