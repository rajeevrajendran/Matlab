% Created by Chris van der Togt
%% Section 01 Open ImageJ

Miji
IJ = ij.IJ;

%% Import images
select_raw = double(MIJ.getCurrentImage());

select_raw_moco = double(MIJ.getCurrentImage());

%% manually import stack in ImageJ and select output directory!!!!

fd = uigetdir(); %where to save filtered images

%% Manually import images to be aligned with the Lukas Kanade method 

%make reference (e.g. from stack z projection)
T = double(MIJ.getCurrentImage());

%retrieve stack: only small stacks
%keep large stacks virtuel
IPagn = IJ.getImage();
dim = double(IPagn.getDimensions());
w = dim(1);
h = dim(2);
t = dim(4);

%run non rigid alignement
for i = 1:t
    IPagn.setSlice(i)
    ip = IPagn.getProcessor().getPixels();
    ip = reshape(ip, w, h);
    ip = double(ip');
    Id = doLucasKanade(T,ip);
    Im = uint16(round(Id));
    writesingletiff( [fd '\LUKAS_' num2str(i) '.tif'], w, h, Im)
end

select_raw_moco_lukas = double(MIJ.getCurrentImage());
video_lukas = double(MIJ.getCurrentImage());
video_lukas_avg = zeros(512,512,400);
for i=1:400
   video_lukas_avg(:,:,i) =  (video_lukas(:,:,i)+video_lukas(:,:,i+1)+video_lukas(:,:,i+3))/3;
end

MIJ.createImage(single(video_lukas_avg));
MIJ.createImage(single(T));




