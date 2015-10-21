function monitor(diagonal_inch,vertical_resolution,horz_ratio,vert_ratio)
hyp_cm=diagonal_inch*2.54;
h=horz_ratio;
v=vert_ratio;
unit=(((hyp_cm)^2)/(h^2+v^2))^0.5;
length=h*unit;
height=v*unit;
vres=vertical_resolution/height;
hres=(vertical_resolution*h/v)/length;
length
height
hres
vres