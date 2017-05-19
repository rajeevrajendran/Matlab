Miji
IJ = ij.IJ;

raw_moco=double(MIJ.getCurrentImage());
raw_red_avg=double(MIJ.getCurrentImage());
raw_moco_avg=double(MIJ.getCurrentImage());
avgF=zeros(252,281,940);
for i=1:940
    avgF(:,:,i)=raw_moco_avg;
end

red=zeros(252,281,940);
for i=1:940
    red(:,:,i)=raw_red_avg;
end

deltaF=zeros(252,281,940);
for i=1:940
    deltaF(:,:,i)=raw_moco(:,:,i)-avgF(:,:,i);
end
MIJ.createImage(single(deltaF));
MIJ.createImage(single(avgF));
MIJ.createImage(single(red));