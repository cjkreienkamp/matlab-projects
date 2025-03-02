% Chris Kreienkamp, 901965168
% Wed, Dec 6, 2017
% AME Lab I, HW3

clear all
close all
clc


%% 2A
T = 6;
range = 2*T;
output = 0;
sample = 1000;

for N = [1,4,100]
    t = linspace(0,2*T,sample);
    f = zeros(sample,1);
    for i = 1:sample
        input = t(i);
        for n = 1:N
            fnew = 1/(2*n-1)*sin((2*n-1)*2*pi/T*input);
            output = output+fnew;
        end
        f(i) = 4/pi*output;
    end
    figure(1)
    plot(t,f,'Linewidth',2); hold on
end
legend('N = 1','N = 4','N = 100','Location','Best')
xlabel('t'); ylabel('f(t)')
set(gca,'FontSize',20)


%% 2B
for N = [1,4,100]
    t = linspace(0,2*T,sample);
    f = zeros(sample,1);
    for i = 1:sample
        input = t(i);
        for n = 1:N
            fnew = 4/pi^2*((cos(2*pi*(2*n-1)))/T*input)/(2*n-1)^2;
            output = output+fnew;
        end
        f(i) = 1/2-output;
    end
    figure(2)
    plot(t,f,'Linewidth',2); hold on
end
figure(2)
legend('N = 1','N = 4','N = 100','Location','Best')
xlabel('t'); ylabel('f(t)')
set(gca,'FontSize',20)


%% 7
clear
clc
transmission = xlsread('transmission_lifetimes.xlsx');
transmission = transmission(1:500,1);
mean = mean(transmission);
s = std(transmission);
Nbins = 30;
xmax = max(transmission);
xmin = min(transmission);
N = length(transmission);
x = linspace(0,3*10^5,10^7);
rho = (xmax-xmin)*N/(Nbins*s*sqrt(2*pi)).*exp(-(x-mean).^2/(2*s^2));

figure(3)
histogram(transmission,Nbins); hold on
plot(x,rho,'r-','Linewidth',3); hold off
xlabel('Frequency'); ylabel('Transmission Mileage')
legend('Actual Distribution','Theoretical Distribution')
set(gca,'FontSize',20)


