function CrossoverAnalyzerF(handles)
%Wesley Garrison, Chris Kreienkamp, Ruben, Tristen Lewandowski
%Section 10, Group 9: Design of a Crossover Network

%% EQUATIONS

% Resistor Impedance: Z = R
% Capacitor Impedance: Z = 1/(j*?*C) = 1 / (1i*omega*Capacitance)
% Inductor Impedance: Z = j*?*L = 1i*omega*Inductance 
% 1i = square root of -1
% omega = 2*pi*frequency


%% SET PARAMETERS

% Capacitance Values
tweetCap=handles.TweetCapSlider.Value*10^-6;       % tweeter capacitance
woofCap=handles.WoofCapSlider.Value*10^-6;         % woofer capacitance
mid1Cap=handles.MidCap1Slider.Value*10^-6;         % midrange 1 capacitance
mid2Cap=handles.MidCap2Slider.Value*10^-6;         % midrange 2 capacitance

% Inductance Values
tweetInduct=handles.TweetInductSlider.Value*10^-3; % tweeter inductance
woofInduct=handles.WoofInductSlider.Value*10^-3;   % woofer inductance
mid1Induct=handles.MidInduct1Slider.Value*10^-3;   % midrange 1 inductance
mid2Induct=handles.MidInduct2Slider.Value*10^-3;   % midrange 2 inductance

% Resistance Values
tweetDriver = 8;            % tweeter driver resistance
midDriver = 7;              % midrange driver resistance
woofDriver = 6.5;           % woofer driver resistance

% Array of all frequencies between 0 - 20,000 Hz
N = 20000;                  
fin=linspace(0,20000,N);    % Input frequency into the circuit
omega=2*pi.*fin;            % Used in the calculation of impedance
R2 = 8;

%% High Pass Filter (Tweeter)

% Inductor in parallel
% Capacitor in series

zCapacitor = 1./(1i*omega*tweetCap);
zInductor = 1i*omega*tweetInduct;

z1=1i*omega*tweetInduct; 

z2=R2.*ones(1,N);    %resistance/impedance of tweeter

%Caculate parallel resistance between z1 and z2
zPTweeter=(z1.*z2)./(z1+z2);
tweetOut=zPTweeter./(zPTweeter+zCapacitor);
magTweetOut=abs(tweetOut);
%loglog(fin,zParallel,'-b')
grid on

a=zPTweeter+zCapacitor;
%% Low Pass Filter (Woofer)

zInductor=1i*omega*woofInduct;

z3=1./(1i*omega*woofCap);
z4=6.5*ones(1,N);   %Resistance of woofer

zPWoofer=(z3.*z4)./(z3+z4);

zWoofSeries=abs(zPWoofer+zInductor);


% voltage divider
woofOut=zPWoofer./(zPWoofer+zInductor);
magWoofOut=abs(woofOut);

b=zPWoofer+zInductor;

%% Mid-Range Filter

%inductor and capacitor impedences
zCmid1=1./(1i*omega*mid1Cap);
zImid1=1i*omega*mid1Induct;
zImid2=1i*omega*mid2Induct;
zCmid2=1./(1i*omega*mid2Cap);

zMid = 7.*ones(1,N);   %resistance of mid-range driver: 7 (ohms)
zMidPar1=(zMid.*zCmid1)./((zMid+zCmid1));         
zMidSer1=zMidPar1+zImid1;
zMidPar2=(zMidSer1.*zImid2)./((zMidSer1+zImid2));   
zMidTotal=zMidPar2+zCmid2;

%Determind Output
midOut=zMidPar1./zMidTotal;
magMidOut=abs(midOut);

c=zMidSer1+zImid2+zMid+zCmid1;

%% Sum 3 functions
freqSum=magTweetOut+magWoofOut+magMidOut;


%% Plot Results

loglog(handles.plotAxes,fin,magTweetOut,'b-',fin,zWoofSeries,'k-',fin,magMidOut,'g-',...
    fin,freqSum,[800 800], [0.0000001 300], 'r',[6000 6000], [0.0000001 300], 'r')
title(handles.plotAxes,'Plot of Vin vs Frequency')
xlabel(handles.plotAxes,'Frequency (Hz)')
ylabel(handles.plotAxes,'Vin')
axis(handles.plotAxes,[0 20000 .1 10])
grid on
legend(handles.plotAxes,'High Pass Filter','Low Pass Filter','Mid-Range Filter','Location','Northwest')
plot(handles.ztotalAxes,fin,a+b+c)
axis(handles.ztotalAxes,[0 20000 0 7])
end