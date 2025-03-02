% Chris Kreienkamp
% Section 10
% 3/7/17
% plotDamped.m

%% Set Parameters
xmin = 0;
xmax = 8;
Nx = 200;


%% Plot
mX = linspace(xmin, xmax, Nx);
y = damped(mX);

for it = 1:1:Nx
    plot(mX(it),y(it),'ro',...
        mX(1:it),y(1:it),'b-')
    
    xlabel('x values')
    ylabel('y values')
    title('Damped Animation')
    axis([xmin xmax -1 1])
    drawnow
end