% Chris Kreienkamp
% 11/11/17
% Experiment A10: Transient Signals

clear all
clf
clc

%% 1. temperature vs time for heating and cooling with both size thermocouples
icesmall = xlsread('icesmall');
icebig = xlsread('icebig');
hotsmall = xlsread('hotsmall');
hotbig = xlsread('hotbig');
TABsensitivity = 10/1000;   % (V/degree C)
icebig_time = icebig(:,1);    % (s)
icesmall_time = icesmall(:,1);  % (s)
icebig_temp = icebig(:,2)./TABsensitivity;    % (degree C)
icesmall_temp = icesmall(:,2)./TABsensitivity;  % (degree C)
hotbig_time = hotbig(:,1);    % (s)
hotsmall_time = hotsmall(:,1);  % (s)
hotbig_temp = hotbig(:,2)./TABsensitivity;    % (degree C)
hotsmall_temp = hotsmall(:,2)./TABsensitivity;  % (degree C)

figure(1)
hotsmall_new = smooth(hotsmall_temp,7,'moving');
hotbig_new = smooth(hotbig_temp,7,'moving');
icesmall_new = smooth(icesmall_temp,7,'moving');
icebig_new = smooth(icebig_temp,7,'moving');
plot(icesmall_time,icesmall_new,'g-',icebig_time,icebig_new,'b-',...
    hotsmall_time,hotsmall_new,'k-',hotbig_time,hotbig_new,'m-')
ylabel('Temperature (^oC)')
xlabel('Time (s)')
set(gca,'FontSize',20)
legend('1/16'''' Ice Water','1/4'''' Ice Water',...
    '1/16'''' Warm Water','1/4'''' Warm Water','Location','best')


%% 2. linearize the temperature data
hotsmall_edit = hotsmall_new(145:209);
hotbig_edit = hotbig_new(117:875);
icesmall_edit = icesmall_new(109:148);
icebig_edit = icebig_new(112:875);
hotsmall_templin = log((hotsmall_edit-hotsmall_new(210))/((hotsmall_edit(1)-hotsmall_new(210))));
hotbig_templin = log((hotbig_edit-hotbig_new(876))/((hotbig_edit(1)-hotbig_new(876))));
icesmall_templin = log((icesmall_edit-icesmall_new(149))/((icesmall_edit(1)-icesmall_new(149))));
icebig_templin = log((icebig_edit-icebig_new(876))/((icebig_edit(1)-icebig_new(876))));
icesmall_fit = fit(icesmall_time(109:148),icesmall_templin,'poly1');
icebig_fit = fit(icebig_time(112:516),icebig_templin(1:405),'poly1');
hotsmall_fit = fit(hotsmall_time(145:209),hotsmall_templin,'poly1');
hotbig_fit = fit(hotbig_time(117:450),hotbig_templin(1:334),'poly1');

figure(3)
plot(icesmall_time(109:148),icesmall_templin,'g',icebig_time(112:875),icebig_templin),'b'; hold on
plot(hotsmall_time(145:209),hotsmall_templin,'k',hotbig_time(117:875),hotbig_templin,'m'); hold on
plot(icesmall_fit); hold on; plot(icebig_fit); hold on
plot(hotsmall_fit); hold on; plot(hotbig_fit);

axis([3 15 -6 1])
xlabel('Time (s)')
ylabel('Linearized Temperature (^oC)')
set(gca,'FontSize',20)
legend('1/16'''' Ice Water','1/4'''' Ice Water','1/16'''' Warm Water','1/4'''' Warm Water','Location','Southeast')


%% 3. find the time constants
cibig = coeffvalues(icebig_fit);
cismall = coeffvalues(icesmall_fit);
chsmall = coeffvalues(hotsmall_fit);
chbig = coeffvalues(hotbig_fit);
tauibig = -1/cibig(1);
tauismall = -1/cismall(1);
tauhbig = -1/chbig(1);
tauhsmall = -1/chsmall(1);


%% 4. plot of measured amplitude vs frequency with theoretical curve
omega= [36.0 36.5 37.0 37.5 38.0 38.5 39.0 39.5 38.7 39.9 40.1...
    40.0 40.3 40.4 40.5 40.7 40.9 41.4 41.9 42.4 42.9 43.4]; % (kHz)
amp_meas = [.200 .200 .240 .280 .360 .600 .720 1.04 1.12 1.84 3.52...
    2.60 3.68 2.88 2.32 1.68 1.32 .480 .280 .240 .200 .200];    % (V)
fwhm = 40.56-39.94; % (kHz)
Vmax = 4.1;         % (V)
omega_not = 40.2;   % (kHz)
beta = sqrt(3)/fwhm;
omega_theor = linspace(36.0,43.5,10000);
amp_theor = omega_not*Vmax./(beta.*sqrt((omega_theor/beta).^2+(omega_theor.^2-omega_not^2).^2));

figure(4)
plot(omega,amp_meas,'ro',omega_theor,amp_theor,'b-')
xlabel('Frequency (kHz)')
ylabel('Amplitude (V)')
legend('Measured Values','Theoretical Curve')
set(gca,'FontSize',20)
axis([36.0 43.5 0 5])


%% 5. Damping ratio
zeta = 1/(2*beta*omega_not);


%% 8. strain gauge output vs time
baseball = xlsread('baseball.xls');
time = baseball(:,1);
ydc = baseball(:,2);
omega_d = 140*2*pi; % (radians), ringing frequency
phase = 2.21+omega_d*0.01863;       % (radians)
t1 = 0.02293;
y1 = 0.04933;
t2 = 0.03026;
y2 = 0.03987;
lambda = log(y1/y2)/(t2-t1);
A = .11;              % estimate
baseball_fit = A.*exp(-lambda*time).*sin(omega_d*time+phase);

figure(5)
ydc_smooth = smooth(ydc,15,'moving');
plot(time,ydc_smooth,'r-',time,baseball_fit,'b-')
xlabel('Time (s)')
ylabel('Strain Gauge Output (V)')
set(gca,'FontSize',20)
legend('Measured Value','Curve Fit')


%% 9. damping ratio
zetaB = lambda^2/(lambda^2-omega_d^2);

