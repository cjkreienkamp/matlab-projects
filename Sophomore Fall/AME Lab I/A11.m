% Chris Kreienkamp
% 11/13/17
% Experiment A11
clear
clf
clc
load('A11_workspace.mat')


%% 1. plot theta vs t for the single pendulum
single1_time = (singlependulum1((108:747),3)-singlependulum1(108,3))/1000;
single2_time = (singlependulum2((127:1261),3)-singlependulum2(127,3))/1000;
single3_time = (singlependulum3((143:855),3)-singlependulum3(143,3))/1000;
single1_theta = singlependulum1((108:747),2);
single2_theta = singlependulum2((127:1261),2);
single3_theta = singlependulum3((143:855),2);

figure(1)
subplot(3,1,1); plot(single1_time,single1_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 8.5 -100 100])
set(gca,'FontSize',16)
subplot(3,1,2); plot(single2_time,single2_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 8.5 -100 100])
set(gca,'FontSize',16)
subplot(3,1,3); plot(single3_time,single3_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 8.5 -100 100])
set(gca,'FontSize',16)


%% 2. plot angular speed vs theta for one of the single pendulum data sets
% angular speed is the time derivative of the angle theta
angspeed1 = zeros(639);
single1_thedit = zeros(639);
for i = 1:639
   ynew = single1_theta(i+1);
   y = single1_theta(i);
   dt = single1_time(i+1) - single1_time(i);
   angspeed1(i) = (ynew-y)/dt;
   single1_thedit(i) = (single1_theta(i+1)+single1_theta(i))/2;
end

figure(2)
single1_smooth = smooth(single1_thedit,3,'moving');
angspeedsmooth1 = smooth(angspeed1,3,'moving');
plot(single1_smooth,angspeedsmooth1);
xlabel('angle, \theta_1 (^o)'); ylabel('angular speed \omega_1')
set(gca,'FontSize',16)


%% 3. plot theta vs t for the double pendulum
double1_time = doublependulum1((50:941),3)/1000-doublependulum1(50,3)/1000;
double2_time = doublependulum2((39:775),3)/1000-doublependulum2(39,3)/1000;
double3_time = doublependulum3((44:782),3)/1000-doublependulum3(44,3)/1000;
double1_theta = doublependulum1((50:941),2);
double2_theta = doublependulum2((39:775),2);
double3_theta = doublependulum3((44:782),2);

figure(3)
subplot(3,1,1); plot(double1_time,double1_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 9.75 -150 100])
set(gca,'FontSize',16)
subplot(3,1,2); plot(double2_time,double2_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 9.75 -150 100])
set(gca,'FontSize',16)
subplot(3,1,3); plot(double3_time,double3_theta)
xlabel('time, t (s)'); ylabel('angle, \theta_1 (^o)')
axis([0 9.75 -150 100])
set(gca,'FontSize',16)


%% 4. plot angular speed vs theta for one of the double pendulum data sets
% angular speed is the time derivative of the angle theta
angspeed2 = zeros(738);
double3_thedit = zeros(738);
for i = 1:738
   ynew = double3_theta(i+1);
   y = double3_theta(i);
   dt = double3_time(i+1) - double3_time(i);
   angspeed2(i) = (ynew-y)/dt;
   double3_thedit(i) = (double3_theta(i+1)+double3_theta(i))/2;
end

figure(4)
double3_smooth = smooth(double3_thedit,3,'moving');
angspeedsmooth2 = smooth(angspeed2,3,'moving');
plot(double3_smooth,angspeedsmooth2);
xlabel('angle, \theta_1 (^o)'); ylabel('angular speed \omega_1')
set(gca,'FontSize',16)


%% plot of accelerometer voltage Vout vs pitch angle theta
pitch = [90 0 75 60 45 30 15 -15 -30 -45 -60 -75 -90];
Vout = [1.26 1.57 1.28 1.33 1.37 1.43 1.51 1.63 1.76 1.82 1.88 1.91 1.92];
pitch_5 = linspace(-100,100,100000);
Vout_5 = (Vout(1)-Vout(2))*sind(pitch_5)+Vout(2);

figure(5)
plot(pitch,Vout,'o',pitch_5,Vout_5,'-')
xlabel('pitch angle \theta (^o)'); ylabel('accelerometer voltage, V_o_u_t (V)')
legend('Measured Voltage','Theoretical Voltage','Location','Northeast')
set(gca,'FontSize',16)