%% Homework 8, Problem 1
% puckShot.m
% Use the verlet method to calculate the position x and velocity v of a
% puck on a hockey table as a function of time
% Initial Position of Puck: xinit = -Fpb / (2k)
% Initial Velocity: vinit = 0
% Force on Puck: -2kx-gamma*v for x<0 AND -gamma*v for x>=0
% Author: Chris Kreienkamp
clear
clc


%% SET INITIAL PARAMETERS

m = 0.1;        % mass of puck (kg)
k = 20;         % spring constant of rubber band (N/m)
Fpb = 25;       % pull back force (N)
gamma = 0.2;    % drag force proportionality constant (N*s/m)
xmax = 5;       % maximum distance traveled by puck (m)
dt = 0.002;     % timestep (s)

% Initial Conditions
xinit = -Fpb / (2*k);   % Initial Position of Puck (m)
vinit = 0;              % Initial Velocity (m/s)
tinit = 0;


%% INITIALIZE ARRAYS

x(1) = xinit;   % X-Position
v(1) = vinit;   % Velocity
t(1) = tinit;   % Time


%% TIME MARCHING WITH VERLET ALGORITHM

% The calculations will stop when:
% (a) the number of time-steps exceeds 104
% (b) puck reaches xmax, or 
% (c) the velocity is less than vTiny=0.01 m/s (sometime after the launch). 

it = 1;              % COUNTER VARIABLE through the WHILE loop
finished = false;    % CONDITIONAL VALUE for WHILE loop

while ~finished         % WHILE statement for before the puck reaches x=0
    
    % VERLET METHOD - 1. FIND HALF VELOCITY (USING DRAG FORCE AT STEP "it")
   Fdrag = -2*k*x(it) - gamma * v(it);          % Drag Force
   vhalf = v(it) + Fdrag * dt/2;                % Half-velocity
   
    % VERLET METHOD - 2. FIND NEW POSITION (USING HALF VELOCITY)
   x(it+1) = x(it) + vhalf*dt;                  % X-position
    
    % VERLET METHOD - 3. FIND NEW VELOCITY (USING DRAG FOCE AT STEP "it+1")
   Fdrag = -2*k*x(it+1) - gamma * v(it);          % Drag Force
   v(it+1) = vhalf + Fdrag * dt/2;                % X-component velocity
   
   % TIME STEP - NEEDED TO INCREMENT TIME AND COUNTER VARIABLE 
    t(it+1) = t(it) + dt;   % Increase Time
    it = it + 1;                % Increase counter variable 
   
   % END WHILE LOOP
    if x(it) >= 0           
        finished = true;
    end
    
end

finished = false;    % CONDITIONAL VALUE for WHILE loop
while ~finished             % WHILE statement x>=0
    
    % VERLET METHOD - 1. FIND HALF VELOCITY (USING DRAG FORCE AT STEP "it")
   Fdrag = - gamma * v(it);          % Drag Force
   vhalf = v(it) + Fdrag * dt/2;                % Half-velocity
   
    % VERLET METHOD - 2. FIND NEW POSITION (USING HALF VELOCITY)
   x(it+1) = x(it) + vhalf*dt;                  % X-position
    
    % VERLET METHOD - 3. FIND NEW VELOCITY (USING DRAG FOCE AT STEP "it+1")
   Fdrag = - gamma * v(it);                     % Drag Force
   v(it+1) = vhalf + Fdrag * dt/2;              % X-component velocity
   
   % TIME STEP - NEEDED TO INCREMENT TIME AND COUNTER VARIABLE 
    t(it+1) = t(it) + dt;       % Increase Time
    it = it + 1;                % Increase counter variable 
   
    currentpos = x(it);
    % END WHILE LOOP
    if it >= 10^4 ||...
            x(it)>=xmax ||...
            v(it) < 0.01
        finished = true;
    end
    
end


%% DISPLAY AND PLOT OUTPUT

KE = 0.5*m*v.^2;                % Kinetic Energy

% Generate plots
figure(1)
plot(t(1:it),x(1:it))
xlabel('Time (sec)')
ylabel('Position (m/s)')
title('Position v. Time')
grid on

figure(2)
plot(t(1:it),v(1:it))
xlabel('Time (sec)')
ylabel('Velocity (m/s)')
title('Velocity v. Time')
grid on

figure(3)
plot(t,KE,'b-')
xlabel('Time (sec)')
ylabel('Kinetic Energy (J)')
title('Kinetic Energy of the Puck')
grid on
