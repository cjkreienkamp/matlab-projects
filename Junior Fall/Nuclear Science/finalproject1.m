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
siga_na = 0.525;
sigs_na = 4;     
sigt_na = siga_na + sigs_na;
siga_c = 0.004;     
sigs_c = 4.8;     
sigt_c = siga_c + sigs_c;


% Number density
N_th = 0.0293;                  % 10^24 neutrons/cm^3
N_u = 0.04783;
N_li = 0.0463;
N_be = 0.1236;
N_f = 3*5.3e-5;
N_na = 0.0254;
N_c = 0.0803;


% Slowing down decrement
ksi_th = 0.0086;
ksi_li = 0.268;
ksi_be = 0.209;
ksi_f = 0.102;
ksi_na = 0.0845;
ksi_c = 0.158;


%% CALCULATIONS
Sig_t = (N_th*sigt_th + N_u*sigt_u + N_li*sigt_li + N_be*sigt_be +...
    N_f*sigt_f + N_c*sigt_c)/...
    (N_th + N_u + N_li + N_be + N_f + N_c);          % (barns)
ksi_bar = (sigs_th*N_th*ksi_th + sigs_li*N_li*ksi_li + ...
    sigs_be*N_be*ksi_be + sigs_f*N_f*ksi_f + sigs_c*N_c*ksi_c)/...
    (sigs_th*N_th + sigs_li*N_li + sigs_be*N_be + sigs_f*N_f + sigs_c*N_c);

% Fast Neutrons
Efast = logspace(-1,1,10000);            % MeV
X = 0.453.*exp(-1.036.*Efast).*sinh(sqrt(2.29.*Efast));
sf = 1/0.003028073252294;
phi_fast = X.*sf/Sig_t;
EphiE = Efast.*phi_fast;
for i = 1:length(EphiE)
    if EphiE(i) == max(EphiE)
        maxlocate = i;
    end
end

% Intermediate Neutrons
Eint = logspace(log10(0.4e-6),-1,10000);
q = X(1)*sf*0.1*ksi_bar;
phi_int = q/ksi_bar/Sig_t./Eint;


% Thermal Neutrons
Eslow = logspace(-9,log10(0.4e-6),10000);
k = 8.617065e-11;                       % Mev/K
T = 500+273.15;                         % http://www.world-nuclear.org/information-library/current-and-future-generation/molten-salt-reactors.aspx
c = q/ksi_bar/Sig_t/(0.4e-6)^2*(k*T)^2/exp(-0.4e-6/k/T);
phi_slow = c/(k*T)^2.*Eslow.*exp(-Eslow./(k*T));



%% PROGRESS THROUGH NEUTRON ENERGIES
phi = zeros(length(Efast)+length(Eint)+length(Eslow)-2,1);
for i = 1:length(Eslow)-1
    E(i) = Eslow(i);
    phi(i) = phi_slow(i);
end
for i = length(Eslow):length(Eslow)+length(Eint)-1
    E(i) = Eint(i-length(Eslow)+1);
    phi(i) = phi_int(i-length(Eslow)+1);
end
for i = length(Eslow)+length(Eint):length(phi)
    E(i) = Efast(i-length(Eslow)-length(Eint)+1);
    phi(i) = phi_fast(i-length(Eslow)-length(Eint)+1);
end



%% PLOT
loglog(E,phi,'b','LineWidth',2)
xlabel('neutron energy (MeV)'); ylabel('\phi(E)')
set(gca,'FontSize',16)



%% ANALYSIS
absorption_density = trapz(phi)*siga_th*N_th;       % absorptions/s/cm^3






%% ASSEMBLING DATA THAT MAY OR MAY NOT BE CORRECT
% https://www-nds.iaea.org/
% https://www.osti.gov/servlets/purl/7342187

% %% SET PARAMETERS
% 
% % Load data
% data = xlsread('Thorium Capture Cross-Section');
% E = data(:,1);          % MeV
% sig_c = data(:,2);      % barns

