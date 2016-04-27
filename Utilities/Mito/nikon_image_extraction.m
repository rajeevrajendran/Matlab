c0z0= double(MIJ.getCurrentImage());
green0z4 = zeros(256,512,135);

for i=1:135
   green0z4(:,:,i)=c0z4(:,:,2*i);
end

greenz=zeros(256,512,135);
for i=1:135
   greenz(:,:,i)=green0z0(:,:,i)+green0z1(:,:,i)+green0z2(:,:,i)...
       +green0z3(:,:,i)+green0z4(:,:,i);
end
MIJ.createImage(single(greenz));

redz4 = zeros(256,512,135);
for i=1:135
   redz4(:,:,i)=c1z4(:,:,2*i);
end

redz=zeros(256,512,135);
for i=1:135
   redz(:,:,i)=redz0(:,:,i)+redz1(:,:,i)+redz2(:,:,i)...
       +redz3(:,:,i)+redz4(:,:,i);
end
MIJ.createImage(single(redz));
% MIJ.createImage(single(red));
