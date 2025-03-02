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
P = 20000;                 % [W]   SELECT FOR CONTINUOUS HIGH EFFICIENCY TOP SPEED
%P = 50000;                  % [W]   SELECT FOR CONTINUOUS TOP SPEED

energy = 0;                 % [Ws]
distance = 0;               % [m]
timeON = 0; timeOFF = 0;    
cycle = 1;
acceleration(1) = 0;        % [m/s^2]



%% CALCULATIONS
syms v
eqn = P*n_eng*n_EM*n_wh == 1/2*CdA*rho*v^3 + m*g*fr*v;
contSpeed = vpasolve(eqn, v, [0 150]) * 9/4;
contSpeed = double(contSpeed)

%% VERIFICATION

% Choose velocity data
time = FTP75data(:,1);
velocity = contSpeed*4/9.*ones(length(time),1);

% FOR loop to determine engine on/off profile during velocity run
for i = 1:length(time)
    powerWheel = 1/2*CdA*rho.*velocity(i)^3+m*g*fr*velocity(i);
    if energy <= 0
        ON = 1;
    end
    if ON == 1
        powerBat_(i) = P*n_eng - powerWheel/n_wh/n_EM;
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



%% PLOT
figure(1)
plot(time,energy_/1000,'b-','LineWidth',3); hold on
plot(time,ON_,'r-','LineWidth',3); hold off
set(gca,'FontSize',18)
axis([0 1875 0 1.5])
xlabel('time (s)'); ylabel('energy in ultracapacitor bank (kWs)')
legend('energy','engine ON/OFF profile')