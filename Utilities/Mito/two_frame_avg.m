
% wrong!
% for i=1:134
%     x=mito(:,:,i);
%     y=mito(:,:,i+1);
%     z=(x+y)/2;
%     mito_avg=zeros(256,512,135);
%     mito_avg(:,:,i)=z;
% end

%better
mito_avg=zeros(256,332,70);
for i=1:70
    x=green(:,:,i);
    y=green(:,:,i+1);
    z=(x+y);    
    mito_avg(:,:,i)=z;
end
vmin = min(min(min(mito_avg)));
mito_avg = mito_avg - vmin;

MIJ.createImage(single(mito_avg));

