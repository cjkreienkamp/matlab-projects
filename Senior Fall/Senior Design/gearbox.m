% Chris Kreienkamp
% Tue Oct 8 2019
% gearbox.m

clear
clc
clf



%% INITIALIZE PARAMETERS
% Friction coefficient parameters
% w - wheel     p - payload     s - static     r - rolling     k - kinetic
% [1 - classroom tile     2 - carpet     3 - marble stairwell]
driveWheelWeight = 4.11;                % [lb]
payloadWeight = 29;                     % [lb]
wsforce = [1.67 2.40 2.80];             % [lb]
psforce = [9.45 11.0 (12.3+17.1)/2];    % [lb]
pkforce = [7.40 10.1 11.6];             % [lb]

% Maximum tractive force parameters
Mv = 21/32.2;               % mass of vehicle [slug]
g = 32.2;                   % acceleration due to gravity [ft/s/s]
L = 6.25/12;                % length between front and back wheel [ft]
La = L*0.9;                 % length between COG and front wheel [ft]

% Gearmotor parameters
slip_prct = 0.95;                   % target percentage of slip
rw = 1/12;                          % wheel radius [ft]

% Torque-speed parameters
R = 4;                              % INPUT GEAR RATIO HERE
Tstall = 119.43/12/16;              % stall torque [lb*ft]
wnoload = 12600;                    % no load RPM [RPM]

% Torque-current parameters
Inoload = 0.85;                     % no load current [A]
Istall = 59;                        % stall current [A]

% Acceleration parameters
Mp = 29/32.2;                       % mass of payload [slug]
x_stop = 22.5;                      % stopping distance 20 < x < 25 [ft]



%% CALCULATIONS
% Friction coefficient calculations
wsfriction = wsforce./driveWheelWeight;     % wheel static friction
psfriction = psforce./payloadWeight;        % payload static friction
pkfriction = pkforce./payloadWeight;        % payload kinetic friction

% Maximum tractive force calculations
%mu_ws = max(wsfriction);                    % wheel static friction
mu_ws = 0.9;
Ftmax = Mv*g*La/L*mu_ws;                    % [lb]

% Gearmotor calculations
Tgm = slip_prct*Ftmax/2*rw;     % max gearmotor operating torque [lb*ft]

% Acceleration calculations
mu_pk = max(pkfriction);                        % payload kinetic friction         
a_max = (slip_prct*Ftmax-Mp*g*mu_pk)/(Mv+Mp);   % max acceleration [ft/s/s]
d_p = -g*mu_pk;                 % max deceleration of the payload [ft/s/s]
d_v = -slip_prct*g*La/L*mu_ws;  % max deceleration of the vehicle [ft/s/s]
d_max = min(max(d_p,d_v),0);    % max deceleration [ft/s/s]
x_switch = min(x_stop/(1-a_max/d_max),20);% transition from acc to dec [ft]
v_max = sqrt(2*a_max*x_switch);         % max velocity of vehicle [ft/s]
w_max = v_max/(2*pi*rw)*60;             % max RPM of gearmotor [RPM]
t1 = sqrt(2*x_switch/a_max);            % acceleration portion time [s]
t2 = (-v_max+sqrt(v_max^2-2*d_max*(x_switch-20)))/d_max;    % dec time [s]
t = t1+t2;                              % total time



%% PLOT
% Torque-speed plot
figure(1)
w = linspace(0,wnoload,1000)/R;
T1 = Tstall*R-Tstall*R^2/wnoload*w;
plot(w,T1,'b-','LineWidth',3); hold on
plot(w,Tgm*ones(1000,1),'r--','LineWidth',3); hold off
xlabel('angular speed (RPM)'); ylabel('torque (ft\cdot lb)')
legend('gearmotor torque','max gearmotor torque'); set(gca,'FontSize',20)
axis([0 max(w) 0 max(T1)+max(T1)*0.1])

% Torque-current plot
figure(2)
I = linspace(0,Istall,1000);
T2 = Tstall/Istall*I - Tstall/Istall*Inoload;
plot(I,T2,'b-','LineWidth',3); hold on
plot(I,Tgm/R*ones(1000,1),'r--','LineWidth',3); hold off
xlabel('motor current (A)'); ylabel('torque (ft\cdot lb)')
legend('motor torque','max motor torque','Location','Best')
set(gca,'FontSize',18)









%% OLD CODE
% f_swheel = 0.6;                     % static friction at wheel
% f_kwheel = 0.5;                     % kinetic friction of wheel
% f_rwheel = 0.2;                     % rolling friction of wheel
% f_spayload = 0.33;                  % static friction at payload
% f_kpayload = 0.23;                  % kinetic friction at payload
% alpha = 0;                          % incline of the road
% hg = 3/12*0.75;                     % height of COG [ft]
% mu_r = 0.1;                         % wheel rolling friction
% 
% % 1) Calculate the maximum tractive force of one wheel
% Ftmax_top = f_swheel*Mv*g*cos(alpha)*(La+f_rwheel*(hg-rd));
% Ftmax_bot = L+f_swheel*hg;
% Ftmax = Ftmax_top/Ftmax_bot;
% 
% % 2) Find a_max, a_dmax
% a_max = slip_prct*Ftmax/(Mv+Mp);
% a_dmax = -(Mv*f_kwheel+Mp*f_kpayload)*g/(Mv+Mp);
% 
% % 3) Find x_switch
% x_switch = x_stop/(1-a_max/a_dmax);

% Ftmax1 = Mv*g*La/L*mu_ws;                   % [lb]
% Ftmax2_top = mu_ws*Mv*g*(La+mu_r*(hg-rw));
% Ftmax2_bot = L+mu_ws*hg;
% Ftmax2 = Ftmax2_top/Ftmax2_bot;             % [lb]
% Ftmax = max(Ftmax1,Ftmax2);                 % [lb]



