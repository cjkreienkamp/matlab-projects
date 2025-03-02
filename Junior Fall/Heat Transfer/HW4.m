% Chris Kreienkamp - 901965168
% AME 34334 - Heat Transfer
% Homework #4 - 21 Feb 2019

clear
clc
clf


%% CALCULATIONS
xn = [0.1 0.25 0.5 0.75 1];
yn = [0.1 0.25 0.5 0.75 1];
%i = [3  6 11 16 21]
x_ = linspace(0,1,21);
y_ = linspace(0,1,21);
xi = 0;
for x = 0:0.05:1
    xi = xi+1;
    yi = 0;
    for y = 0:0.05:1
        sum = 0;
        yi = yi+1;
        for n = 1:200
            sum = sum + ((-1)^n-1)/n.*sin(n*pi*x).*sinh(n*pi*y)/sinh(n*pi);
        end
        T(xi,yi) = 120/pi*sum+90;
    end
end

%% PLOT
figure(1)
surf(x_, y_, T)
set(gca,'FontSize',18)
xlabel('y (m)'); ylabel('x (m)'); zlabel('T(x,y) (^oC)')

figure(2)
plot(x_,T(:,3),'b','LineWidth',2); hold on
plot(x_,T(:,6),'r','LineWidth',2); hold on
plot(x_,T(:,11),'g','LineWidth',2); hold on
plot(x_,T(:,16),'m','LineWidth',2); hold on
plot(x_,T(:,21),'k','LineWidth',2)
set(gca,'FontSize',18)
axis([0 1 25 95])
xlabel('x (m)'); ylabel('T (^oC)');
legend('y = 0.1 m','y = 0.25 m','y = 0.5 m',...
    'y = 0.75 m','y = 1 m','Location','Best')

figure(3)
plot(y_,T(3,:),'b','LineWidth',2); hold on
plot(y_,T(6,:),'r','LineWidth',3); hold on
plot(y_,T(11,:),'g','LineWidth',2); hold on
plot(y_,T(16,:),'m','LineWidth',2); hold on
plot(y_,T(21,:),'k','LineWidth',2)
set(gca,'FontSize',18)
axis([0 1 25 95])
xlabel('y (m)'); ylabel('T (^oC)');
legend('x = 0.1 m','x = 0.25 m','x = 0.5 m',...
    'x = 0.75 m','x = 1 m','Location','Best')
