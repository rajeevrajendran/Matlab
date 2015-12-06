% Created by Rajeev Rajendran
% 3rd August 2015

function eldritch_horror (n) % n=number of players
rng('shuffle')
x=randperm(8,1); % select ancient one
y=randperm(24,3*n); % select players
z=randperm(14,1); % select prelude card
A={'Azathoth','Cthulhu','Ithaqua','Rise of the Elder Things',...
    'Shub-Niggurath','Syzygy','Yig','Yog-Sothoth'};
B={'Agnes Baker','Akachi Onyele','Charlie Kane','Daisy Walker','Diana Stanley',...
    'Finn Edwards','George Barnaby','Jacqueline Fine','Jim Culver',...
    'Leo Anderson','Lily Chen','Lola Hayes','Marie Lambeau','Mark Harrigan',...
    'Norman Withers','Patrice Hathaway','Silas Marsh','Skids OToole',...
    'Tommy Muldoon','Tony Morgan','Trish Scarborough','Ursula Downs',...
    'Wilson Richards','Zoey Samaras'};
C={'Beginning of the end','Blank','Blank with Antarctica',...
    'Blank with Special encounter deck',...
    'Blank with Antarctica and Special encounter deck','Dark blessings',...
    'Doomsayer from Antarctica','In Cosmic alignment','Key to salvation'...
    'Rumors from the North','The coming storm','The Dunwitch horror',...
    'Ultimate Sacrifice','Unwilling Sacrifice'};

for i=1:3*n
    Players(i)= B(y(i));
end
disp(' ')
disp(['Ancient One is ',char(A(x))]);
disp(' ')
disp(['Lead investigator is ',char(Players(1))]);
disp(' ')
disp('Other investigators are ')
disp(' ')
 for j=2:n
     disp(char(Players(j)));
 end
disp(' ')
disp('Backup investigators are ')
disp(' ')
 for k=n+1:3*n
     disp(char(Players(k)));
 end
 if x ~= 2
     disp(' ')
     disp(['Select prelude card ',char(C(z))]);
 elseif x ~= 3
     disp(' ')
     disp(['Select prelude card ',char(C(z))]);
 elseif x ~= 4
     disp(' ')
     disp(['Select prelude card ',char(C(z))]);
 elseif x ~= 5
     disp(' ')
     disp(['Select prelude card ',char(C(z))]);
 end

if x == 4 
    disp('Also setup Antarctica side board');
elseif x == 6
    disp('Also setup Mystic ruins encounter deck');
end
if z == 3
    disp('Also setup Antarctica side board');
elseif z == 5
    disp('Also setup Antarctica side board');
elseif z == 7
    disp('Also setup Antarctica side board');
end
if z == 4
    disp('Also setup Mystic ruins encounter deck');
elseif z == 5
    disp('Also setup Mystic ruins encounter deck');
elseif z == 8
    disp('Also setup Mystic ruins encounter deck');
end
% x
% z 
