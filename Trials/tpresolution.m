function tpresolution(exc_wavelength,NA)
w=exc_wavelength;
lat_res = (0.51*w)/(1000*NA); % microns
z_res = (0.88*w)/((1000)*(1-(1-(NA)^2)^0.5)); % microns
xymin = lat_res*10; % PSF_xy_min
xymax = lat_res*2.5; % PSF_xy_max
zmin = z_res*10; % PSF_z_min
zmax = z_res*2.5; % PSF_z_max
disp('Lateral resolution (um)) = '), lat_res
disp('Axial resolution (um) = '), z_res
disp('PSF range lateral (um) = '),xymin,xymax
disp('PSF range axial (um) = '),zmin,zmax