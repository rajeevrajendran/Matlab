function house(cost_1000eur,year,travel_time_mins,floor_area_m2,living_room_m2,...
    energy_label_capital_alphabet,house_type_AorHorM,bedroom1_area,bedroom2_area,...
    stove_GorI,balcony_area,ownership_ForP,stories,levels,garage_0or1,service) 
a=cost_1000eur;
q=year;
b=travel_time_mins;
c=floor_area_m2;
d=living_room_m2;
if energy_label_capital_alphabet == 'A'
    e=1;
elseif energy_label_capital_alphabet == 'B'
    e=0.95;
elseif energy_label_capital_alphabet == 'C'
    e=0.85;
end
if house_type_AorHorM == 'A'% apartment
    f=1;
else
    f=0.9;
end
g=bedroom1_area;
h=bedroom2_area;
if stove_GorI == 'G'
    r=1;
else
    r=0.95;
end
m=balcony_area;
n=ownership_ForP;
if ownership_ForP == 'F'
    k=1;
else
    k=0.9;
end
if house_type_AorHorM == 'M'
    if levels == 3
    elseif levels == 4
        l=0.95;
    end
    else
        l=1;
end
if stories > 5
    x=1.05;
else
    x=1;
end
o=garage_0or1;
p=service;
rank = (5*300/a)+(1+(q/20000))+(32/b)+(1+(c/940))+(d/27)+(e)+(f)+(1+(g/170))+(1+(h/125))+(r)...
    +(1+(m/250))+(n)+(k)+(l)+(x)+((100+o)/100)+(1+(94/(p*5)))

%house(389,2003,15,130,50,'B','A',15.74,14.63,'G',6.3,'P',7,1,1,161)
%house(369,2008,19,111,32.8,'A','A',14.03,11.32,'G',13.65,'F',2,1,1,180)
%house(325,2001,23,150,30.62,'A','A',27.73,14.06,'I',10.8,'F',8,8,1,232.66)