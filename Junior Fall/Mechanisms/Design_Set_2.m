%65168
clear all
close all
clc



%% DESIGN PARAMETERS
% Gearmotor variables
motorThickness = 1.5/12;        %(ft)               
motorRadius = 0.5/12;           %                   
T_stall = 69.16/16/12;          %(ft-lbf)          \
w_noload = 19300/60;            % no load (rev/s)   
wMotor = 7.7/16;                %(lbf)             
costMotor = 7.25;               %($)                
R = 527.77;                     % gearbox ratio     
wGearbox = 11.4/16;             %                   
costGearbox = 77.95;            %                   

% Machine variables
g = 32.2;                       %(ft/s^s)
r1 = 3.20/12;                   %(ft)
r2 = 7.00/12;
r3 = 7.80/12;
r4 = 6.50/12;
rg3 = 4.80/12;
l = 5.00/12;
w = 3.00/12;
h = 3.00/12;
den_steel = .283*12^3/g;        %(slug/ft^3)
den_copper = 0.324*12^3/g;
volume = l*w*h;                 %(ft^3)
m3 = den_steel*volume;          %(slug)
mMotor = pi*motorRadius^2*motorThickness*den_copper;
I3 = 1/12*m3*(l^2+w^2);         %(ft^2*slug)
Imotor = 1/2*mMotor*motorRadius^2;

t2i = 11.3;                     %(deg)
t3i = 146.4; 
t4i = 115.9; 
phi = -24.5;
te = -64.1;
w_noload_gm = w_noload/R;       % no load speed out of gearbox (rev/s)



%% CALCULATIONS

% Create arrays
n = 3600;
t2_array = zeros(n,1);
t3_array = zeros(n,1);
t4_array = zeros(n,1);
h3_array = zeros(n,1);
h4_array = zeros(n,1);
h3dot_array = zeros(n,1);
h4dot_array = zeros(n,1);
fg3x_array = zeros(n,1);
fg3y_array = zeros(n,1);
fg3xdot_array = zeros(n,1);
fg3ydot_array = zeros(n,1);
fe_array = zeros(n,1);
sumA_array = zeros(n,1);
sumB_array = zeros(n,1);
Ablock_array = zeros(n,1);
Bblock_array = zeros(n,1);
T_gearmotor_array = zeros(n,1);
t2dot_array = zeros(n,1);
t_array = zeros(360,1);
Si_array = zeros(360,1);
Sidot_array = zeros(360,1);
Siddot_array = zeros(360,1);

% Compute
t3 = deg2rad(t3i);
t4 = deg2rad(t4i);
te = deg2rad(te);
phi = deg2rad(phi);
count = 0;

[Amotor,Bmotor] = sumAB(mMotor,Imotor,R,0,0,0,0,0);
for i = 1:360/n:361
   
    count = count+1;
    t2 = deg2rad(i-1);
    t3est = rad2deg(t3);
    t4est = rad2deg(t4);
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
    [h3,h4,h3dot,h4dot] = kc4bar(r2,r3,r4,t2,t3,t4);
    [fg3x,fg3y,fg3xdot,fg3ydot,fe] = ...
        kcPointOfInterest(r2,rg3,t2,t3,phi,te,h3,h3dot);
    [Ablock,Bblock] = sumAB(m3,I3,h3,h3dot,fg3x,fg3xdot,fg3y,fg3ydot);
    t2dot = (i-1)/360*w_noload_gm;      %(rev/s)
    [T_gearmotor] = output_torque(R, T_stall, t2dot, w_noload_gm);
    
    % compile into arrays
    t2_array(count) = i-1;
    t3_array(count) = rad2deg(t3);
    t4_array(count) = rad2deg(t4);
    h3_array(count) = h3;
    h4_array(count) = h4;
    h3dot_array(count) = h3dot;
    h4dot_array(count) = h4dot;
    fg3x_array(count) = fg3x;
    fg3y_array(count) = fg3y;
    fg3xdot_array(count) = fg3xdot;
    fg3ydot_array(count) = fg3ydot;
    fe_array(count) = fe;
    Ablock_array(count) = Ablock;    %(ft^2 slug)
    Bblock_array(count) = Bblock;    %(ft^2 slug)
    sumA_array(count) = Ablock + Amotor;    %(ft^2 slug)
    sumB_array(count) = Bblock + Bmotor;    %(ft^2 slug)
    t2dot_array(count) = t2dot;     %(rev/s)
    T_gearmotor_array(count) = T_gearmotor;
end
T2_array = -m3*g*fe_array;



%% FORWARD DYNAMICS SIMULATION OF MOTOR

% Euler's Method
deltSi = deg2rad(-1);               %(rad)
t0 = 0;                             %(s)
Si = t2i;                           %(deg)
Si0dot = 0;                         %(rad/s)
T2 = -T_gearmotor_array(1);
Si0ddot = (T2-m3*g*fe_array(114))/sumA_array(114);       %(rad/s/s)

index = 114;
for i = 1:1800
    t_array(i) = t0;                    %(s)
    Si_array(i) = Si;                   %(deg)
    Sidot_array(i) = Si0dot/2/pi*60;    %(rpm)
    Siddot_array(i) = Si0ddot;          %(rad/s/s)
    
    index = index - 10;
    if index <= 0
        index = index+n;
    end
    
    deltt = (-Si0dot - sqrt(Si0dot^2 + 2*Si0ddot*deltSi))/Si0ddot;
    deltSidot = Si0ddot*deltt; 
    t0 = t0 + deltt;
    Si = Si + rad2deg(deltSi);
    Si0dot = Si0dot + deltSidot;
    T2 = -output_torque(R, T_stall, abs(Si0dot/2/pi), w_noload_gm);
    t2ddot = (T2-sumB_array(index)*(Si0dot)^2-...
        m3*g*fe_array(index))/sumA_array(index);
    Si0ddot = t2ddot;
            
