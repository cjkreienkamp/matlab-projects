% Tait McGlinn
% Computing HW 9
% Due 11/9/17
 
clear all
close all
clc
 
output=[0.0000000       1.00000000
    0.10000000 0.90483332
    0.20000000 0.81872332
    0.30000001 0.74080813
    0.40000001 0.67030787
    0.50000000 0.60651690
    0.60000002 0.54879671
    0.70000005 0.49656954
    0.80000007 0.44931266
    0.90000010 0.40655306
    1.00000010 0.36786276];
 
x = output(:,1);
y = output(:,2);
 
xx=linspace(0,1,11);
yy=exp(-x);
 
figure(1)
plot(x,y,'ro',xx,yy,'b-');
xlabel('t')
ylabel('y(t)')
 
legend('Approximate Solution',' y = e^-^t');
set(gca,'Fontsize',20);
 
 
 
 
 
%% error
 
error = [1 3.45461369E-02
    0.5 2.86212564E-03
    0.2 1.43975019E-04
    0.1 1.66296959E-05
    0.05 2.05636024E-06
    0.01 2.08616257E-07
    0.0001 3.27825546E-07
    0.00001 1.19209290E-07
    0.000001 6.55651093E-07];
 
 
 
 
linfit = [1 3.45461369E-02
    0.5 2.86212564E-03
    0.2 1.43975019E-04
    0.1 1.66296959E-05
    0.05 2.05636024E-06];
 
 
errorfit = fit(log(linfit(:,1)),log(linfit(:,2)),'poly1');
errorslope = coeffvalues(errorfit)
 
 
figure(2)
plot(log(error(:,1)),log(error(:,2)),'bo');
hold on
plot(errorfit)
xlabel('\Delta t')
ylabel('|Error|')
set(gca,'Fontsize',14);
legend('|Error|','Linear Fit','Location','Northwest')
 
 
 
hold on
axis([-14 0 -20 0])