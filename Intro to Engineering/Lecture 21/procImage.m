% Chris Kreienkamp
% Section 10
% 4/4/17

% Read and Manipulate an Image

clear    % Clear memory
clc      % Cleras command window
clf      % Clears figure

%% Load and Display Image

filename = 'Jude2.jpg';         % Load image
M_v1 = imread(filename);        % Read image
M_v2 = rgb2gray(M_v1);          % Convert from color to grayscale

% Display Image
figure(1)                % Open new figure window
axis;                    % Creaes axis on figure
hax_v2 = gca;            % GCA gets handle for current axis
                         % In GUI's, we already know our handle (location)

imshow(M_v2,'InitialMagnification','fit','Parent',hax_v2);                       
                         
                         
%% Transfer Function

% Set parameters
x0 = 155;
width = 1;
x = linspace(0,255,256);

% Evaluate the transfer function (using the logistic equation)
transferFunc = 255*logistic(x,x0,width);

% Display transfer function
figure(2)
plot(x,transferFunc);
xlabel('Pixel Input Intensity Level')
ylabel('Pixel Output Intensity Level')
title('Transfer Function')
axis([0 255 0 255])


%% Image Manipulation - Changing Intensity

% Change intensity of the current image
M_v3 = 255*logistic(M_v2,x0,width);

% Display new image
figure(3)
axis;
hax_v3 = gca;
imshow(M_v3,'InitialMagnification','fit','Parent',hax_v3)