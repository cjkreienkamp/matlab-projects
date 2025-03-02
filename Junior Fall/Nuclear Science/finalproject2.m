% Chris Kreienkamp - 901965168
% AME 54533 - Nuclear Science
% Final Project - Due 6 May 2019

clear
clc
clf



%% SET PARAMETERS

% Microscopic cross-section
% sig = sigma   a = absorption   s = scatter   f = fission   c = capture
%               t = total
siga_th = 7.56;                 % (barns)
sigs_th = 12.6;     
sigt_th = siga_th + sigs_th;
sigf_u = 527;
sigc_u = 54;     
sigt_u = sigf_u + sigc_u;
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


% Number density
N_th = 0.0293;                  % 10^24 neutrons/cm^3
N_u = 0.04783;
N_li = 0.0463;
N_be = 0.1236;
N_f = 3*5.3e-5;
N_c = 0.0803;


% Slowing down decrement
ksi_th = 0.0086;
ksi_li = 0.268;
ksi_be = 0.209;
ksi_f = 0.102;
ksi_c = 0.158;


% Decay constants
lambda_th


%% CALCULATIONS
Sig_t = (N_th*sigt_th + N_u*sigt_u + N_li*sigt_li + N_be*sigt_be +...
    N_f*sigt_f + N_c*sigt_c)/...
    (N_th + N_u + N_li + N_be + N_f + N_c);          % (barns)
ksi_bar = (sigs_th*N_th*ksi_th + sigs_li*N_li*ksi_li + ...
    sigs_be*N_be*ksi_be + sigs_f*N_f*ksi_f + sigs_c*N_c*ksi_c)/...
    (sigs_th*N_th + sigs_li*N_li + sigs_be*N_be + sigs_f*N_f + sigs_c*N_c);

P = 500000;                     % W
gamma = 3.1*10^-11;             % J/fission ??? recoverable energy per fission
D = 0.098;                      % m ??? diffusion coefficient
R = 0.05;
Rex = R + 2*D;
C = P/(4*gamma*sigf_u*Rex^2);
phi = C/R*sin(pi*R/Rex);        % neutrons/s/m^2 ... neutron flux

neutron_th_abs = phi*siga_th;   % thorium absorptions/s/m^2





