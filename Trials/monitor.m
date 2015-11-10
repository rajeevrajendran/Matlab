function monitor(diag_inch,horz_res,vert_res,horz_ratio,vert_ratio)
diag_cm=diag_inch*2.54;
h=horz_ratio;
v=vert_ratio;
unit_ratio=(((diag_cm)^2)/(h^2+v^2))^0.5;
length=h*unit_ratio;
height=v*unit_ratio;
vdpi=vert_res/height;
hdpi=horz_res/length;
p=vert_res*horz_res;
X = ['Height is ',num2str(height),' cm, Width is ',num2str(length),' cm, DPI is ',num2str(vdpi),' horz and  ',num2str(hdpi),' vert, Pixels ',num2str(p)];
disp(X)
