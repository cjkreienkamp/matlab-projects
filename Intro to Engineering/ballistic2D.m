% Chris Kreienkamp
% Section 10
% 3/30/17

% Model Ballistic Motion with Drag Force
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
v0 = 44;        % Initial velocity (m/s)
theta0 = 45;    % Initial angle (degrees)
x0 = 0;         % Initial x-position (m)
y0 = 0;         % Initial y-position (m)

% Initial Velocity in X-Y Components
vx0 = v0 * cosd(theta0);    % Use COSD because angle in degrees
vy0 = v0 * sind(theta0);    % Use SIND because angle in degrees

%% INITIALIZE ARRAYS

x(1) = x0;        % X-position
y(1) = y0;        % Y-position
vx(1) = vx0;      % X-component velocity
vy(1) = vy0;      % Y-component velocity
t(1) = 0;         % Time
deltat = 0.01;    % Time step

%% TIME MARCHING WITH VERLET ALGORITHM

% Use Verlet Method because 2nd order ODE!!!

% In videos, a FOR loop was used to perform the calculations
% since we picked the final time or time period for the calculations.

% In this example, we will use a WHILE loop to perform the calculations.
% The calculations will stop when ball hits the ground and
% we don't know when this will happen - so WHILE better option than FOR.
% We will also use an IF statement to determine when ball hits ground

it = 1;         % COUNTER VARIABLE through the WHILE loop
finished = false;    % CONDITIONAL VALUE for WHILE loop

while ~finished
    
    % VERLET METHOD - 1. FIND HALF VELOCITY (USING DRAG FORCE AT STEP "it")
   vmag = sqrt((vx(it))^2 + (vy(it))^2);        % Magnitude of the velocity
   vhat = [vx(it), vy(it)] / vmag;      % Unit vector in terms of direction
   Fdrag = -alpha * (vmag^2) * vhat;            % Drag Force as a vector
   vhalfx = vx(it) + (Fdrag(1)/m) * deltat/2;   % X-component half-velocity
   vhalfy = vy(it) + (Fdrag(2)/m-g) * deltat/2; % Y-component half-velocity
   
    % VERLET METHOD - 2. FIND NEW POSITION (USING HALF VELOCITY)
   x(it+1) = x(it) + vhalfx*deltat;        % x-position
   y(it+1) = y(it) + vhalfy*deltat;        % y-position
    
    % VERLET METHOD - 3. FIND NEW VELOCITY (USING DRAG FOCE AT STEP "it+1")
   vmag = sqrt(vhalfx^2 + vhalfy^2);       % Magnitude of the velocity
   Fdrag = -alpha * (vmag^2) * vhat;       % Drag Force as a vector
   vx(it+1) = vhalfx + (Fdrag(1)/m) * deltat/2; % X-component velocity
   vy(it+1) = vhalfy + (Fdrag(1)/m) * deltat/2; % Y-component velocity
    
    % CHECK FOR GROUND IMPACT
    if y(it+1) <= 0         % Check if y-position is less than 0
        finished = true;    % Change value of conditional variable to end WHILE loop
    end
    
    % TIME STEP - NEEDED TO INCREMENT TIME AND COUNTER VARIABLE 
    t(it+1) = t(it) + deltat;   % Increase Time
    it = it + 1;                % Increase counter variable
    
end


%% DISPLAY AND PLOT OUTPUT

% Distance Traveled in X-Direction
xmax = max(x);
disp(['The ball hits the ground at x = ',num2str(xmax),' meters.'])

% Generate plots
figure(1)
plot(x(1:it),y(1:it))
axis([0 1.1*max(x) 0 1.1*max(y)])
xlabel('X-Position (m)')
ylabel('Y-Position (m)')
title('X-Y Position')
grid on

figure(2)
plot(t(1:it),y(1:it))
axis([0 1.1*max(t) 0 1.1*max(y)])
xlabel('Time (sec)')
ylabel('Y-Position (m)')
title('Y-Position v. Time')
grid on