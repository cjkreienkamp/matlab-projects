function [m,b] = lineVals(x1, y1, x2, y2)
% Chris Kreienkamp
% Section 10
% 2/23/17
% takes the x and y coordinates of any two points (x1,y1)(x2,y2) as inputs
% returns slope(m) and y-int(b) of the line defined by these two points
% function [m,b] = lineVals(x1, y1, x2, y2)

% Find the slope of the graph
m = (y2 - y1) / (x2 - x1);

% Find the y-intercept
% y - y1 = m(x-x1)
% y = m*x - m*x1 + y1
% y = m*x + (y1 - m*x1)
b = y1 - m*x1;