% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 1 - 24 Jan 2020

clear
clc
clf



%% 2-18
Irms = sqrt( 1/0.020 * (49*0.006+25*0.004+16*0.010));


%% 2-21
R = 4; L = 0.010; Vdc = 12;
w1 = 4*pi*60; w2 = 8*pi*60; 
I0 = (-12+50)/R; I1 = 30/(R+j*w1*L); I2 = 10/(R+j*w2*L);
I1mag = abs(I1); I1phase = rad2deg(angle(I1));
I2mag = abs(I2); I2phase = rad2deg(angle(I2));
Pdc = Vdc*I0;
PR = (I0^2+(I1mag/sqrt(2))^2+(I2mag/sqrt(2))^2)*R;
PS = -Pdc-PR;



%% 2-24
a0=50*10; a1=50*10/2; a2=50*10/2^4; a3=50*10/3^3/2; a4=50*10/4^3/2;
b1=atan(1/2); b2=atan(2/2); b3=atan(3/2); b4=atan(4/2);
P = a0 + a1*cos(b1) + a2*cos(b2) + a3*cos(b3) + a4*cos(b4);