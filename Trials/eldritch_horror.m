% Created by Rajeev Rajendran
% 3rd August 2015

function eldritch_horror (n) % n=number of players
rng('shuffle')
x=randperm(7,1);% select ancient one
% x=randperm(8,1); % select ancient one
y=randperm(20,3*n); % select players
% y=randperm(24,n); % select players
z=randperm(8,1); % select prelude card
% z=randperm(12,1); % select prelude card
A={'Azathoth','Cthulhu','Ithaqua','Rise of the Elder Things',...
    'Shub-Niggurath','Yig','Yog-Sothoth'};
% A={'Azathoth','Cthulhu','Ithaqua','Rise of the Elder Things',...
%     'Shub-Niggurath','Syzygy','Yig','Yog-Sothoth'};
B={'Agnes Baker','Akachi Onyele','Charlie Kane','Daisy Walker','Diana Stanley',...
    'Finn Edwards','George Barnaby','Jacqueline Fine','Jim Culver',...
    'Leo Anderson','Lily Chen','Lola Hayes','Mark Harrigan','Norman Withers',...
    'Patrice Hathaway','Silas Marsh','Tommy Muldoon','Trish Scarborough',...
    'Ursula Downs','Wilson Richards'};
% B={'Agnes Baker','Akachi Onyele','Charlie Kane','Daisy Walker','Diana Stanley',...
%     'Finn Edwards','George Barnaby','Jacqueline Fine','Jim Culver',...
%     'Leo Anderson','Lily Chen','Lola Hayes','Marie Lambeau','Mark Harrigan',...
%     'Norman Withers','Patrice Hathaway','Silas Marsh','Skids OToole',...
%     'Tommy Muldoon','Tony Morgan','Trish Scarborough','Ursula Downs',...
%     'Wilson Richards','ZoeySamaras'};
C={'Doomsayer from Antarctica','Unwilling Sacrifice','Beginning of the end',...
    'Ultimate Sacrifice','Rumors from the North','Key to salvation','Blank',...
    'Blank with Antarctica'};
% C={'Doomsayer from Antarctica','Unwilling Sacrifice','Beginning of the end',...
%     'Ultimate Sacrifice','Rumors from the North','Key to salvation'...
%     'The Dunwitch horror','Dark blessings','In Cosmic alignment','Blank',...
%     'The coming storm','Blank with Antarctica'};

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
disp(' ')
disp(['Select prelude card ',char(C(z))]);
