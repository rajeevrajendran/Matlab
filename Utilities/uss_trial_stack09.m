% Created by Rajeev Rajendran
% Date created 2016-10-12


uss_stim_frames = [1:25:226];
u_s_f = uss_stim_frames;
uss_base_frames = [1:5:46];
u_b_f = uss_base_frames;

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
intensity_stim(:,10)=Mean10;
intensity_stim(:,11)=Mean11;
intensity_stim(:,12)=Mean12;
intensity_stim(:,13)=Mean13;
intensity_stim(:,14)=Mean14;
intensity_stim(:,15)=Mean15;
intensity_stim(:,16)=Mean16;
intensity_stim(:,17)=Mean17;
intensity_stim(:,18)=Mean18;
intensity_stim(:,19)=Mean19;
intensity_stim(:,20)=Mean20;
intensity_stim(:,21)=Mean21;
intensity_stim(:,22)=Mean22;
intensity_stim(:,23)=Mean23;
intensity_stim(:,24)=Mean24;

intensity_base=[];
intensity_base(:,1)=Mean1;
intensity_base(:,2)=Mean2;
intensity_base(:,3)=Mean3;
intensity_base(:,4)=Mean4;
intensity_base(:,5)=Mean5;
intensity_base(:,6)=Mean6;
intensity_base(:,7)=Mean7;
intensity_base(:,8)=Mean8;
intensity_base(:,9)=Mean9;
intensity_base(:,10)=Mean10;
intensity_base(:,11)=Mean11;
intensity_base(:,12)=Mean12;
intensity_base(:,13)=Mean13;
intensity_base(:,14)=Mean14;
intensity_base(:,15)=Mean15;
intensity_base(:,16)=Mean16;
intensity_base(:,17)=Mean17;
intensity_base(:,18)=Mean18;
intensity_base(:,19)=Mean19;
intensity_base(:,20)=Mean20;
intensity_base(:,21)=Mean21;
intensity_base(:,22)=Mean22;
intensity_base(:,23)=Mean23;
intensity_base(:,24)=Mean24;


Cell_base=[];
for i = 1:24 % cell1
    for k = 1:10 % stim1
        for j = 1:5
            Cell_base(j,k,i) = intensity_base((u_b_f(k)-1)+j,i);
        end
    end
end

Cell_stim=[];
for i = 1:24 % cell1
    for k = 1:10 % stim1
        for j = 1:5
            Cell_stim(j,k,i) = intensity_stim((u_s_f(k)+19)+j,i);
        end
    end
end

Cell_resp=[];
for i = 1:24 % cell1
    for k = 1:10 % stim1
        Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_base(:,k,i)))/mean(Cell_base(:,k,i)))*100;
    end
end





 


