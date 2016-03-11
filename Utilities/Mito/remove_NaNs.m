function remove_NaNs
VectG = [];
for i = 1:2
G = values_y{1,i}{1,1};
entries = G(~isnan(G));
total=length(entries);
success = sum(entries);
VectG = [VectG;success];
VectG = [VectG;total];
end;