% 65168
% Programming Problem 2
clear
clc

% values of scalar knowns (dimensions)
r1 = 10;   % (in)
r2 = 6;
r3 = 8;
r4 = 10;
t1 = 0;

% values of scalar unknowns (the remaining joint variables)
t3 = 30*3.14159/180;
t4 = 95*3.14159/180;
% t3 = 260*3.14159/180;
% t4 = 190*3.14159/180;

% define vector of initial guesses
x = [t3;t4];
error = ones(2,1);
solution = ones(360,3);

for n = 1:360
    t2 = n/180*3.14159;
    tolerance = 1;
while tolerance > 0.01
    % compute the necessary sines and consines of angles t2-t4
    ct2 = cos(t2);
    st2 = sin(t2);
    ct3 = cos(t3);
    st3 = sin(t3);
    ct4 = cos(t4);
    st4 = sin(t4);
    % compute the functions at the guessed value
    f1 = r2*st2+r3*st3-r4*st4;
    f2 = r2*ct2+r3*ct3-r4*ct4-r1;
    % define vector of functions computed at guessed solution
    f = [f1;f2];
    % calculate the partials of f w.r.t. each element of x
    dfdt3 = [r3*ct3;-r3*st3];
    dfdt4 = [-r4*ct4;r4*st4];
    % define the A matrix
    A = [dfdt3 dfdt4];
    % use equation (2.67) to compute the solution x
    x = x-inv(A)*f;
    % check tolerance
    error(1) = abs(t3-x(1));
    error(2) = abs(t4-x(2));
    tolerance = max(error);
    % update values
    t3 = x(1);
    t4 = x(2);
end

solution(n,1) = t2*180/3.14159;
solution(n,2) = t3*180/3.14159;
solution(n,3) = t4*180/3.14159;

end


%% GRAPH
figure(1)
plot(solution(:,1),solution(:,2),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('\theta_3(degrees)')
title('Figure 1: \theta_3 vs. \theta_2')
axis([0 360 0 140])
set(gca,'FontSize',18)
box off

figure(2)
plot(solution(:,1),solution(:,3),'b-','LineWidth',3)
xlabel('\theta_2(degrees)'); ylabel('\theta_4(degrees)')
title('Figure 2: \theta_4 vs. \theta_2')
axis([0 360 80 180])
set(gca,'FontSize',18)
box off

% figure(3)
% plot(solution(:,1),solution(:,2),'b-','LineWidth',3)
% xlabel('\theta_2(degrees)'); ylabel('\theta_3(degrees)')
% title('Figure 3: \theta_3 vs. \theta_2')
% axis([0 360 220 360])
% set(gca,'FontSize',18)
% box off
% 
% figure(4)
% plot(solution(:,1),solution(:,3),'b-','LineWidth',3)
% xlabel('\theta_2(degrees)'); ylabel('\theta_4(degrees)')
% title('Figure 4: \theta_4 vs. \theta_2')
% axis([0 360 160 300])
% set(gca,'FontSize',18)
% box off





