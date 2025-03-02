% Chris Kreienkamp, 901965168
% Diff Eq, Vib, Controls
% 12/7/17

%% Initialization
clear all; close all; hold off; clc;
clc
ndid = 901965168;

%%
%%% select sk0 to change quality of the road
sk0 = 10/10^6;      % very good road
%sk0 = 40/10^6;     % good road
%sk0 = 160/10^6;    % average road
%sk0 = 640/10^6;    % poor road
%sk0 = 2560/10^6;   % very poor road

%%% DO NOT CHANGE ANY OF THESE!!!
minwaveno = -2; maxwaveno = 2;  
N = 61; wavenos = logspace(minwaveno,maxwaveno,N);
rng(ndid+floor(sk0+10^6*2)); phi = unifrnd(-pi,pi,1,N);  
%%% END OF DO NOT CHANGE ANY OF THESE

roadlength = 1000;  % 1km track
x = linspace(0,roadlength,100000);

%%% This will plot the road profile.
figure(1); hold on
plot(x,y(sk0,wavenos,phi,x),'r');
xlabel('Position (m)')
ylabel('Height (m)')
set(gca,'FontSize',24)
    
%%% Baseline suspension values
m = 250; k = 6000*9.81; b = 5370; g = 9.81;
v = 30;  % units are m/s
%v = 460.8209;
%v = 651.6991;
%v = 921.6418;
t = linspace(0,roadlength/v,100000);

%%% This will plot the initial parameters
time_period = [0, roadlength/v];        % d = 1000 m ; v = 30 m/s
initial = [y(sk0,wavenos,phi,0), dydx(sk0,wavenos,phi,0)];
[time,MiataHeight] = ode45(@(t,z) carrhs(t,z,sk0,wavenos,phi,v,m,b,k),time_period,initial);
plot(time*v,MiataHeight(:,1),'b'); hold on
axis([340 440 -0.1 0])
legend('Road','Miata MX-5','Location','Northeast')


%%
%%% Find second derivative of the height of the car
% Already know the first derivative from MiataHeight(:,2)
z_first = MiataHeight(:,2);
length = length(MiataHeight(:,2))-1;
z_second = zeros(1,length);
time_second = zeros(1,length);
for i = 1:length
   znew = z_first(i+1);
   z = z_first(i);
   dt = time(i+1) - time(i);
   z_second(i) = (znew-z)/dt;
   time_second(i) = (time(i+1)+time(i))/2;
end
%figure(2)
maxAcc = max(z_second)
minAcc = min(z_second)
% plot(time_second*v,z_second,'k')
% axis([0 1000 -4 4])

%%% Find the maximum extensions and minimum compressions of the suspension
compression = MiataHeight(:,1) - y(sk0,wavenos,phi,time*v);
maxExt = max(compression)
minExt = min(compression)


%%
omegan = sqrt(k/m)
zeta = b/2/sqrt(k*m)
T = 565.4-376.7
