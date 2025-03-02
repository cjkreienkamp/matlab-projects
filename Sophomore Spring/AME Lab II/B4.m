% Chris Kreienkamp, 901965168
% Fri Feb 16 2018
% AME 21217, Experiment B4 - Buckling

clear
clf
clc


%% load vs displacement
w = .996;
t = .119;
L = 11+7/8;
I = w*t^3/12;          % in^4
E = 10*10^3;        % kips / in^2        
Pcr = E*I*4*pi^2/L^2*1000;   % lbf
data = xlsread('AR.xls');
axial = data(:,3)*1.94076;
transverse = data(:,2)*.1946;
load = data(:,1)*100/Pcr;

figure(1)
plot(axial,load,'r-','LineWidth',3)
xlabel('Axial Displacement (in)'); ylabel('Load (unitless)')
set(gca,'FontSize',18);
axis([-.0012 0.105 0 1.25]);
figure(2)
plot(transverse,load,'r-','LineWidth',3); hold on
plot(linspace(0,0.1163,10),0.995*ones(10),'b','LineWidth',2); hold on
plot(0.1163,0.995,'b.','MarkerSize',20); hold on
plot(linspace(0,.4085,100),max(load)*ones(100),'b','LineWidth',2); hold on
plot(.4085,max(load),'b.','MarkerSize',20); hold off
axis([0 .65 0 1.25]);
xlabel('Transverse Deflection (in)'); ylabel('Load (unitless)')
set(gca,'FontSize',18);