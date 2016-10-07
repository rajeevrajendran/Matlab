% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% import raw files
axon = double(MIJ.getCurrentImage());
mito = double(MIJ.getCurrentImage());

% frame average
axon_avg = zeros(128,256,235);

for i=1:235
    axon_avg(:,:,i)= (axon(:,:,i)+axon(:,:,i+1)+axon(:,:,i+2)+axon(:,:,i+3))/4;
end

mito_avg = zeros(128,256,235);

for i=1:235
    mito_avg(:,:,i)= (mito(:,:,i)+mito(:,:,i+1))/2;
end

% frame doubling

mito_avg2=zeros(128,256,470);
axon_avg2=zeros(128,256,470);

for i=1:235
    mito_avg2(:,:,2*i-1)= mito_avg(:,:,i);
    mito_avg2(:,:,2*i)= mito_avg(:,:,i);
    axon_avg2(:,:,2*i-1)= axon_avg(:,:,i);
    axon_avg2(:,:,2*i)= axon_avg(:,:,i);
end

MIJ.createImage(single(axon_avg2));
MIJ.createImage(single(mito_avg2));


