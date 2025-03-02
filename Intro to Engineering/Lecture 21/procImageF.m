function procImageF(handles)

% Chris Kreienkamp
% Section 10
% 4/4/17

%% Load and Display Image

filename = 'Jude2.jpg';
M_v1 = imread(filename);
M_v2 = rgb2gray(M_v1);

imshow(M_v2,'InitialMagnification','fit','Parent',handles.origAxes);                                           
  

%% Transfer Function

% Set parameters
x0 = handles.thresholdSlider.Value;
width = handles.widthSlider.Value;
x = linspace(0,255,256);

% Evaluate the transfer function (using the logistic equation)
transferFunc = 255*logistic(x,x0,width);

% Display transfer function

plot(handles.plotAxes, x,transferFunc);
xlabel(handles.plotAxes,'Pixel Input Intensity Level')
ylabel(handles.plotAxes,'Pixel Output Intensity Level')
title(handles.plotAxes,'Transfer Function')
axis([0 255 0 255])


%% Image Manipulation - Changing Intensity

M_v3 = 255*logistic(M_v2,x0,width);
imshow(M_v3,'InitialMagnification','fit','Parent',handles.procAxes)