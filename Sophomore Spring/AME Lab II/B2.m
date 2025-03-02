% Chris Kreienkamp
% 2/1/18
% Experiment B2: Uniaxial Tension
clear
clc


%% LOAD DATA
cold = xlsread('CKcold.xls');
hot = xlsread('KZhot.xls');
coldLVDT = 0.199740;    % in
coldExt = 0.027196;     % in/in
coldLoad = 1000;        % lbf
hotLVDT = 0.194600;     % in
hotExt = 0.027460;      % in/in
hotLoad = 1000;         % lbf
coldL = 3.55;           % in
coldD = 0.340;          % in
hotL = 3.598;           % in
hotD = 0.3378;          % in


%% 1. extensometer stress-strain
XcExt = cold(1:275,3)*coldExt*-1;
YcExt = cold(1:275,1)*coldLoad/(pi*(coldD/2)^2)/1000;
XhExt = hot(1:265,3)*hotExt;
YhExt = hot(1:265,1)*hotLoad/(pi*(hotD/2)^2)/1000;
Ecext = (41.66-22.97)/(0.001548-0.0009335);        % Young's Modulus
Ehext = (36.15-18.75)/(0.001173-0.0006316);
EcextU = (50.75-34.6)/(0.009752-0.009136);       % Young's Modulus Unloading
EhextU = (34.26-19.86)/(0.02106-0.02051);


figure(1)
plot(XcExt,YcExt,'b-','LineWidth',1.5); hold on
plot(linspace(0,0.001887,10),51.64*ones(10),'r--','LineWidth',2); hold on
plot(0.001887,51.64,'ro','LineWidth',2,'MarkerSize',10); hold on          % proportional limit
plot(linspace(0.00,0.00449,10),Ecext*(-0.002+linspace(0,0.00449,10)),'g--','LineWidth',2); hold on
plot(.004449,74.507,'go','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,.004449,5),74.507*ones(5),'g--','LineWidth',2); hold off
xlabel('strain (in/in)'); ylabel('stress (kpsi)')
axis([0 0.055 0 90])
set(gca,'FontSize',16)

figure(2)
plot(XhExt,YhExt,'b-','LineWidth',1.5); hold on
plot(linspace(0,0.001812,2),[56.68,56.68],'g--','LineWidth',2); hold on
plot(0.001812,56.68,'go','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,0.01376,2),[51.1,51.1],'r--','LineWidth',2); hold on
plot(0.01376,51.1,'ro','LineWidth',2,'MarkerSize',10); hold off
xlabel('strain (in/in)'); ylabel('stress (kpsi)')
axis([0 0.055 0 90])
set(gca,'FontSize',16)


%% 2. LVDT stress-strain
XcLVDT = cold(1:317,3)*coldLVDT*-1/coldL;
YcLVDT = cold(1:317,1)*coldLoad/(pi*(coldD/2)^2)/1000;
XhLVDT = hot(1:385,3)*hotLVDT/hotL;
YhLVDT = hot(1:385,1)*hotLoad/(pi*(hotD/2)^2)/1000;
EcLVDT = (41.66-26.28)/(0.003303-0.002248);
EhLVDT = (46.19-20.87)/(0.002937-0.00139);
EcLVDTu = (53.61-25.31)/(0.0205-0.01832);
EhLVDTu = (34.59-11.27)/(0.04105-0.03964);

figure(3)
plot(XcLVDT,YcLVDT,'b-','LineWidth',1.5); hold on
plot(linspace(0,0.06023,2),max(YcLVDT)*[1,1],'m--','LineWidth',2); hold on
plot(0.06023,84.72,'mo','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,0.004004,2),51.64*[1,1],'r--','LineWidth',2); hold on
plot(linspace(0,0.006714,10),EcLVDT*(-.002+linspace(0,0.006714,10)),'g--','LineWidth',2); hold on
plot(0.004004,51.64,'ro','LineWidth',2,'MarkerSize',10); hold on
plot(0.006714,68.7245,'go','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,0.006714,2),68.7245*[1,1],'g--','LineWidth',2); hold off
xlabel('strain (in/in)'); ylabel('stress (kpsi)')
axis([0 0.25 0 90])
set(gca,'FontSize',16)

figure(4)
plot(XhLVDT,YhLVDT,'b-','LineWidth',1.5); hold on
plot(linspace(0,.1963,2),max(YhLVDT)*[1,1],'m--','LineWidth',2); hold on
plot(0.1963,72.3,'mo','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,0.00357,2),[56.68,56.68],'g--','LineWidth',2); hold on
plot(0.00357,56.68,'go','LineWidth',2,'MarkerSize',10); hold on
plot(linspace(0,0.0271,2),[51.1,51.1],'r--','LineWidth',2); hold on
plot(0.0271,51.1,'ro','LineWidth',2,'MarkerSize',10); hold off
xlabel('strain (in/in)'); ylabel('stress (kpsi)')
axis([0 0.25 0 90])
set(gca,'FontSize',16)
