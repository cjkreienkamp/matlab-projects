% Chris Kreienkamp
% Mon Dec 4, 2017
% Experiment A12

clear all
clf
clc


% PART I: MY DATA

% 1) Theoretical probability distribution P(n)
data = xlsread('A12_MON_3PM');
classdata = xlsread('A12_aggregate');
barx = [2 3 4 5 6 7 8 9 10 11 12];
bary = [1/36 2/36 3/36 4/36 5/36 6/36 5/36 4/36 3/36 2/36 1/36];
figure(1)
bar(barx,bary,1,'m'); hold on
xlabel('Sum of two 6-sided dice, n'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([0 14 0 0.25])

% Measured Proability distribution from group data
mydata1 = data(1:100,6);
prob_my1 = histcounts(mydata1)/length(mydata1);

% Poisson error bars
uncertaintymy1 = sqrt(prob_my1/length(mydata1));
errorbar(barx,prob_my1,uncertaintymy1,'bo'); hold off
legend('Theoretical Distribution','Measured Distribution','Location','Best')
avemy1 = mean(mydata1);


%% PART I: LAB SECTION'S DATA

% 1) Theoretical probability distribution P(n)
figure(2)
bar(barx,bary,1,'m'); hold on
xlabel('Sum of two 6-sided dice, n'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([0 14 0 0.25])

% Measured Proability distribution from group data
secdata1 = data(1:100,1:8);
prob_sec1 = histcounts(secdata1)/800;
plot(barx,prob_sec1,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Best')

% Poisson error bars
uncertaintysec1 = sqrt(prob_sec1/800);
errorbar(barx,prob_sec1,uncertaintysec1,'bo'); hold off
avesec1 = mean(secdata1);


%% PART I: ENTIRE CLASS'S DATA

% 1) Theoretical probability distribution P(n)
figure(3)
bar(barx,bary,1,'m'); hold on
xlabel('Sum of two 6-sided dice, n'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([0 14 0 0.25])

% Measured Proability distribution from group data
classdata1 = classdata(1:4458,1);
prob_class1 = histcounts(classdata1)/4458;
plot(barx,prob_class1,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Best')

% Poisson error bars
uncertaintyclass1 = sqrt(prob_class1/4458);
errorbar(barx,prob_class1,uncertaintyclass1,'bo'); hold off
aveclass1 = mean(classdata1);


%% PART II (4 row): MY DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4];
bary = factorial(4)./(factorial(barx).*factorial(4-barx)).*0.5.^barx.*0.5.^(4-barx);
figure(4)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 5 0 0.5])

% Measured Proability distribution from group data
mydata2 = data(1:50,14);
avemy2 = mean(mydata2);
prob_my2 = histcounts(mydata2)/length(mydata2);
plot(barx,prob_my2,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintymy2 = sqrt(prob_my2/length(mydata2));
errorbar(barx,prob_my2,uncertaintymy2,'bo'); hold off


%% PART II (4 row): LAB SECTION'S DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4];
bary = factorial(4)./(factorial(barx).*factorial(4-barx)).*0.5.^barx.*0.5.^(4-barx);
figure(5)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 5 0 0.5])

% Measured Proability distribution from group data
secdata2 = data(1:50,10:17);
avesec2 = mean(secdata2);
prob_sec2 = histcounts(secdata2)/400;
plot(barx,prob_sec2,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintysec2 = sqrt(prob_sec2/400);
errorbar(barx,prob_sec2,uncertaintysec2,'bo'); hold off


%% PART II (4 row): ENTIRE CLASS'S DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4];
bary = factorial(4)./(factorial(barx).*factorial(4-barx)).*0.5.^barx.*0.5.^(4-barx);
figure(6)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 5 0 0.5])

% Measured Probability distribution from group data
classdata2 = classdata(1:2257,2);
aveclass2 = mean(classdata2);
prob_class2 = histcounts(classdata2)/2257;
plot(barx,prob_class2,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintyclass2 = sqrt(prob_class2/2257);
errorbar(barx,prob_class2,uncertaintyclass2,'bo'); hold off


%% PART II (10 row): MY DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4 5 6 7 8 9 10];
bary = factorial(10)./(factorial(barx).*factorial(10-barx)).*0.5.^barx.*0.5.^(10-barx);
figure(7)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 11 0 0.3])

% Measured Proability distribution from group data
mydata3 = data(1:50,24);
avemy3 = mean(mydata3);
prob_my3 = histcounts(mydata3)/length(mydata3);
prob_my3 = [0,prob_my3];
plot(barx,prob_my3,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintymy3 = sqrt(prob_my3/length(mydata3));
errorbar(barx,prob_my3,uncertaintymy3,'bo'); hold off


%% PART II (10 row): LAB SECTION'S DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4 5 6 7 8 9 10];
bary = factorial(10)./(factorial(barx).*factorial(10-barx)).*0.5.^barx.*0.5.^(10-barx);
figure(8)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 11 0 0.32])

% Measured Proability distribution from group data
secdata3 = data(1:50,19:26);
avesec3 = mean(secdata3);
prob_sec3 = histcounts(secdata3)/400;
plot(barx,prob_sec3,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintysec3 = sqrt(prob_sec3/400);
errorbar(barx,prob_sec3,uncertaintysec3,'bo'); hold off


%% PART II (10 row): ENTIRE CLASS'S DATA

% 1) Theoretical probability distribution P(n)
barx = [0 1 2 3 4 5 6 7 8 9 10];
bary = factorial(10)./(factorial(barx).*factorial(10-barx)).*0.5.^barx.*0.5.^(10-barx);
figure(9)
bar(barx,bary,1,'m'); hold on
xlabel('Plinko board bin'); ylabel('Probability Distribution, P(n)')
set(gca,'FontSize',20)
axis([-1 11 0 0.32])

