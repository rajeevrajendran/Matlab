Miji
IJ = ij.IJ;
%
axon_raw = double(MIJ.getCurrentImage());
mito_raw = double(MIJ.getCurrentImage());


axon_raw_2min = double(MIJ.getCurrentImage());
mito_raw_2min = double(MIJ.getCurrentImage());

axon_raw_2min = axon_raw_2min-500;
MIJ.createImage(single(axon_raw_2min));
axon_raw_2min_moco = double(MIJ.getCurrentImage());

mito_moco_2min = double(MIJ.getCurrentImage());
% mito processing
mito_avg_2min = zeros(192,472,121);
for i=1:121
    x=mito_moco_2min(:,:,i);
    y=mito_moco_2min(:,:,i+1);
    z=mito_moco_2min(:,:,i+2);
    avg=(x+y+z)/3;
    mito_avg_2min(:,:,i)=avg;
end

MIJ.createImage(single(mito_avg_2min));
MIJ.createImage(single(mito_moco_2min));
% axon processing
axon_avg_2min = zeros(192,472,121);
for i=1:121
    x=axon_raw_2min_moco(:,:,i);
    y=axon_raw_2min_moco(:,:,i+1);
    z=axon_raw_2min_moco(:,:,i+2);
    avg_a=(x+y+z)/3;
    axon_avg_2min(:,:,i)=avg_a;
end

MIJ.createImage(single(axon_avg_2min));
