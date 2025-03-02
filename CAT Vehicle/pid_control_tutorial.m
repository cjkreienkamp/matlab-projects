% Introduction to PID Control
clear
clc
clf

%% STEP RESPONSE
t = 0:0.01:2;
s = tf('s');
P = 1/(s^2 + 10*s + 20);
figure(1)
step(P,t)

%% PROPORTIONAL CONTROL
Kp = 1000;
C = pid(Kp);
T = feedback(C*P,1);
figure(2)
step(T,t)

%% PROPORTIONAL-DERIVATIVE CONTROL
Kp = 100;
Kd = 20;
C = pid(Kp,0,Kd);
D = feedback(C*P,1);
figure(3)
step(D,t)

%% PROPORTIONAL-INTEGRAL-DERIVATIVE CONTROL
Kp = 300;
Kd = 20;
Ki = 100;
C = pid(Kp,Ki,Kd);
I = feedback(C*P,1);
figure(4)
step(I,t)
stepinfo(I)