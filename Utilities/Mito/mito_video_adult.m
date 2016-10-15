Miji
IJ = ij.IJ;
%
axon = double(MIJ.getCurrentImage());
mito = double(MIJ.getCurrentImage());

axon_moco = double(MIJ.getCurrentImage());
mito_moco = double(MIJ.getCurrentImage());
%
axon_avg_moco =zeros(192,472,121);
for i=1:121
    x=axon_moco(:,:,i);
    y=axon_moco(:,:,i+1);
    z=axon_moco(:,:,i+2);
    avg=(x+y+z)/3;
    axon_avg_moco(:,:,i)=avg;
end

mito_avg_moco =zeros(192,472,121);
for i=1:121
    x=mito_moco(:,:,i);
    y=mito_moco(:,:,i+1);
    z=mito_moco(:,:,i+2);
    avg_m=(x+y+z)/3;
    mito_avg_moco(:,:,i)=avg_m;
end

vmin = min(min(min(mito_avg)));
mito_avg2 = mito_avg - vmin;

MIJ.createImage(single(axon_avg));
MIJ.createImage(single(mito_avg));

MIJ.createImage(single(axon_moco));
MIJ.createImage(single(mito_moco));
%

red=zeros(256,512,99);
for i=1:99
   red(:,:,i)= axon_avg;
end
MIJ.createImage(single(red));
axon_avg = double(MIJ.getCurrentImage());