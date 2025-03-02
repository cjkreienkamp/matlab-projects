function [h3,h4,hdot3,hdot4] = kc4bar(r2,r3,r4,t2,t3,t4)
% [h3,h4,hdot3,hdot4] = kc4bar(r2,r3,r4,t2,t3,t4)
% Gives the kinematic coefficients given the dimensions and 
% angles of the four bars. Input (rad)

% compute the necessary sines and consines of angles t2-t4
ct2 = cos(t2);
st2 = sin(t2);
ct3 = cos(t3);
st3 = sin(t3);
ct4 = cos(t4);
st4 = sin(t4);

% compute kinematic coefficients
h3 = (r2*sin(t4-t2))/(r3*sin(t3-t4));
h4 = (r2*sin(t3-t2))/(r4*sin(t3-t4));
hdot3 = (r4*h4^2-ct4*(r3*ct3*h3^2+r2*ct2)-st4*(r3*st3*h3^2+r2*st2))...
    /(r3*sin(t3-t4));
hdot4 = (st3*(r4*st4*h4^2-r2*st2)+ct3*(r4*ct4*h4^2-r2*ct2)-r3*h3^2)...
    /(r4*sin(t3-t4));

