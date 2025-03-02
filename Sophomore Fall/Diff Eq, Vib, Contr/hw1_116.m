% 901965168
% Chris Kreienkamp
% 9/6/17
% Homework 1, 1.16
clear
clc
clf

%% SET PARAMETERS
tInitial = 0;           % initial independent variable
tFinal = 10;            % final independent variable
dt = 0.0001;               % time step
thetadot0 = 1.247;          % initial condition for thetadot
theta0 = 1;             % inital condition for theta
thetadot(1) = thetadot0;        % thetadot array
theta(1) = theta0;              % theta array
t(1) = tInitial;        % first indpendent variable value
g = 9.80;               % acceleration due to gravity
r = 2;                  % radius of circle

%% EULER'S METHOD
% Euler's Method: x(dt+t) = xdot(t)*dt+x(t)
% thetadotdot(t) = -g/r*cos(theta(t))
i = 1;                                              % counter variable
while t(i) < tFinal                         % continue until the final time
    thetadotdot(i) = -g/r*cos(theta(i));            % given equation
    thetadot(i+1) = thetadotdot(i)*dt+thetadot(i);     % find the next thetadot
    theta(i+1) = thetadot(i)*dt + theta(i);         % find next theta
    t(i+1) = t(i) + dt;               % increase independent variable by dt
    i = i+1;                                        % increment counter
end

[t1,xODE45] = ode45('xDerivDeriv',[tInitial tFinal],[theta0 thetadot0]);

%% PLOT RESULTS
plot(t,theta,'b',t1,xODE45(:,1),'r')
xlabel('t','FontSize',24);
ylabel('\Theta','FontSize',24);
legend('Euler''s Method','ODE Solution','Location','Southeast')
set(gca,'FontSize',20);