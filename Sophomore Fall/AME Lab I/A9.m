% Chris Kreienkamp
% Experiment A9 - Practical Implementation of Sensors
% 11/2/17
clear
clf
clc


%% Mass vs voltage
mass_1 = [0 10 20 30 40 50 60]; % (g)
Vout_1 = [0.00 0.39 0.82 1.13 1.58 2.02 2.39];  % (V)
fit_1 = fit(Vout_1',mass_1','poly1');
coeff_1 = coeffvalues(fit_1);

figure(1)
plot(Vout_1,mass_1,'bo'); hold on; plot(fit_1,'r')
xlabel('Voltage (V)')
ylabel('Mass (g)')
legend('Measured Voltage','Linear Fit','Location','Northwest')
set(gca,'FontSize',16)


%% Measured mass vs discrete number of ping pong balls
numBalls_2 = [1 2 3 4 5];
Vout_2 = [0.05 0.12 0.26 0.39 0.48];    % (V)
mass_2 = coeff_1(1)*Vout_2+coeff_1(2);  % (g)
fit_2 = fit(numBalls_2',mass_2','poly1');
coeff_2 = coeffvalues(fit_2);
error = 0;
residual = zeros(1,5);
for i=1:5
    residual(i) = abs(mass_2(i)-coeff_2(1)*i-coeff_2(2));
    error = error+residual(i)^2;
end

figure(2)
plot(numBalls_2,mass_2,'bo'); hold on; plot(fit_2,'r')
xlabel('Discrete Number of Ping Pong Balls')
ylabel('Measured Mass (g)')
legend('Measured Mass','Linear Fit','Location','Northwest')
set(gca,'FontSize',16)


%% Photocell output voltage vs time
data_4 = xlsread('fanspeed.xls');
time_4 = data_4(:,3);
Vout_4 = data_4(:,4);

figure(3)
plot(time_4,Vout_4,'b-')
xlabel('Time (s)')
ylabel('Photocell Output Voltage (V)')
axis([0 0.01 0.75 1])
set(gca,'FontSize',16)


%% Temperature vs time thermistor and fan speed vs time
data_5 = xlsread('A8Therm.xls');
timeTherm = data_5(:,1);
voltTherm = data_5(:,2);
Rfix = 10000;   % Ohms
Rref = 10000;
Vin = 5;
A = 3.354016e-3;
B = 2.56985e-4;
C = 2.620131e-6;
D = 6.383091e-8;
Rtherm = Rfix.*(Vin./voltTherm-1);
temp = 1./(A+B*log(Rtherm./Rref)+C*(log(Rtherm./Rref)).^2+D*(log(Rtherm./Rref)).^3);

initialx = 3;
initialy = 4;
% for n = 4:1:13
%     initialx = initialx+2;
%     initialy = initialy+2;
%     figure(n)
%     plot(data_4(:,initialx),data_4(:,initialy))
%     xlabel('Time (s)')
%     ylabel('Photocell Output Voltage (V)')
%     axis([0 0.01 0.75 1])
%     set(gca,'FontSize',16)
%     title(['time = ',num2str(n-3),' seconds'])
% end
timeFan = [0 1 2 3 4 5,...
    6 7 8 9 10];
periodFan = [.00205 .002025 .00205 .0020375 .0020375 .002025...
    .00205 .0020375 .002025 .0020375 .00205];
fanspeed = 60/15./periodFan;

figure(100)
yyaxis left
plot(timeTherm,temp,'b-')
ylabel('Temperature (K)')
set(gca,'FontSize',16)
axis([0 10 314.5 316])
figure(100)
yyaxis right
plot(timeFan,fanspeed,'o')
ylabel('Fan Speed (RPM)')
xlabel('Time (min)')
set(gca,'FontSize',16)
axis([0 10 1930 2000])