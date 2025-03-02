% Chris Kreienkamp - 901965168
% AME 34334 - Diff Eq II
% Homework #6 - 28 Mar 2019

clear
clc
clf



%% PROBLEM 2

% Calculations
t = linspace(0,10,10000);

syms x1(t1)
dx1 = diff(x1);
eqn1 = 2*diff(x1,t1,2) + diff(x1,t1) - x1 == exp(4*t1);
ic1 = x1(0) == 3;
ic1prime = dx1(0) == 0;
soln1(t1) = dsolve(eqn1,[ic1 ic1prime]);
x1simp = simplify(soln1(t1))
x1hand = 0.0286*exp(4*t) + 1.07*exp(-t) + 1.90*exp(-1/2*t);

syms x2(t2)
dx2 = diff(x2);
eqn2 = diff(x2,t2,2) + 2*diff(x2,t2) + 5*x2 == 6*cos(3*t2) - 4*sin(3*t2);
ic2 = x2(0) == 0;
ic2prime = dx2(0) == 5;
soln2(t2) = dsolve(eqn2,[ic2 ic2prime]);
x2simp = simplify(soln2(t2))
x2hand = sin(3*t) + exp(-t).*sin(2*t);

% Plots
figure(1)
plot(t,x1hand,'b','LineWidth',4); hold on
fplot(x1simp,[0 10],'r','LineWidth',2); hold off
set(gca,'FontSize',18)
xlabel('t'); ylabel('x(t)')
legend('Solution by hand','MATLAB solution')

figure(2)
plot(t,x2hand,'b','LineWidth',4); hold on
fplot(x2simp,[0 10],'r','LineWidth',2); hold off
set(gca,'FontSize',18)
xlabel('t'); ylabel('x(t)')
legend('Solution by hand','MATLAB solution')



%% PROBLEM 3
t3 = linspace(0,10,10000);
y1 = -0.07504*cos(2*t3) + 0.8630*sin(2*t3) + 0.07505*exp(-23*t3);

figure(3)
plot(t3,y1,'b','LineWidth',3)
set(gca,'FontSize',18)
xlabel('t'); ylabel('y(t)')