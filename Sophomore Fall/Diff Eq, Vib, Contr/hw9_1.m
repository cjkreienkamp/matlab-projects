% Chris Kreienkamp
% Sat Nov 25, 2017
% Homework 9, 11.2

clear all
clf
clc


%% 11.2

% x1 Numerical Approximation
time_period = [0,1];
initial = [0,0];
[t1,y1] = ode45(@ode45fun1, time_period, initial);

% x2 Numerical Approximation
time_period = [1,2];
initial = [2/(9*pi^2),0];
[t2,y2] = ode45(@ode45fun2,time_period,initial);

% x3 Numerical Approximation
time_period = [2,3];
initial = [-2/(9*pi^2),0];
[t3,y3] = ode45(@ode45fun1, time_period, initial);

% x4 Numerical Approximation
time_period = [3,4];
initial = [4/(9*pi^2),0];
[t4,y4] = ode45(@ode45fun2,time_period,initial);


% Part 1 Solutions
t10 = linspace(0,1,1000);
t11 = linspace(1,2,1000);
t12 = linspace(2,3,1000);
t13 = linspace(3,4,1000);
x1 = -1/(9*pi^2)*cos(3*pi*t10)+1/(9*pi^2);
x2 = -2/(9*pi^2)*cos(3*pi*t11);
x3 = -1/(3*pi^2)*cos(3*pi*t12)+1/(9*pi^2);
x4 = -4/(9*pi^2)*cos(3*pi*t13);

% Fourier Transform
N = 100;
c1 = 0;
for i = 1:N
    if i == 3
        c1new = 0;
    else
        c1new = 1/(3*pi)*(cos(N*pi)-1)/(pi^2*(9-N^2));
    end
    c1 = c1 + c1new;
end
t = linspace(0,4,1000);
xf = c1*sin(3*pi*t)-1/(18*pi^2)*cos(3*pi*t)+1/(18*pi^2);
for i = 1:N
    if i == 3
        xfnew = t.*(-1/(9*pi^2).*cos(3*pi*t));
    else
        xfnew = (1-cos(N*pi))/(N*pi^3*(9-N^2))*sin(N*pi*t);
    end
    xf = xf + xfnew;
end

%% PLOT

figure(1)
plot(t1,y1(:,1),'r',t2,y2(:,1),'b',t3,y3(:,1),'m',t4,y4(:,1),'c')
legend('x_1(t) Numerical Approximation','x_2(t) Numerical Approximation',...
    'x_3(t) Numerical Approximation','x_4(t) Numerical Approximation',...
    'Location','Southwest')
set(gca,'FontSize',15)
xlabel('t'); ylabel('x(t)')

figure(2)
plot(t10,x1,'r',t11,x2,'b',t12,x3,'m',t13,x4,'c')
legend('x_1(t) Part 1 Solution','x_2(t) Part 1 Solution',...
    'x_3(t) Part 1 Solution','x_4(t) Part 1 Solution','Location','Southwest')
set(gca,'FontSize',15)
xlabel('t'); ylabel('x(t)')

figure(3)
plot(t,xf,'m')
legend('Fourier Solution','Location','Southwest')
set(gca,'FontSize',20)
xlabel('t'); ylabel('x(t)')

