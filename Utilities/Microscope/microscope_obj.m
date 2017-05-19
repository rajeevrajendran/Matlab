function microscope_obj(na,mag,wd,n,lmd) % na = numerical aperture, mag = magnification
% wd = working distance, n - refractive index of immersion medium, lmd = wavelength
lc = 10000*((((na)^2)/mag)^2);% light collection
x = asind (na/n); % x = half angle cone of light 
res = lmd/(2*(n*(sind(x)))); % res = two point resolution

% Output
Light_collection_arb = lc
XY_resolution_nm = res
