q2 = 0:pi/100:2*pi;
q3 = 0:pi/100:2*pi;
y = cos(q2+q3)+cos(q2)-1.5;
plot(q2,y,-)
plot(q3,y,o)
legend(q2,q3)