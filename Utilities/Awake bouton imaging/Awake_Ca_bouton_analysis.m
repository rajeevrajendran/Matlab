%%work protocol for preprocessing Image stacks

%open acces to java objects in ImageJ
Miji

IJ = ij.IJ;
%In FIJI open stack with Bioformats importer as virtual stack. If neccessary reduce
%memory use by splitting stack in color and z planes.


%% filtering and registration of images is done with TurboReg ->StackReg

%import raw stack in ImageJ!!!!

IPstack = IJ.getImage();

%path to save registered images
fd = uigetdir('', 'PATH TO SAVE REGISTERED IMAGES');



%% Getting calcium responses
% Run a Z projection on the stack, with projection type standard deviation set

% (set conversion scaling on ... Edit/Options/Conversions)
% to easily select rois change the image type to 8 bits  adjust brightness/contrast

%now use adaptive (auto local) thresholding, with Niblack and radius 15 for
%cell bodies ... Image/Adjust/Auto local threshold
%use binary -> make binary to change image to binary mask
%...Process/Binary/Make binary
%Use binary erode to get wel formed rois .. Process/Binary/Erode and
%Process/Binary/Dilate

%select rois with wand tracing tool and save to ROI manager
%also save the Z projection image with rois

%run multimeasure on selected rois and retrieve to matlab

R = MIJ.getResultsTable();
[imglngth, RoiNm] = size(R);


%% select suitable image and get estimate of darknoise
darknoise = darknoise_estimate(0.05);

%it might be better to use an image from the microscope with the laser
%turned off!!!

%%
figure, plot(R-darknoise)

save( [fd '\Res.mat'], 'R', 'darknoise')

figure
for i = 1:imglngth
    plot(R(:,i))
    title(num2str(i))
    pause
end



%% Retrieve resultstable from matfile after previously saving
% [filenm,PathName] = uigetfile('D:\Users\Public\DATA\*.mat');
[filenm,PathName] = uigetfile('D:\Users\Public\DATA\*.mat');

filepath = [PathName filenm];
load(filepath);
%Res = load(filepath);
% Fields = fieldnames(Res);
% R = Res.(Fields{1});
imglngth = size(R,1);


%% you may need to get rid of artifacts
% for example averaging presently is occasionally associated with single or double frame increases in
% luminance. Remove with remartifact
R1 = R - darknoise; %save raw data
R = remartifact(R1);


figure
for i = 1:imglngth
    plot(R(:,i))
    title(num2str(i))
    pause
end
% you may want to remove rois that do not show responses
% eg. NoRes = [15 20 31 32 35 36 38 45 54 62 64 71 87 94];
% SelRes = setxor((1:RoiNm), NoRes);
% R = R(:,SelRes);
% RoiNm = size(R,2);

%% How were the images recorded, averaging * Z number etc.
Skip = 1; %averaging 2 frames, skip this number of frame triggers

%% time to retrieve triggers
[filenm,PathName] = uigetfile([fd '\Dat_files\ *.dat']);
filepath = [PathName filenm];

[head, trig] = Trigtimes(filepath); %trigtimes retrieves: frametimes and IOtimes
trig = trig';
frames = trig(trig(:,1)==1, 2);
trg = trig(trig(:,1)==0, 2);

%% check consistency of the frame triggers
frames = checkconsistency(frames, imglngth);

%% and since the last frame triggers are surplus
frames = frames(1:imglngth*Skip);
frames = frames(1:Skip:end);

figure, plot(frames./1000, R)
hold on, plot(trg./1000, 100, '*b')

%% retrieval of motion position
[filenm,PathName] = uigetfile([fd '\Dat_files\ *.dat']);
filepath = [PathName filenm];
M = ReadSerial(filepath);
M = M'; %dim 1 is motion, dim 2 is time
figure, plot(M(:,2), M(:,1))
V = smoothG(diff(M(:,1)), 5);
figure, plot(M(2:end,2), V - 100)

figure, plot(frames./1000, R)
hold on, plot(trg./1000, 100, '*b')
plot(M(2:end,2), V*4-100)





%% END OF BASIC PROCESSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% analysis with stimulus presentations (movingbar stim)
[filenm,PathName] = uigetfile([fd '\Dat_files\ *.mat']);
filepath = [PathName filenm];
load(filepath)
%%terriblebug getlast triggers
log = log(97:end);
stims = log;

stim = unique(stims);
Snm = length(stim);

trialtime = 6.0; %seconds
frameintv = mean(diff(frames))./1000;
Lng = ceil(trialtime/frameintv);
ECR = zeros(Lng, size(R,2), Snm);
Onset = 3.0; %2 sec(in ms) before onset of trigger in frames
Begin = 1.0; 

for s = 1:Snm
    avnm = 0;
    is = find(stims == stim(s));
    for i = is
        T = trg(i) - Onset*1000; %time in ms
        ix = find(frames >= T, 1, 'first');
        if(ix+Lng-1 < imglngth)
            ECR(:,:,s) = ECR(:,:,s) + R(ix:ix+Lng-1, :);
            avnm = avnm + 1;
        end
    end
    ECR(:,:,s) = ECR(:,:,s)./avnm;
end

xa = (1:Lng).*frameintv-Begin;
figure, 
for i = 1:Snm
    plot(xa, ECR(:,:,i))
    pause
end

Resmoothed = ECR;
for i = 1:Snm
    Resmoothed(:,:,i) = smoothG(ECR(:,:,i), 3);
end
%plot(xa, Resmoothed(:,:,1))

winmin = xa > -0.5 & xa < 0.5;
winmax = xa > 1 & xa < 3;

Resmin = mean(Resmoothed(winmin, :,:));
Resmax = mean(Resmoothed(winmax, :,:));
Noise = squeeze(std(Resmoothed(winmin, :,:)));

%obtain maxima from smoothed responses
Df = (Resmax - Resmin)./Resmin;
Df = squeeze(Df);

figure
for i=1:RoiNm
   polar(stim/pi, Df(i,:))
%    plot(stim, Df(i,:))
%    hold on, plot(stim, Noise(i,:))
   title(num2str(i))
   pause
   hold off
end

figure, polar(stim, Df(1,:))
