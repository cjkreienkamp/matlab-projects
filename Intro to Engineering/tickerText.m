function tickerText(s,iwidth,dt)
%% Homework 5, Problem 3 (Chapter 7, Problem 10)
% tickerText.m
% Displays the string 's' scrolling
% through a text window with width 'iwidth'
% Parameter 'dt' gives the length of the pause after piece of text is
% displayed
% Author: Chris Kreienkamp

% With assistance from Tina Wu

fullLength = length(s);
iwidth = iwidth-1;

for iCounter = 1 : fullLength + 2*iwidth
    if iCounter <= iwidth
        disp([blanks(iwidth-iCounter),s(1:iCounter)])
    elseif iwidth < iCounter && iCounter <= fullLength
        disp(s(iCounter-iwidth:iCounter))
    elseif iCounter > fullLength
        disp(s(iCounter-iwidth:fullLength))
    end  
    pause(dt)
end