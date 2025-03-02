% Pizza Oven Project
% Chris, Tyler, Christy
clear
clc
clf



%% SET PARAMETERS
tmin = 0;           % Range of t-values
tmax = 90;
Nt = 1000;          % Number of t-values
T_a = 220;          % Temperature of ambient air [C]
T_0 = 20;           % Initial temperature of dough [C]
theta_S = 1;        % Non-dimensionalized temperature of oven
theta_B = 1;        % at surface of dough and base of dough
alpha_p = 3e-7;     % Temperature conductivity of pizza dough [m^2/s]
L = 0.02;           % Height of dough [m]
L_p = L/5;          % Height of section under analysis [m]
r0 = L;
h = 780;
k = 0.416;




%% INITIALIZE VECTORS
t = linspace(tmin,tmax,Nt);     % Vector of times
dt = t(2) - t(1);               % Increment of the approximation (time step)
theta_1 = zeros(1,Nt);          % Vectors
theta_2 = zeros(1,Nt);
theta_3 = zeros(1,Nt);
theta_4 = zeros(1,Nt);
theta_5 = zeros(1,Nt);
theta_1(1) = 0;                 % Initial condition [non-dimensional]
theta_2(1) = 0;
theta_3(1) = 0;
theta_4(1) = 0;
theta_5(1) = 0;



%% CALCULATIONS - EULER METHOD

for it = 1:Nt-1
    dtheta_1 = 100*alpha_p/(3*L_p^2)*(theta_B-3*theta_1(it)+2*theta_2(it));
    dtheta_2 = 25*alpha_p/L_p^2*(theta_1(it)-2*theta_2(it)+theta_3(it));
    dtheta_3 = 25*alpha_p/L_p^2*(theta_2(it)-2*theta_3(it)+theta_4(it));
    dtheta_4 = 25*alpha_p/L_p^2*(theta_3(it)-2*theta_4(it)+theta_5(it));
    dtheta_5 = 4*alpha_p/(L_p^2)*(theta_4(it)-3*theta_5(it)+2*theta_S);
    theta_1(it+1) = theta_1(it) + dtheta_1*dt;
    theta_2(it+1) = theta_2(it) + dtheta_2*dt;
    theta_3(it+1) = theta_3(it) + dtheta_3*dt;
    theta_4(it+1) = theta_4(it) + dtheta_4*dt;
    theta_5(it+1) = theta_5(it) + dtheta_5*dt;
    T_5s = theta_5(it+1)*(T_a-T_0)+T_0;
    T_S = (h*T_a-k*T_5s/L_p)/(h-k/L_p);
    theta_S = (T_S-T_0)/(T_a-T_0);
end
T_1 = theta_1.*(T_a-T_0)+T_0;
T_2 = theta_2.*(T_a-T_0)+T_0;
T_3 = theta_3.*(T_a-T_0)+T_0;
T_4 = theta_4.*(T_a-T_0)+T_0;
T_5 = theta_5.*(T_a-T_0)+T_0;



%% GENERATE PLOT
figure(1)

% Plot approximate solution
plot(t,T_5,'y-','LineWidth',2); hold on
plot(t,T_4,'-','color',[0.6350, 0.2780, 0.1840],'LineWidth',2); hold on
plot(t,T_3,'r-','LineWidth',2); hold on
plot(t,T_2,'b-','LineWidth',2); hold on
plot(t,T_1,'k-','LineWidth',2);

% Enhance plots with labels
xlabel('Time (seconds)')
ylabel('Temperature (^oC)')
legend('Section 5','Section 4','Section 3','Section 2','Section 1','Location','Best')
set(gca,'FontSize',18)



%% HEAT LOST THROUGH CONVECTION
Ts = T_a;                   % degrees C
Tinf = 20;
Tf = (Ts+Tinf)/2;
Beta_air = 2.5e-3;
g = 9.81;
nu_air = 25.13e-6;
Pr_air = 0.7016;
k_air = 32.99e-3;
alpha_air = 35e-6;
g_air = 0.75*Pr_air^(1/2)/(0.609+1.221*Pr_air^(1/2)+1.238*Pr_air)^(1/4);

