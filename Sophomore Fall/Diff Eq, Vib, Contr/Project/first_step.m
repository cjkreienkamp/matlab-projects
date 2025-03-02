% Chris Kreienkamp, 901965168
% Diff Eq, Vib, Controls
% 11/1/17

%% Initialization
clear all; close all; hold off; clc;
ndid = 901965168;

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
t = linspace(0,roadlength/v,100000);
offGround = 0.14605;        % Lowest point of Miata from the ground (m)

%%% This will plot the initial parameters
time_period = [0, roadlength/v];        % d = 1000 m ; v = 30 m/s
initial = [y(sk0,wavenos,phi,0), dydx(sk0,wavenos,phi,0)];
[time,MiataHeight] = ode45(@(t,z) carrhs(t,z,sk0,wavenos,phi,v,m,b,k),time_period,initial);
figure(1)
plot(time*v,MiataHeight(:,1)+offGround)
legend('Road','Miata MX-5','Location','Northeast')

for i=1:24:61   % plot 6 evenly spaced points of velocity
    %%% This will plot the road profile.
    figure(i+1); hold on
    plot(x,y(sk0,wavenos,phi,x),'r');
    xlabel('Position (m)')
    ylabel('Height (m)')
    set(gca,'FontSize',24)

    %%% This will plot height of the car vs time if driving at speed v
    v = i;
    t = linspace(0,roadlength/v,100000);
    time_period = [0, roadlength/v];        % d = 1000 m ; v = 30 m/s
    initial = [y(sk0,wavenos,phi,0), dydx(sk0,wavenos,phi,0)];
    [time,MiataHeight] = ode45(@(t,z) carrhs(t,z,sk0,wavenos,phi,v,m,b,k),time_period,initial);
    figure(i+1); hold on
    plot(time*v,MiataHeight(:,1)+offGround)
    
    %%% This will plot height of the car vs road length if driving at speed
    %%% v+12
    v = v+12;
    t = linspace(0,roadlength/v,100000);
    time_period = [0, roadlength/v];        % d = 1000 m ; v = 30 m/s
    initial = [y(sk0,wavenos,phi,0), dydx(sk0,wavenos,phi,0)];
    [time,MiataHeight] = ode45(@(t,z) carrhs(t,z,sk0,wavenos,phi,v,m,b,k),time_period,initial);
    figure(i+1)
    plot(time*v,MiataHeight(:,1)+offGround)
    legend('Road',['v = ',(num2str(v-12)),' m/s'],['v = ',(num2str(v)),' m/s'],'Location','Northeast')
    axis([900 1000 0 0.25])
    set(gca,'FontSize',24)
end
