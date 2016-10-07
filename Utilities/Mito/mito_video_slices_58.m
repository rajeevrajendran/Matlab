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
axon_avg = zeros(256,512,214);
for i=1:214
   axon_avg(:,:,i)= axon_reg_filt_avg;
end
MIJ.createImage(single(axon_avg));

%
axon_mean_zcollapse = double(MIJ.getCurrentImage());

c1z1 = double(MIJ.getCurrentImage());
c1z2 = double(MIJ.getCurrentImage());
c1z3 = double(MIJ.getCurrentImage());

c1_avg = zeros(256,512,100);
for i=1:100
   c1_avg(:,:,i)= c1z1(:,:,i*2)+c1z2(:,:,i*2)+c1z3(:,:,i*2);
end
MIJ.createImage(single(c1_avg));
%
axon = zeros(256,512,100);
for i=1:100
   axon(:,:,i)= axon_mean_zcollapse;
end
MIJ.createImage(single(axon));