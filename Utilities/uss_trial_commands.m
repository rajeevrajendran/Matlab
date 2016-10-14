uss_stim_frames = [10:40:370];
u_s_f = uss_stim_frames;
for k = 1:10 % stim1
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
end
for k = 1:10 % stim1
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
Cell1_stim_F(k)=mean(Cell1_stim_F(k));
end
for k = 1:10 % stim1
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
Cell1_stim_F(k)=mean(Cell1_stim_F(k,:));
end
for k = 1:10 % stim1
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
Cell1_stim_F(k)=mean(Cell1_stim_F(:,k));
end
for k = 1:10 % stim1
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
%     Cell1_stim_F(k)=mean(Cell1_stim_F(:,k));
end
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
k=1;
for j = 1:5
Cell1_stim_F(6-j,k) = Mean1(u_s_f(k)-j);
end
x=mean(Cell1_stim_F(:,1));
intensity=[];
intensity(:,1)=Mean1;
intensity(:,2)=Mean2;
intensity(:,3)=Mean3;
intensity(:,4)=Mean4;
intensity(:,5)=Mean5;
intensity(:,6)=Mean6;
intensity(:,7)=Mean7;
intensity(:,8)=Mean8;
intensity(:,9)=Mean9;
intensity(:,10)=Mean10;
intensity(:,11)=Mean11;
intensity(:,12)=Mean12;
intensity(:,13)=Mean13;
intensity(:,14)=Mean14;
intensity(:,15)=Mean15;
intensity(:,16)=Mean16;
intensity(:,17)=Mean17;
intensity(:,18)=Mean18;
intensity(:,19)=Mean19;
intensity(:,20)=Mean20;
Cell1_stim_F=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:5
Cell_stim_F(6-j,k,i) = intensity(u_s_f(k)-j,i);
end
end
end
Cell_stim_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:15
Cell_stim_resp(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_stim_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:20
Cell_stim_resp(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:20
Cell_stim_resp(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_F=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:5
Cell_stim_F(6-j,k,i) = intensity(u_s_f(k)-j,i);
end
end
end
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
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((Cell_stim(k,:,i))-mean(Cell_F(k,:,i)))/mean(Cell_F(k,:,i));
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=(mean(Cell_stim(k,:,i))-mean(Cell_F(k,:,i)))/mean(Cell_F(k,:,i));
end
end
(Cell_stim(k,:,i))
(Cell_stim(7,:,i))
(Cell_stim(10,:,20))
i=20;
k=10;
Cell_resp(i,k)=(mean(Cell_stim(k,:,i))-mean(Cell_F(k,:,i)))/mean(Cell_F(k,:,i));
mean(Cell_stim(k,:,i)
mean(Cell_stim(k,:,i))
mean(Cell_F(k,:,i))
Cell_F(k,:,i)
Cell_F(:,k,i)
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=(mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i));
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 6:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:15
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:30
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
%-- 14-10-2016 12:40 --%
Miji
IJ = ij.IJ;
intensity=[];
intensity(:,1)=Mean1;
intensity(:,2)=Mean2;
intensity(:,3)=Mean3;
intensity(:,4)=Mean4;
intensity(:,5)=Mean5;
intensity(:,6)=Mean6;
intensity(:,7)=Mean7;
intensity(:,8)=Mean8;
intensity(:,9)=Mean9;
intensity(:,10)=Mean10;
intensity(:,11)=Mean11;
intensity(:,12)=Mean12;
intensity(:,13)=Mean13;
intensity(:,14)=Mean14;
intensity(:,15)=Mean15;
intensity(:,16)=Mean16;
intensity(:,17)=Mean17;
intensity(:,18)=Mean18;
intensity(:,19)=Mean19;
intensity(:,20)=Mean20;
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
for j = 1:30
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 10:30
Cell_stim(j,k,i) = intensity(u_s_f(k)+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
(mean(Cell_stim(:,k,i))
(mean(Cell_stim(:,k,i)))
mean(Cell_F(:,k,i))
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 10:30
Cell_stim(j,k,i) = intensity(u_s_f(k)+10+j,i);
end
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 10:30
Cell_stim(j,k,i) = intensity(u_s_f(k)+9+j,i);
end
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+9+j,i);
end
end
end
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+10+j,i);
end
end
en
Cell_stim=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+10+j,i);
end
end
end
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
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+10+j,i);
end
end
end
Cell_resp=[];
for i = 1:20 % cell1
for k = 1:10 % stim1
Cell_resp(i,k)=((mean(Cell_stim(:,k,i))-mean(Cell_F(:,k,i)))/mean(Cell_F(:,k,i)))*100;
end
end
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
for j = 1:20
Cell_stim(j,k,i) = intensity(u_s_f(k)+15+j,i);
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
%-- 14-10-2016 18:46 --%