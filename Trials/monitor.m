function monitor(diag_inch,horz_res,vert_res,horz_ratio,vert_ratio)
diag_cm=diag_inch*2.54;
h=horz_ratio;
v=vert_ratio;
unit_ratio=(((diag_cm)^2)/(h^2+v^2))^0.5;
length=(h*unit_ratio)/59.7727;
height=(v*unit_ratio)/33.6221;
vdpi=(vert_res/height)/(32.1217*33.6221);
hdpi=(horz_res/length)/(32.1217*59.7727);
p=(vert_res*horz_res)/2073600;
X = ['Height is ',num2str(height),' Width is ',num2str(length),' DPI is ',num2str(vdpi),' horz and ',num2str(hdpi),' vert, Pixels ',num2str(p)];
disp(X)
