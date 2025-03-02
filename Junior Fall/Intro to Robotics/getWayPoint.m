%% p = getWayPoint(n)
% Return the position of the n-th waypoint
%
% Inputs: n     the number of the waypoint of interest
%
% Ouptuts: p    a 1x3 vector for the position of the n-th waypoint
function p = getWayPoint(n) 
    separation = 0.18; %separation in y between waypoints
    y0 = -.5;          %initial y-position of waypoints
    y = (n-1)*separation + y0;
    if mod(n,2) == 0 % even numbered waypoints are on the fuselage
       p = getFuselagePosition(15*pi/180,  0 , 0);
    else %odd numbered waypoints are 0.25 m away
       p = getFuselagePosition(15*pi/180,  0, .25); 
    end
    p(2) = y;
end