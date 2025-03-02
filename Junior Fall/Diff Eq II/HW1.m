% Chris Kreienkamp - 901965168
% AME 30315 - Diff Eq II
% Homework #1 - 31 Jan 2019

clear
clc
clf



%% CALCULATION
omega = linspace(0,10000,100001)';
magF = sqrt(omega.^6+86*omega.^4-775*omega.^2+625000)./...
    (omega.^4-14*omega.^2+625);
phaseF = atan2((-omega.^3-35*omega),(250-4*omega.^2));
F = magF.*exp(1i*phaseF);

%% MARK CHARACTERISTIC POINTS
plot(real(F(1)),imag(F(1)),'^','MarkerSize',15,'LineWidth',3); hold on
plot(real(F(11)),imag(F(11)),'o','MarkerSize',15,'LineWidth',3); hold on
plot(real(F(101)),imag(F(101)),'*','MarkerSize',15,'LineWidth',3); hold on
plot(real(F(1001)),imag(F(1001)),'+','MarkerSize',15,'LineWidth',3); hold on

%% PLOT
plot(real(F),imag(F),'b','LineWidth',3)
set(gca,'FontSize',22)
xlabel('Real F(s)'); ylabel('Imaginary F(s)')
legend('\omega = 0','\omega = 1','\omega = 10','\omega = 100','Location','best')
axis([-0.2,1.4,-1,0.1])