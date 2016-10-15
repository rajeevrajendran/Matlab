Miji
IJ = ij.IJ;
%
axon = double(MIJ.getCurrentImage());
mito = double(MIJ.getCurrentImage());
%
mito_sub =zeros(256,512,214);
for i=1:214
    x=mito(:,:,i);
    y=(axon(:,:,i))./3;
    z=(x-y);    
    mito_sub(:,:,i)=z;
end
mito_sub=mito_sub+400;
vmin = min(min(min(mito_avg)));
mito_avg2 = mito_avg - vmin;

MIJ.createImage(single(mito_sub));
MIJ.createImage(single(mito_avg2));
%
red=zeros(256,512,99);
for i=1:99
   red(:,:,i)= axon_avg;
end
MIJ.createImage(single(red));
axon_avg = double(MIJ.getCurrentImage());