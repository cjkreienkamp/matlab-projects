% 65168
clear
clf
clc

%% SETUP
% design parameters
% 102.8543 min error for R = 7 @ 298 degrees
% 82.7707 min error for R = 7.5 @ 299 degrees
% 75.8483 min error for R = 8 @ 299.9 degrees
% 91.3564 min error for R = 8.5 @ 300.7 degrees
R = 7.97;


 % constant parameters
t = 50/12;
w = 60/12;
t3est = 0;

% create precision points
phi_123 = [0 atand(w/(R-t/2)) atand(w/(-R-t/2))]';
psi_123 = [0 atand(w/(R+t/2)) atand(w/(-R+t/2))]';
phi_123_7 = [0 atand(w/(7-t/2)) atand(w/(-7-t/2))]';
psi_123_7 = [0 atand(w/(7+t/2)) atand(w/(-7+t/2))]';

% loop to optimize t2i
n = 0;
possible_orientations = zeros(100,9);
h = waitbar(0,'Please wait...');
for t2i = 270.1:0.1:359.9
    t4i = wrapTo360(180 - t2i);
    t4est = t4i;
    
    % convert phi/psi to thetas
    t2_123 = phi_123 + t2i;
    t4_123 = psi_123 + t4i;
    t2_123_7 = phi_123_7 + t2i;
    t4_123_7 = psi_123_7 + t4i;

%% SOLVE
    % solve for R1, R2, R3
    A = [-cosd(t2_123) cosd(t4_123) [1;1;1]];
    B = cosd(t2_123-t4_123);
    R_matrix = linsolve(A,B);
    R1 = R_matrix(1); R2 = R_matrix(2); R3 = R_matrix(3);
    r1 = t;
    r2 = r1/R2;
    r4 = r1/R1;
    r3 = sqrt(r2^2 + r4^2 + r1^2 - 2*r2*r4*R3);
    dead_pos = 360 - acosd(((r3+r4)^2-r1^2-r2^2)/(-2*r1*r2));
    limit_pos = 360 - asind(r4/(r2+r3)*sin(acos(((r2+r3)^2-r1^2-r4^2)/(2*r1*r4))));
    
    % create array of possible orientations
    if r2 > (1/12) && r2 < (t/2)...
            && isreal(dead_pos) && isreal(limit_pos)...
            && dead_pos < min(t2_123_7)
        n = n+1;
        possible_orientations(n,1) = r1;
        possible_orientations(n,2) = r2; 
        possible_orientations(n,3) = r3;
        possible_orientations(n,4) = r4;
        possible_orientations(n,5) = dead_pos;
        possible_orientations(n,6) = limit_pos;
        possible_orientations(n,7) = R;
        possible_orientations(n,8) = t2i;

%% PERFORMANCE (ERROR)
        % find error for each orientation
        i = 0;
        for z = min(t2_123_7) :.01: max(t2_123_7)
            i = i+1;
            t2 = deg2rad(z);
            [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
            phi(i,1) = wrapTo360(rad2deg(t2)) - t2i;         % actual phi
            psi(i,1) = wrapTo360(rad2deg(t4)) - t4i;         % actual psi
        end
        phi_desired = linspace(min(phi_123_7), max(phi_123_7), i)';
        psi_desired = atand(w./(w./tand(phi_desired)+t));
        error = sqrt(sum((psi_desired-psi).^2));
        possible_orientations(n,9) = error;
       clear phi_desired psi_desired phi psi
    end
    waitbar((t2i-270.05)/89.9,h)
end
close(h)

%% PLOT
optimized_n = 37;          % chosen from POSSIBLE_ORIENTATIONS array

% restate optimized parameters
r1 = possible_orientations(optimized_n,1);
r2 = possible_orientations(optimized_n,2);
r3 = possible_orientations(optimized_n,3);
r4 = possible_orientations(optimized_n,4);
dead_pos = possible_orientations(optimized_n,5);
limit_pos = possible_orientations(optimized_n,6);
R = possible_orientations(optimized_n,7);
t2i = possible_orientations(optimized_n,8);
t4i = wrapTo360(180 - t2i);
t4est = t4i;

% call Newton's Method to find actual values of theta 2, theta 4, error
i = 0;
for z = min(phi_123_7)+t2i:.01:max(phi_123_7)+t2i
    i = i+1;
    t2 = deg2rad(z);
    [t3,t4] = newton4bar(r1,r2,r3,r4,t2,t3est,t4est);
    phi(i,1) = wrapTo360(rad2deg(t2)) - t2i;         % actual phi
    psi(i,1) = wrapTo360(rad2deg(t4)) - t4i;         % actual psi
end
phi_desired = linspace(min(phi_123_7),max(phi_123_7), i);
psi_desired = atand(w./(w./tand(phi_desired)+t));

% display optimal values
disp(['r1 = ',num2str(r1),', r2 = ',num2str(r2),', r3 = ',...
    num2str(r3),', r4 = ',num2str(r4)])
disp(['t2i = ',num2str(t2i),', t4i = ',num2str(t4i)])

% graph
figure(1)
plot(phi,psi,'r-'); hold on
plot(phi_123, psi_123, 'bo'); hold on
plot(phi_desired,psi_desired,'b--')

xlabel('\phi (degrees)'); ylabel('\psi (degrees)')
axis([min(phi_123_7)-10 max(phi_123_7)+10 min(psi_123_7)-10 max(psi_123_7)+10])
set(gca,'FontSize',18)
legend('Actual','Precision points','Desired','Location','Best')
box off
