fd = uigetdir();

for i = 1:3400
    Im = uint16(round(Id(:,:,i)));
    writesingletiff( [fd '\LUKAS_02' num2str(i) '.tif'], 512, 512, Im)
end