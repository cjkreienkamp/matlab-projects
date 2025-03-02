% Chris Kreienkamp, 901965168
% Experiment A6/A7 - Solar Panels
% 10/6/17

clear
clc
clf

%% A6 PART I
areaPanel = .24*.175;   % (m^2)
RL = [200 400 600 800 1000 1200 1400 1600 1800 2000];   % (Ohms)
current90 = [18.1 17.8 16.8 14.8 12.9 11.2 9.9 8.9 8.0 7.2];    % (mA)
current110 = [30.8 28.6 23.0 18.5 15.4 13.0 11.3 10.0 9.0 8.1];
current120 = [37.1 32.4 24.7 19.4 16.0 13.5 11.7 10.4 9.2 8.3];
voltage90 = [3.59 7.08 10.06 11.82 12.76 13.39 13.76 14.04 14.26 14.41]; % (V)
voltage110 = [6.06 11.35 13.70 14.69 15.21 15.54 15.74 15.88 16.00 16.08];
voltage120 = [7.33 12.88 14.77 15.54 15.91 16.17 16.32 16.43 16.52 16.59];
power90 = current90.*voltage90;     % (mW)
power110 = current110.*voltage110;
power120 = current120.*voltage120;
volt2Irrad90 = 10^2.114*10*(2.2*1.30-0.035)*10;    % (mW/m^2)
volt2Irrad110 = 10^2.114*10*(2.2*2.20-0.035)*10;
volt2Irrad120 = 10^2.114*10*(2.2*2.68-0.035)*10;
efficiency90 = power90./(volt2Irrad90*areaPanel);
efficiency110 = power110./(volt2Irrad110*areaPanel);
efficiency120 = power120./(volt2Irrad120*areaPanel);

figure(1)
plot(RL,efficiency90,'ro',RL,efficiency110,'bo',RL,efficiency120,'mo')
xlabel('Load Resistance, R_L (\Omega)')
ylabel('Solar Panel Efficiency, \eta_p_a_n_e_l')
set(gca,'FontSize',16)
legend('V_I_N = 90V','V_I_N = 110V','V_I_N = 120V','Location', 'Northeast')


%% A6 PART II
distance = [.895 .860 .820 .781 .742 .705 .665 .63];  % (m)
irradiance90 = [1.916 2.111 2.278 2.488 2.782 3.091 3.479 3.913];   % (V)
irradiance110 = [3.400 3.695 3.856 4.348 4.741 5.202 5.831 6.814];
irradiance120 = [4.195 4.636 5.139 5.592 6.151 6.861 7.606 8.672];
realIrrad90 = 10^2.114*10*(2.2.*irradiance90-0.035)/100;    % (W/m^2)
realIrrad110 = 10^2.114*10*(2.2.*irradiance110-0.035)/100;
realIrrad120 = 10^2.114*10*(2.2.*irradiance120-0.035)/100;
f90 = fit(log(distance'),log(realIrrad90'),'poly1');
f110 = fit(log(distance'),log(realIrrad110'),'poly1');
f120 = fit(log(distance'),log(realIrrad120'),'poly1');
coeff90 = coeffvalues(f90);
coeff110 = coeffvalues(f110);
coeff120 = coeffvalues(f120);
xvalues = linspace(-0.5,-0.1,1000);
fitcurve90 = coeff90(1).*xvalues + coeff90(2);
fitcurve110 = coeff110(1).*xvalues + coeff110(2);
fitcurve120 = coeff120(1).*xvalues + coeff120(2);

figure(2)
plot(distance,realIrrad90,'ro',distance,realIrrad110,'bo',distance,realIrrad120,'mo')
xlabel('Distance, r (m)')
ylabel('Measured Irradiance, E_0 (W/m^2)')
set(gca,'FontSize',16)
legend('V_I_N = 90V','V_I_N = 110V','V_I_N = 120V','Location', 'Northeast')
figure(3)
plot(log(distance),log(realIrrad90),'ro',log(distance),log(realIrrad110),'bo',log(distance),log(realIrrad120),'mo')
hold on
plot(xvalues,fitcurve90,'r-',xvalues,fitcurve110,'b-',xvalues,fitcurve120,'m-')
hold off
xlabel('log(r) (m)')
ylabel('log(E_0) (W/m^2)')
set(gca,'FontSize',16)
legend('V_I_N = 90V','V_I_N = 110V','V_I_N = 120V','Location', 'Northeast')


