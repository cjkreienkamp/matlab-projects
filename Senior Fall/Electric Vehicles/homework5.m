% Chris Kreienkamp - 901965168
% AME 40472 - Electric and Hybrid Vehicles
% Homework #5 - Due 4 November 2019

clear
clc
clf



%% PARAMETERS
T = 0.050;                      % [s] sampling time
n = 0.93;                       % powertrain efficiency
fr = 0.01;                      % rolling resistance
m = (4647+190)/2.2;             % [kg] car mass
g = 9.80;                       % [m/s/s] gravitational acceleration
Cd = 0.23;                      % drag coefficient
A = 25.2/3.28/3.28;             % [m^2] frontal surface area
p = 1.2;                        % [kg/m^3] density of air
rw = 27.7/2*0.0254;             % [m] wheel radius



%% CALCULATIONS
t(1) = 0; v(1) = 0.00001; s(1) = 0; E(1) = 0; torque(1) = 0;
P(1) = 270000/(49/3600*1609.34)*v(1);
for i = 2:1:120
    t(i) = (i-1)*T;
    v(i) = v(i-1) + T/m * (P(i-1)/v(i-1)-m*g*fr-Cd*A*p/2*v(i-1)^2);
    s(i) = s(i-1) + v(i-1)*T;
    a(i-1) = (v(i)-v(i-1))/T;
    E(i) = E(i-1)+T*P(i-1);
    if v(i)<= 49/3600*1609.34
        P(i) = 270000/(49/3600*1609.34)*v(i);
        torque(i) = 440;
    else
        P(i) = 270000;
        torque(i) = 275+(275-440)/((80-49)/3600*1609.34)*(v(i)-80/3600*1609.34);
    end
end
a(i) = (P(i)/v(i)-m*g*fr-Cd*A*p/2*v(i)^2)/m;
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

