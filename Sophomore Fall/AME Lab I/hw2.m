% Chris Kreienkamp, 901965168
% Homework 2
% 10/9/17
clear
clc
clf

%% CURRENT AND VOLTAGE AS A FUNCTION OF TIME
f = 10000;  % (Hz)
omega = 2*pi*f; % (rad/s)
emf = 20;   % (V)
R = 100;    % (Ohms)
C = 2*10^-6;    % (F)
Zeq = sqrt(R^2+(1/(omega*C))^2);
t = linspace(0,0.2,1000);
phi = atan(-1/(omega*R*C));
I = emf/Zeq.*exp(1i*(omega.*t-phi));
V = emf.*exp(1i*omega.*t);

figure(1)
ax = plotyy(t,V,t,I);
xlabel(['Time, t (s)'])
ylabel(ax(1),'Voltage (V)')
ylabel(ax(2),'Current (A)')

%% LINEAR CURVE FITTING
x = [2 3 4 5 6 7 8];
y = [13.2 14.9 16.26 17.96 19.56 20.83 22.71];
xMean = sum(x)/length(x);
yMean = sum(y)/length(y);
sumNum = 0;
sumDen = 0;
N = length(x);             % Number of data points
for count = 1:N
    mNumerator = (x(count)-xMean)*(y(count)-yMean);
    mDenominator = (x(count)-xMean)^2;
    sumNum = mNumerator + sumNum;
    sumDen = mDenominator + sumDen;
end
m = sumNum/sumDen;
b = yMean-m*xMean;
xfit = linspace(0,9,100);
yfit = m.*xfit+b;

figure(2)
plot(x,y,'ro',xfit,yfit,'b-')
xlabel('x')
ylabel('y')
set(gca,'FontSize',24)
legend('Measured Data','Linear Fit','Location','Northwest')