function ddot=xDerivMid(t,theta)
g = 9.8;
r = 2;
ddot=ones(2,1); 
ddot(1)=theta(2);
ddot(2)=-g/r*cos(theta);