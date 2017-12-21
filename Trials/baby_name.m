% Created by Rajeev Rajendran
% 3rd August 2015
% Modified 22 May 2016

function baby_name (x,y) % n=number of letters
for j=1:10
rng('shuffle')
cons=randperm(22,x); % select consonant

rng('shuffle')
vowe=randperm(8,y); % select vowels


CONS={'B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T',...
    'V','W','X','Z','S','T'};

VOWE={'A','E','I','O','U','Y','E','A'};

for i=1:x
    name(i)= CONS(cons(i));
end
for i=1:y
    name(x+i)= VOWE(vowe(i));
end

rng('shuffle')
order=randperm(x+y); % select prelude card

for i=1:x+y
    NAME(i)= name(order(i));
end

disp(' ')
disp(['Baby name can be ',(NAME)]);
j=j+1;
end
