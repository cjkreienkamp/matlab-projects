% 63943
% Mechanisms and Machines
% Design Set 2
% Deliverable due: 11/14
 
clear all
clc
close all
 
%% Parameters
r1 = 3.2/12; %ft
r2 = 7/12; %ft
r3 = 7.8/12; %ft
r3p = 4.8/12; %ft
r4 = 6.5/12; %ft
theta1 = 0;
theta3est = 130;
theta4est = 105;
phi = deg2rad(24.5);
thetae = deg2rad(64.1);
 
 
%% Input values of theta2
for i=0:360
 
theta2 = deg2rad(i);
 
    [theta3,theta4] = newton4bar(r1,r2,r3,r4,theta2,theta3est,theta4est);
    [h3,h4,h3dot,h4dot] = kc4bar(r2,r3,r4,theta2,theta3,theta4);
    [fg3x,fg3y,fg3xdot,fg3ydot,fe] = kcPointOfInterest(r2,r3p,theta2,theta3,phi,thetae,h3,h3dot);
 
theta3est = rad2deg(theta3);
theta4est = rad2deg(theta4);
 
theta3d = wrapTo360(rad2deg(theta3));
theta4d = wrapTo360(rad2deg(theta4));
 
arrayt2(i+1) = i;
arrayt3(i+1) = theta3d;
arrayt4(i+1) = theta4d;
 
 
arrayh3(i+1) = h3;
arrayh4(i+1) = h4;
arrayh3dot(i+1) = h3dot;
arrayh4dot(i+1) = h4dot;
arrayfg3x(i+1) = fg3x;
arrayfg3y(i+1) = fg3y;
arrayfg3xdot(i+1) = fg3xdot;
arrayfg3ydot(i+1) = fg3ydot;
arrayfe(i+1) = fe;
 
end
 
%% Display Results
% disp(['theta3deg = ',num2str(rad2deg(theta3))])
% disp(['theta4deg = ',num2str(rad2deg(theta4))])
% disp(['h3 = ',num2str(h3)])
% disp(['h4 = ',num2str(h4)])
% disp(['h3dot = ',num2str(h3dot)])
% disp(['h4dot = ',num2str(h4dot)])
 
 
 
 
%% Plot
% figure(1)
% plot(arrayt2,arrayt3,'b.',arrayt2,arrayt4,'r.','Linewidth',2)
% axis([0 360 -5 380])
% legend('\theta_3','\theta_4','Location','Northwest')
% xlabel('\theta_2 (degrees)')
% ylabel('\theta_3 and \theta_4 (degrees)')
% set(gca,'Fontsize',18)
% 
% figure(2)
% plot(arrayt2,arrayh3,'b.',arrayt2,arrayh4,'r.','Linewidth',2)
% axis([0 360 0.4 2])
% legend('h_3','h_4','Location','Southeast')
% xlabel('\theta_2 (degrees)')
% ylabel('h_3 and h_4 (dimensionless)')
% set(gca,'Fontsize',18)
% 
% figure(3)
% plot(arrayt2,arrayh3dot,'b.',arrayt2,arrayh4dot,'r.','Linewidth',2)
% axis([0 360 -2 2])
% legend('h''_3','h''_4')
% xlabel('\theta_2 (degrees)')
% ylabel('h''_3 and h''_4 (dimensionless)')
% set(gca,'Fontsize',18)
 
figure(7)
plot(arrayt2,arrayfg3x,'b.',arrayt2,arrayfg3y,'r.','Linewidth',2)
axis([0 360 -1 1])
legend('f_{g3x}','f_{g3y}','Location','Northwest')
xlabel('\theta_2 (degrees)')
ylabel('f_{g3x} and f_{g3y} (feet)')
set(gca,'Fontsize',18)
 
figure(8)
plot(arrayt2,arrayfg3xdot,'b.',arrayt2,arrayfg3ydot,'r.','Linewidth',2)
axis([0 360 -2 1])
legend('f''_{g3x}','f''_{g3y}','Location','Southwest')
xlabel('\theta_2 (degrees)')
ylabel('f''_{g3x} and f''_{g3y} (feet)')
set(gca,'Fontsize',18)
 
figure(9)
plot(arrayt2,arrayfe,'b.','Linewidth',2)
axis([0 360 -0.6 1])
xlabel('\theta_2 (degrees)')
ylabel('f_e (feet)')
set(gca,'Fontsize',18)

function [h3, h4, h3dot, h4dot, fg3x, fg3y, fg3xdot, fg3ydot, fe] = kinematiccoeffs(r1, r2, r3, r4, r3p, theta2, theta3, theta4, phi, thetae)
 
 
h3 = (r2*sin(theta4-theta2))/(r3*sin(theta3-theta4));
 
h4 = (r2*sin(theta3-theta2))/(r4*sin(theta3-theta4));
 
h3dot = (-r2*r4*cos(theta2)*cos(theta4) - r3*r4*cos(theta3)*cos(theta4)*h3^2 ...
    + r4^2*(cos(theta4))^2*h4^2 - r2*r4*sin(theta2)*sin(theta4) ...
    - r3*r4*sin(theta3)*sin(theta4)*h3^2 + r4^2*(sin(theta4))^2*h4^2)/ ...
    (r3*r4*sin(theta3-theta4));
 
h4dot = (-r2*r3*sin(theta2)*sin(theta3) - r3^2*(sin(theta3))^2*h3^2 ...
    + r3*r4*sin(theta3)*sin(theta4)*h4^2 - r2*r3*cos(theta2)*cos(theta3) ...
    - r3^2*(cos(theta3))^2*h3^2 + r3*r4*cos(theta3)*cos(theta4)*h4^2)/ ...
    (r3*r4*sin(theta3-theta4));
 
fg3x = -r2*sin(theta2)-r3p*sin(theta3-phi)*h3;
 
fg3y = r2*cos(theta2)+r3p*cos(theta3-phi)*h3;

fg3xdot = -r2*cos(theta2)-r3p*cos(theta3-phi)*h3^2-r3p*sin(theta3-phi)*h3dot;
 
fg3ydot = -r2*sin(theta2)-r3p*sin(theta3-phi)*h3^2+r3p*cos(theta3-phi)*h3dot;
 
fe = fg3x*cos(thetae)+fg3y*sin(thetae);
end