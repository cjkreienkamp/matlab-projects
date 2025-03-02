function hasMatch = vectorHasMatch(v)

% Chris Kreienkamp
% Section 10
% 2/21/17
%
%"hasMatch" is the output variable
% VECTORHASMATCH is the function and file name
% "v" is the input variable
%
% Analyze an input vector "v"
% If the vector has at least one matching pair of
% values, program will return a "1" for true

% We don't need to define "v" within the function itself

% Find the vector length
n = length(v);

% Sort the vector
sv = sort(v);

% Check the entries with a WHILE loop and IF statement
% WHILE will check all entries in the vector
% IF will be used to determine if neighboring entries match

k = 1; % Counter variable
hasMatch = false; % Output variable; initialized as false

% The loop continues as long as we haven't found a match yet
while (k < n) && (hasMatch == 0)
    
    % Checking the "k" entry against the "k+1" entry
    if sv (k) == sv(k+1)
        % True Condition
        % Changes the output variable to true
        hasMatch = true;
        
    else
        % False Condition
        % Increment the counter variable
        k = k+1;
        
    end
end