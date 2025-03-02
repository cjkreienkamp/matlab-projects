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
powerICEonoff = 20;         % [kW]
bsfc = 190;                 % [g/kWh]
rhoDiesel = 830;            % [g/L]
startUpFuel = 0.01;         % [L]

LperGallon = 3.29;          % [L/gal]
milesPerKilometer = 0.6214; % [mi/km]

energy = 0;                 % [Ws]
distance = 0;               % [m]
timeON = 0; timeOFF = 0;    
cycle = 1;
acceleration(1) = 0;        % [m/s^2]



%% CALCULATIONS

% Choose velocity data
time = FTP75data(:,1);
velocity = FTP75data(:,2)*4/9;             % [m/s] drive cycle test
%velocity = 30*4/9.*ones(length(time),1);   % [m/s] 30mph velocity
%velocity = 50*4/9.*ones(length(time),1);   % [m/s] 50mph velocity
%velocity = 70*4/9.*ones(length(time),1);   % [m/s] 70mph velocity

% FOR loop to determine engine on/off profile during velocity run
for i = 1:length(time)
    powerWheel = 1/2*CdA*rho.*velocity(i)^3+m*g*fr*velocity(i);
    if energy <= 0
        ON = 1;
    end
    if ON == 1
        powerBat_(i) = powerICEonoff*1000*n_eng - powerWheel/n_wh/n_EM;
        energy = energy + powerBat_(i)*1;
        distance = distance + velocity(i)*1;
        timeON = timeON + 1;
        if energy > energyBuffer*1000
            ON = 0;
        end
    else
        powerBat_(i) = -powerWheel/n_wh/n_EM;
        energy = energy + powerBat_(i)*1;
        distance = distance + velocity(i)*1;
        timeOFF = timeOFF + 1;      
    end
    ON_(i)=ON;
    energy_(i) = energy;
    powerWheel_(i) = powerWheel;
    distance_(i) = distance;
    if i>1
        if ON_(i) == 1 && ON_(i-1) == 0
        cycle = cycle + 1;
        end
        acceleration(i) = velocity(i)-velocity(i-1);
    end
end

% Fuel consumption
fuelBurned = powerICEonoff*timeON/3600 * bsfc / rhoDiesel;  % [L]
totalFuel = fuelBurned + cycle*startUpFuel;                 % [L]
Lper100km = totalFuel*1e5/distance;                         % [L/100km]
mpg = LperGallon/Lper100km*milesPerKilometer*100;           % [mi/gal]



%% PLOT
figure(1)
plot(time,energy_/1000,'b-','LineWidth',3); hold on
plot(time,ON_.*200,'r-','LineWidth',3); hold off
set(gca,'FontSize',18)
%axis([0 1875 0 1200])
xlabel('time (s)'); ylabel('energy in storage bank (kWs)')
legend('energy','engine ON/OFF profile')

figure(2)
plot(time,powerWheel_/1000,'b-','LineWidth',3)
set(gca,'FontSize',18)
%axis([0 1875 0 1200])
xlabel('time (s)'); ylabel('power at the wheel (kW)')

figure(3)
plot(time,distance_./1000,'b-','LineWidth',3)
set(gca,'FontSize',18)
%axis([0 1875 0 1200])
xlabel('time (s)'); ylabel('distance (km)')

figure(4)
plot(time,velocity,'b-','LineWidth',3)
set(gca,'FontSize',18)
%axis([0 1875 0 1200])
xlabel('time (s)'); ylabel('speed (m/s)')

figure(5)
plot(time,acceleration,'b-','LineWidth',3)
set(gca,'FontSize',18)
%axis([0 1875 0 1200])
xlabel('time (s)'); ylabel('acceleration (m/s^2)')