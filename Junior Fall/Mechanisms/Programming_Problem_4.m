% 65168
%  Programming Problem 4
clear
clf
clc


%% INITIALIZE
% values of scalar knowns (dimensions)
r1 = 10;   % (in)
r2 = 6;
r3 = 8;
r4 = 10;
t1 = 0;
% values of scalar unknowns (the remaining joint variables)
t3est = 70;
t4est = 110;


%% CALL FUNCTIONS TO CREATE AN ARRAY
solution = ones(360,5);
for n = 1:360
    t2 = deg2rad(n);
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
    [h3,h4,hdot3,hdot4] = kc4bar(r2,r3,r4,t2,t3,t4);
    solution(n,1) = rad2deg(t2);
    solution(n,2) = h3;
    solution(n,3) = h4;
    solution(n,4) = hdot3;
    solution(n,5) = hdot4;
end


%% CHECK h'3 h'4 OUTPUTS
% set up arrays in radians
t2array = deg2rad(solution(:,1));
h3array = deg2rad(solution(:,2));
h4array = deg2rad(solution(:,3));
hdot3array = deg2rad(solution(:,4));
hdot4array = deg2rad(solution(:,5));
% check h'3
slope53h3 = (h3array(54)-h3array(52))/(t2array(54)-t2array(52))
deriv53hdot3 = hdot3array(53)
slope165h3 = (h3array(166)-h3array(164))/(t2array(166)-t2array(164))
deriv165hdot3 = hdot3array(165)
slope283h3 = (h3array(284)-h3array(282))/(t2array(284)-t2array(282))
deriv283hdot3 = hdot3array(283)
% check h'4
slope53h4 = (h4array(54)-h4array(52))/(t2array(54)-t2array(52))
deriv53hdot4 = hdot4array(53)
slope165h4 = (h4array(166)-h4array(164))/(t2array(166)-t2array(164))
deriv165hdot4 = hdot4array(165)
slope283h4 = (h4array(284)-h4array(282))/(t2array(284)-t2array(282))
deriv283hdot4 = hdot4array(283)


%% GRAPH
figure(1) % h3 vs theta_2
plot(solution(:,1),solution(:,2),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('h_3')
title('Figure 1: h_3 vs. \theta_2')
axis([0 360 -2 1])
set(gca,'FontSize',18)
box off

figure(2) % h4 vs theta_2
plot(solution(:,1),solution(:,3),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('h_4')
title('Figure 2: h_4 vs. \theta_2')
axis([0 360 -2 1])
set(gca,'FontSize',18)
box off

figure(3) % hdot3 vs theta_2
plot(solution(:,1),solution(:,4),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('h''_3')
title('Figure 3: h''_3 vs. \theta_2')
axis([0 360 -5 3])
set(gca,'FontSize',18)
box off

figure(4) %hdot4 vs theta_2
plot(solution(:,1),solution(:,5),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('h''_4')
title('Figure 4: h''_4 vs. \theta_2')
axis([0 360 -3 3.5])
set(gca,'FontSize',18)
box off
