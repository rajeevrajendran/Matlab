Miji
IJ = ij.IJ;
%
axon = double(MIJ.getCurrentImage());
axon_avg = double(MIJ.getCurrentImage());
mito = double(MIJ.getCurrentImage());
%
mito_avg=zeros(256,512,99);
for i=1:99
    x=mito(:,:,i);
    y=mito(:,:,i+1);
    z=(x+y);    
    mito_avg(:,:,i)=z;
end
vmin = min(min(min(mito_avg)));
mito_avg2 = mito_avg - vmin;

MIJ.createImage(single(mito_avg));
MIJ.createImage(single(mito_avg2));
%
red=zeros(256,512,99);
for i=1:99
   red(:,:,i)= axon_avg;
end
MIJ.createImage(single(red));
