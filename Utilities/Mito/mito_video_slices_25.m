% Rajeev 2016-05-02

% open imagej
Miji
IJ = ij.IJ;

% Import raw images from xyt stack
axon_raw = double(MIJ.getCurrentImage());
mito_raw = double(MIJ.getCurrentImage());

% import after moco registration
axon_reg = double(MIJ.getCurrentImage());
axon_reg_filt = double(MIJ.getCurrentImage());
axon_reg_avg = double(MIJ.getCurrentImage());
axon_reg_filt_avg = double(MIJ.getCurrentImage());
mito_reg = double(MIJ.getCurrentImage());
mito_reg_filt = double(MIJ.getCurrentImage());

% make avg axon all frames
axon_avg = zeros(256,512,66);
for i=1:66
   axon_avg(:,:,i)= axon_reg_filt_avg;
end
MIJ.createImage(single(axon_avg));
MIJ.createImage(single(axon_reg_filt_avg));

vmin = min(min(min(mito_reg)));
mito_reg2 = mito_reg - vmin;
MIJ.createImage(single(mito_reg2));
