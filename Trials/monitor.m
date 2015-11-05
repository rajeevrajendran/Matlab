function monitor(diag_inch,horz_resolution,vert_resolution,horz_ratio,vert_ratio)
hyp_cm=diag_inch*2.54;
h=horz_ratio;
v=vert_ratio;
unit=(((hyp_cm)^2)/(h^2+v^2))^0.5;
length=h*unit;
height=v*unit;
vdpi=vert_resolution/height;
hdpi=horz_resolution/length;
p=vert_resolution*horz_resolution;
X = ['Height ',num2str(height),', Width ',num2str(length),', DPI ',num2str(vdpi),' ',num2str(hdpi),', Pixels ',num2str(p)];
disp(X)

% disp (['Width is ' ]); disp (length);
% disp (['Height is ' ]); disp (height);
% disp (['DPI is ' ]); disp (dpi);
