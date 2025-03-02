% Chris Kreienkamp
% Section 10
% 3/30/17

% verletPractice.m
% Approximate the velocity of a baseball falling from 500 meters
% Plot the velocity of the object as a function of time and in a second
% plot show the kinetic, potential, and total energy as a function of time
% Drag Force: Fd = -0.5*rho*Cd*A*|v|^2 = alpha*|v|^2

clear
clc

%% SET INITIAL PARAMETERS

Cd = 0.5;     % Drag coefficient
R = 36e-3;    % Radius of projectile (m)
m = 150e-3;   % Mass of projectile mass (kg)
rho = 1.225;  % Density of air (kg/m^3)
g = 9.81;     % Acceleration (m/s^2)

% "Net" Drag Coefficient  |Fd|= alpha * v^2
alpha = 0.5*rho*Cd*(pi*R^2);

% Initial Conditions
v0 = 0;             % Initial velocity (m/s)
y0 = 500;           % Initial y-position (m)


%% INITIALIZE ARRAYS

y(1) = y0;          % Y-position
v(1) = v0;          % Y-component velocity
t(1) = 0;           % Time
deltat = 0.01;      % Time step


%% TIME MARCHING WITH VERLET ALGORITHM

% In this example, we will use a WHILE loop to perform the calculations.
% The calculations will stop when ball hits the ground.
% We will also use an IF statement to determine when ball hits ground

it = 1;              % COUNTER VARIABLE through the WHILE loop
finished = false;    % CONDITIONAL VALUE for WHILE loop

while ~finished
    
    % VERLET METHOD - 1. FIND HALF VELOCITY (USING DRAG FORCE AT STEP "it")
   Fdrag = alpha * (v(it)^2);                      % Drag Force
   vhalf = v(it) + (Fdrag/m-g) * deltat/2;  % Half-velocity
   
    % VERLET METHOD - 2. FIND NEW POSITION (USING HALF VELOCITY)
   y(it+1) = y(it) + vhalf*deltat;              % y-position
    
    % VERLET METHOD - 3. FIND NEW VELOCITY (USING DRAG FOCE AT STEP "it+1")
   Fdrag = alpha * v(it);                       % Drag Force
   v(it+1) = vhalf + (Fdrag/m) * deltat/2;      % Y-component velocity
   
    % CHECK FOR GROUND IMPACT
    if y(it+1) <= 0         % Check if y-position is less than 0
        finished = true;    % Change value of conditional variable to end WHILE loop
    end
    
    % TIME STEP - NEEDED TO INCREMENT TIME AND COUNTER VARIABLE 
    t(it+1) = t(it) + deltat;   % Increase Time
    it = it + 1;                % Increase counter variable
    
end


%% ENERGY ANALYSIS

KE = 0.5*m*v.^2;                % Kinetic Energy
PE = m*g*y;                     % Potential Energy
TE = KE + PE;                   % Total Energy


%% DISPLAY AND PLOT OUTPUT

% Velocity as a function of time
tmax = max(t);
disp(['The ball hits the ground after t = ',num2str(tmax),' seconds.'])

% Generate plots
figure(1)
plot(t(1:it),v(1:it))
axis([0 1.1*max(t) 1.1*min(v) 0])
xlabel('Time (sec)')
ylabel('Velocity (m/s)')
title('Velocity v. Time')
grid on

figure(2)
plot(t,KE,'b-',t,PE,'r-',t,TE,'k-')
axis([0 1.1*max(t) 0 1.1*max(TE)])
xlabel('Time (sec)')
ylabel('Energy (J)')
title('Energy of the Baseball')
legend('Kinetic','Potential','Total')
grid on