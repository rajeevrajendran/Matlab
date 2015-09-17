% function remove_NaNs
VectG = [];
for i = 1:2
G = values_y{1,i}{1,1};
gg = G(~isnan(G));
g = sum(gg)/length(gg);
VectG = [VectG;g];
end;