end



%% STATE VARIABLE OPTIMIZATION
t2max = max(Sidot_array(1200:1800));
t2min = min(Sidot_array(1200:1800));
t2ave = (t2max + t2min)/2;
Cf = (t2max - t2min)/abs(t2ave);
weight = wMotor + wGearbox;
cost = costMotor + costGearbox;
disp(['Tmax req: ',num2str(max(T2_array)),'     Tgmstall: ',...
    num2str(T_stall*R)])
disp(['State Variable 1: intermediate time = ',...
    num2str(t_array(71)),' s         < 0.5 s'])
disp(['State Variable 2: is steady-state reached within 2 seconds?'])
disp(['State Variable 3: Cf = ',num2str(abs(Cf*100)),...
    '%          < 10%'])
disp(['State Variable 4: cost = $',num2str(cost),...
    '          < $60'])
disp(['State Variable 5: weight = ',num2str(weight),...
    ' lbf          < 2 lbf'])



%% DELIVERABLE 1

% Plot of t3 and t4 vs t2 on a single graph
figure(1)
plot(t2_array,t3_array,'r.',t2_array,t4_array,'b.','Linewidth',2)
legend('\theta_3','\theta_4','Location','Southeast')
xlabel('\theta_2 (deg)'); ylabel('\theta_3 and \theta_4 (deg)');
set(gca,'FontSize',18)

% Plot of h3 and h4 vs t2 on a single graph
figure(2)
plot(t2_array,h3_array,'r.',t2_array,h4_array,'b.','Linewidth',2)
legend('h_3','h_4','Location','Southeast')
xlabel('\theta_2 (deg)'); ylabel('h_3 and h_4 (unitless)');
set(gca,'FontSize',18)

% Plot of h3dot and h4dot vs t2 on a single graph
figure(3)
plot(t2_array,h3dot_array,'r.',t2_array,h4dot_array,'b.','Linewidth',2)
legend('h''_3','h''_4','Location','Southeast')
xlabel('\theta_2 (deg)'); ylabel('h''_3 and h''_4 (unitless)');
set(gca,'FontSize',18)



%% DELIVERABLE 2

% Plot of fg3x and fg3y vs t2 on a single graph
figure(4)
plot(t2_array,fg3x_array,'r.',t2_array,fg3y_array,'b.','Linewidth',2)
legend('f_{g3x}','f_{g3y}','Location','Northwest')
xlabel('\theta_2 (deg)'); ylabel('f_{g3x} and f_{g3y} (ft)');
set(gca,'FontSize',18)

% Plot of fg3dotx and fg3doty vs t2 on a single graph
figure(5)
plot(t2_array,fg3xdot_array,'r.',t2_array,fg3ydot_array,'b.','Linewidth',2)
legend('f''_{g3x}','f''_{g3y}','Location','Northwest')
xlabel('\theta_2 (deg)'); ylabel('f''_{g3x} and f''_{g3y} (ft)');
set(gca,'FontSize',18)

% Plot of fe vs t2
figure(6)
plot(t2_array,fe_array,'k.','Linewidth',2)
xlabel('\theta_2 (deg)'); ylabel('f_e (ft)');
set(gca,'FontSize',18)



%% DELIVERABLE 3

% Plot of sum of A's and sum of B's vs t2 for one revolution
figure(7)
plot(t2_array,sumA_array,'r.',t2_array,sumB_array,'b.','Linewidth',2)
legend('\Sigma A','\Sigma B','Location','Best')
xlabel('\theta_2 (deg)'); ylabel('\Sigma A and \Sigma B (ft^2\cdot slug)');
set(gca,'FontSize',18)



%% DELIVERABLE 4    

% Plot of T2 required for static equilibrium vs t2 for one revolution
figure(8)
plot(t2_array,T2_array,'r.','Linewidth',2)
xlabel('\theta_2 (deg)'); ylabel('T_2 (ft\cdot lb_{f})');
set(gca,'FontSize',18)

% Plot of T2 required for static equilibrium vs t2 during initial lift
figure(9)
t2_array_initial = [t2_array(3019:3601)-360; t2_array(1:114)];
T2_initial = [T2_array(3019:3601); T2_array(1:114)];
plot(t2_array_initial,T2_initial,'r.','Linewidth',2)
xlabel('\theta_2 (deg)'); ylabel('T_2 (ft\cdot lb_{f})');
set(gca,'FontSize',18)



%% DELIVERABLE 5

% Plot of the gearmotor torque speed curve for the Banebots RS 550 motor
% using their P60 gearbox with a ratio of 528:1
figure(10)
plot(t2dot_array,T_gearmotor_array,'r.','Linewidth',2)
xlabel('\omega_{gm} (rev/sec)'); ylabel('T_{gm} (ft\cdot lb_{f})');
set(gca,'FontSize',18)



%% DELIVERABLE 7

% Plot of t2 vs time to determine State Variable 1.
figure(11)
plot(t_array,Si_array,'r-','Linewidth',2)
xlabel('time (s)'); ylabel('\theta_2 (degrees)');
axis([0 0.6 -58.2 20])
set(gca,'FontSize',18)

% Plot of t2 vs. time to determine State Variables 2-4.
figure(12)
plot(t_array,Sidot_array,'r-','Linewidth',2)
xlabel('time (s)'); ylabel('\theta_2'' (rpm)');
set(gca,'FontSize',18)

