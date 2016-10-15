% Created by Rajeev Rajendran
% Date created 2016-10-12

% Open ImageJ
Miji
IJ = ij.IJ;

stim1 = double(MIJ.getCurrentImage());
stim2 = double(MIJ.getCurrentImage());
stim3 = double(MIJ.getCurrentImage());
stim10 = double(MIJ.getCurrentImage());
stim9 = double(MIJ.getCurrentImage());
stim8 = double(MIJ.getCurrentImage());
stim7 = double(MIJ.getCurrentImage());
stim6 = double(MIJ.getCurrentImage());
stim5 = double(MIJ.getCurrentImage());
stim4 = double(MIJ.getCurrentImage());
stim_conc = double(MIJ.getCurrentImage());

uss_stim_frames = [10:40:370];
u_s_f = uss_stim_frames;
Cell_F=[];
for i = 1:20 % cell1
    for k = 1:10 % stim1
        for j = 1:5
            Cell_F(6-j,k,i) = intensity(u_s_f(k)-j,i);
        end
    end
end

Cell_stim=[];
for i = 1:20 % cell1
    for k = 1:10 % stim1
        for j = 1:15
            Cell_stim(j,k,i) = intensity(u_s_f(k)+15+j,i);
        end
    end
end

Cell_resp=[];
for i = 1:20 % cell1
    for k = 1:10 % stim1
        Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
    end
end




% Manually import images to be aligned with the Lukas Kanade method 

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

 


