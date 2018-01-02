% Created by Rajeev Rajendran
% Date created 2016-10-12

%% Open ImageJ
Miji
IJ = ij.IJ;

%%
raw =double(MIJ.getCurrentImage());
x=512;
y=796;
t=649;
n=5;
p=[1 121 242 363 484];

mean_image=[];
for b=1:120
    for a=1:n
        image(:,:,a)=raw(:,:,((p(a))+(b-1)));
    end
    image=(image(:,:,1)+image(:,:,2)+image(:,:,3)+image(:,:,4)+image(:,:,5))/5;
    mean_image(:,:,b)=image;
    
end

MIJ.createImage(single(mean_image));
