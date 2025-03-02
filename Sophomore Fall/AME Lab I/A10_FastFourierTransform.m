% File: plab3_fft.m
% Last modified: 03/03/16
%
clear all
close all
clc

% Load the file to the variable 'x'.  The file should have two columns and
% not text in it.  The first column should be time and the second should be
% voltage readings.  

x = xlsread('baseball.xls');  % rename 'yourfile.CSV' to correspond with your file name

time = x(:,1);      % [s] places the time column into the variable 'time' 
ydc = x(:,2);       % [V] places the signal column into the variable 'ydc'
y=ydc-mean(ydc);    % [V] determines the relative size of the output signal

[n c]=size(time);   % [] the variable 'n' is the number of data points
tmin=min(time);     % [s] initial time measurement
tmax=max(time);     % [s] final time measurement
T=tmax-tmin;        % [s] sampling period

%changed (n) to (n-1), LGN
dt=T/(n-1);         % [s] the time increment between measurments

fsamp=1/dt;         % [Hz] sampling frequncy
tf=T;               
ti=0;
t=ti:dt:tf;         
F=fft(y,n);         % fast Fourier transform on 'n' points of relative voltage

A=(2/n)*sqrt(F.*conj(F));   % normalizes the result for the relative amplitude
P=F.*conj(F)/n^2;
f=(1/(n*dt))*(0:(n/2)-1);   % extracts frequencies from the sampling range 

% Plot the time history of the measured signal
figure(1)
ydc_smooth = smooth(ydc,15,'moving');
plot(time,ydc_smooth,'k-')
xlabel('time (s)')
ylabel('y(t)')

% Plot the Amplitude in the frequency domain 
%(also called the spectral density) of the FFT
figure(2)
bar(f,A(1:n/2),0.1,'k')    % '0.01' is the width of the bars and may be changed
ylabel('Amplitude |y(f)| (V)') % this will have units of whatever your measurement variable is
xlabel('Frequency (Hz)')
set(gca,'FontSize',20)
xlim([0 500])               % frequency range on the plot

% Plot the Phase in the frequency domain, which is 
% the arctan of the Real divided by the Imaginary part of the FFT
figure(3)
bar(f,angle(F(1:n/2)),0.1,'k')    % '0.01' is the width of the bars and may be changed
ylabel('phase (radians)') % this will have units of radians
xlabel('frequency (Hz)')
xlim([0 500])               % frequency range on the plot