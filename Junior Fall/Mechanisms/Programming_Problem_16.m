% 65168
% Newton's Method as a Function
clear
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


%% FUNCTION FOR NEWTON'S METHOD
for n = 1:360
    t2 = n/180*3.14159;
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2, t3est,t4est);
    solution(n,1) = rad2deg(t2);
    solution(n,2) = rad2deg(t3);
    solution(n,3) = rad2deg(t4);
end
disp(['t3 = ',num2str(t3)])
disp(['t4 = ',num2str(t4)])


%% GRAPH
clf
figure(1)
plot(solution(:,1),solution(:,2),'b-','LineWidth',3)
hold on
plot(solution(:,1),solution(:,3),'b--','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('\theta_3 and \theta_4(degrees)')
title('Figure 1: \theta_3 and \theta_4 vs. \theta_2')
axis([0 360 0 180])
set(gca,'FontSize',18)
legend('\theta_3','\theta_4','Location','Southeast')
box off