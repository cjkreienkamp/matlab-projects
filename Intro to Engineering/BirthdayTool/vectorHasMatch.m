function hasMatch = vectorHasMatch(v)

% Returns true if vector v has at least one pair of identical elements


%% Find Matches within Vector

% Find length of vector
n = length(v);

% Sort vector by entries
sv = sort(v);

% Initialize condition/counter variabls
hasMatch = false;
k = 1;

% Check entries of vector
while (k<n) && (~hasMatch)
    if sv(k) == sv(k+1)
        hasMatch = true;
    else
        k=k+1;
    end
end