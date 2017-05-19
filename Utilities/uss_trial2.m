% Created by Rajeev Rajendran
% Date created 2016-10-12

% Open ImageJ
Miji
IJ = ij.IJ;

stim1_std=double(MIJ.getCurrentImage());
stim1_min=double(MIJ.getCurrentImage());
stim1=stim1_std-(stim1_min)/2;
MIJ.createImage(single(stim1));

stim2_std=double(MIJ.getCurrentImage());
stim2_min=double(MIJ.getCurrentImage());
stim2=stim2_std-(stim2_min)/2;
MIJ.createImage(single(stim2));

stim3_std=double(MIJ.getCurrentImage());
stim3_min=double(MIJ.getCurrentImage());
stim3=stim3_std-(stim3_min)/2;
MIJ.createImage(single(stim3));

stim4_std=double(MIJ.getCurrentImage());
stim4_min=double(MIJ.getCurrentImage());
stim4=stim4_std-(stim4_min)/2;
MIJ.createImage(single(stim4));

stim5_std=double(MIJ.getCurrentImage());
stim5_min=double(MIJ.getCurrentImage());
stim5=stim5_std-(stim5_min)/2;
MIJ.createImage(single(stim5));

stim6_std=double(MIJ.getCurrentImage());
stim6_min=double(MIJ.getCurrentImage());
stim6=stim6_std-(stim6_min)/2;
MIJ.createImage(single(stim6));

stim7_std=double(MIJ.getCurrentImage());
stim7_min=double(MIJ.getCurrentImage());
stim7=stim7_std-(stim7_min)/2;

stim8_std=double(MIJ.getCurrentImage());
stim8_min=double(MIJ.getCurrentImage());
stim8=stim8_std-(stim8_min)/2;

stim9_std=double(MIJ.getCurrentImage());
stim9_min=double(MIJ.getCurrentImage());
stim9=stim9_std-(stim9_min)/2;

stim10_std=double(MIJ.getCurrentImage());
stim10_min=double(MIJ.getCurrentImage());
stim10=stim10_std-(stim10_min)/2;

MIJ.createImage(single(stim1));
MIJ.createImage(single(stim2));
MIJ.createImage(single(stim3));
MIJ.createImage(single(stim4));
MIJ.createImage(single(stim5));
MIJ.createImage(single(stim6));
MIJ.createImage(single(stim7));
MIJ.createImage(single(stim8));
MIJ.createImage(single(stim9));
MIJ.createImage(single(stim10));

response_image = double(MIJ.getCurrentImage());
stim_image = double(MIJ.getCurrentImage());
MIJ.createImage(single(stim_image));
base_image = double(MIJ.getCurrentImage());
MIJ.createImage(single(base_image));


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

uss_stim_frames = [1:16:155];
u_s_f = uss_stim_frames;
u_s_b = [1:5:46];

intensity_stim=[];
intensity_stim(:,1)=Mean1;
intensity_stim(:,2)=Mean2;
intensity_stim(:,3)=Mean3;
intensity_stim(:,4)=Mean4;
intensity_stim(:,5)=Mean5;
intensity_stim(:,6)=Mean6;
intensity_stim(:,7)=Mean7;
intensity_stim(:,8)=Mean8;
intensity_stim(:,9)=Mean9;

Cell_F=[];
for i = 1:9 % cell1
    for k = 1:10 % stim1
        for j = 1:5
            Cell_F(j,k,i) = intensity_base((u_s_b(k)-1)+j,i);
        end
    end
end

Cell_stim=[];
for i = 1:9 % cell1
    for k = 1:10 % stim1
        for j = 1:8
            Cell_stim(j,k,i) = intensity_stim((u_s_f(k)+7)+j,i);
        end
    end
end

Cell_resp=[];
for i = 1:9 % cell1
    for k = 1:10 % stim1
        Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
    end
end