%% A7 MONOCRYSTALLINE
monoareaPanel = .125*.1625;   % (m^2)
monoRL = 1000;   % (Ohms)
monocurrent90 = [1.1 1.0 0.7 0.8 0.6 0.7 0.6];    % (mA)
monocurrent110 = [1.3 1.3 1.0 1.1 0.7 0.8 0.8];
monocurrent120 = [1.4 1.4 1.0 1.0 0.7 0.9 0.8];
monovoltage90 = [1.089 1.025 0.674 0.750 0.633 0.680 0.655]; % (V)
monovoltage110 = [1.311 1.260 .966 1.057 0.691 0.770 0.776];
monovoltage120 = [1.411 1.355 1.045 1.031 0.730 0.888 0.778];
monopower90 = monocurrent90.*monovoltage90;     % (mW)
monopower110 = monocurrent110.*monovoltage110;
monopower120 = monocurrent120.*monovoltage120;
monoirradiance90 = [1.48 1.22 0.49 0.72 0.42 0.62 0.41];    % (V)
monoirradiance110 = [2.45 1.98 .78 1.13 0.62 0.93 0.63];
monoirradiance120 = [3.02 2.36 0.89 1.36 0.74 1.09 0.74];
monovolt2Irrad90 = 10^2.114*10*(2.2.*monoirradiance90-0.035)*10;    % (mW/m^2)
monovolt2Irrad110 = 10^2.114*10*(2.2.*monoirradiance110-0.035)*10;
monovolt2Irrad120 = 10^2.114*10*(2.2.*monoirradiance120-0.035)*10;
monoeff90 = monopower90./(monovolt2Irrad90*monoareaPanel);
monoeff110 = monopower110./(monovolt2Irrad110*monoareaPanel);
monoeff120 = monopower120./(monovolt2Irrad120*monoareaPanel);
monoefficiency = [monoeff90(1) monoeff110(1) monoeff120(1);...
    monoeff90(2) monoeff110(2) monoeff120(2);...
    monoeff90(3) monoeff110(3) monoeff120(3);...
    monoeff90(4) monoeff110(4) monoeff120(4);...
    monoeff90(5) monoeff110(5) monoeff120(5);...
    monoeff90(6) monoeff110(6) monoeff120(6);...
    monoeff90(7) monoeff110(7) monoeff120(7)];

figure(4)
bar(monoefficiency,'grouped');
xlabel('Filter Color')
ylabel('Solar Panel Efficiency, \eta_p_a_n_e_l')
set(gca,'FontSize',16)
legend('V_I_N = 90V','V_I_N = 110V','V_I_N = 120V','Location', 'Northeast')


%% A7 POLYCRYSTALLINE
polyareaPanel = .125*.155;   % (m^2)
polyRL = 1000;   % (Ohms)
polycurrent90 = [1.1 1.0 0.7 0.8 0.6 0.7 0.6];    % (mA)
polycurrent110 = [1.3 1.3 1.0 1.1 0.7 0.8 0.8];
polycurrent120 = [1.4 1.4 1.0 1.0 0.7 0.9 0.8];
polyvoltage90 = [1.089 1.025 0.674 0.750 0.633 0.680 0.655]; % (V)
polyvoltage110 = [1.311 1.260 .966 1.057 0.691 0.770 0.776];
polyvoltage120 = [1.411 1.355 1.045 1.031 0.730 0.888 0.778];
polypower90 = polycurrent90.*polyvoltage90;     % (mW)
polypower110 = polycurrent110.*polyvoltage110;
polypower120 = polycurrent120.*polyvoltage120;
polyirradiance90 = [1.48 1.22 0.49 0.72 0.42 0.62 0.41];    % (V)
polyirradiance110 = [2.45 1.98 .78 1.13 0.62 0.93 0.63];
polyirradiance120 = [3.02 2.36 0.89 1.36 0.74 1.09 0.74];
polyvolt2Irrad90 = 10^2.114*10*(2.2.*polyirradiance90-0.035)*10;    % (mW/m^2)
polyvolt2Irrad110 = 10^2.114*10*(2.2.*polyirradiance110-0.035)*10;
polyvolt2Irrad120 = 10^2.114*10*(2.2.*polyirradiance120-0.035)*10;
polyeff90 = polypower90./(polyvolt2Irrad90*polyareaPanel);
polyeff110 = polypower110./(polyvolt2Irrad110*polyareaPanel);
polyeff120 = polypower120./(polyvolt2Irrad120*polyareaPanel);
polyefficiency = [polyeff90(1) polyeff110(1) polyeff120(1);...
    polyeff90(2) polyeff110(2) polyeff120(2);...
    polyeff90(3) polyeff110(3) polyeff120(3);...
    polyeff90(4) polyeff110(4) polyeff120(4);...
    polyeff90(5) polyeff110(5) polyeff120(5);...
    polyeff90(6) polyeff110(6) polyeff120(6);...
    polyeff90(7) polyeff110(7) polyeff120(7)];

figure(5)
bar(polyefficiency,'grouped');
xlabel('Filter Color')
ylabel('Solar Panel Efficiency, \eta_p_a_n_e_l')
set(gca,'FontSize',16)
legend('V_I_N = 90V','V_I_N = 110V','V_I_N = 120V','Location', 'Northeast')


%% A7 RESULTS
avemonoeffNONE = mean(monoefficiency(1,:));
avemonoeffRED = mean(monoefficiency(2,:));
avemonoeffGREEN = mean(monoefficiency(3,:));
avemonoeffBLUE = mean(monoefficiency(4,:));
avemonoeffRG = mean(monoefficiency(5,:));
avemonoeffRB = mean(monoefficiency(6,:));
avemonoeffGB = mean(monoefficiency(7,:));
avepolyeffNONE = mean(polyefficiency(1,:));
avepolyeffRED = mean(polyefficiency(2,:));
avepolyeffGREEN = mean(polyefficiency(3,:));
avepolyeffBLUE = mean(polyefficiency(4,:));
avepolyeffRG = mean(polyefficiency(5,:));
avepolyeffRB = mean(polyefficiency(6,:));
avepolyeffGB = mean(polyefficiency(7,:));

