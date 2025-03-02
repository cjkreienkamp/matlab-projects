function [fcx,fcy,fcxdot,fcydot,fe] = kcPointOfInterest(r2,rc,t2,t3,phi,te,h3,h3dot)
% [fcx,fcy,fcdotx,fcdoty,fe] = kcPointOfInterest(r2,rc,t2,t3,phi,te,h3,hdot3)
% Gives the kinematic coefficients of point of interest C and 
% the kinematic coefficient of elevation for link C given the 
% dimensions and angles of the four bars. Input (rad)

% compute the necessary sines and consines of angles t2-t4
ct2 = cos(t2);
st2 = sin(t2);
ct3 = cos(t3);
st3 = sin(t3);

% compute kinematic coefficients
fcx = -r2*st2-rc*sin(t3+phi)*h3;
fcy = r2*ct2+rc*cos(t3+phi)*h3;
fcxdot = -r2*ct2-rc*cos(t3+phi)*h3^2-rc*sin(t3+phi)*h3dot;
fcydot = -r2*st2-rc*sin(t3+phi)*h3^2+rc*cos(t3+phi)*h3dot;

% compute kinematic coefficient of elevation
fe = fcx*cos(te)+fcy*sin(te);