% Created by Rajeev Rajendran
% Date created 2016-10-12

%% Open ImageJ
Miji
IJ = ij.IJ;

%%
raw =double(MIJ.getCurrentImage());
x=512;
y=796;
t=599;
n=5;

mean_image=[];
for b=0:118
    for a=1:n
        image(:,:,a)=raw(:,:,(5*b+a));
    end
    image=(image(:,:,1)+image(:,:,2)+image(:,:,3)+image(:,:,4)+image(:,:,5))/5;
    mean_image(:,:,b+1)=image;
    
end

MIJ.createImage(single(mean_image));