% SIDE HOLE
r_vert = 0.35/2;
A_vert = pi*r_vert^2;
P_vert = pi*r_vert;
L_vert = A_vert/(pi*0.35/2);
GrL_vert = Beta_air*g*(Ts-Tinf)*L_vert^3/nu_air^2;
NuLbar_vert = 4/3*(GrL_vert/4)^(1/4)*g_air;
hbar_vert = NuLbar_vert*k_air/L_vert;
q_vert = hbar_vert*A_vert*(Ts-Tinf);            % W

% EXHAUST HOLE
r_horiz = 0.141;
A_horiz = pi*r_horiz^2;
P_horiz = 2*pi*r_horiz;
L_horiz = A_horiz/P_horiz;
RaL_horiz = Beta_air*g*(Ts-Tinf)*L_horiz^3/(alpha_air*nu_air);
NuLbar_horiz = 0.54*RaL_horiz^(1/4);
hbar_horiz = NuLbar_horiz*k_air/L_horiz;
q_horiz = hbar_horiz*A_horiz*(Ts-Tinf);         % W

% TOTAL CONVECTION
q_convloss = q_vert + q_horiz;



%% CALCULATIONS - NON-DIMENSIONAL EQUATIONS
% t = linspace(tmin,tmax,Nt)';
% tstar = alpha_p*t/(r0^2);
% Bi = h*r0/k;
% lambda = [-31.09202 31.09202 185.76361 362.95721];
% thetastar = zeros(Nt,7);
% for i = 1:length(lambda)
%     c(i) = 4*sin(lambda(i))/(2*lambda(i)+sin(2*lambda(i)));
% end
% for i = 1:7
%     thetastarsum = 0;
%     for j = 1:length(lambda)
%         thetastarnew = c(j)*exp(-lambda(j)^2.*tstar).*cos(lambda(j)*(i-1)/6);
%         thetastarsum = thetastarsum + thetastarnew;
%     end
%     thetastar(:,i) = thetastarsum;
% end
% 
% 
% % lambda1 = 1.4961 - (20-Bi)*(1.4961-1.4289)/(20-10);
% % c1 = 1.2699 - (20-Bi)*(1.2699-1.2620)/(20-10);
% % theta_0star = c1.*exp(-lambda1^2.*tstar);
% % theta_Tstar = theta_0star.*cos(lambda1*r0*0/6);
% % theta_5star = theta_0star.*cos(lambda1*r0*1/6);
% % theta_4star = theta_0star.*cos(lambda1*r0*2/6);
% % theta_3star = theta_0star.*cos(lambda1*r0*3/6);
% % theta_2star = theta_0star.*cos(lambda1*r0*4/6);
% % theta_1star = theta_0star.*cos(lambda1*r0*5/6);
% % theta_Bstar = theta_0star.*cos(lambda1*r0*6/6);
% T_Ts = thetastar(:,1)*(T_0-T_a) + T_a;
% T_5s = thetastar(:,2)*(T_0-T_a) + T_a;
% T_4s = thetastar(:,3).*(T_0-T_a) + T_a;
% T_3s = thetastar(:,4).*(T_0-T_a) + T_a;
% T_2s = thetastar(:,5).*(T_0-T_a) + T_a;
% T_1s = thetastar(:,6).*(T_0-T_a) + T_a;
% T_Bs = ones(Nt).*T_a;
% 
% 
% 
% %% GENERATE PLOT
% figure(2)
% 
% % Plot non-dimensional solution
% plot(t,T_Ts,'y-','LineWidth',2); hold on
% plot(t,T_5s,'-','color',[0.6350, 0.2780, 0.1840],'LineWidth',2); hold on
% plot(t,T_4s,'r-','LineWidth',2); hold on
% plot(t,T_3s,'b-','LineWidth',2); hold on
% plot(t,T_2s,'k-','LineWidth',2); hold on
% plot(t,T_1s,'LineWidth',2); hold on
% plot(t,T_Bs,'LineWidth',2);
% 
% % Enhance plots with labels
% xlabel('Time (seconds)')
% ylabel('Temperature (^oC)')
% legend('Top Surface','Section 5','Section 4','Section 3','Section 2',...
%     'Section 1','Bottom Surface','Location','Best')
% set(gca,'FontSize',18)





