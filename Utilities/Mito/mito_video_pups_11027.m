% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% raw file axon channel

axon = double(MIJ.getCurrentImage());
mito = double(MIJ.getCurrentImage());
axon_avg = double(MIJ.getCurrentImage());

% make whole stack from avg

axon_main = zeros(256,512,135);
for i=1:135
    axon_main(:,:,i)= axon_avg;
end
MIJ.createImage(single(axon_main));

