% FollowerStopper Controller
clear
clc
clf



%% SET PARAMETERS
w1 = 4.5;
w2 = 5.25;
w3 = 6.0;
d1 = 1.5;
d2 = 1.0;
d3 = 0.5;

n = 10000;
dv = linspace(-10,0,n);
array = linspace(0,10,n);
w1_ = w1*ones(n,1);
w2_ = w2*ones(n,1);
w3_ = w3*ones(n,1);


%% CALCULATIONS
ksi1 = w1 + 1/(2*d1) .* dv.^2;
ksi2 = w2 + 1/(2*d2) .* dv.^2;
ksi3 = w3 + 1/(2*d3) .* dv.^2;


%% GRAPH
plot(dv,ksi1,'b',dv,ksi2,'r',dv,ksi3,'g','LineWidth',2); hold on
plot(array,w1_,'b',array,w2_,'r',array,w3_,'g','LineWidth',2); hold off
axis([-10, 10, 0, 60]);
xlabel('\Delta v (m/s)'); ylabel('\Delta x (m)')
set(gca,'FontSize',18)