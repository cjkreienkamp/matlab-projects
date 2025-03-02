% Chris Kreienkamp
% University of Notre Dame
% 22 May 2019

clear
clc
clf
% eng = engine; gen = generator; ctrl = controller; cap = ultracapacitor;
% hub = hub motor



%% CALCULATE COOLING LOADS OF ENGINE, GENERATOR
% Inputs
T_eng = 21.7;                   % [N m]
omega_eng = 10000;              % [RPM]
n_eng = 0.27;
n_gen = 0.92;
% Calculations
omega_eng = omega_eng/60*2*pi;  % [rad/s]
P_eng = T_eng*omega_eng/1000;   % [kW]       
Ploss_eng = P_eng*(1-n_eng);
P_gen = P_eng*n_eng;
Ploss_gen = P_gen*(1-n_gen);



%% CALCULATE COOLING LOAD OF ULTRACAPACITORS
% Inputs
S = 15;                         % number in series
P = 3;                          % number in parallel
Vcell = 2.70;                   % cell voltage [V]
Ccell = 3.04;                   % cell capacity [W h]
ESR = 0.29/1000;                % cell Equivalent Series Resistance [Ohm]
R_busbar = 0.1/1000;            % busbar resistance [Ohm]
Imax_cap = 1900;                % max current in ultracapacitor [A]
% Calculations
Vnom_cap = S*Vcell;             % module nominal voltage [V]
E_cap = Ccell*Vnom_cap*P;       % energy capacity [W h]
Rtotal_cap = (P/((ESR*S)+(R_busbar*(S-1))))^-1;     % [Ohm]
P_cap = Vnom_cap*Imax_cap/1000; % ultracapacitor max power [kW]
Ploss_cap = Rtotal_cap*Imax_cap^2/1000; % [kW]



%% CALCULATE COOLING LOAD OF CONTROLLER
% Inputs
n_ctrl = 0.99;
% Calculations
Vtherm_cap = Imax_cap*Rtotal_cap;   % capacitor voltage resulting in heat [V]
n_cap = 1-(Vtherm_cap/Vnom_cap);    % find efficiency of ultracapacitors
P1_ctrl = P_gen*n_gen;              % [kW]
P2_ctrl = P_cap*n_cap;
Ploss1_ctrl = P1_ctrl*(1-n_ctrl);
Ploss2_ctrl = P2_ctrl*(1-n_ctrl);
Ploss_ctrl = Ploss1_ctrl + Ploss2_ctrl;



%% CALCULATE COOLING LOAD OF HUB MOTORS
% Inputs
n_hub = (0.93 + 0.98)/2;
Imax_hub = 100;                     % [A]
Vcont_hub = 96;                     % [V]
% Calculations
P1_hub = Imax_hub*Vcont_hub/1000;   % [kW]
Ploss1_hub = P1_hub*(1-n_hub);
Ploss_hub = Ploss1_hub*2;



