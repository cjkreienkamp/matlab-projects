% Chris Kreienkamp - 901965168
% AME 30362 - Design Methodology
% Assignment 6 - Probabilistic Design
% Due Friday, October 10, 2019

clear all
close all
clc

% Probabilistic Design
% 2-bar bracket example


% % Single Point Design
% L = 4;                  % [m] beam length
% r = 0.05;               % [m] beam radius               
% F = 1000;               % [N] applied load
% E = 180*10^9;           % [Pa] Young's Modulus of stainless steel AISI 302
% 
% I = r^4*pi/4;           % [m^4] area moment of inertia of a cylinder
% d = F*L^3/(3*E*I);      % [m] deflection
% 
% d_all = 2*r;            % [m] maximum allowable deflection

% Probabilistic Design
% Assume the input force is uniformly distributed between 900-1100 N
% Assume that anything that is built has a tolerance 0.0001 m and follows
% a normal distribution

r_nom = 0.05;           % [m] nominal beam radius
E = 180*10^9;           % [Pa] Young's Modulus of stainless steel AISI 302
d_all = 2*r_nom;        % [m] maximum allowable deflection

%F_dist = makedist('Uniform','Lower',800,'Upper',1200);      % [N] Uniform distribution for the force from 800-1200 N
%F_dist = makedist('Normal','mu',1000,'sigma',200);          % [N] Normal distribution for the force with a mean of 1000 N and std. dev. of 200 N
L_dist = makedist('Normal','mu',4,'sigma',0.4);             % [m] Normal distribution for the length with a mean of 4 m and std. dev. of 0.4 m
r_dist = makedist('Normal','mu',r_nom,'sigma',0.005);       % [m] Normal distribution for the radius with a mean of 0.05 m and std. dev. of 0.005 m

for i = 1:10000
    F(i) = 1000;                    % [N] Single value for the force of 1000 N
    %F(i) = random(F_dist);          % randomly select a load
    L(i) = random(L_dist);          % randomly select a length
    r(i) = random(r_dist);          % randomly select a radius
    I(i) = r(i)^4*pi/4;             % [m^4] area moment of inertia of a cylinder
    d(i) = F(i)*L(i)^3/(3*E*I(i));  % [m] deflection
end

figure(1)
histogram(F,'Normalization','probability')
xlabel('applied load, W (N)','FontSize',16)
ylabel('occurances','FontSize',16)
set(gca,'FontSize',16)

figure(2)
histogram(L,'Normalization','probability')
xlabel('length (m)','FontSize',16)
ylabel('occurances','FontSize',16)
set(gca,'FontSize',16)

figure(3)
histogram(r,'Normalization','probability')
xlabel('radius (m)','FontSize',16)
ylabel('occurances','FontSize',16)
set(gca,'FontSize',16)

figure(4)
histogram(d,'Normalization','probability')
hold on
X = [d_all d_all];
Y = [0 0.12];
line(X,Y,'Color','red','LineStyle','--')
xlabel('deflection (m)','FontSize',16)
ylabel('occurances','FontSize',16)
set(gca,'FontSize',16)
