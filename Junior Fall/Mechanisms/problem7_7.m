% 65168
clear; clf; clc

%% PARAMETERS
r1 = 5; r2 = 3.5; r3 = 1.5; r4 = 1.7; r5 = 4.7; r6 = 1.2;
t3est = 315; t4est = 120;   % deg

%% PROGRAM
n = 1000; count = 0; Ma = zeros(n,1); t2_array = zeros(n,1);
for i = 20:19/n:39
    count = count+1;
    t2 = deg2rad(i);
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
    Ma(count) = r4/(r6*sin(t3-t2))*(sin(t3-t4)*cos(t3-t2)-r5/r3*sin(t4-t2));
    t2_array(count) = rad2deg(t2);
    t3est = rad2deg(t3); t4est = rad2deg(t4);
end

%% PLOT
plot(t2_array, Ma, 'r.','LineWidth',3)
xlabel('\theta_2 (degrees)'); ylabel('M_a (dimensionless)')
set(gca,'FontSize',20)