% 901965168
% Chris Kreienkamp
% 9/6/17
% Homework 1, 1.24
% dx/dt + x = exp(3t)
clear
clc
clf

%% SET PARAMETERS
tInitial = 0;           % initial independent variable
tFinal = 10;            % final independent variable
dt = 0.05;               % time step
x0 = 1;                 % initial condition
x1(1) = x0;              % first dependent variable value
t(1) = tInitial;        % first indpendent variable value


%% EULER'S METHOD
% Euler's Method: x(dt+t) = dx/dt(t)*dt+x(t)
% dx/dt + x(t) = exp(3t)
% dx/dt = exp(3t) - x(t)
i = 1;                          % counter variable
while t(i) < tFinal             % continue until the final time
    dxdt = exp(3*t(i))-x1(i);      % find the derivative of x
    x1(i+1) = dxdt*dt+x1(i);      % find the next dependent variable value
    t(i+1) = t(i) + dt;         % increase independent variable by dt
    i = i+1;                     % increment counter
end

[t2,xODE45] = ode45(@xDeriv,[tInitial,tFinal],x0);  % ODE Solution

%% PLOT RESULTS
plot(t,x1,'b',t2,xODE45,'r')
xlabel('t','FontSize',24);
ylabel('x(t)','FontSize',24);
axis([0 11 0 2e12]);
legend(['\Deltat = ',num2str(dt)],'ODE Solution','Location','Northwest')
set(gca,'FontSize',20);