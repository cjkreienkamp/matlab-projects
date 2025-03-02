% 901965168
% Homework 9
% Problem 1

clear
clf
clc

t = linspace(0,1,1000);
t1 = -90*t.^3+135*t.^2;
t1_d = -270*t.^2 + 270*t;
d2 = -4*t.^3+6*t.^2+0.5;
d2_d = -12*t.^2 + 12*t;
t3 = -120*t.^3+180*t.^2;
t3_d = -360*t.^2 + 360*t;

figure (1); plot(t,t1,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('\theta_1 (deg)')
figure (2); plot(t,d2,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('d_2 (m)')
figure (3); plot(t,t3,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('\theta_3 (deg)')

figure (4); plot(t,t1_d,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('\theta_1'' (deg/s)')
figure (5); plot(t,d2_d,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('d_2'' (m/s)')
figure (6); plot(t,t3_d,'-','LineWidth',3); set(gca,'FontSize',30)
xlabel('time (s)'); ylabel('\theta_3'' (deg/s)')