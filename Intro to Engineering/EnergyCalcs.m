% Chris Kreienkamp
% Section 10
% 4/11/17

% Approximate the velocity of a baseball falling from 500 meters
% Plot the velocity of the object as a function of time and in a second
% plot show the kinetic, potential, and total energy as a function of time
% Drag Force: Fd = -0.5*rho*Cd*A*|v|^2 = alpha*|v|^2

% Find the enrgy lost to drag over time using the trapz function to
% approximate the work done by the ball on the atmosphere

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
Fdrag = 0;


%% TIME MARCHING WITH VERLET ALGORITHM

% In this example, we will use a WHILE loop to perform the calculations.
% The calculations will stop when ball hits the ground.
% We will also use an IF statement to determine when ball hits ground

it = 1;              % COUNTER VARIABLE through the WHILE loop
finished = false;    % CONDITIONAL VALUE for WHILE loop

while ~finished
    
    % VERLET METHOD - 1. FIND HALF VELOCITY (USING DRAG FORCE AT STEP "it")
   Fdrag(it) = alpha * (v(it)^2);                      % Drag Force
   vhalf = v(it) + (Fdrag(it)/m-g) * deltat/2;  % Half-velocity
   
    % VERLET METHOD - 2. FIND NEW POSITION (USING HALF VELOCITY)
   y(it+1) = y(it) + vhalf*deltat;              % y-position
    
    % VERLET METHOD - 3. FIND NEW VELOCITY (USING DRAG FOCE AT STEP "it+1")
   Fdrag(it+1) = alpha * vhalf^2;                       % Drag Force
   v(it+1) = vhalf + (Fdrag(it+1)/m-g) * deltat/2;      % Y-component velocity
   
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

Nt = length(t);         % Number of time points (COUNTER variable for loop)
for it = 2:Nt    % Loop runs for the number of "spaces" between time points
    Edrag(it) = -trapz(y(1:it),Fdrag(1:it));   % Calculate integral
end

TE = KE + PE + Edrag;           % Total Energy


%% POWER ANALYSIS

dt = t(2) - t(1);               % Step of derivative
Power =  gradient(Edrag,dt);         % Derivative using GRADIENT function


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
plot(t,KE,'b--',t,PE,'r--',t,Edrag,'g--',t,TE,'k-',t,Power,'m-')
axis([0 1.1*max(t) 0 1.1*max(TE)])
xlabel('Time (sec)')
ylabel('Energy (J)')
title('Energy of the Baseball')
legend('Kinetic E','Potential E','Drag E','Total E','Drag Power')
grid on

