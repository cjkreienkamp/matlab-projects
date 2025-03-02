% Chris Kreienkamp, 901965168
% Sun Mar 4 2018
% AME 20217
% Experiment B6 - Thermal Properties of Materials

clear
clc
clf


%% PART I
q = 26*[0.16 0.17 0.18 0.17 0.17];
m = [5.30 16.70 15.50 17.50 2.85];
Um = [0.02 0.02 0.02 0.02 0.02];
t = [20.01 19.84 19.90 20.03 19.89];
Ut = [0.05 0.05 0.05 0.05 0.05];
deltaT = [(40.3-27) (37.2-26) (38-26.2) (35.9-25.5) (48.7-26.3)];
UdeltaT = deltaT*0.0005+0.3;
c = q .* t ./ (m.*deltaT);
Uc = c .* sqrt( (Um/m).^2 + (UdeltaT/deltaT).^2 + (Ut/t).^2);


%% PART II
format short e
D = [0.505 0.502 0.759 0.500]*0.0254;
UD = [0.005 0.005 0.005 0.005]*0.0254;
L = [1.957 2.030 0.725 2.120]*0.0254;
UL = [0.005 0.005 0.005 0.005]*0.0254;
q2 = 26*[0.33 0.18 0.33 0.17];
deltaT2 = -1*[17.4 17.4 31.5 4.3];
UdeltaT2 = deltaT2 * 0.0005 + 0.3;
A = (D/2).^2*pi;
k = -q2 ./ A.* L ./ deltaT2;
Uk = k*sqrt(2*(UD/D).^2 + (UL/L).^2 + (UdeltaT2/deltaT2).^2);