% Chris Kreienkamp - 901965168
% EE 40442: Power Electronics
% Homework 10 - 22 Apr 2020

clear
clc
clf



%% 8-5
% R = 15; L = 0.010; f = 400; I1rms = 8;
% Z1 = sqrt(R^2+(1*2*pi*f*L)^2);
% Vdc = I1rms*sqrt(2)/4*1*pi*Z1;
% A = ones(7,5);
% i = 0;
% for n = [1,3,5,7,9,11,13]
%     i = i+1;
%     A(i,1) = n;                         % n
%     A(i,2) = 4*Vdc/n/pi;                % V_n (V)
%     A(i,3) = sqrt(R^2+(n*2*pi*f*L)^2);  % Z_n (Ohms)
%     A(i,4) = A(i,2)/A(i,3);             % I_n (A)
%     A(i,5) = A(i,4)/sqrt(2);            % I_n,rms (Arms)
% end
% THD = sqrt(A(2,5)^2+A(3,5)^2+A(4,5)^2+A(5,5)^2+A(6,5)^2+A(7,5)^2)...
%     /I1rms;



%% 8-14
% B = ones(5,2); i = 0;
% Vdc = 48; alpha1 = 15; alpha2 = 25; alpha3 = 55;
% for n = [1,3,5,7,9]
%     i = i+1;
%     B(i,1) = n;                         % n
%     B(i,2) = 4*Vdc/n/pi*(cosd(n*alpha1)+cosd(n*alpha2)+cosd(n*alpha3));
% end



%% 8-21
% R = 10; L = 0.020; f_ref = 60; V1rms = 120; THD_max = 0.08; % given
% V1 = V1rms*sqrt(2);
% Z1 = sqrt(R^2+(1*2*pi*f_ref*L)^2);
% I1 = V1/Z1;
% THD_top = THD_max*I1/sqrt(2);
% 
% ma_test = 0.8;                              % modify if THD too high
% Vdc_test = V1/ma_test;
% Vdc = 212;  nmf = 0.82;     nmf2 = 0.22;    % modify based on Vdc_t, ma_c
% ma = V1/Vdc;
% Vmf = nmf*Vdc;
% Imf = THD_top*sqrt(2);
% Zmf = Vmf/Imf;
% mf_calc = Zmf/(2*pi*f_ref*L);
% mf = 25;                                    % modify based on mf_calc
% f_tri = mf*f_ref;
% 
% % _c indicates it is a check
% VmfLow_c = nmf2*Vdc;
% VmfMid_c = nmf*Vdc;
% VmfHigh_c = nmf2*Vdc;
% ZmfLow_c = sqrt(R^2+((mf-2)*2*pi*f_ref*L)^2);
% ZmfMid_c = sqrt(R^2+((mf)*2*pi*f_ref*L)^2);
% ZmfHigh_c = sqrt(R^2+((mf+2)*2*pi*f_ref*L)^2);
% ImfLow_c = VmfLow_c / ZmfLow_c;
% ImfMid_c = VmfMid_c / ZmfMid_c;
% ImfHigh_c = VmfHigh_c / ZmfHigh_c;
% THD_actual = sqrt(ImfLow_c^2 + ImfMid_c^2 + ImfHigh_c^2) / I1;



%% SUPPLEMENTAL A
N = 1000;
a_1 = linspace(0,90,N);
a_2 = linspace(0,90,N);
e = ones(N,N);
for row = 1:N
    for col = 1:N
        e(row,col) = totalSquaredError(a_1(row),a_2(col));
    end
end
mesh(a_1, a_2, e)
axis([0 90 0 90 0 8])
xlabel('\alpha_1'); ylabel('\alpha_2'); zlabel('\epsilon^2')
set(gca,'FontSize',18)

% Total Harmonic Distortion
a1 = 48.11; a2 = 11.98;
f = 60; R = 10; L = 0.025; Vdc = 120;
V = ones(7,1); Z = ones(7,1); I = ones(7,1);
index = 0;
for n = [1,3,5,7,9,11,13]
    index = index + 1;
    V(index) = 4*Vdc/n/pi*(cosd(n*a1)+cosd(n*a2));
    Z(index) = sqrt(R^2+(n*2*pi*f*L)^2);
    I(index) = V(index)/Z(index);
end
THD = sqrt(I(2)^2 + I(3)^2 + I(4)^2 + I(5)^2 + I(6)^2 + I(7)^2)/I(1);

function  error = totalSquaredError(a_1,a_2)
error = (cosd(3*a_1)+cosd(3*a_2)).^2 + (cosd(5*a_1)+cosd(5*a_2)).^2;
end