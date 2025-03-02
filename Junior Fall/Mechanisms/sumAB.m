function [sumA , sumB] = sumAB(m,Ig,h,hdot,fgx,fgxdot,fgy,fgydot)
% [sumA , sumB] = sumAB(m,Ig,h,hdot,fgx,fgxdot,fgy,fgydot)
% Gives the sum of the A's and sum of the B's for all
% moving parts of the machine

% compute sum A
sumA = m*(fgx^2+fgy^2)+Ig*h^2;
sumA = sum(sumA);

% compute sum B
sumB = m*(fgx*fgxdot+fgy*fgydot)+Ig*h*hdot;
sumB = sum(sumB);