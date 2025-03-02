% Experiment A4 - Sensor Calibration
clear
clc
clf


%% P vs Vout

% Input Data
Pin = [.095 .155 .29 .42 .60 .80 1.35 2.00];                % Differential pressure (in of H2O)
P = 248.84.*Pin;                                            % Differential pressure (Pa)
Vout = [2.547 2.560 2.583 2.610 2.647 2.688 2.795 2.935];   % Transducer Voltage (V)
f = fit(Vout',P','Poly1');                                  % Create fit
coeff = coeffvalues(f);                                     % Extract coefficients
t = linspace(2.5,3,1000);                                   % Create array of values
fitCurve = coeff(1)*t + coeff(2);                           % Create fit curve

% Plot
figure(1)
plot(Vout,P,'ro',t,fitCurve,'b-')
xlabel('Transducer Voltage, V_o_u_t (V) ')
ylabel('Differential Pressure, P (Pa)')
set(gca,'FontSize',16)
legend('Experimental Values','Linear Fit','Location', 'Northwest')


%% Velocity of air jet (m/s) vs Flow rate (m^3/s)

% Input Data
rhoAir = 1.275;                                     % Density of Air (kg/m^3)
airSpeed = sqrt(2.*P/rhoAir);                       % Airspeed (m/s)
rate = [3.42 5.12 6.87 8.66 10.5 12.3 16.0 19.8];   % Flow Rate (L/min)
flowRate = rate/1000/60;                            % Flow Rate (m^3/s)
theorflow = linspace(0,.0004,1000);                 % Create array of values
nozzleDiameter = .175/39.3701;                      % Conversion from (in) to (m)
A = pi*(nozzleDiameter/2)^2;                        % Cross-sectional area (m^2)
theorAirSpeed = theorflow/A;                        % Theoretical air speed (m/s)

% Plot
figure(2)
plot(flowRate,airSpeed,'ro',theorflow,theorAirSpeed,'b-')
xlabel('Flow Rate, Q (m^3/s)')
ylabel('Velocity of Air Jet, u (m/s)')
set(gca,'FontSize',16)
legend('Experimental Values','Theoretical Value','Location', 'Northwest')