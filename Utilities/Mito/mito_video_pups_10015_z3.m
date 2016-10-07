% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% raw file axon channel

c0z3 = double(MIJ.getCurrentImage());
% c0z0 = double(MIJ.getCurrentImage());
% c0z2 = double(MIJ.getCurrentImage());

% split even and odd frames only

c0z3_even = zeros(256,512,135);
c0z3_odd = zeros(256,512,135);
% c0z0_even = zeros(256,512,135);
% c0z2_odd = zeros(256,512,135);

for i=1:135
    c0z3_even(:,:,i)= c0z3(:,:,i*2);
    c0z3_odd(:,:,i)= c0z3(:,:,(i*2-1));
end
% for i=1:135
%     c0z0_even(:,:,i)= c0z0(:,:,i*2);
%     c0z2_odd(:,:,i)= c0z2(:,:,(i*2-1));
% end

% moco registration
MIJ.createImage(single(c0z3_even));
MIJ.createImage(single(c0z3_odd));
% MIJ.createImage(single(c0z0_even));
% MIJ.createImage(single(c0z2_odd));

% import after registration

c0z3_even_reg = double(MIJ.getCurrentImage());
% c0z0_even_reg = double(MIJ.getCurrentImage());
c0z3_odd_reg = double(MIJ.getCurrentImage());
% c0z2_odd_reg = double(MIJ.getCurrentImage());

% merge even odd
c0z3_avg = zeros(256,512,135);
for i=1:135
    
    c0z3_avg(:,:,i)= (c0z3_even_reg(:,:,i)+ c0z3_odd_reg(:,:,i));
end
MIJ.createImage(single(c0z3_avg));

% mito channel
c1z3 = double(MIJ.getCurrentImage());

c1z3_even = zeros(256,512,135);
c1z3_odd = zeros(256,512,135);

for i=1:135
    c1z3_even(:,:,i)= c1z3(:,:,i*2);
    c1z3_odd(:,:,i)= c1z3(:,:,(i*2-1));
end

% moco registration
MIJ.createImage(single(c1z3_even));
MIJ.createImage(single(c1z3_odd));

% import after registration

c1z3_even_reg = double(MIJ.getCurrentImage());
c1z3_odd_reg = double(MIJ.getCurrentImage());

% merge even odd
c1z3_avg = zeros(256,512,135);
for i=1:135
    c1z3_avg(:,:,i)= c1z3_even_reg(:,:,i)+ c1z3_odd_reg(:,:,i);
end
MIJ.createImage(single(c1z3_avg));
MIJ.createImage(single(c0z3_avg));
