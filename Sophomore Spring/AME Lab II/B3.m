% Chris Kreienkamp
% 2/10/17
% Experiment B3

clear
clc
clf


%% displacement vs load
F = [0 0.5 1.5 2.5 3.5 4.5 5.5]*9.81;        % N
vertdisp = [0.096 0.089 0.080 0.061 0.047 0.032 0.016];
offset = 0.096;
in2m = 0.0254;      % inches to meters
yactual = (vertdisp-offset)*in2m;  % meters
E = 69.5*10^9 ;      % N/m^2
L = (24+3/8)*in2m;
x = 19*in2m;
I = (0.181*in2m*(.5*in2m)^3+1.49*in2m*((.863*in2m)^3-(.5*in2m)^3))/12;
ytheor = F/(6*E*I)*(x^3-3*L*x^2);

figure(1)
plot(F,yactual,'b-',F,ytheor,'r-')
xlabel('F (N)'); ylabel('y (m)');
legend('Experimental','Theoretical','Location','Best')
set(gca,'FontSize',20)
% axis([0,55,0,0.000001])


%% measured strain vs load
strainactual = [0 15 48 79 112 143 176]*10^-6;
c = .863/2*in2m;
l = 21*in2m;
straintheor = c*F*l/(E*I);

figure(2)
plot(F, strainactual,'b-',F,straintheor,'r-')
xlabel('F (N)'); ylabel('\epsilon (unitless)');
legend('Experimental','Theoretical','Location','Best')
set(gca,'FontSize',20)