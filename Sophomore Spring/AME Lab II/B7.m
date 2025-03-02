% Chris Kreienkamp, 901965168
% Wed Mar 7 2018
% AME 20217
% Experiment B7 - Heat Exchangers

clear
clc
clf


%% PART I
deltaT = [9.7 11.1 13.1 15.5 19.6 24.3];
Q = [21.7 18.7 15.7 12.7 9.74 6.87]/1000/60;
qdot = 0.29*23.00/1000;                         % kW
rhoA = 1.28;
cp = 1.003;
theorQ = linspace(6,22,1000)/1000/60;
theorT = qdot./(rhoA*theorQ*cp);

plot(Q,deltaT,'r.','MarkerSize',20); hold on
plot(theorQ,theorT,'b-','LineWidth',2); hold off
xlabel('Flow Rate Q (m^3/s)'); ylabel('\Delta T (K)')
legend('Measured \Delta T','Theoretical \Delta T');
set(gca,'FontSize',20);


%% PART II
rhoW = 1000;    % kg/(m^3)
cpW = 4180;     % J/(kg K)
natTin = [43.9 45.5 43.9];
natTout = [43.0 45.2 44.3];
natT = natTin - natTout;
flowrate = [15 19.2 8]/3600/264.172;
natPower = rhoW * flowrate * cpW .* natT;
fanTin = [43.8 45.5 44.6];
fanTout = [33.1 42.0 39.7];
fanT = fanTin - fanTout;
fanPower = rhoW * flowrate * cpW .* fanT;

Tin_inf = [296.25 297.65 317.05];
Tout_inf = [302.25 304.65 317.45];
T_lmtop = (fanTin - Tin_inf) - (fanTout - Tout_inf);
T_lmbot = log((fanTin - Tin_inf)./(fanTout - Tout_inf));
T_lm = T_lmtop ./ T_lmbot;
UA = fanPower ./ T_lm