% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

c0z1 = double(MIJ.getCurrentImage());
c0z2 = double(MIJ.getCurrentImage());
c0z3 = double(MIJ.getCurrentImage());

MIJ.createImage(single(c0z2));

% average z
c0_avg = zeros(256,512,100);
for i=1:100
   c0_avg(:,:,i)= c0z1(:,:,i*2)+c0z2(:,:,i*2)+c0z3(:,:,i*2);
end
MIJ.createImage(single(c0_avg));

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