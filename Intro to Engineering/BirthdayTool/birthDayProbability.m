function Pbirthday = birthDayProbability(Npeople, Nsamples)
 
%  Returns the probability that at least two people 
%  within a group (where the size of the group equals Npeople)
%  have the same birthday.
%
%  Uses Nsamples to estimate probability.


%%   Generate Matrix with "NSamples" Rows and "Npeople" columns

% Each row will be a specific sample or trial
bdays = randi(365,Nsamples,Npeople);

%% Determine the Number of Matches in all the Samples

% Initialize accumulation variable
NumMatches = 0;

% Determine matches
for iTrial = 1:Nsamples
    if vectorHasMatch(bdays(iTrial,:))
        NumMatches = NumMatches+1;
    end
end

%% Determine Probability 

% Divide matches by number of samples to determine probability
Pbirthday = NumMatches/Nsamples;
