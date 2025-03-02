% Chris Kreienkamp - 901965168
% AME 34334 - Heat Transfer
% Homework #5 - 28 Feb 2019

clear
clc
clf


%% SET PARAMETERS

% Thermal Conductivity [W/(m K)]
k_alum = 205;           % hyper-physics.edu
k_alox = 35;            % accuratus.com
k_wood = 0.113;         % thermtest.com for pine wood

% Density [kg/m^3]
d_alum = 2710;          % thyssen-krupp-materials.co.uk
d_alox = 3950;          % aqua-calc.com
d_wood = 400;           % rpbc.co.nz

% Heat Capacity [J/(kg C)]
c_alum = 902;           % iun.edu
c_alox = 880;           % accuratus.com
c_wood = 2300;          % woodproducts.fi

% Constants
Ti = 400;
Tinf = 293;
thetai = Ti - Tinf;
L = 0.1;
h = 10;
t = linspace(0,100000,50000);

% Alpha
alpha_alum = k_alum/(d_alum*c_alum);
alpha_alox = k_alox/(d_alox*c_alox);
alpha_wood = k_wood/(d_wood*c_wood);

% T-star
tstar_alum = alpha_alum.*t/L^2;
tstar_alox = alpha_alox.*t/L^2;
tstar_wood = alpha_wood.*t/L^2;



%% LUMPED CAPACITY SOLUTION
Tlump_alum = Tinf + thetai.*exp(-h*L*tstar_alum/k_alum);
Tlump_alox = Tinf + thetai.*exp(-h*L*tstar_alox/k_alox);
Tlump_wood = Tinf + thetai.*exp(-h*L*tstar_wood/k_wood);



%% FULL TRANSIENT SOLUTION
Bi_alum = h*L/k_alum
Bi_alox = h*L/k_alox
Bi_wood = h*L/k_wood

l1_alum = 0.0998;
c1_alum = 1.0017;
l1_alox = 0.1410+(Bi_alox-0.02)*(0.1987-0.1410)/(0.04-0.02);
c1_alox = 1.0033+(Bi_alox-0.02)*(1.0066-1.0033)/(0.04-0.02);
l1_wood = 1.3987+(Bi_wood-8)*(1.4149-1.3978)/(9-8);
c1_wood = 1.2570+(Bi_wood-8)*(1.2598-1.2570)/(9-8);

theta0star_alum = c1_alum*exp(-l1_alum^2*tstar_alum);
theta0star_alox = c1_alox*exp(-l1_alox^2*tstar_alox);
theta0star_wood = c1_wood*exp(-l1_wood^2*tstar_wood);

% centerline temperature (xstar = 0)
Tfull_alum_c = Tinf + thetai*theta0star_alum;
Tfull_alox_c = Tinf + thetai*theta0star_alox;
Tfull_wood_c = Tinf + thetai*theta0star_wood;

% surface temperature (xstar = 1)
Tfull_alum_s = Tinf + thetai*theta0star_alum*cos(l1_alum);
Tfull_alox_s = Tinf + thetai*theta0star_alox*cos(l1_alox);
Tfull_wood_s = Tinf + thetai*theta0star_wood*cos(l1_wood);



%% PLOT
figure(1)   % aluminum
plot(t,Tlump_alum,t,Tfull_alum_c,t,Tfull_alum_s,'LineWidth',3)
set(gca,'FontSize',18)
xlabel('elapsed time (s)'); ylabel('temperature (K)')
legend('lumped centerline and surface','full transient centerline',...
    'full transient surface','Location','Best')

figure(2)   % aluminum oxide
plot(t,Tlump_alox,t,Tfull_alox_c,t,Tfull_alox_s,'LineWidth',3)
set(gca,'FontSize',18)
xlabel('elapsed time (s)'); ylabel('temperature (K)')
legend('lumped centerline and surface','full transient centerline',...
    'full transient surface','Location','Best')

figure(3)   % pine wood
plot(t,Tlump_wood,t,Tfull_wood_c,t,Tfull_wood_s,'LineWidth',3)
set(gca,'FontSize',18)
xlabel('elapsed time (s)'); ylabel('temperature (K)')
legend('lumped centerline and surface','full transient centerline',...
    'full transient surface','Location','Best')
