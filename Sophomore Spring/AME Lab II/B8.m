% Chris Kreienkamp, 901965168
% Fri Mar 23, AME 20217
% Experiment B8 - Fluids

clear
clc



%% PART I - kinematic viscosity vs temperature
temp = [14.9 24.6 54.9 67.7 110.3]+273.15;
K = 3.5;
C = 14;
tz = [74.44 40.76 19.31 17.87 14.25];       % (s)
kvisc = K*(tz-C);                           % (centiStoke cSt)

plot(temp, kvisc,'ro','MarkerSize',10,'LineWidth',5)
xlabel('Temperature T (K)'); ylabel('Kinematic Viscosity \nu (cSt)');
set(gca,'FontSize',22)



%% PART I - Arrhenius plot
atemp = 1./temp;
akvisc = log(kvisc);
trendline = fit(atemp',akvisc','poly1');

figure(2)
plot(atemp,akvisc,'ro','MarkerSize',10,'LineWidth',5); hold on
h = plot(trendline,'b-'); hold off
h.LineWidth = 4;
xlabel('1/T (K^{-1})'); ylabel('ln(\nu [cSt])');
set(gca,'FontSize',22)
legend('Measured Data','Linear Fit','Location','Southeast')



%% PART II - terminal velocity vs sphere diameter (TEFLON)
rhoL = 1.26/1000*100^3;
tefrhoS = 2.16/1000*100^3;
delrhoS = 1.42/1000*100^3;
eta = .95;
tefd = [1/16 3/32 1/8 5/32 3/16 1/4]*2.54/100;      % (m)
tefx = [98 98 98 98 98 98]/1000;                    % (m)
teft = [91.07 47.02 28.09 19.64 14.00 9.26];        % (s)
teftermv = tefx./teft;                              % (m/s)
tef_x = linspace(0,7e-3,100);
tef_y = 2*(tefrhoS-rhoL)*9.80/(9*eta).*(tef_x./2).^2;

figure(3)
plot(tefd,teftermv,'ro','MarkerSize',10,'LineWidth',5); hold on
plot(tef_x,tef_y,'b-','LineWidth',4); hold off
xlabel('Sphere Diameter (m)'); ylabel('Terminal Velocity \nu_t (m/s)');
legend('Measured Velocity','Theoretical Velocity','Location','Northwest')
set(gca,'FontSize',22)
axis([0 7e-3 0 .02]);



%% PART II - terminal velocity vs sphere diameter (DELRIN)
deld = [1/8 5/32 3/16 1/4 5/16]*2.54/100;           % (m)
delx = [98 98 98 98 98]/1000;                        % (m)
delt = [199.59 160.51 100.13 74.09 58.27];          % (s)
deltermv = delx./delt;                              % (m/s)
del_x = linspace(0,9e-3,100);
del_y = 2*(delrhoS-rhoL)*9.80/(9*eta)*(del_x/2).^2;

figure(4)
plot(deld,deltermv,'ro','MarkerSize',10,'LineWidth',5); hold on
plot(del_x,del_y,'b-','LineWidth',4); hold off
xlabel('Sphere Diameter (m)'); ylabel('Terminal Velocity \nu_t (m/s)');
legend('Measured Velocity','Theoretical Velocity','Location','Northwest')
set(gca,'FontSize',22)
axis([0 9e-3 0 0.002]);



%% PART II - reynolds number
% Teflon
Fg_tef = 4/3*pi*(tefd/2).^3*(tefrhoS-rhoL)*9.8;
Re_tef = rhoL*teftermv.*tefd/eta;
Fd_tef = 6*pi*eta.*tefd/2.*teftermv;
Cd_tef = Fd_tef./(1/2*rhoL.*teftermv.^2*pi.*(tefd./2).^2);
trend_tef = fit(log(Re_tef'),log(Cd_tef'),'poly1');
% Delrin
Fg_del = 4/3*pi*(deld/2).^3*(delrhoS-rhoL)*9.8;
Re_del = rhoL*deltermv.*deld/eta;
Fd_del = 6*pi*eta.*deld/2.*deltermv;
Cd_del = Fd_del./(1/2*rhoL.*deltermv.^2*pi.*(deld./2).^2);
trend_del = fit(log(Re_del'),log(Cd_del'),'poly1');

figure(5)
plot(log(Re_tef),log(Cd_tef),'ro','MarkerSize',8,'LineWidth',4); hold on
plot(log(Re_del),log(Cd_del),'bo','MarkerSize',8,'LineWidth',4); hold on
plot(trend_tef,'k-'); hold off
xlabel('log(Re)'); ylabel('log(C_d)');
legend('Teflon','Delrin','Linear Fit','Location','Northeast')
set(gca,'FontSize',22)
axis([-7 -2 5.0 9.75])


