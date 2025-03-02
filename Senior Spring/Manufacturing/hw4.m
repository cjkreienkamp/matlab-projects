% Chris Kreienkamp - 901965168
% AME 50542: Manufacturing
% Homework 4 - 21 Feb 2020

clear
clc
clf



%% PROBLEM 4
% Evaluate function for each friction case
R = linspace(0,70,1000);            %[%] - max reduction in height
h0 = 0.025;
h = h0-h0*R/100;                    % height
deltaH = (h0-h);                    %[m] - reduction in height
F0 = dieFric(h,0);
F02 = dieFric(h,0.2);
F05 = dieFric(h,0.5);

% Plot
plot(deltaH*1000,F0,'b-','LineWidth',3); hold on;
plot(deltaH*1000,F02,'r-','LineWidth',3); hold on;
plot(deltaH*1000,F05,'g-','LineWidth',3); hold off;
xlabel('reduction in height (mm)'); ylabel('forging force (N)');
legend('no friction','\mu=0.2','\mu=0.5','Location','Best')
set(gca,'FontSize',17)

% Work
W0 = trapz(deltaH,dieFric(h,0));
W02 = trapz(deltaH,dieFric(h,0.2));
W05 = trapz(deltaH,dieFric(h,0.5));

% Temperature
rho = 8530;
cp = 377.1;
D0 = 0.025;
hfinal = min(h);
A = pi*D0^2*h0/(4*hfinal);
T0 = W0/rho/cp/A/hfinal;
T02 = W02/rho/cp/A/hfinal;
T05 = W05/rho/cp/A/hfinal;


% Function
function [F] = dieFric(h,mu)
    h0 = 0.025;                         %[m]
    D0 = 0.025;                         %[m]
    K = 895*10^6;                       %[Pa] - strength coefficient
    n = 0.49;                           % strain-hardening exponent                          
    strain = log(h0./h);                % true strain
    D = D0.*sqrt(h0./h);                % diameter
    p_avg = K*strain.^n.*(1+mu*D/3./h); % average pressure
    F = p_avg*pi.*D.^2/4;               %[N] - force
end