function iNext = findNextAlive(alive,ipoint,k)
% alive is an array of 1's for people alive and 0's for people dead
% ipoint is the position where the last person in the chain is killed
% k is the number of people skipped

n = length(alive);
found = false;
nAlive = 0;
itry = ipoint;
k = k+1;

while ~found
    itry = itry + 1;
    if itry > n
        itry = itry - n;
    end
    if alive(itry) == 1
        nAlive = nAlive + 1;
        if nAlive == k
            found = true;
            iNext = itry;
        end
    end
end