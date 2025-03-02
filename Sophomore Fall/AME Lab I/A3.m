% Experiment A3 - Electronics I
clear
clc
clf


%% INPUT DATA

% Part I: Voltage Divider
Vin = 10;                                           % Input Voltage
R1 = 984;                                           % Resistance R1 (Ohms)
R2 = [10.0 97.3 465 985 1965 9890 46400];           % Resistance R2 (Ohms)
R2lin = linspace(10,46400,10000);
Vout1 = [.104 .941 3.26 5.07 6.76 9.23 9.94];       % Voltage Out (Volts)
Vout1Theor = R2lin./(R1+R2lin)*Vin;                 % Theoretical Output

% Part II: Non-ideal Power Supply
Voc = 3.21;                                         % Open Circuit Voltage
Isc = .106;                                         % Short Circuit Current
Rs = Voc / Isc;                                     % Internal Resistance
Rl = [4.3 5.2 10.0 14.8 19.8 29.9 46.6 98.1 146.8]; % Load Resistance
Rllin = linspace(4.3,146.8,1000);
Vout2 = [.820 .820 1.17 1.40 1.53 1.69 2.16 2.20 2.41]; % Voltage Out
Vout2Theor = Rllin./(Rs+Rllin)*Voc;                       % Theoretical Output

I = [.1122 .1000 .0907 .0784 .0674 .0515 .0435 .0217 .0161];   % Current
powerL = I.*Vout2;                                  % Power
powerTheor = Rllin.*Voc^2./(Rs+Rllin).^2;                 % Theoretical Power
RsArray = Rs*ones(1,101);
RsLine = linspace(0,100,101);


%% PLOT

% Vout vs R2
figure(1)  
plot(R2,Vout1,'bo',R2lin,Vout1Theor,'r-')
xlabel('R_2 (\Omega)','FontSize',24)
ylabel('V_o_u_t (Volts)','FontSize',24)
axis([0 4.7e4 0 10.5])
set(gca,'FontSize',18)
legend('Measured Output','Theoretical Output','Location', 'Southeast')

% Vout vs Rl
figure(2)  
plot(Rl,Vout2,'bo',Rllin,Vout2Theor,'r-')
xlabel('R_L (\Omega)','FontSize',24)
ylabel('V_o_u_t (Volts)','FontSize',24)
set(gca,'FontSize',18)
legend('Measured Output','Theoretical Output','Location', 'Southeast')

% powerL vs Rl
figure(3)  
plot(Rl,powerL,'bo',Rllin,powerTheor,'r-',RsArray,RsLine,'g-')
xlabel('R_L (\Omega)','FontSize',24)
ylabel('q_L (W)','FontSize',24)
axis([0 150 0 .12])
set(gca,'FontSize',18)
legend('Measured Power','Theoretical Power','R_L=R_S','Location', 'Northeast')