% Chris Kreienkamp - 901965168
% AME 54533 - Nuclear Science
% Homework #4 - 21 Feb 2019

clear
clc
clf

%% SET PARAMETERS

% Load data
% h1 = xlsread('Total Cross-Section.xlsx','H-1');
% h2 = xlsread('Total Cross-Section.xlsx','h2.csv');
% o16 = xlsread('Total Cross-Section.xlsx','o16.csv');
% u235 = xlsread('Total Cross-Section.xlsx','u235.csv');
% u238 = xlsread('Total Cross-Section.xlsx','u238.csv');
load('HW4.mat');

% Make every array unique
[h1un, un] = unique(h1(:,1));
h1 = [h1un h1(un,2)];
[h2un, un] = unique(h2(:,1));
h2 = [h2un h2(un,2)];
[o16un, un] = unique(o16(:,1));
o16 = [o16un o16(un,2)];
[u235un, un] = unique(u235(:,1));
u235 = [u235un u235(un,2)];
[u238un, un] = unique(u238(:,1));
u238 = [u238un u238(un,2)];

% Interpolate to have the same neutron energies for every array
E = u238(1:252526,1);
h1 = interp1(h1(:,1),h1(:,2),E);
h1 = [E h1];
h2 = interp1(h2(:,1),h2(:,2),E);
h2 = [E h2];
o16 = interp1(o16(:,1),o16(:,2),E);
o16 = [E o16];
u235 = interp1(u235(:,1),u235(:,2),E);
u235 = [E u235];
u238 = [E u238(1:252526,2)];

% Organize into energies and sigmas
h_e = h1(:,1);
h_sig = h1(:,2);
d_e = h2(:,1);
d_sig = h2(:,2);
o_e = o16(:,1);
o_sig = o16(:,2);
u235_e = u235(:,1);
u235_sig = u235(:,2);
u238_e = u238(:,1);
u238_sig = u238(:,2);

% Input element number density
No = 9000;
Nh = 18000;
Nd = 18000;
N235 = 5;
N238 = 45;



%% CALCULATIONS
Sig_t = (No.*o_sig+Nd.*d_sig+N235.*u235_sig+N238.*u238_sig)./...
    (No+Nd+N235+N238);
Sig_t_h1 = (No.*o_sig+Nh.*h_sig+N235.*u235_sig+N238.*u238_sig)./...
    (No+Nh+N235+N238);

% Fast Neutrons
fast = 251896;
Efast = E(fast:end);
sf = 1/0.266182266669349;
sf_h1 = 1/0.243124115997524;
X = 0.453.*exp(-1.036*Efast).*sinh(sqrt(2.29.*Efast));
Sig_tfast = Sig_t(fast:end);
Sig_tfast_h1 = Sig_t_h1(fast:end);
Ephi_fast = Efast.*X.*sf./Sig_tfast;
Ephi_fast_h1 = Efast.*X.*sf_h1./Sig_tfast_h1;

% Intermediate Neutrons
ksi_d = 0.51;
ksi_h1 = 0.93;
q = X(1)*sf*0.1*ksi_d;
q_h1 = X(1)*sf_h1*0.1*ksi_h1;
int = 150;
Eint = E(int:fast-1);
Sig_tint = Sig_t(int:fast-1);
Sig_tint_h1 = Sig_t_h1(int:fast-1);
Ephi_int = q./(ksi_d.*Sig_tint);
Ephi_int_h1 = q_h1./(ksi_h1.*Sig_tint_h1);


% Slow Neutrons
k = 8.617065e-11;
T = 290;
Eslow = E(1:int-1);
c = q/ksi_d/Sig_tint(1)*(k*T)^2/Eint(1)^2/exp(-Eint(1)/k/T);
c_h1 = q_h1/ksi_h1/Sig_tint_h1(1)*(k*T)^2/Eint(1)^2/exp(-Eint(1)/k/T);
Sig_tslow = Sig_t(1:int-1);
Sig_tslow_h1 = Sig_t_h1(1:int-1);
Ephi_slow = c/(k*T)^2.*Eslow.^2.*exp(-Eslow/(k*T));
Ephi_slow_h1 = c_h1/(k*T)^2.*Eslow.^2.*exp(-Eslow/(k*T));



%% PROGRESS THROUGH NEUTRON ENERGIES
Ephi = zeros(length(E),1);
Ephi_h1 = zeros(length(E),1);
for i = 1:int-1
    Ephi(i) = Ephi_slow(i);
    Ephi_h1(i) = Ephi_slow_h1(i);
end
for i = int:fast-1
    Ephi(i) = Ephi_int(i-int+1);
    Ephi_h1(i) = Ephi_int_h1(i-int+1);
end
for i = fast:length(E)
    Ephi(i) = Ephi_fast(i-fast+1);
    Ephi_h1(i) = Ephi_fast_h1(i-fast+1);
end



%% PLOT
loglog(E,Ephi,'b','LineWidth',2); hold on
loglog(E,Ephi_h1,'r','LineWidth',2); hold off
xlabel('neutron energy (MeV)'); ylabel('E\phi(E)')
set(gca,'FontSize',16)
legend('D_2O','H_2O')

