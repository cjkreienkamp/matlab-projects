% Chris Kreienkamp
% Assignment 11 - Product Economics 2

clear
clc
clf

development = [-5, -2.5, 1, 4];
npvDev = [0.4161, 0.203, -0.0953, -0.351];
testing = [-5, -2.5, 1, 4];
npvTest = [0.3295 0.1597 -0.078 -0.2817];
unitPrice = [-2.5 1 4];
npvPrice = [-7.4842 2.9796 11.9486];

plot(development,npvDev,'r-','LineWidth',3); hold on
plot(testing,npvTest,'b-','LineWidth',3); hold on
plot(unitPrice,npvPrice,'g-','LineWidth',3); hold off
axis([-4 4 -2 2])
xlabel('% change in variable'); ylabel('% NPV')
legend('Development','Testing','Unit Price','Location','Best')
set(gca,'FontSize',18)