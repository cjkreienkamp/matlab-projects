% Chris Kreienkamp
% Section 10
% 4/4/17

% Read and Manipulate an Image

clear    % Clear memory
clc      % Cleras command window
clf      % Clears figure

%% Load and Display Image

filename = 'Jude.png';     % Load image
Mcolor = imread(filename); % Read image

% Display image
figure(1)       % Open new figure window
axis;           % Create axis on figure
hax = gca;      % GCA gets "handle" (or information) for the current axes
                % For GUI's we already know the handle! (handles.plotAxes)

% We'll use IMSHOW to display image
% - "MColor" is the variable name for the image
% - 'InitialMagnification' sets the initial scale for the figure
% - Selecting 'fit' will scale the entire image to the figure window
% - 'Parent' is the handle for the axes
% - Selecting variable 'hax' for handle will place the image on the current
% figure
imshow(Mcolor,'InitialMagnification','fit','Parent',hax)


%% Image Manipulation #1 - Color to Gray

Mgray = rgb2gray(Mcolor);          % Convert from color to gray

figure(2)
axis;
hax2 = gca;
imshow(Mgray,'InitialMagnification','fit','Parent',hax2)


%% Image Manipulation #2 - Re-arrange Pixels

Mtop = Mgray(1:200,:);     % Variable assigned to first 200 rows of pixels
Mbot = Mgray(201:end,:);   % Variable assigned to remaining rows for pixels
Mmod = [Mbot; Mtop];        % Create modified image with moved pixels

figure(3)
axis;
hax3 = gca;
imshow(Mmod,'InitialMagnification','fit','Parent',hax3)