% Measured Proability distribution from group data
classdata3 = classdata(1:2155,3);
aveclass3 = mean(classdata3);
prob_class3 = histcounts(classdata3)/2155;
plot(barx,prob_class3,'bo'); hold on
legend('Theoretical Distribution','Measured Distribution','Location','Northeast')

% Poisson error bars
uncertaintyclass3 = sqrt(prob_class3/2155);
errorbar(barx,prob_class3,uncertaintyclass3,'bo'); hold off


%% PART III (1%): MY DATA

figure(10)
Nbins = 10;
% Measured Proability distribution from group data
mydata4 = data(1:50,32);
histogram(mydata4,Nbins,'Binwidth',.7); hold on

% Theoretical Gaussian distribution
N = length(mydata4);
s = std(mydata4);
ave = mean(mydata4);
rmax = max(mydata4);
rmin = min(mydata4);
r = linspace(0,2000,100000);
theor4 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi))*exp(-(r-ave).^2/(2*s^2));
plot(r,theor4,'Linewidth',2); hold off;
axis([990 1002 0 11])
xlabel('Resistance (\Omega)'); ylabel('Frequency');
legend('Measured Distribution','Theoretical Distribution')
set(gca,'FontSize',20)
disp([ave,s])


%% PART III (1%): LAB SECTION'S DATA

figure(11)
Nbins = 10;
% Measured Proability distribution from group data
secdata4 = data(1:400,28);
histogram(secdata4,Nbins,'Binwidth',1); hold on

% Theoretical Gaussian distribution
N = length(secdata4);
s = std(secdata4);
ave = mean(secdata4);
rmax = max(secdata4);
rmin = min(secdata4);
theorsec4 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi))*exp(-(r-ave).^2/(2*s^2));
plot(r,theorsec4,'Linewidth',2); hold off;
axis([990 1004 0 116])
legend('Measured Distribution','Theoretical Distribution')
xlabel('Resistance (\Omega)'); ylabel('Frequency');
set(gca,'FontSize',20)
disp([ave,s])

%% PART III (1%): ENTIRE CLASS'S DATA

figure(12)
Nbins = 40;
% Measured Proability distribution from group data
classdata4 = classdata(1:2223,4);
histogram(classdata4,Nbins,'Binwidth',.9); hold on

% Theoretical Gaussian distribution
N = length(classdata4);
s = std(classdata4);
ave = mean(classdata4);
rmax = max(classdata4);
rmin = min(classdata4);
theorclass4 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi))*exp(-(r-ave).^2/(2*s^2));
plot(r, theorclass4,'Linewidth',2); hold off;
axis([988 1005 0 520])
legend('Measured Distribution','Theoretical Distribution')
xlabel('Resistance (\Omega)'); ylabel('Frequency');
set(gca,'FontSize',20)
disp([ave,s])

%% PART III (5%): MY DATA

figure(13)
Nbins = 13;
% Measured Proability distribution from group data
mydata5 = data(1:50,41);
histogram(mydata5,Nbins,'Binwidth',0.9); hold on

% Theoretical Gaussian distribution
N = length(mydata5);
s = std(mydata5);
ave = mean(mydata5);
rmax = max(mydata5);
rmin = min(mydata5);
theor5 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi))*exp(-(r-ave).^2/(2*s^2));
plot(r,theor5,'Linewidth',2); hold off;
axis([970 995 0 12])
legend('Measured Distribution','Theoretical Distribution')
xlabel('Resistance (\Omega)'); ylabel('Frequency');
set(gca,'FontSize',20)
disp([ave,s])

%% PART III (5%): LAB SECTION'S DATA

figure(14)
Nbins = 14;
% Measured Proability distribution from group data
secdata5 = data(1:403,37);
histogram(secdata5,Nbins,'Binwidth',1.2); hold on

% Theoretical Gaussian distribution
N = length(secdata5);
s = std(secdata5);
ave = mean(secdata5);
rmax = max(secdata5);
rmin = min(secdata5);
theorsec5 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi))*exp(-(r-ave).^2/(2*s^2));
plot(r,theorsec5,'Linewidth',2); hold off;
axis([960 1010 0 100])
legend('Measured Distribution','Theoretical Distribution')
xlabel('Resistance (\Omega)'); ylabel('Frequency');
set(gca,'FontSize',20)
disp([ave,s])

%% PART III (5%): ENTIRE CLASS'S DATA

figure(15)
Nbins = 65;
% Measured Proability distribution from group data
classdata5 = classdata(1:2180,5);
histogram(classdata5,Nbins,'Binwidth',0.5); hold on

% Theoretical Gaussian distribution
N = length(classdata5);
s = std(classdata5);
ave = mean(classdata5);
rmax = max(classdata5);
rmin = min(classdata5);
theorclass5 = (rmax-rmin)*N/(Nbins*s*sqrt(2*pi)).*exp(-(r-ave).^2/(2*s^2));
plot(r,theorclass5,'Linewidth',2); hold off;
legend('Measured Distribution','Theoretical Distribution')
axis([955 1015 0 200])
xlabel('Resistance (\Omega)'); ylabel('Frequency');
set(gca,'FontSize',20)
disp([ave,s])