% %% CALCULATE COOLING LOAD OF EACH LOOP
% q_loop1 = Ploss_eng + Ploss_gen;
% q_loop2 = Ploss_cap;
% q_loop3 = Ploss_hub;
% q_heatsink = Ploss_ctrl;
% 
% 
% 
% %% CALCULATE SYSTEM 1 COOLING RESULTS
% % Radiator, pump, and fan specifications
% mdot_1 = 0.2;           % mass flow rate [kg/s]
% L_rad_1 = 0.275;        % length of radiator [m]
% D_rad_1 = 0.01;         % diameter of the tubes of the radiator [m]
% t_rad_1 = 0.001;        % wall thickness of tubes of the radiator [m]
% u_air_rad_1 = 5;        % minimum airspeed [m/s]
% 
% % Find the required outlet temperature from the radiator
% c_water = 4.186;    % specific heat of water [J/(g C)]
% Twi_1 = 93.5;       % temperature of water at radiator inlet
% Two_1 = Twi_1-q_loop1/(mdot_1*c_water);
% T_air = (Twi_1+Two_1)/2;
% 
% % Find the outer resistance
% To_1 = 25 - Two_1;
% Ti_1 = 25 - Twi_1;
% T_lm_1 = -(To_1-Ti_1)/log(To_1/Ti_1);
% k_air_1 = 0.03046;   % [W/(m K)]
% v_air_1 = 21.22e-6;  % [m^2/s]
% Pr_air_1 = 0.701;
% Re_air_1 = u_air_rad_1*D_rad_1/v_air_1;
% C2_1 = 0.64;
% C1_1 = 0.286;
% m_1 = 0.608;
% Nu_air_1 = C2_1*1.13*C1_1*Re_air_1^m_1*Pr_air_1^(1/3);
% ho_1 = k_air_1*Nu_air_1/D_rad_1;
% Ro_1 = 1/(ho_1*pi*D_rad_1*L_rad_1);
% 
% % Find the wall resistance
% r2_rad_1 = D_rad_1/2;
% r1_rad_1 = r2_rad_1-t_rad_1;
% kwall_rad_1 = 205;      % thermal conductivity of alumnium [W/(m K)]
% Rwall_1 = log(r2_rad_1/r1_rad_1)/(kwall_rad_1*2*pi*L_rad_1);
% 
% % Find the inner resistance
% u_water_1 = mdot_1/997/pi/r1_rad_1^2;
% v_water_1 = 0.365e-6;
% k_water_1 = 0.606;          % [W/(m K)]
% Re_water_1 = u_water_1*D_rad_1/v_water_1;
% Pr_water_1 = 2;
% Nu_water_1 = 1.86*(Re_water_1*Pr_water_1/(L_rad_1/D_rad_1))^1/3;
% hi_1 = k_water_1*Nu_water_1/D_rad_1;
% Ri_1 = 1/(hi_1*2*pi*r1_rad_1*L_rad_1);
% 
% % Find heat dissipation of radiator, pump, and fan
% q_1 = T_lm_1/(Ro_1+Rwall_1+Ri_1)/1000;
% 
% 
% 
% %% CALCULATE SYSTEM 2 COOLING RESULTS
% u_air_2 = 1;
% L_2 = .288;
% H_2 =0.055;
% W_2 = 0.186;
% number_2 = 20;
% 
% v_2 =  1.655e-5;     % @ 35 C
% Pr_2 = 0.7268;
% k_2 = 0.02625;
% Re_2 = u_air_2*L_2/v_2;
% Nu_2 = 0.037*Re_2^(4/5)*Pr_2^(1/3);
% h_2 = Nu_2*k_2/L_2;
% R_thermalpaste_2 = 0.014;
% R_heatsink_2 = 0.40;
% R_ambient_2 = L_2*H_2*number_2*2;
% R_total_2 = R_thermalpaste_2+R_heatsink_2+R_ambient_2;  % [C/kW]
% T_controller = 25 + q_heatsink*R_total_2*1000;
% 
% 
% 
% %% CALCULATE ULTRACAPACITOR COOLING (3)
% q_loop2;
% % Radiator, pump, and fan specifications
% mdot_3 = 0.2;           % mass flow rate [kg/s]
% L_rad_3 = 0.275;        % length of radiator [m]
% D_rad_3 = 0.01;         % diameter of the tubes of the radiator [m]
% t_rad_3 = 0.001;        % wall thickness of tubes of the radiator [m]
% u_air_rad_3 = 5;        % minimum airspeed [m/s]
% 
% % Find the required outlet temperature from the radiator
% c_water = 4.186;    % specific heat of water [J/(g C)]
% Twi_3 = 12.5;       % temperature of water at radiator inlet
% Two_3 = Twi_3-q_loop2/(mdot_1*c_water);
% T_air = (Twi_3+Two_3)/2;
% 
% % Find the outer resistance
% To_3 = 25 - Two_3;
% Ti_3 = 25 - Twi_3;
% T_lm_3 = -(To_3-Ti_3)/log(To_3/Ti_3);
% k_air_3 = 0.03046;   % [W/(m K)]
% v_air_3 = 21.22e-6;  % [m^2/s]
% Pr_air_3 = 0.701;
% Re_air_3 = u_air_rad_3*D_rad_3/v_air_3;
% C2_3 = 0.64;
% C1_3 = 0.286;
% m_3 = 0.608;
% Nu_air_3 = C2_3*1.13*C1_3*Re_air_3^m_3*Pr_air_3^(1/3);
% ho_3 = k_air_3*Nu_air_3/D_rad_3;
% Ro_3 = 1/(ho_3*pi*D_rad_3*L_rad_3);
% 
% % Find the wall resistance
% r2_rad_3 = D_rad_3/2;
% r1_rad_3 = r2_rad_3-t_rad_3;
% kwall_rad_3 = 205;      % thermal conductivity of alumnium [W/(m K)]
% Rwall_3 = log(r2_rad_3/r1_rad_3)/(kwall_rad_3*2*pi*L_rad_3);
% 
% % Find the inner resistance
% u_water_3 = mdot_3/997/pi/r1_rad_3^2;
% v_water_3 = 0.365e-6;
% k_water_3 = 0.606;          % [W/(m K)]
% Re_water_3 = u_water_3*D_rad_3/v_water_3;
% Pr_water_3 = 2;
% Nu_water_3 = 1.86*(Re_water_3*Pr_water_3/(L_rad_3/D_rad_3))^1/3;
% hi_3 = k_water_3*Nu_water_3/D_rad_3;
% Ri_3 = 1/(hi_3*2*pi*r1_rad_3*L_rad_3);
% 
% % Find heat dissipation of radiator, pump, and fan
% q_3 = T_lm_3/(Ro_3+Rwall_3+Ri_3)/1000;
