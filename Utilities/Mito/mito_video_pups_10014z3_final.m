% Rajeev 2016-04-28
% Import images from xyzt stack
Miji
IJ = ij.IJ;

% raw file axon channel
c0z3 = double(MIJ.getCurrentImage());
c0z4 = double(MIJ.getCurrentImage());

% raw file mito channel

c1z3 = double(MIJ.getCurrentImage());
c1z4 = double(MIJ.getCurrentImage());


% split even and odd frames only

c0z3_even = zeros(256,512,135);
c0z3_odd = zeros(256,512,135);
c0z4_even = zeros(256,512,135);
c0z4_odd = zeros(256,512,135);
c1z3_even = zeros(256,512,135);
c1z3_odd = zeros(256,512,135);
c1z4_even = zeros(256,512,135);
c1z4_odd = zeros(256,512,135);


for i=1:135
    c0z3_even(:,:,i)= c0z3(:,:,i*2);
    c0z3_odd(:,:,i)= c0z3(:,:,(i*2-1));
    c0z4_even(:,:,i)= c0z4(:,:,i*2);
    c0z4_odd(:,:,i)= c0z4(:,:,(i*2-1));
    c1z3_even(:,:,i)= c1z3(:,:,i*2);
    c1z3_odd(:,:,i)= c1z3(:,:,(i*2-1));
    c1z4_even(:,:,i)= c1z4(:,:,i*2);
    c1z4_odd(:,:,i)= c1z4(:,:,(i*2-1));
end

% Moco registration
MIJ.createImage(single(c0z3_even));
c0z3_even_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c0z3_odd));
c0z3_odd_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c0z4_even));
c0z4_even_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c0z4_odd));
c0z4_odd_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c1z3_even));
c1z3_even_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c1z3_odd));
c1z3_odd_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c1z4_even));
c1z4_even_moco = double(MIJ.getCurrentImage());
MIJ.createImage(single(c1z4_odd));
c1z4_odd_moco = double(MIJ.getCurrentImage());

% add even odd
c0z3_avg_moco = zeros (256,512,135);
c0z4_avg_moco = zeros (256,512,135);
c1z3_avg_moco = zeros (256,512,135);
c1z4_avg_moco = zeros (256,512,135);
for i=1:135
    c0z3_avg_moco(:,:,i) = c0z3_even_moco(:,:,i)+c0z3_odd_moco(:,:,i);
    c0z4_avg_moco(:,:,i) = c0z4_even_moco(:,:,i)+c0z4_odd_moco(:,:,i);
    c1z3_avg_moco(:,:,i) = c1z3_even_moco(:,:,i)+c1z3_odd_moco(:,:,i);
    c1z4_avg_moco(:,:,i) = c1z4_even_moco(:,:,i)+c1z4_odd_moco(:,:,i);
end

% Kanade registration even odd images
% Manually import images to be aligned with the Lukas Kanade method 
% make reference (e.g. from stack z projection)
MIJ.createImage(single(c1z4_avg_moco));
T = double(MIJ.getCurrentImage());

MIJ.createImage(single(c1z4_odd_moco));
IPagn = IJ.getImage();
dim = double(IPagn.getDimensions());
w = dim(1);
h = dim(2);
t = dim(4);
fd = uigetdir(); 
for i = 1:t
    IPagn.setSlice(i)
    ip = IPagn.getProcessor().getPixels();
    ip = reshape(ip, w, h);
    ip = double(ip');
    Id = doLucasKanade(T,ip);
    Im = uint16(round(Id));
    writesingletiff( [fd '\LUKAS_' num2str(i) '.tif'], h, w, Im)
end
c1z4_odd_lukas = double(MIJ.getCurrentImage());

%  add even odd lukas images

c0z3_avg_lukas = zeros (256,512,135);
c0z4_avg_lukas = zeros (256,512,135);
c1z3_avg_lukas = zeros (256,512,135);
c1z4_avg_lukas = zeros (256,512,135);

for i=1:135
    c0z3_avg_lukas(:,:,i) = c0z3_even_lukas(:,:,i)+c0z3_odd_lukas(:,:,i);
    c0z4_avg_lukas(:,:,i) = c0z4_even_lukas(:,:,i)+c0z4_odd_lukas(:,:,i);
    c1z3_avg_lukas(:,:,i) = c1z3_even_lukas(:,:,i)+c1z3_odd_lukas(:,:,i);
    c1z4_avg_lukas(:,:,i) = c1z4_even_lukas(:,:,i)+c1z4_odd_lukas(:,:,i);
end
MIJ.createImage(single(c0z3_avg_lukas));
MIJ.createImage(single(c0z4_avg_lukas));
MIJ.createImage(single(c1z3_avg_lukas));
MIJ.createImage(single(c1z4_avg_lukas));

% add z
c0z34_avg_lukas = zeros (256,512,135);
c1z34_avg_lukas = zeros (256,512,135);

for i=1:135
    c0z34_avg_lukas(:,:,i) = c0z3_avg_lukas(:,:,i)+c0z4_avg_lukas(:,:,i);
    c1z34_avg_lukas(:,:,i) = c1z3_avg_lukas(:,:,i)+c1z4_avg_lukas(:,:,i);
end

MIJ.createImage(single(c0z34_avg_lukas));
MIJ.createImage(single(c1z34_avg_lukas));

% consecutive frame average
c0z34_avg2_lukas = zeros (256,512,130);
c1z34_avg2_lukas = zeros (256,512,130);
for i=1:130
    c0z34_avg2_lukas(:,:,i) = (c0z34_avg_lukas(:,:,i)+c0z34_avg_lukas(:,:,i+1)...
        +c0z34_avg_lukas(:,:,i+2)+c0z34_avg_lukas(:,:,i+3))/4;
    c1z34_avg2_lukas(:,:,i) = (c1z34_avg_lukas(:,:,i)+c1z34_avg_lukas(:,:,i+1))/2;
end

% frame doubling
c0z34_avg3_lukas = zeros(256,512,260);
c1z34_avg3_lukas = zeros(256,512,260);

for i=1:130
    c0z34_avg3_lukas(:,:,2*i-1)= c0z34_avg2_lukas(:,:,i);
    c0z34_avg3_lukas(:,:,2*i)= c0z34_avg2_lukas(:,:,i);
    c1z34_avg3_lukas(:,:,2*i-1)= c1z34_avg2_lukas(:,:,i);
    c1z34_avg3_lukas(:,:,2*i)= c1z34_avg2_lukas(:,:,i);
end

MIJ.createImage(single(c0z34_avg3_lukas));
MIJ.createImage(single(c1z34_avg3_lukas));


