% Chris Kreienkamp
% 12/4/17
% AME Lab I - Final

clear all
clf
clc


%% INPUT DATA
deltax = [10 20 30 40 50 60 70 80 90 100]/100;
deltat = [0.728 1.336 1.920 2.484 3.012 3.630 4.180 4.740 5.290 5.950]/1000;


%% PLOT
plot(deltat,deltax,'bo'); hold on
curvefit = fit(deltat',deltax','poly1');
plot(curvefit)
legend('Measured','Theoretical','Location','Northwest')
ylabel('\Delta x (m)'); xlabel('\Delta t (s)')
set(gca,'FontSize',20)
axis([0 6.5*10^-3 0 1.05])

m = coeffvalues(curvefit)
c = confint(curvefit)