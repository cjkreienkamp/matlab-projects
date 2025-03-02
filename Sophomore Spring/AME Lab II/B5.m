% Chris Kreienkamp, 901965168
% Fri Feb 23 2018
% AME 20217, Experiment B5 - Build-A-Beam

clear
clf
clc


%% load vs displacement
data = xlsread('CK');
load = data(:,1)*100;       % lbf
disp = data(:,2)*1.724;     % in
plot(disp,load,'r.','MarkerSize',10);
xlabel('Displacement (in)'); ylabel('Load (lbf)')
set(gca,'FontSize',18);
axis([0 1.9 0 35]);


%% important parameters
linForce = 22.79;      % max force for linear response
linDisp = 0.8176;        % max deflection for linear response
maxForce = 30.3369;     % max force carried by beam
maxDisp = 1.1831;       % deflection at max force
stiff = (linForce-1.216)/(linDisp-0.2755);
