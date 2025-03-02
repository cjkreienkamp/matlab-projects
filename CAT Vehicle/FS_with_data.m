% FollowerStopper Controller
clear
clc
clf

load 'FS_with_data'

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
axis([-5, 2, 0, 15]);
xlabel('\Delta v (m/s)'); ylabel('\Delta x (m)')
set(gca,'FontSize',18)
lLine = animatedline('Color','k');%,'Marker','s','MarkerSize',10,'MarkerFaceColor','r');
for n = 1:1:501
    addpoints(lLine,data(n,1),data(n,2))
    drawnow
    pause(0.05)
end