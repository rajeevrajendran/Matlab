% Created by Rajeev Rajendran
% 3rd August 2015
% Modified 22 May 2016

function baby_name (x,y) % x=number of consonants, y=number of vowels
A=81;
E=127;
I=70;
O=75;
U=28;
Y=20;

B=15;
C=28;
D=42;
F=22;
G=20;
H=60;
J=1;
K=8;
L=40;
M=24;
N=67;
P=19;
Q=1;
R=60;
S=63;
T=90;
V=10;
W=23;
X=1;
Z=1;

VOWE={};
CONS={};
i=0;
for i=1:B
CONS{1,i}='B';
end
for i=i+1:i+C
CONS{1,i}='C';
end
for i=i+1:i+D
CONS{1,i}='D';
end
for i=i+1:i+F
CONS{1,i}='F';
end
for i=i+1:i+G
CONS{1,i}='G';
end
for i=i+1:i+H
CONS{1,i}='H';
end
for i=i+J
CONS{1,i}='J';
end
for i=i+1:i+K
CONS{1,i}='K';
end
for i=i+1:i+L
CONS{1,i}='L';
end
for i=i+1:i+M
CONS{1,i}='M';
end
for i=i+1:i+N
CONS{1,i}='N';
end
for i=i+1:i+P
CONS{1,i}='P';
end
for i=i+Q
CONS{1,i}='Q';
end
for i=i+1:i+R
CONS{1,i}='R';
end
for i=i+1:i+S
CONS{1,i}='S';
end
for i=i+1:i+T
CONS{1,i}='T';
end
for i=i+1:i+V
CONS{1,i}='V';
end
for i=i+1:i+W
CONS{1,i}='W';
end
for i=i+X
CONS{1,i}='X';
end
for i=i+Z
CONS{1,i}='Z';
end
xx=i;
for i=1:A
VOWE{1,i}='A';
end
for i=i+1:i+E
VOWE{1,i}='E';
end
for i=i+1:i+I
VOWE{1,i}='I';
end
for i=i+1:i+O
VOWE{1,i}='O';
end
for i=i+1:i+U
VOWE{1,i}='U';
end
for i=i+1:i+Y
VOWE{1,i}='Y';
end
yy=i;

for j=1:10
rng('shuffle')
cons=randperm(xx,x); % select consonant

rng('shuffle')
vowe=randperm(yy,y); % select vowels

for i=1:x
    name(i)= CONS(cons(i));
end
for i=1:y
    name(x+i)= VOWE(vowe(i));
end

rng('shuffle')
order=randperm(x+y);

for i=1:x+y
    NAME(i)= name(order(i));
end

disp(' ')
disp(['Baby name can be ',(NAME)]);
j=j+1;
end
