% Chris Kreienkamp
% Section 10
% 2/14/17

% Compute and animate the path of a random walk
clc
clear

%% SET INITIAL PARAMETERS
N = 500;
x = zeros(1,N);
y = zeros(1,N);

animOnOff= input('Type 1 for animation ON and 0 for animation OFF: ');

%% CALCULATE A WALK STARTING AT THE ORIGIN
for istep = 1:N-1
    idirection = randi(360);
    x(istep+1) = x(istep) + cosd(idirection);
    y(istep+1) = y(istep) + sind(idirection);
end

%% ANIMATE THE PLOT OF THE WALK
for istep = 1:N-1
    if animOnOff == true
        plot(x(1:istep),y(1:istep),...                  % path
            x(istep), y(istep), 'ro',...                % walker position
            0,0,'r^')                                   % origin
        
        xyMax = max(abs([x(1:istep),y(1:istep),10]));   % largest xy value
        axis([-xyMax xyMax -xyMax xyMax])
        drawnow
        
    elseif animOnOff == false
        plot(x(1:istep),y(1:istep),...                 % path
            x(istep), y(istep), 'ro',...                % walker position
            0,0,'r^')                                   % origin
        
        xyMax = max(abs([x(1:istep),y(1:istep),10]));   % largest xy value
        axis([-xyMax xyMax -xyMax xyMax])
    end
end