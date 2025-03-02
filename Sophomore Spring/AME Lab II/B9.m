% Chris Kreienkamp, 901965168
% AME Lab II - AME 20217
% Thu Mar 29
% Experiment B9 - Acoustics

clear
clc
clf


%% PRE-ANALYSIS
C = xlsread('tek0005CH1');                  % time(:,1)
E = xlsread('tek0006CH1');                  % voltage(:,2)
G = xlsread('tek0007CH1');
Csine = xlsread('tek0008CH1');



%% PART II: voltage vs time
figure(1)
subplot(4,1,1)
plot(C(:,1),C(:,2),'LineWidth',2)
title('C')
set(gca,'FontSize',18)
axis([-0.02 0.02 -0.5 0.5])

subplot(4,1,2)
plot(E(:,1),E(:,2),'LineWidth',2)
title('E')
ylabel('V(t) (V)');
set(gca,'FontSize',18)
axis([-0.02 0.02 -0.5 0.5])

subplot(4,1,3)
plot(G(:,1),G(:,2),'LineWidth',2)
title('G')
ylabel('voltage');
set(gca,'FontSize',18)
axis([-0.02 0.02 -0.5 0.5])

subplot(4,1,4)
plot(Csine(:,1),Csine(:,2),'LineWidth',2)
title('C sine')
xlabel('time, t (s)');
set(gca,'FontSize',18)
axis([-0.02 0.02 -0.5 0.5])



%% PART II: spectral density vs frequency
lins = linspace(0,1/4e-6,10000);

figure(2)
subplot(4,1,1)
plot(lins,abs(fft(C(:,2))),'LineWidth',2)
title('C')
set(gca,'FontSize',18)
axis([0 2000 0 1000])

subplot(4,1,2)
plot(lins,abs(fft(E(:,2))),'LineWidth',2)
title('E')
ylabel('|V(t)| (V)');
set(gca,'FontSize',18)
axis([0 2000 0 1000])

subplot(4,1,3)
plot(lins,abs(fft(G(:,2))),'LineWidth',2)
title('G')
ylabel('spectral density');
set(gca,'FontSize',18)
axis([0 2000 0 1000])

subplot(4,1,4)
plot(lins,abs(fft(Csine(:,2))),'LineWidth',2)
title('C sine')
xlabel('frequency, f (Hz)');
set(gca,'FontSize',18)
axis([0 2000 0 1000])



%% PART I: L vs 1/f0
L = [.2 .3 .4 .5 .6 .7 .8];                     % (m)
theor_f0 = [425 283 212 170 141 121 106];       % (Hz)
meas_f0 = [310 226 181 150 122 107 96];         % (Hz)

figure(3)
plot(1./meas_f0,L,'bo','MarkerSize',7,'LineWidth',3); hold on
set(gca,'FontSize',20)
linfit = fit(1./meas_f0',L','poly1');
h = plot(linfit); hold off
h.LineWidth = 2;
legend HIDE
xlabel('Measured Period, 1/f_0 (s)'); ylabel('Length, L (m)');
coeff_linfit = coeffvalues(linfit);
speedofSound = coeff_linfit(1)*4

