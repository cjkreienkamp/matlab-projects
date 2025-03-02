% Chris Kreienkamp - 901965168
% Heat Transfer
% Homework #2 - 7 Feb 2019

clear
clc
clf


%% CALCULATION
TmaxA = 660;
TmaxU = 1132;
i = 0;
qg_ = zeros(500,1);
h_ = zeros(500,1);
T_aluminum = zeros(500,1);
T_uranium = zeros(500,1);
for qg = 10^8:200000000:10^9
    for h = 5000:1000:10000
        i = i+1;
        qg_(i) = qg;
        h_(i) = h;
        T_aluminum(i) = 95+qg/(160*h);
        T_uranium(i) = 95+qg/(160*h)+qg/116*(1.5625e-4);
    end
end


%% PLOT

figure(1)
plot3(qg_,h_,T_aluminum,'bx','MarkerSize',10)
xlabel('q_g'''''' (W/m^3)'); ylabel('h (W/m^2-K)'); zlabel('T_{aluminum} (^oC)')
axis([10^8 10^9 5000 10000])
set(gca,'FontSize',16)
grid on; grid minor

figure(2)
plot3(qg_,h_,T_uranium,'bx','MarkerSize',10)
xlabel('q_g'''''' (W/m^3)'); ylabel('h (W/m^3-K)'); zlabel('T_{uranium} (^oC)')
axis([10^8 10^9 5000 10000])
set(gca,'FontSize',16)
grid on; grid minor