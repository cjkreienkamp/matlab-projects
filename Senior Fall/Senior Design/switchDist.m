% Chris Kreienkamp
% switchDist.m

clear
clc

mu_ws = 0.9;                    % [ ] wheel static friction (0.9)
mu_wr = 0.2;                    % [ ] wheel rolling friction (???)
mu_pk = 0.4;                    % [ ] payload kinetic friction (0.4)

%% CONSTANT INPUTS
g = 32.2;                       % [ft/s/s] acceleration due to gravity
vehMass = 16.9/g;               % [slug] mass of the vehicle
payMass = 29/g;                 % [slug] mass of the payload
targetSlip = 0.95;              % target percentage of slip
stopDist = 22.5;                % [ft] desired stopping distance

%% SWITCHING DISTANCE CALCULATIONS
maxTractiveForce = vehMass*g*mu_ws;
maxAccel = (targetSlip*maxTractiveForce-payMass*g*mu_pk)/(vehMass + payMass);
payDecel = -g*mu_pk;
vehDecel = -g*mu_wr;
maxDecel = min(max(payDecel,vehDecel),0);
switchDis = min(stopDist/(1-maxAccel/maxDecel),20)