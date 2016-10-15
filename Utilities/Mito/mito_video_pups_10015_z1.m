% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% raw file axon channel

c0z1 = double(MIJ.getCurrentImage());
% c0z0 = double(MIJ.getCurrentImage());
% c0z2 = double(MIJ.getCurrentImage());

% split even and odd frames only

c0z1_even = zeros(256,512,135);
c0z1_odd = zeros(256,512,135);
% c0z0_even = zeros(256,512,135);
% c0z2_odd = zeros(256,512,135);

for i=1:135
    c0z1_even(:,:,i)= c0z1(:,:,i*2);
    c0z1_odd(:,:,i)= c0z1(:,:,(i*2-1));
end
% for i=1:135
%     c0z0_even(:,:,i)= c0z0(:,:,i*2);
%     c0z2_odd(:,:,i)= c0z2(:,:,(i*2-1));
% end

% moco registration
MIJ.createImage(single(c0z1_even));
MIJ.createImage(single(c0z1_odd));
% MIJ.createImage(single(c0z0_even));
% MIJ.createImage(single(c0z2_odd));

% import after registration

c0z1_even_reg = double(MIJ.getCurrentImage());
% c0z0_even_reg = double(MIJ.getCurrentImage());
c0z1_odd_reg = double(MIJ.getCurrentImage());
% c0z2_odd_reg = double(MIJ.getCurrentImage());

% merge even odd
c0z1_avg = zeros(256,512,135);
for i=1:135
    %     c0z1_avg(:,:,i)= (c0z1_even_reg(:,:,i)+ c0z1_odd_reg(:,:,i)+c0z2_odd_reg(:,:,i)+c0z0_even_reg(:,:,i))/2;
    c0z1_avg(:,:,i)= (c0z1_even_reg(:,:,i)+ c0z1_odd_reg(:,:,i));
end

c0z1_avg_step = zeros(256,512,134);
for i=1:134
    c0z1_avg_step(:,:,i)=(c0z1_avg(:,:,i)+c0z1_avg(:,:,i+1))/2;
end

% mito channel
c1z1 = double(MIJ.getCurrentImage());
c1z0 = double(MIJ.getCurrentImage());
c1z2 = double(MIJ.getCurrentImage());
% split even and odd frames only

c1z1_even = zeros(256,512,135);
c1z1_odd = zeros(256,512,135);
c1z0_even = zeros(256,512,135);
c1z2_odd = zeros(256,512,135);

for i=1:135
    c1z1_even(:,:,i)= c1z1(:,:,i*2);
    c1z1_odd(:,:,i)= c1z1(:,:,(i*2-1));
end

for i=1:135
    c1z0_even(:,:,i)= c1z0(:,:,i*2);
    c1z2_odd(:,:,i)= c1z2(:,:,(i*2-1));
end

% moco registration
MIJ.createImage(single(c1z1_even));
MIJ.createImage(single(c1z1_odd));
MIJ.createImage(single(c1z0_even));
MIJ.createImage(single(c1z2_odd));

% import after registration

c1z1_even_reg = double(MIJ.getCurrentImage());
c1z1_odd_reg = double(MIJ.getCurrentImage());
c1z0_even_reg = double(MIJ.getCurrentImage());
c1z2_odd_reg = double(MIJ.getCurrentImage());

% merge even odd
c1z1_avg = zeros(256,512,135);
for i=1:135
    c1z1_avg(:,:,i)= (c1z1_even_reg(:,:,i)+ c1z1_odd_reg(:,:,i)+c1z0_even_reg(:,:,i)+c1z2_odd_reg(:,:,i));
%     c1z1_avg(:,:,i)= c1z1_even_reg(:,:,i)+ c1z1_odd_reg(:,:,i);
%     c1z2_avg(:,:,i)= c1z0_even_reg(:,:,i)+ c1z2_odd_reg(:,:,i);
end

c1z1_avg_step = zeros(256,512,134);
for i=1:134
    c1z1_avg_step(:,:,i)=(c1z1_avg(:,:,i)+c1z1_avg(:,:,i+1))/2;
end
MIJ.createImage(single(c1z1_avg_step));
MIJ.createImage(single(c1z2_avg));
MIJ.createImage(single(c0z1_avg_step));
