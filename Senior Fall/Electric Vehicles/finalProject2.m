% Chris Kreienkamp
% Chris Metzger

%% INITIALIZE
clear
clc
clf


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
rw = 27.7/2*0.0254;         % [m] wheel radius
T = 0.250;

vbreak=50*4/9;


%% CALCULATIONS
t(1) = 0;       % time (s)
v(1) = 0.00001; % velocity (m/s)
s(1) = 0;       % position (m)
E(1) = 0;       % energy (J)
torque(1) = 0;  % torque (N)
P(1) = (160*10^3)/vbreak*v(1);   % power (W)
for i = 2:1:25
    t(i) = (i-1)*T;
    v(i) = v(i-1) + T/m * (P(i-1)/v(i-1)-m*g*fr-CdA*rho/2*v(i-1)^2);
    s(i) = s(i-1) + v(i-1)*T;
    a(i-1) = (v(i)-v(i-1))/T;
    E(i) = E(i-1)+(T*P(i-1))/n_EM;
    if v(i)<= vbreak
        P(i) = 160000/(vbreak)*v(i)*n_wh;
        torque(i)=P(i)*rw/v(i);
    else
        P(i) = 160000*n_wh;
        torque(i)=P(i)*rw/v(i);
    end
end
a(i) = (P(i)/v(i)-m*g*fr-CdA*rho/2*v(i)^2)/m;
Ft = torque./rw;
v = v.*3600/1609.34;            % [mph]


%% GRAPHING
figure(1)
plot(t,v,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('speed (mph)');

figure(2)
plot(t,s,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('position (m)');

figure(3)
plot(t,a,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('acceleration (m/s^2)');

figure(4)
plot(t,P/1000,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('power (kW)');

figure(5)
plot(t,Ft/1000,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('tractive force (kN)');

figure(6)
plot(t,torque,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('torque (N\cdot m)');

figure(7)
plot(t,E/1000,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('energy (kJ)');