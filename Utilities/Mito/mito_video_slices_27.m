% Rajeev 2016-05-02

% open imagej
Miji
IJ = ij.IJ;

% Import raw images from xyt stack
axon_raw = double(MIJ.getCurrentImage());
mito_raw = double(MIJ.getCurrentImage());

% import after moco registration
axon_reg = double(MIJ.getCurrentImage());
mito_reg = double(MIJ.getCurrentImage());
axon_reg_avg = double(MIJ.getCurrentImage());

% make frame averages
axon_avg = zeros(256,512,213);
for i=1:213
   axon_avg(:,:,i)= axon_reg_avg;
end

mito_avg = zeros(256,512,213);
for i=2:214
   mito_avg(:,:,i-1)= (mito_reg(:,:,i-1)+mito_reg(:,:,i))/2;
end

% frame doubling

mito_avg2=zeros(256,512,426);
axon_avg2=zeros(256,512,426);

for i=1:213
    mito_avg2(:,:,2*i-1)= mito_avg(:,:,i);
    mito_avg2(:,:,2*i)= mito_avg(:,:,i);
    axon_avg2(:,:,2*i-1)= axon_avg(:,:,i);
    axon_avg2(:,:,2*i)= axon_avg(:,:,i);
end

MIJ.createImage(single(axon_avg2));
MIJ.createImage(single(mito_avg2));

