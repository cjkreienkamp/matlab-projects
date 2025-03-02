% Chris Kreienkamp - 901965168
% AME 54533 - Nuclear Science
% Final Project - Due 6 May 2019

clear
clc
clf



%% INPUT DATA
% Fuel: Thorium-232, Uranium-233
% Moderator: Fluorine, Lithium, Beryllium, Graphite
E = 1e-6;               % energy ranges [MeV]
nu = 2.5;               % https://www.google.com/search?tbm=isch&q=neutrons+produced+per+fission+of+U+233&spell=1&sa=X&ved=0ahUKEwiI94_8p__hAhUCQ60KHSRjAKIQBQg8KAA&biw=1440&bih=789&dpr=1#imgrc=OPVf3naj85jjEM:
Avogadro = 6.022e23;
siga_th = 7.56;                 % (barns)
sigs_th = 12.6;     
sigt_th = siga_th + sigs_th;
sigf_u = 527;
sigc_u = 54;     
sigt_u = sigf_u + sigc_u;
siga_u = sigt_u;
siga_li = 71;
sigs_li = 1.4;     
sigt_li = siga_li + sigs_li;
siga_be = 0.010;
sigs_be = 7;     
sigt_be = siga_be + sigs_be;
siga_f = 0.01;
sigs_f = 3.9;     
sigt_f = siga_f + sigs_f;
siga_c = 0.004;     
sigs_c = 4.8;     
sigt_c = siga_c + sigs_c;  
siga_pa = 200;
FLiBe_density = 1.94;       % g/cm^3
FLiBe_molarmass = 2*6.94 + 9.0122 + 4*18.998;   % g/mol
N_FLiBe = FLiBe_density / FLiBe_molarmass * Avogadro / 1e24;
N_th = 0.0293;
N_u = 0.04783;
N_f = 4*N_FLiBe;
N_li = 2*N_FLiBe;
N_be = N_FLiBe;
N_c = 0.0803;
N_pa = 0.0402;
Sigf_fuel = sigf_u*N_u;
Siga_fuel = sigt_u*N_u + siga_th*N_th;
Siga_moderator = siga_f*N_f + siga_li*N_li + siga_be*N_be + siga_c*N_c;
Sigt = sigt_th*N_th + sigt_u*N_u + sigt_f*N_f + sigt_li*N_li + ...
    sigt_be*N_be + sigt_c*N_c;
Siga = siga_th*N_th + siga_u*N_u + siga_f*N_f + siga_li*N_li + ...
    siga_be*N_be + siga_c*N_c;

%% SET PARAMETERS
R = 4.5;
Rm = 0.01;              % http://k-mac-plastics.com/graphite-rods.htm
Nm = 100;
P = 10e6;               % W
H = 4.5;



%% FOR A CYLINDER, K=1
k = 1;

%% FIND K_INF AS A FUNCTION OF R AND H USING 4 FACTOR FORMULA
Vm = pi*Rm^2.*H*Nm;      % Nm = number of moderator rods
Vf = pi*R^2.*H-Vm;
k_inf = (Vf.*nu*Sigf_fuel) ./ (Vf.*Siga_fuel + Vm.*Siga_moderator);

%% FIND THE NON-LEAKAGE PROBABILITY P_NL
P_NL = k./k_inf;

%% FIND THE GEOMETRIC BUCKLING BG^2 OF REACTOR
D = 1/Sigt;
L2 = D/Siga;
Bg2 = (1-P_NL)./(L2.*P_NL);

%% FIND THE STEADY-STATE FLUX PHI
gamma = 3.1e-11;                    % J/fission
nu_1 = 2.405;
H_ex = H+4*D;
R_ex = R+2*D;
V_ex = pi*R_ex^2.*H_ex;
constant = 3.63*P./(gamma*Sigf_fuel.*V_ex);
phi = 0.275*constant.*V_ex;

%% PROMPTS
% 1) The production rate of the desired nuclei
production_rate = (siga_th*N_th)*phi*pi*R^2*H;

% 2) The time it would take to produce 1 kg of the desired product
u233_molarmass = 233.04;
desired_1kg_s = 1000/u233_molarmass*Avogadro/production_rate/1e6/Vf;
desired_1kg_min = desired_1kg_s/60;
desired_1kg_d = desired_1kg_s/3600/24;

% 3) The maximum fission power production rate in the reactor
maxfisspower_rate = (sigf_u*N_u)*phi*Vf*200*1.60218e-13;

% 5) The estimated value of 1 kg of the product and the estimated cost of the target nuclei
costfor1_55tons = (5.5+11)/2*1e9;   % US dollars
kilogramsperton = 907.185;
costperkg = costfor1_55tons*1.55/kilogramsperton;
costofgraphite= Nm*H/0.3048*87.30;
costofthorium = 150/28.34*11.7*1000000*200;
breakeventime = 13e9/(desired_1kg_s*costperkg);
breakeventime_hr = breakeventime/3600;



















