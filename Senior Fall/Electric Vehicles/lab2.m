% Chris Kreienkamp - 901965168
% AME 40472 - Electric and Hybrid Vehicles
% Lab 2: Mechanical Drivetrain and Energy Conversion

clear
clc
clf



%% SET PARAMETERS
speed1 = [0 204 411 591];                       % [RPM]
inputpower = [0 123 317 490];                   % [W]
speed2 = [0 204 411 591];                       % [RPM]    
current2 = [0 20.4 27.2 31.5];                  % [A]
torque2 = current2*19/100;                      % [N*m]
fit2 = fit(speed2',torque2','poly2');
fit1 = fit(speed1',inputpower','poly2');
speed3 = linspace(0,1000,1000);
a = coeffvalues(fit1);
b = coeffvalues(fit2);


%% PLOT
figure(1)
plot(speed1,inputpower,'b.','MarkerSize',15); hold on
plot(speed3,a(1).*speed3.^2+a(2).*speed3+a(3),'r-');
set(gca,'FontSize',18)
xlabel('speed (RPM)'); ylabel('power (W)');
axis([0 1000 0 1000])

figure(2)
plot(speed2,torque2,'b.','MarkerSize',15); hold on
plot(speed3,b(1).*speed3.^2+b(2).*speed3+b(3),'r-');
set(gca,'FontSize',18)
xlabel('speed (RPM)'); ylabel('torque (N\cdot m)');
axis([0 600 0 6])