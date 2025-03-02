% Chris Kreienkamp
% Section 10
% Test Version B

clear
clc


%% CHALLENGE 2 - CALLING THE FUNCTION

myVal = 3.2;
[x1, y1] = myfunc(myVal);
disp(['For t = ',num2str(myVal),', myfunc returns x is ',num2str(x1),' and y is ',num2str(y1),'.'])

if y1 > 0
    disp('The value of y1 is positive.')
elseif y1 < 0
    disp('The value of y1 is negative.')
else
    disp('The value of y1 is 0.')
end


%% CHALLENGE 3 - PLOTTING

Nt = input('How many points would you like to plot? ');
tmin = 1;
tmax = 4;
myt = linspace(tmin, tmax, Nt);

[x,y] = myfunc(myt);
plot(x, y, 'b-')
xlabel('Distance')
ylabel('Height')
title('myfunc.m Function')


%% CHALLENGE 4 - ANIMATION

figure

for it = 1:1:Nt
    plot(x(it),y(it),'ro', x(1:it), y(1:it), 'b-')
    axis([0 90 0 25])
    xlabel('Distance')
    ylabel('Height')
    title('myfunc.m Animation')
    drawnow
end


%% CHALLENGE 5 - ARRAYS AND VECTORS

temperature = load('WeatherDataB.txt');

% Find the average of all the elements in temperature
totalSum = 0;
numberTemp = 0;
for irow = 1:1:31
    for icolumn = 1:1:4
        totalSum = totalSum + temperature(irow,icolumn);
        numberTemp = numberTemp + 1;
    end
end

averageTemp = totalSum / numberTemp;
disp(['The average temperature in January is ',num2str(averageTemp),' degrees.'])


%% CHALLENGE 6 - WHILE LOOPS AND LOGIC

iyear = input('Enter a column number (1-4): ');

while iyear < 1 || iyear > 4
    iyear = input('Enter a number within the specified range (1-4): ');
end

tempRange = 0;
for irow = 1:1:31
    if temperature(irow,iyear) > 10 && temperature(irow,iyear) < 25
        tempRange = tempRange + 1;
    end
end

tempPercent = tempRange / 31 * 100;
disp([num2str(tempPercent),'% of the days in January of year ',num2str(iyear),' had a temperature between 10 and 25 degrees.'])
