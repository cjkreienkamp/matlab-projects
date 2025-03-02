% Chris Kreienkamp
% Sun Mar 11 2018
clear
clc



%% SET PARAMETERS

stats = xlsread('2017 NCAA Stats');

team = {'Villanova','Mt St Mary''s','New Orleans','Wisconsin',...
    'Virginia Tech','Virginia','UNC Wilmington','Florida','ETSU',...
    'SMU','Providence','USC','Baylor','New Mexico St','South Carolina',...
    'Marquette','Duke','Troy',...
    'Gonzaga','South Dakota St','Northwestern','Vanderbilt','Notre Dame',...
    'Princeton','West Virginia','Bucknell',...
    'Maryland','Xavier','Florida St','FGCU','St Mary''s','VCU','Arizona',...
    'North Dakota',...
    'Kansas','NC Central','UC Davis','Miami','Michigan St','Iowa St',...
    'Nevada','Purdue','Vermont',...
    'Creighton','Rhode Island','Oregon','Iona','Michigan','Oklahoma St'...
    'Louisville','Jacksonville St',...
    'North Carolina','Texas Southern','Arkansas','Seton Hall','Minnesota'...
    'Middle Tennessee','Butler','Winthrop',...
    'Cincinnati','Kansas St','Wake Forest','UCLA','Kent St','Dayton',...
    'Wichita St','Kentucky','Northern Kentucky'};
team = team';

counter = 0;



%% ALGORITHM

for a = 1:0.5:3
    asm = stats(:,1)*a*10/mean(stats(:,1));           % Average Scoring Margin
    for b = 1:0.5:3
        toe = stats(:,2)*b*10/mean(stats(:,2));           % Team Offensive Efficiency
        for c = 1:0.5:3
            tfp = stats(:,3)*c*10/mean(stats(:,3));           % Team Floor Percentage
            for d = 1:0.5:3
                shm = stats(:,4)*d*10/mean(stats(:,4));           % Average Second Half Margin
                for e = 1:0.5:3
                    ppft = stats(:,5)*e*10/mean(stats(:,5));          % Percent of Points from Free Throws
                    for f = 1:0.5:3
                        pp3 = stats(:,6)*f*10/mean(stats(:,6));           % Percent of Points from 3-Pointers
                        for g = 1:0.5:3
                            sp = stats(:,7)*g*10/mean(stats(:,7));            % Shooting Percentage
                            for h = 1:0.5:3
                                p3p = stats(:,8)*h*10/mean(stats(:,8));           % 3-Point Percentage
                                for i = 1:0.5:3
                                    ftp = stats(:,9)*i*10/mean(stats(:,9));           % Free Throw Percentage
                                    for j = 1:0.5:3
                                        orpg = stats(:,10)*j*10/mean(stats(:,10));        % Offensive Rebounds Per Game
                                        for k = 1:0.5:3
                                            drpg = stats(:,11)*k*10/mean(stats(:,11));         % Defensive Rebounds Per Game
                                            for l = 1:0.5:3
                                                bpg = stats(:,12)*l*10/mean(stats(:,12));          % Blocks Per Game
                                                for m = 1:0.5:3
                                                    spg = stats(:,13)*m*10/mean(stats(:,13));         % Steals Per Game
                                                    for n = 1:0.5:3
                                                        atr = stats(:,14)*n*10/mean(stats(:,14));          % Assists to Turnover Ratio
                                                        for o = 1:0.5:3
                                                            tpp = stats(:,15)*o*10/mean(stats(:,15));         % Turnovers Per Possession
                                                            for p = 1:0.5:3
                                                                fpg = stats(:,16)*p*10/mean(stats(:,16));         % Fouls Per Game
                                                                for q = 1:0.5:3
                                                                    ofgp = stats(:,17)*q*10/mean(stats(:,17));        % Opponent Field Goal Percentage
                                                                    for r = 1:0.5:3
                                                                        wpcg = stats(:,18)*r*10/mean(stats(:,18));        % Win Percentage Close Games
                                                                        for s = 1:0.5:3
                                                                            xsc = stats(:,19)*s*10/mean(stats(:,19));         % Extra Scoring Chances Per Game
                                                                            for t = 1:0.5:3
                                                                                ospp = stats(:,20)*t*10/mean(stats(:,20));        % Opponent Steals Per PossessioN
                                              


%% ASSIGNING A TEAM TO A SCORE

score = zeros(68,1);
for z = 1:1:68
    score(z) = asm(z)+toe(z)+tfp(z)+shm(z)+ppft(z)+pp3(z)+sp(z)+p3p(z) +...
        ftp(z)+orpg(z)+drpg(z)+bpg(z)+spg(z)+atr(z)-tpp(z)-fpg(z)-...
        ofgp(z)+wpcg(z)+xsc(z)-ospp(z);
end



%% RESULTS

accuracy = 0;

% Upper East
upperEast = max(score(1:9));
for z = 1:9
    if score(z) == upperEast
        upperEast = z;
    end
end
%disp(team{upperEast});
if strcmp('Florida',team{upperEast})
    accuracy = accuracy + 1;
end

% Lower East
lowerEast = max(score(10:18));
for z = 10:18
    if score(z) == lowerEast
        lowerEast = z;
    end
end
%disp(team{lowerEast});
if strcmp('South Carolina',team{lowerEast})
    accuracy = accuracy + 1;
end

% Upper West
upperWest = max(score(19:26));
for z = 19:26
    if score(z) == upperWest
        upperWest = z;
    end
end
%disp(team{upperWest});
if strcmp('Gonzaga',team{upperWest})
    accuracy = accuracy + 1;
end

% Lower West
lowerWest = max(score(27:34));
for z = 27:34
    if score(z) == lowerWest
        lowerWest = z;
    end
end
%disp(team{lowerWest});
if strcmp('Xavier',team{lowerWest})
    accuracy = accuracy+1;
end

% Upper Midwest
upperMidwest = max(score(35:43));
for z = 35:43
    if score(z) == upperMidwest
        upperMidwest = z;
    end
end
%disp(team{upperMidwest});
if strcmp('Kansas',team{upperMidwest})
    accuracy = accuracy + 1;
end

% Lower Midwest
lowerMidwest = max(score(44:51));
for z = 44:51
    if score(z) == lowerMidwest
        lowerMidwest = z;
    end
end
%disp(team{lowerMidwest});
if strcmp('Oregon',team{lowerMidwest})
    accuracy = accuracy + 1;
end

% Upper South
upperSouth = max(score(52:59));
for z = 52:59
    if score(z) == upperSouth
        upperSouth = z;
    end
end
%disp(team{upperSouth});
if strcmp('North Carolina',team{upperSouth})
    accuracy = accuracy + 1;
end

% Lower South
lowerSouth = max(score(60:68));
for z = 60:68
    if score(z) == lowerSouth
        lowerSouth = z;
    end
end
%disp(team{lowerSouth});
if strcmp('Kentucky',team{lowerSouth})
    accuracy = accuracy + 1;
end

accuracy = accuracy*100/8;
if accuracy > 20
    disp(accuracy)
    disp([a,b,c,d])
    disp([e,f,g,h])
    disp([i,j,k,l])
    disp([m,n,o,p])
    disp([q,r,s,t])
end
%disp(['Accuracy = ',num2str(accuracy),'%'])
counter = counter+1;



%% END FOR LOOP
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end                                          
                                                    end
                                                end
                                            end
                                        end
                                        disp(counter)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
         

