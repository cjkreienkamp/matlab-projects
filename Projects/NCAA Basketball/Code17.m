% number of players with above 5 points per game     
% field goal percentage of top 5 ppg leaders (top5FG%)        
% turnovers per game by top 5 players (top5TPG)
% (FTM per game)
% (ORPG)

% (# top 50 player in the nation) * 50 - (sum of ranks) 

% players and coaches who can't perform against good teams (top 25 record)
% win streak
% team incidents (AKA Grayson Allen is a bitch)


%% TRY NEXT YEAR
%Shoot a high field goal percentage (+FG%)
%Do not commit turnovers (-TPG)
%Get to the foul line frequently (+FTM per game)
%Get offensive rebounds (+ORPG)
%Force the offense to take bad shots
%Average point differential??

%% SET PARAMETERS

clear
clc

num5PPG = zeros(1,64);
FGprctSum = zeros(1,64);
turnoverSum = zeros(1,64);
top25wins = zeros(1,64);
top25losses = zeros(1,64);
winStreak = zeros(1,64);
numRankedPlayers = zeros(1,64);
rankedPlayerSum = zeros(1,64);
teamIncident = zeros(1,64);
team = {' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',...
    ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',...
    ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',...
    ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '};


%% EXTRA STATS

freeThrowsMadePG = [15.1 0 12.2 16.4 9.8 14.1 17.3 17.4 14.2 0 13.6 17.9 16.1 14.4 17.1 0 ...
    16.5 0 13.4 14.6 13.5 10.4 16.4 14.1 15.6 16.1 16.1 13.7 10.6 14.9 17.1 15.8 ...
    14.9 0 13.5 12.4 12.1 17.4 15.3 13.2 11.5 15.0 14.4 14.8 13.0 18.9 14.6 13.4 ...
    15.6 0 17.9 14.3 16.8 12.1 15.0 16.1 13.2 15.1 13.0 15.3 16.6 17.5 18.4 14.5];

offRebPG = [8.6 0 12.3 7.3 8.8 12.0 11.6 10.1 12.1 0 12.9 12.9 12.5 8.8 10.5 0 ...
    9.4 0 10.8 8.2 9.3 8.3 14.3 8.6 10.8 12.2 11.8 11.2 9.6 10.7 10.3 8.6 ...
    12.0 0 11.1 9.5 9.3 11.1 9.8 9.4 8.2 12.0 10.4 9.6 7.6 13.7 13.3 10.3 ...
    15.8 0 11.4 13.1 11.3 9.9 8.8 9.8 12.3 9.5 9.8 15.0 8.6 11.9 12.6 11.1];


%% EAST CONFERENCE

team{1} = 'Villanova';
num5PPG(1) = 7;
FGprctSum(1) = 2.462;
turnoverSum(1) = 8.2;
top25wins(1) = 7;
top25losses(1) = 2;
winStreak(1) = 5;
numRankedPlayers(1) = 2;
rankedPlayerSum(1) = 40;
teamIncident(1) = 0;

team{2} = 'MS/NO';
num5PPG(2) = 0;
FGprctSum(2) = 0;
turnoverSum(2) = 0;
top25wins(2) = 0;
top25losses(2) = 0;
winStreak(2) = 0;
numRankedPlayers(2) = 0;
rankedPlayerSum(2) = 0;
teamIncident(2) = 0;

team{3} = 'Wisconsin';
num5PPG(3) = 6;
FGprctSum(3) = 2.337;
turnoverSum(3) = 7.7;
top25wins(3) = 3;
top25losses(3) = 3;
winStreak(3) = 0;
numRankedPlayers(3) = 1;
rankedPlayerSum(3) = 13;
teamIncident(3) = 0;

team{4} = 'Virginia Tech';
num5PPG(4) = 7;
FGprctSum(4) = 2.529;
turnoverSum(4) = 10.3;
top25wins(4) = 3;
top25losses(4) = 6;
winStreak(4) = 0;
numRankedPlayers(4) = 1;
rankedPlayerSum(4) = 39;
teamIncident(4) = 0;

team{5} = 'UVA';
num5PPG(5) = 7;
FGprctSum(5) = 2.294;
turnoverSum(5) = 4.4;
top25wins(5) = 4;
top25losses(5) = 6;
winStreak(5) = 0;
numRankedPlayers(5) = 1;
rankedPlayerSum(5) = 41;
teamIncident(5) = 0;

team{6} = 'UNC Wilmington';
num5PPG(6) = 6;
FGprctSum(6) = 2.594;
turnoverSum(6) = 7.3;
top25wins(6) = 0;
top25losses(6) = 0;
winStreak(6) = 7;
numRankedPlayers(6) = 1;
rankedPlayerSum(6) = 48;
teamIncident(6) = 0;

team{7} = 'Florida';
num5PPG(7) = 8;
FGprctSum(7) = 2.248;
turnoverSum(7) = 8.2;
top25wins(7) = 1;
top25losses(7) = 4;
winStreak(7) = 0;
numRankedPlayers(7) = 1;
rankedPlayerSum(7) = 37;
teamIncident(7) = -15;

team{8} = 'ETSU';
num5PPG(8) = 7;
FGprctSum(8) = 2.583;
turnoverSum(8) = 9.7;
top25wins(8) = 0;
top25losses(8) = 0;
winStreak(8) = 3;
numRankedPlayers(8) = 0;
rankedPlayerSum(8) = 0;
teamIncident(8) = 0;

team{9} = 'SMU';
num5PPG(9) = 5;
FGprctSum(9) = 2.477;
turnoverSum(9) = 7.9;
top25wins(9) = 2;
top25losses(9) = 1;
winStreak(9) = 16;
numRankedPlayers(9) = 1;
rankedPlayerSum(9) = 18;
teamIncident(9) = 0;

team{10} = 'PR/SC';
num5PPG(10) = 0;
FGprctSum(10) = 0;
turnoverSum(10) = 0;
top25wins(10) = 0;
top25losses(10) = 0;
winStreak(10) = 0;
numRankedPlayers(10) = 0;
rankedPlayerSum(10) = 0;
teamIncident(10) = 0;

team{11} = 'Baylor';
num5PPG(11) = 6;
FGprctSum(11) = 2.455;
turnoverSum(11) = 8.9;
top25wins(11) = 5;
top25losses(11) = 3;
winStreak(11) = 0;
numRankedPlayers(11) = 1;
rankedPlayerSum(11) = 7;
teamIncident(11) = 0;

team{12} = 'New Mexico St';
num5PPG(12) = 8;
FGprctSum(12) = 2.439;
turnoverSum(12) = 9.6;
top25wins(12) = 0;
top25losses(12) = 0;
winStreak(12) = 5;
numRankedPlayers(12) = 0;
rankedPlayerSum(12) = 0;
teamIncident(12) = 0;

team{13} = 'South Carolina';
num5PPG(13) = 6;
FGprctSum(13) = 2.256;
turnoverSum(13) = 9.2;
top25wins(13) = 3;
top25losses(13) = 2;
winStreak(13) = 0;
numRankedPlayers(13) = 1;
rankedPlayerSum(13) = 19;
teamIncident(13) = 0;

team{14} = 'Marquette';
num5PPG(14) = 7;
FGprctSum(14) = 2.495;
turnoverSum(14) = 8.1;
top25wins(14) = 2;
top25losses(14) = 4;
winStreak(14) = 0;
numRankedPlayers(14) = 0;
rankedPlayerSum(14) = 0;
teamIncident(14) = 0;

team{15}= 'Duke';
num5PPG(15) = 6;
FGprctSum(15) = 2.435;
turnoverSum(15) = 9;
top25wins(15) = 9;
top25losses(15) = 4;
winStreak(15) = 4;
numRankedPlayers(15) = 3;
rankedPlayerSum(15) = 66;
teamIncident(15) = -10;

team{16} = 'Troy';
num5PPG(16) = 0;
FGprctSum(16) = 0;
turnoverSum(16) = 0;
top25wins(16) = 0;
top25losses(16) = 0;
winStreak(16) = 0;
numRankedPlayers(16) = 0;
rankedPlayerSum(16) = 0;
teamIncident(16) = 0;


%% WEST CONFERENCE

team{17} = 'Gonzaga';
num5PPG(17) = 7;
FGprctSum(17) = 2.791;
turnoverSum(17) = 7.3;
top25wins(17) = 5;
top25losses(17) = 0;
winStreak(17) = 3;
numRankedPlayers(17) = 1;
rankedPlayerSum(17) = 8;
teamIncident(17) = 0;

team{18} = 'South Dakota St';
num5PPG(18) = 0;
FGprctSum(18) = 0;
turnoverSum(18) = 0;
top25wins(18) = 0;
top25losses(18) = 0;
winStreak(18) = 0;
numRankedPlayers(18) = 0;
rankedPlayerSum(18) = 0;
teamIncident(18) = 0;

team{19} = 'Northwestern';
num5PPG(19) = 7;
FGprctSum(19) = 2.178;
turnoverSum(19) = 7.6;
top25wins(19) = 3;
top25losses(19) = 3;
winStreak(19) = 0;
numRankedPlayers(19) = 0;
rankedPlayerSum(19) = 0;
teamIncident(19) = 0;

team{20} = 'Vanderbilt';
num5PPG(20) = 7;
FGprctSum(20) = 2.221;
turnoverSum(20) = 7.8;
top25wins(20) = 4;
top25losses(20) = 2;
winStreak(20) = 0;
numRankedPlayers(20) = 0;
rankedPlayerSum(20) = 0;
teamIncident(20) = 0;

team{21} = 'Notre Dame';
num5PPG(21) = 4;
FGprctSum(21) = 2.286;
turnoverSum(21) = 7.1;
top25wins(21) = 4;
top25losses(21) = 8;
winStreak(21) = 0;
numRankedPlayers(21) = 1;
rankedPlayerSum(21) = 14;
teamIncident(21) = 0;

team{22} = 'Princeton';
num5PPG(22) = 7;
FGprctSum(22) = 2.329;
turnoverSum(22) = 7.5;
top25wins(22) = 0;
top25losses(22) = 0;
winStreak(22) = 19;
numRankedPlayers(22) = 0;
rankedPlayerSum(22) = 0;
teamIncident(22) = 0;

team{23} = 'West Virginia';
num5PPG(23) = 7;
FGprctSum(23) = 2.213;
turnoverSum(23) = 7.9;
top25wins(23) = 3;
top25losses(23) = 3;
winStreak(23) = 0;
numRankedPlayers(23) = 0;
rankedPlayerSum(23) = 0;
teamIncident(23) = 0;

team{24} = 'Bucknell';
num5PPG(24) = 5;
FGprctSum(24) = 2.536;
turnoverSum(24) = 9.5;
top25wins(24) = 0;
top25losses(24) = 0;
winStreak(24) = 6;
numRankedPlayers(24) = 0;
rankedPlayerSum(24) = 0;
teamIncident(24) = 0;

team{25} = 'Maryland';
num5PPG(25) = 7;
FGprctSum(25) = 2.394;
turnoverSum(25) = 9.2;
top25wins(25) = 0;
top25losses(25) = 2;
winStreak(25) = 0;
numRankedPlayers(25) = 1;
rankedPlayerSum(25) = 23;
teamIncident(25) = 0;

team{26} = 'Xavier';
num5PPG(26) = 8;
FGprctSum(26) = 2.334;
turnoverSum(26) = 9.7;
top25wins(26) = 2;
top25losses(26) = 7;
winStreak(26) = 0;
numRankedPlayers(26) = 1;
rankedPlayerSum(26) = 35;
teamIncident(26) = 0;

team{27} = 'FSU';
num5PPG(27) = 7;
FGprctSum(27) = 2.403;
turnoverSum(27) = 6.8;
top25wins(27) = 7;
top25losses(27) = 3;
winStreak(27) = 0;
numRankedPlayers(27) = 2;
rankedPlayerSum(27) = 77;
teamIncident(27) = 0;

team{28} = 'FGCU';
num5PPG(28) = 7;
FGprctSum(28) = 2.634;
turnoverSum(28) = 8.3;
top25wins(28) = 0;
top25losses(28) = 1;
winStreak(28) = 7;
numRankedPlayers(28) = 0;
rankedPlayerSum(28) = 0;
teamIncident(28) = 0;

team{29} = 'Saint Mary''s';
num5PPG(29) = 8.3;
FGprctSum(29) = 2.585;
turnoverSum(29) = 8.3;
top25wins(29) = 0;
top25losses(29) = 2;
winStreak(29) = 0;
numRankedPlayers(29) = 1;
rankedPlayerSum(29) = 22;
teamIncident(29) = 0;

team{30} = 'VCU';
num5PPG(30) = 7;
FGprctSum(30) = 2.434;
turnoverSum(30) = 8.5;
top25wins(30) = 0;
top25losses(30) = 1;
winStreak(30) = 0;
numRankedPlayers(30) = 0;
rankedPlayerSum(30) = 0;
teamIncident(30) = 0;

team{31} = 'Arizona';
num5PPG(31) = 8;
FGprctSum(31) = 2.411;
turnoverSum(31) = 7.8;
top25wins(31) = 4;
top25losses(31) = 3;
winStreak(31) = 4;
numRankedPlayers(31) = 1;
rankedPlayerSum(31) = 26;
teamIncident(31) = 0;

team{32} = 'North Dakota';
num5PPG(32) = 7;
FGprctSum(32) = 2.422;
turnoverSum(32) = 8.9;
top25wins(32) = 0;
top25losses(32) = 0;
winStreak(32) = 4;
numRankedPlayers(32) = 0;
rankedPlayerSum(32) = 0;
teamIncident(32) = 0;


%% MIDWEST CONFERENCE

team{33} = 'Kansas';
num5PPG(33) = 6;
FGprctSum(33) = 2.496;
turnoverSum(33) = 10.1;
top25wins(33) = 5;
top25losses(33) = 2;
winStreak(33) = 0;
numRankedPlayers(33) = 3;
rankedPlayerSum(33) = 64;
teamIncident(33) = 0;

team{34} = 'NC/UD';
num5PPG(34) = 0;
FGprctSum(34) = 0;
turnoverSum(34) = 0;
top25wins(34) = 0;
top25losses(34) = 0;
winStreak(34) = 0;
numRankedPlayers(34) = 0;
rankedPlayerSum(34) = 0;
teamIncident(34) = 0;

team{35} = 'Miami';
num5PPG(35) = 7;
FGprctSum(35) = 2.290;
turnoverSum(35) = 10.4;
top25wins(35) = 3;
top25losses(35) = 6;
winStreak(35) = 0;
numRankedPlayers(35) = 0;
rankedPlayerSum(35) = 0;
teamIncident(35) = 0;

team{36} = 'Michigan St';
num5PPG(36) = 7;
FGprctSum(36) = 2.418;
turnoverSum(36) = 9.3;
top25wins(36) = 2;
top25losses(36) = 6;
winStreak(36) = 0;
numRankedPlayers(36) = 1;
rankedPlayerSum(36) = 29;
teamIncident(36) = 0;

team{37} = 'Iowa State';
num5PPG(37) = 6;
FGprctSum(37) = 2.293;
turnoverSum(37) = 6.8;
top25wins(37) = 3;
top25losses(37) = 5;
winStreak(37) = 3;
numRankedPlayers(37) = 1;
rankedPlayerSum(37) = 16;
teamIncident(37) = 0;

team{38} = 'Nevada';
num5PPG(38) = 6;
FGprctSum(38) = 2.428;
turnoverSum(38) = 9.1;
top25wins(38) = 0;
top25losses(38) = 1;
winStreak(38) = 9;
numRankedPlayers(38) = 1;
rankedPlayerSum(38) = 42;
teamIncident(38) = 0;

team{39} = 'Purdue';
num5PPG(39) = 7;
FGprctSum(39) = 2.461;
turnoverSum(39) = 10.7;
top25wins(39) = 4;
top25losses(39) = 2;
winStreak(39) = 0;
numRankedPlayers(39) = 1;
rankedPlayerSum(39) = 4;
teamIncident(39) = 0;

team{40} = 'Vermont';
num5PPG(40) = 7;
FGprctSum(40) = 2.327;
turnoverSum(40) = 6.7;
top25wins(40) = 0;
top25losses(40) = 2;
winStreak(40) = 21;
numRankedPlayers(40) = 0;
rankedPlayerSum(40) = 0;
teamIncident(40) = 0;

team{41} = 'Creighton';
num5PPG(41) = 7;
FGprctSum(41) = 2.631;
turnoverSum(41) = 10.3;
top25wins(41) = 4;
top25losses(41) = 3;
winStreak(41) = 0;
numRankedPlayers(41) = 1;
rankedPlayerSum(41) = 27;
teamIncident(41) = -20;

team{42} = 'URI';
num5PPG(42) = 6;
FGprctSum(42) = 2.321;
turnoverSum(42) = 8.2;
top25wins(42) = 1;
top25losses(42) = 1;
winStreak(42) = 8;
numRankedPlayers(42) = 1;
rankedPlayerSum(42) = 46;
teamIncident(42) = 0;

team{43} = 'Oregon';
num5PPG(43) = 6;
FGprctSum(43) = 2.537;
turnoverSum(43) = 8.2;
top25wins(43) = 3;
top25losses(43) = 2;
winStreak(43) = 0;
numRankedPlayers(43) = 1;
rankedPlayerSum(43) = 9;
teamIncident(43) = -20;

team{44} = 'Iona';
num5PPG(44) = 7;
FGprctSum(44) = 2.313;
turnoverSum(44) = 8.4;
top25wins(44) = 0;
top25losses(44) = 0;
winStreak(44) = 3;
numRankedPlayers(44) = 0;
rankedPlayerSum(44) = 0;
teamIncident(44) = 0;

team{45} = 'Michigan';
num5PPG(45) = 6;
FGprctSum(45) = 2.452;
turnoverSum(45) = 7.2;
top25wins(45) = 4;
top25losses(45) = 2;
winStreak(45) = 5;
numRankedPlayers(45) = 1;
rankedPlayerSum(45) = 40;
teamIncident(45) = 0;

team{46} = 'Oklahoma St';
num5PPG(46) = 8;
FGprctSum(46) = 2.324;
turnoverSum(46) = 7.6;
top25wins(46) = 1;
top25losses(46) = 8;
winStreak(46) = 0;
numRankedPlayers(46) = 1;
rankedPlayerSum(46) = 12;
teamIncident(46) = 0;

team{47} = 'Louisville';
num5PPG(47) = 8;
FGprctSum(47) = 2.323;
turnoverSum(47) = 7.1;
top25wins(47) = 5;
top25losses(47) = 7;
winStreak(47) = 0;
numRankedPlayers(47) = 1;
rankedPlayerSum(47) = 24;
teamIncident(47) = 0;

team{48} = 'Jacksonville St';
num5PPG(48) = 6;
FGprctSum(48) = 2.401;
turnoverSum(48) = 9.7;
top25wins(48) = 0;
top25losses(48) = 0;
winStreak(48) = 4;
numRankedPlayers(48) = 0;
rankedPlayerSum(48) = 0;
teamIncident(48) = 0;


%% SOUTH CONFERENCE

team{49} = 'UNC';
num5PPG(49) = 7;
FGprctSum(49) = 2.614;
turnoverSum(49) = 7;
top25wins(49) = 6;
top25losses(49) = 5;
winStreak(49) = 0;
numRankedPlayers(49) = 2;
rankedPlayerSum(49) = 22;
teamIncident(49) = 0;

team{50} = 'Texas Southern';
num5PPG(50) = 0;
FGprctSum(50) = 0;
turnoverSum(50) = 0;
top25wins(50) = 0;
top25losses(50) = 0;
winStreak(50) = 0;
numRankedPlayers(50) = 0;
rankedPlayerSum(50) = 0;
teamIncident(50) = 0;

team{51} = 'Arkansas';
num5PPG(51) = 7;
FGprctSum(51) = 2.201;
turnoverSum(51) = 8.3;
top25wins(51) = 1;
top25losses(51) = 4;
winStreak(51) = 0;
numRankedPlayers(51) = 0;
rankedPlayerSum(51) = 0;
teamIncident(51) = 0;

team{52} = 'Seton Hall';
num5PPG(52) = 5;
FGprctSum(52) = 2.214;
turnoverSum(52) = 10.1;
top25wins(52) = 3;
top25losses(52) = 5;
winStreak(52) = 0;
numRankedPlayers(52) = 1;
rankedPlayerSum(52) = 30;
teamIncident(52) = 0;

team{53} = 'Minnesota';
num5PPG(53) = 7;
FGprctSum(53) = 2.158;
turnoverSum(53) = 7.9;
top25wins(53) = 2;
top25losses(53) = 3;
winStreak(53) = 0;
numRankedPlayers(53) = 1;
rankedPlayerSum(53) = 47;
teamIncident(53) = 0;

team{54} = 'Middle Tennessee';
num5PPG(54) = 5;
FGprctSum(54) = 2.490;
turnoverSum(54) = 6.7;
top25wins(54) = 0;
top25losses(54) = 0;
winStreak(54) = 10;
numRankedPlayers(54) = 0;
rankedPlayerSum(54) = 0;
teamIncident(54) = 0;

team{55} = 'Butler';
num5PPG(55) = 8;
FGprctSum(55) = 2.250;
turnoverSum(55) = 6.4;
top25wins(55) = 6;
top25losses(55) = 2;
winStreak(55) = 0;
numRankedPlayers(55) = 1;
rankedPlayerSum(55) = 32;
teamIncident(55) = 0;

team{56} = 'Winthrop';
num5PPG(56) = 7;
FGprctSum(56) = 2.225;
turnoverSum(56) = 8.5;
top25wins(56) = 0;
top25losses(56) = 0;
winStreak(56) = 8;
numRankedPlayers(56) = 1;
rankedPlayerSum(56) = 25;
teamIncident(56) = 0;

team{57} = 'Cincinnati';
num5PPG(57) = 6;
FGprctSum(57) = 2.378;
turnoverSum(57) = 6;
top25wins(57) = 2;
top25losses(57) = 4;
winStreak(57) = 0;
numRankedPlayers(57) = 1;
rankedPlayerSum(57) = 36;
teamIncident(57) = 0;

team{58} = 'Kansas St';
num5PPG(58) = 6;
FGprctSum(58) = 2.348;
turnoverSum(58) = 9.6;
top25wins(58) = 4;
top25losses(58) = 5;
winStreak(58) = 1;
numRankedPlayers(58) = 0;
rankedPlayerSum(58) = 0;
teamIncident(58) = 0;

team{59} = 'UCLA';
num5PPG(59) = 6;
FGprctSum(59) = 2.548;
turnoverSum(59) = 9.6;
top25wins(59) = 3;
top25losses(59) = 3;
winStreak(59) = 0;
numRankedPlayers(59) = 2;
rankedPlayerSum(59) = 45;
teamIncident(59) = 0;

team{60} = 'Kent State';
num5PPG(60) = 6;
FGprctSum(60) = 2.090;
turnoverSum(60) = 9.2;
top25wins(60) = 0;
top25losses(60) = 0;
winStreak(60) = 4;
numRankedPlayers(60) = 0;
rankedPlayerSum(60) = 0;
teamIncident(60) = 0;

team{61} = 'Dayton';
num5PPG(61) = 8;
FGprctSum(61) = 2.524;
turnoverSum(61) = 8.1;
top25wins(61) = 0;
top25losses(61) = 1;
winStreak(61) = 0;
numRankedPlayers(61) = 1;
rankedPlayerSum(61) = 31;
teamIncident(61) = 0;

team{62} = 'Wichita State';
num5PPG(62) = 9;
FGprctSum(62) = 2.475;
turnoverSum(62) = 5.7;
top25wins(62) = 0;
top25losses(62) = 2;
winStreak(62) = 15;
numRankedPlayers(62) = 1;
rankedPlayerSum(62) = 33;
teamIncident(62) = 0;

team{63} = 'Kentucky';
num5PPG(63) = 7;
FGprctSum(63) = 2.510;
turnoverSum(63) = 9.6;
top25wins(63) = 4;
top25losses(63) = 4;
winStreak(63) = 11;
numRankedPlayers(63) = 2;
rankedPlayerSum(63) = 38;
teamIncident(63) = 0;

team{64} = 'Northern Kentucky';
num5PPG(64) = 5;
FGprctSum(64) = 2.355;
turnoverSum(64) = 8.7;
top25wins(64) = 0;
top25losses(64) = 1;
winStreak(64) = 6;
numRankedPlayers(64) = 0;
rankedPlayerSum(64) = 0;
teamIncident(64) = 0;


%% CALCULATIONS

for icount = 1:1:64
    top5Score(icount) = num5PPG(icount)/4 ...
        * (FGprctSum(icount)^5) ...
        - turnoverSum(icount)^2;
    rankScore(icount) = (numRankedPlayers(icount) * 50 ...
        - rankedPlayerSum(icount)) * .5 * winStreak(icount);
    recordScore(icount) = top25wins(icount)*8 ...
        - top25losses(icount)*6 ...
        + winStreak(icount)*6 ...
        + teamIncident(icount);
    freeThrowsMadePGScore(icount) = freeThrowsMadePG(icount) - 8.8;
    offRebPGScore(icount) = offRebPG(icount) - 6.3;
    gritScore(icount) = 6*sqrt(freeThrowsMadePGScore(icount)^3 + offRebPGScore(icount)^3) ;
    teamScore(icount) = top5Score(icount) + rankScore(icount) + recordScore(icount) + gritScore(icount);
    %disp([team(icount),num2str(teamScore(icount))])
end


%% RESULTS

a = input('Team 1: ','s');
b = input('Team 2: ','s');

for iString= 1:1:64
    if strcmp(team(iString),a)
        a = iString;
    end
    if strcmp(team(iString),b)
        b = iString;
    end
end

    if teamScore(a) > teamScore(b)
        disp([team(a),'wins'])
        disp([team(b),'loses'])
    elseif teamScore(a) < teamScore(b)
        disp([team(a),'loses'])
        disp([team(b),'wins'])
    else
        disp('Evenly Matched')
    end