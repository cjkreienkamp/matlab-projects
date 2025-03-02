% 65168
clear
clf
clc

%% DESIGN PROCEDURE
% constants
t = 50/12;
w = 60/12;
R = 7;
phi_123 = [0 atand(w/(R-t/2)) atand(w/(-R-t/2))]';
psi_123 = [0 atand(w/(R+t/2)) atand(w/(-R+t/2))]';

% choose value for phi and psi
phides = 0;
psides = 0;

% compute three derivatives
h4 = 1;
h4dot = -2*t/w;
h4dotdot = 6*(t/w)^2;

% compute a, b, c, d in Table 8.3
a = [-h4; -h4dot; h4dotdot-h4^3];
b = [0; -h4^2; 3*h4*h4dot];
c = [-(1-h4); h4dot; -h4dotdot-(1-h4)^3];
d = [0; -(1-h4)^2; -3*h4dot*(1-h4)];

% compute D, E, F from Equations 8.18
n = 0;
possible_orientations = zeros(10,6);
h = waitbar(0,'Please wait...');
for t4des = 180:0.1:269.9

    E = a*sind(t4des) + b*cosd(t4des);
    D = c*cosd(t4des) + d*sind(t4des);
    F = -c*sind(t4des) + d*cosd(t4des);

    % compute l1, l2, l3 from Equations 8.27
    l1 = D(2)*(E(3)-E(1))+E(2)*(D(1)-D(3));
    l2 = E(2)*(F(1)-F(3))-D(1)*E(3)+E(1)*D(3)+F(2)*(E(3)-E(1));
    l3 = E(1)*F(3)-F(1)*E(3);

    % compute t2des from Equation 8.26
    radicand = l2^2 - 4*l1*l3;
    t2des_1 = atand((-l2 + sqrt(radicand))/(2*l1));
    t2des_2 = atand((-l2 - sqrt(radicand))/(2*l1));
    t2des = min(t2des_2);

    % compute R1, R2, R3 from Equations 8.20 - 8.23, 8.5
    G = E(2)*sind(t2des) - E(1)*cosd(t2des);
    G1 = (D(1)*sind(t2des)+F(1)*cosd(t2des))*E(2) - (D(2)*sind(t2des)+F(2)*cosd(t2des))*E(1);
    G2 = (D(2)*sind(t2des)+F(2)*cosd(t2des))*sind(t2des) - (D(1)*sind(t2des)+F(1)*cosd(t2des))*cosd(t2des);
    R1 = G1/G;
    R2 = G2/G;
    R3 = cosd(t2des-t4des) + R1*cosd(t2des) - R2*cosd(t4des);

    % compute link lengths
    r1 = t;
    r2 = r1/R2;
    r4 = r1/R1;
    r3 = sqrt(r2^2 + r4^2 + r1^2 - 2*r2*r4*R3);

    % compute t2i and t4i from Equations 8.6, 8.7
    t2i = wrapTo360(t2des - phides);
    t4i = wrapTo360(t4des - psides);

    %% PERFORMANCE
    % call Newton's Method to find actual values of theta 2, theta 4, error
    t3est = 0;
    t4est = t4i;
    t2_123 = phi_123 + t2i;
    t4_123 = psi_123 + t4i;
    dead_pos = 360 - acosd(((r3+r4)^2-r1^2-r2^2)/(-2*r1*r2));
    limit_pos = 360 - asind(r4/(r2+r3)*sin(acos(((r2+r3)^2-r1^2-r4^2)/(2*r1*r4))));

    if r2 > (1/12) && r2 < (t/2)...
                && isreal(dead_pos) && isreal(limit_pos)...
                && dead_pos<t2i
        n = n+1;
        i = 0;
        error = 0;
        
        for z = dead_pos:.01:max(phi_123)+t2i
            i = i+1;
            t2 = deg2rad(z);
            [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
            phi(i,1) = wrapTo360(rad2deg(t2)) - t2i;         % actual phi
            psi(i,1) = wrapTo360(rad2deg(t4)) - t4i;         % actual psi
        end
        phi_desired = linspace(dead_pos-t2i, max(phi_123), i)';
        psi_desired = atand(w./(w./tand(phi_desired)+t));
        clear phi_desired psi_desired phi psi

        % create arrays
        possible_orientations(n,1) = r1;
        possible_orientations(n,2) = r2;
        possible_orientations(n,3) = r3;
        possible_orientations(n,4) = r4;
        possible_orientations(n,5) = t2i;
        possible_orientations(n,6) = t4des;
        possible_orientations(n,7) = error;

    end

    waitbar(t4des/900,h)
end
close(h)

% %% THETA 4 ADMISSIBLE
% counter = 0;
% for t4des = 0:0.1:180
%     counter = counter + 1;
%     t4array(counter,1) = t4des;
%     
%     compute three derivatives
%     h4 = 1;
%     h4dot = -2*t/w;
%     h4dotdot = 6*(t/w)^2;
% 
%     % compute a, b, c, d in Table 8.3
%     a = [-h4; -h4dot; h4dotdot-h4^3];
%     b = [0; -h4^2; 3*h4*h4dot];
%     c = [-(1-h4); h4dot; -h4dotdot-(1-h4)^3];
%     d = [0; -(1-h4)^2; -3*h4dot*(1-h4)];
% 
%     E = a*sind(t4des) + b*cosd(t4des);
%     D = c*cosd(t4des) + d*sind(t4des);
%     F = -c*sind(t4des) + d*cosd(t4des);
% 
%     % compute l1, l2, l3 from Equations 8.27
%     l1 = D(2)*(E(3)-E(1))+E(2)*(D(1)-D(3));
%     l2 = E(2)*(F(1)-F(3))-D(1)*E(3)+E(1)*D(3)+F(2)*(E(3)-E(1));
%     l3 = E(1)*F(3)-F(1)*E(3);
% 
%     compute t2des from Equation 8.26
%     radicand(counter,1) = l2^2 - 4*l1*l3;
% end

%% PLOT
optimized_n = 1;          % chosen from POSSIBLE_ORIENTATIONS array

% restate optimized parameters
r1 = possible_orientations(optimized_n,1);
r2 = possible_orientations(optimized_n,2); 
r3 = possible_orientations(optimized_n,3);
r4 = possible_orientations(optimized_n,4);
t2i = possible_orientations(optimized_n,5);
t4i = possible_orientations(optimized_n,6); 
dead_pos = 360 - acosd(((r3+r4)^2-r1^2-r2^2)/(-2*r1*r2));
limit_pos = 360 - asind(r4/(r2+r3)*sin(acos(((r2+r3)^2-r1^2-r4^2)/(2*r1*r4))));
t3est = 0;
t4est = t4i;

% call Newton's Method to find actual values of theta 2, theta 4, error
i = 0;
error = 0;
for z = dead_pos:.01:max(phi_123)+t2i
    i = i+1;
    t2 = deg2rad(z);
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
    phi(i,1) = wrapTo360(rad2deg(t2)) - t2i;         % actual phi
    psi(i,1) = wrapTo360(rad2deg(t4)) - t4i;         % actual psi
end
phi_desired = linspace(dead_pos-t2i, max(phi_123), i);
psi_desired = atand(w./(w./tand(phi_desired)+t));

% display optimal values
disp(['r1 = ',num2str(r1),', r2 = ',num2str(r2),', r3 = ',...
    num2str(r3),', r4 = ',num2str(r4)])

% graph
figure(1)
plot(phi,psi,'r-'); hold on
plot(phides, psides, 'bo'); hold on
plot(phi_desired,psi_desired,'b--')

xlabel('\phi (degrees)'); ylabel('\psi (degrees)')
axis([(phi_desired(1)-10) (phi_desired(i)+10) psi(1)-10 psi_desired(i)+10])
set(gca,'FontSize',18)
legend('Actual','Precision points','Desired','Location','Best')
box off

% % graph
% figure(2)
% t4array = linspace(0,180,counter);
% plot(t4array,radicand,'b-')
% axis([0 180 -1 20])
% xlabel('\theta_{4des} (degrees)'); ylabel('Radicand (unitless)')
% set(gca,'FontSize',18)
