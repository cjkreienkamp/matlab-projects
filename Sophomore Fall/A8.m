% Experiment A8 - Electronics III
% 10/27/17
clear
clf
clc

%% Gain vs R1
R1p1 = [98.6 468 1002 1971 9980];    % (Ohms)
N = 10500;
array = linspace(0,N,N);
Voutp1 = [2.20 2.94 4.00 6.48 22.0]; % (V)
R2p1 = 1001; % (Ohms)
Vinp1 = 2.08;    % (V)
Gain1meas = Voutp1./Vinp1;
Gain1theor = 1+array./R2p1;

figure(1)
plot(array,Gain1theor,'r-',R1p1,Gain1meas,'bo')
xlabel('R_1 (\Omega) ')
ylabel('Gain')
set(gca,'FontSize',16)
legend('Experimental Values','Theoretical Values','Location', 'Northwest')
axis([0,10250,0,12])


%% Gain vs R1
R1p2 = [99.5 459 1002 1969 9980];    % (Ohms)
Voutp2 = [19.0 3.68 1.92 0.860 0.160];  % (V)
R2p2 = 1001; % (Ohms)
Vinp2 = 1.98;    % (V)
array2 = linspace(100,10500,10500);
Gain2meas = Voutp2./Vinp2;
Gain2theor = R2p2./array2;

figure(2)
plot(array2,Gain2theor,'r-',R1p2,Gain2meas,'bo')
xlabel('R_1 (\Omega) ')
ylabel('Gain')
set(gca,'FontSize',16)
legend('Experimental Values','Theoretical Values','Location', 'Northeast')
axis([0,10250,0,10])