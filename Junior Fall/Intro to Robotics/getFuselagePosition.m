% Helper function to return the a cartesian position along the fuselage from
% cylindrical coordniate inputs
% You don't need to know any of the details to complete the project
function p = getFuselagePosition(th, y, extra_r)
    r = 2;
    l = 4; 
    x0 = 2.5; 
    y0 = -2;
    z0 = 0;
    r = r+extra_r;
    p = [x0-r*cos(th) y0+l*y z0+r*sin(th)];
end