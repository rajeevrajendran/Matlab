% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

MIJ.createImage(single(mito_avg2));
MIJ.createImage(single(red));
MIJ.createImage(single(axon));

% frame average
axon_avg = zeros(256,332,60);
mito_avg = zeros(256,332,60);
for i=1:60
    axon_avg(:,:,i) = (axon(:,:,i)+axon(:,:,i+1)+axon(:,:,i+2)...
        +axon(:,:,i+3)+axon(:,:,i+4))/5;
    mito_avg(:,:,i) = (mito(:,:,i)+mito(:,:,i+1))/2;
end
mito_avg2=zeros(256,332,76);
for i=1:38
    mito_avg2(:,:,2*i)= mito_avg(:,:,i);
    mito_avg2(:,:,2*i-1)= mito_avg(:,:,i);
end
axon_avg2=zeros(256,332,76);
for i=1:38
    axon_avg2(:,:,2*i)= axon_avg(:,:,i);
    axon_avg2(:,:,2*i-1)= axon_avg(:,:,i);
end
MIJ.createImage(single(mito_avg));
MIJ.createImage(single(axon_avg2));
MIJ.createImage(single(mito_avg2));