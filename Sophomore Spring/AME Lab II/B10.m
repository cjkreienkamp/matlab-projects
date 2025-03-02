% Chris Kreienkamp, 901965168
% Sun Apr 15, 2018
% AME 20217
% Experiment B10 - Pumps and Turbines

clear
clf
clc



%% PUMP CURVE
height = [0 10 20 30 40 50 60 70 92]./100*3.28084;  % (ft)
volume = 0.264172*ones(1,9);                        % (gallons)
times = [9.34,9.51,10.08;
    10.75,11.12,10.95;
    11.76,11.52,11.06;
    13.09,12.71,12.71;
    13.96,14.64,13.93;
    16.59,16.32,16.59;
    18.97,18.40,18.56;
    23.90,22.59,23.02];
time = ones(1,9);
time(1,9) = 1e20;
for i = 1:8
    time(i) = mean(times(i,:));
end
flowrate = volume./time*3600;               % (GPH)
    
figure(1)
plot(flowrate,height,'ro','LineWidth',3,'MarkerSize',10)
xlabel('flow rate (GPH)'); ylabel('pressure head (ft of water)');
set(gca,'FontSize',18)
axis([-10 105 -.25 3.5])



%% PUMP EFFICIENCY CURVE
height_metric = height./3.28084;
flowrate_metric = ones(1,9)./1000./time;
density = 1000;
g = 9.8;
Phyd = density*g*height_metric.*flowrate_metric;
Pins = [6.9,6.9,6.9;
    6.8,6.8,6.8;
    6.9,7.0,6.8;
    6.7,6.7,6.8;
    6.7,6.8,6.8;
    6.6,6.6,6.6;
    6.5,6.5,6.5;
    6.5,6.6,6.5];
Pin = ones(1,9);
Pin(9) = 6.2;
for i = 1:8
    Pin(i) = mean(Pins(i,:));
end
n = Phyd./Pin*100;

figure(2)
plot(flowrate,n,'ro','LineWidth',3,'MarkerSize',10)
xlabel('flow rate (GPH)'); ylabel('pump efficiency (%)');
set(gca,'FontSize',18)
axis([35 105 -.25 5.5])







