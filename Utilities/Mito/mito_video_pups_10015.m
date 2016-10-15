% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% raw file axon channel

c0z1 = double(MIJ.getCurrentImage());
c0z2 = double(MIJ.getCurrentImage());
c0z3 = double(MIJ.getCurrentImage());

% take even frames only
c0z1_even = zeros(256,512,122);
c0z2_even = zeros(256,512,122);
c0z3_even = zeros(256,512,122);
for i=1:122
    c0z1_even(:,:,i)= c0z1(:,:,i*2);
    c0z2_even(:,:,i)= c0z2(:,:,i*2);
    c0z3_even(:,:,i)= c0z3(:,:,i*2);
end

% moco registration
MIJ.createImage(single(c0z1_even));
MIJ.createImage(single(c0z2_even));
MIJ.createImage(single(c0z3_even));

% import after registration
c0z1_even_reg = double(MIJ.getCurrentImage());
c0z2_even_reg = double(MIJ.getCurrentImage());
c0z3_even_reg = double(MIJ.getCurrentImage());

% merge z-stacks
c0_z_avg = zeros(256,512,122);
for i=1:122
    c0_z_avg(:,:,i)= (c0z1_even_reg(:,:,i)+ c0z2_even_reg(:,:,i)+ c0z3_even_reg(:,:,i))/3;
end
MIJ.createImage(single(c0_z_avg));
c0_avg = double(MIJ.getCurrentImage());
c0_main=zeros(256,512,122);
for i=1:122
    c0_main(:,:,i)= c0_avg;
end
MIJ.createImage(single(c0_main));

% raw file mito channel

c1z1 = double(MIJ.getCurrentImage());
c1z2 = double(MIJ.getCurrentImage());
c1z3 = double(MIJ.getCurrentImage());

% take even frames only
c1z1_even = zeros(256,512,122);
c1z2_even = zeros(256,512,122);
c1z3_even = zeros(256,512,122);
for i=1:122
    c1z1_even(:,:,i)= c1z1(:,:,i*2);
    c1z2_even(:,:,i)= c1z2(:,:,i*2);
    c1z3_even(:,:,i)= c1z3(:,:,i*2);
end

% moco registration
MIJ.createImage(single(c1z1_even));
MIJ.createImage(single(c1z2_even));
MIJ.createImage(single(c1z3_even));

% import after registration
c1z1_even_reg = double(MIJ.getCurrentImage());
c1z2_even_reg = double(MIJ.getCurrentImage());
c1z3_even_reg = double(MIJ.getCurrentImage());

% merge z-stacks
c1_z_avg = zeros(256,512,122);
for i=1:122
    c1_z_avg(:,:,i)= (c1z1_even_reg(:,:,i)+ c1z2_even_reg(:,:,i)+ c1z3_even_reg(:,:,i))/3;
end
MIJ.createImage(single(c1_z_avg))





