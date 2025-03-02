% Chris Kreienkamp - 901965168
% AME 34334 - Nuclear Science
% Homework #6 - 25 Mar 2019

clear
clc
clf



%% PROBLEM 1
t_half  = [56 23 6.2 2.3 0.61 0.23]';
B_U233  = [0.00023 0.00078 0.00064 0.00074 0.00014 0.00008];
B_U235  = [0.00021 0.00142 0.00128 0.00257 0.00075 0.00027];
B_Pu239 = [0.00007 0.00063 0.00044 0.00069 0.00018 0.00009];

t_half_U233 = B_U233*t_half/sum(B_U233);
t_half_U235 = B_U235*t_half/sum(B_U235);
t_half_Pu239 = B_Pu239*t_half/sum(B_Pu239);
l_U233 = log(2)/t_half_U233;
l_U235 = log(2)/t_half_U235;
l_Pu239 = log(2)/t_half_Pu239;
T_U233 = 100/l_U233;
T_U235 = 100/l_U235;
T_Pu239 = 100/l_Pu239;



%% PROBLEM 2
t2 = linspace(0,0.01,10000);
n2 = 0.935.*exp(-2140.*t2) + 0.0654.*exp(-0.0748.*t2);

%Plot
figure(1)
plot(t2,n2,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('neutron population')



%% PROBLEM 3
biglambda = 5*10^-5;
lambda = 0.08;
theta = 1;
beta = 0.007;
t3 = linspace(0,20,10000);
rho = (biglambda*theta - (biglambda*theta + beta*theta/lambda).*exp(-lambda.*t3)...
    - beta.*(theta.*t3 + 1 - theta/lambda)) ./ (1+theta.*t3) + beta;

%Plot
figure(2)
plot(t3,rho,'b-','LineWidth',3)
set(gca,'FontSize',18)
xlabel('time (s)'); ylabel('reactivity \rho(t) (unitless)')


