% Chris Kreienkamp
% Chris Metzger

%% INITIALIZE
clear
clc
clf
load FTP75.mat


%% SET PARAMETERS
CdA = 0.5;                  % [m^2]
m = 1000;                   % [kg]
rho = 1.2;                  % [kg/m^3]
g = 9.80;                   % [m/s^2]
fr = 0.007;                 % [ ]
n_eng = 0.90;               % [ ]
n_EM = 0.90;                % [ ]
n_wh = 0.98;                % [ ]
energyBuffer = 1000;        % [kWs]

powerMotor = 160000;               % [w]
maxContSpeed = 111.2840;    % [mph]
    
energy = 0;                 % [Ws]
distance = 0;               % [m]
timeON = 0; timeOFF = 0;    
cycle = 1;



%% CALCULATIONS
T = 0.01;
powerWheel = powerMotor*n_wh;
v(1) = maxContSpeed*4/9;
a(1) = 0;
t(1) = 0;

for i = 2:1000
    t(i) = t(i-1) + T;
    a(i) = powerWheel/(m*v(i-1)) - g*fr - 1/2*CdA*rho*v(i-1)^2/m;
    v(i) = v(i-1) + a(i)*T;
end


%% PLOT
figure(1)
plot(t,v.*9/4,'b-','LineWidth',3)
xlabel('time (s)'); ylabel('velocity (mph)')
set(gca,'FontSize',18)

figure(2)
plot(t,a,'b-','LineWidth',3)
xlabel('time (s)'); ylabel('acceleration (m/s^2)')
set(gca,'FontSize',18)