function house(cost_1000eur,travel_time_mins,floor_area_m2,living_room_m2,...
    energy_label_capital_alphabet,house_type_AorH,) 
a=cost_1000eur;
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
if house_type_AorH == 'A'
    f=1;
else
    f=0.9;
end
rank = (4*a/300)*(2*b/32)*(c/94)*(d/27)*(e)*(f)