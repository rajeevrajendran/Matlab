% Created by Rajeev Rajendran
% 3rd August 2015

function eldritch_horror (n)
x=randperm(7,1);
y=randperm(20,n);
z=randperm(6,1);
A={'Azathoth','Cthulhu','Ithaqua','Rise of the Elder Things',...
    'Shub-Niggurath','Yig','Yog-Sothoth'};
B={'Agnes Baker','Akachi Onyele','Charlie Kane','Daisy Walker','Diana Stanley',...
    'Finn Edwards','George Barnaby','Jacqueline Fine','Jim Culver',...
    'Leo Anderson','Lily Chen','Lola Hayes','Mark Harrigan','Norman Withers',...
    'Patrice Hathaway','Silas Marsh','Tommy Muldoon','Trish Scarborough',...
    'Ursula Downs','Wilson Richards'};
C={'Doomsayer from Antarctica','Unwilling Sacrifice','Beginning of the end',...
    'Ultimate Sacrifice','Rumors from the North','Key to salvation'};
 for i=1:n
    Players(i)= B(y(i));
 end
P=Players(2:n);
 disp(['Ancient One is ',char(A(x))]);
 disp(['Lead investigator is ',char(Players(1))]);
 disp(['Other investigators are ',P]);
 disp(['Select prelude card ',char(C(z))]);
