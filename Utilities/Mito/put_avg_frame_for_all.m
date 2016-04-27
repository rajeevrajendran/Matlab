green= double(MIJ.getCurrentImage());
green_uni = zeros(256,332,70);
for i=1:70
   green_uni(:,:,i)=green;
end
MIJ.createImage(single(green_uni));
MIJ.createImage(single(red));
