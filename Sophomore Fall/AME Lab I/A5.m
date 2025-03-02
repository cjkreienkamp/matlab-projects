% Experiment A5 - Electronics II
clear
clc
clf


%% Vout vs frequency

% Input Data
f = [100 1000 1500 2000 3000 5000 7000 10000];      % Frequency (Hz)
farray = linspace(100,10000,10000);                 % Array of Frequencies (Hz)
Vout1 = [1.2 6 8.6 10.8 13.6 16.8 18 18.8];         % Voltage Out(V) Amplitude,R = 1 kilo-ohm
Vout2 = [1.6 10.8 13.6 15.6 17.6 19.2 19.6 20];     % Voltage Out(V) Amplitude,R = 2 kilo-ohm
omegaArray = 2*pi.*farray;                          % frequency (rad/s)
R1 = 1000;                                          % resistance (ohms)
R2 = 1981;                                          % resistance (ohms)
C = .047e-6;                                        % capacitance (microFarads)
Vin1 = 20.6;                                        % input voltage (V)
Vin2 = 20.8;                                        % input voltage (V)
VoutTheor1 = (omegaArray*R1*C)./(sqrt(1+(omegaArray*R1*C).^2))*Vin1;  % Theoretical Output Voltage (V)
VoutTheor2 = (omegaArray*R2*C)./(sqrt(1+(omegaArray*R2*C).^2))*Vin2;  % Theoretical Output Voltage (V)

% Plot
figure(1)
plot(f,Vout1,'ro',farray,VoutTheor1,'r-',f,Vout2,'bo',farray,VoutTheor2,'b-')
xlabel('Frequency, f (Hz) ')
ylabel('Output Voltage Amplitude, |V_o_u_t| (V)')
axis([0,10500,0,23])
set(gca,'FontSize',16)
legend('R = 1.000 k\Omega Measured','R = 1.000 k\Omega Theoretical',...
    'R = 1.981 k\Omega Measured','R = 1.981 k\Omega Theoretical','Location', 'Southeast')


%% phase angle vs frequency

% Input Data
phase1 = [2460 294 121 82 44.4 18.8 10.12 5.1]*1e-6;        % Phase deltaT (s)
phase2 = [2430 161 88 55.8 26.8 10.2 5.3 2.7]*1e-6;         % Phase deltaT (s)
omegad = 360.*f;                                            % frequency (degrees/s)
phase1angle = phase1.*omegad;                               % Phase Angle, R = 1 kilo-ohm
phase2angle = phase2.*omegad;                               % Phase Angle, R = 2 kilo-ohm
phase1Theor = atand(1./(omegaArray*R1*C));                  % Theoretical Phase Angle
phase2Theor = atand(1./(omegaArray*R2*C));                  % Theoretical Phase Angle

% Plot
figure(2)
plot(f,phase1angle,'ro',farray,phase1Theor,'r-',f,phase2angle,'bo',farray,phase2Theor,'b-')
xlabel('Frequency, f (Hz) ')
ylabel('Phase Angle, \phi (^o)')
axis([0,10500,0,110])
set(gca,'FontSize',16)
legend('R = 1.000 k\Omega Measured','R = 1.000 k\Omega Theoretical',...
    'R = 1.981 k\Omega Measured','R = 1.981 k\Omega Theoretical','Location', 'Northeast')


%% Vout / Vin vs 2pifRC

% Input Data
outOverIn1 = Vout1./Vin1;                                   % Vout/Vin, R = 1 kilo-ohm
outOverIn2 = Vout2./Vin2;                                   % Vout/Vin, R = 2 kilo-ohm
omegaRC1 = 2*pi.*f*R1*C;                                    % frequency (rad/s),R = 1 kilo-ohm
omegaRC2 = 2*pi.*f*R2*C;                                    % frequency (rad/s),R = 2 kilo-ohm
omegaRC = linspace(0,6,100);
ampTheor = omegaRC./sqrt(1+omegaRC.^2);

% Plot
figure(3)
plot(omegaRC1,outOverIn1,'ro',omegaRC2,outOverIn2,'bo',omegaRC,ampTheor,'k')
xlabel('2*\pi*f*R*C')
ylabel('|V_o_u_t / V_i_n|')
set(gca,'FontSize',16)
legend('R = 1.000 k\Omega Measured','R = 1.981 k\Omega Measured',...
    'Nondimensional Theoretical','Location', 'Southeast')



%% phase vs 2pifRC

% Input Data
phase1rad = phase1angle.*2*pi/360;
phase2rad = phase2angle.*2*pi/360;
phaseTheor = atan(1./omegaRC);

% Plot
figure(4)
plot(omegaRC1,phase1rad,'ro',omegaRC2,phase2rad,'bo',omegaRC,phaseTheor,'k')
xlabel('2*\pi*f*R*C')
ylabel('Phase Angle, \phi (radians)')
%axis([0,10500,0,110])
set(gca,'FontSize',16)
legend('R = 1.000 k\Omega Measured','R = 1.981 k\Omega Measured',...
    'Nondimensional Theoretical','Location', 'Northeast')



%% Vout / Vin vs f Part II

% Input Data
Vout5 = [1 2.4 4.2 6.8 8.8 10 10.4 10.8 11.2 11.2];         % Output Voltage (V)
Vin5 = 20.8;                                                % Input Voltage (V)
outOverIn5 = Vout5 / Vin5;                                  % Vout / Vin
f5 = [1 5 10 20 30 45 50 65 85 100]*1e3;                    % Frequency (Hz)
cutoff = 50e3*ones(1,100);



% Plot
figure(5)
plot(f5,outOverIn5,'ro',cutoff,linspace(0,1,100),'b-')
xlabel('Frequency, f (Hz) ')
ylabel('|V_o_u_t / V_i_n|')
%axis([0,10500,0,110])
set(gca,'FontSize',16)










