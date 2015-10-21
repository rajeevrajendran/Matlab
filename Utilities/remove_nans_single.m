function remove_nans_single
G = values_y{1,2}{1,1};
B=[];
for i=1:length(G)
    if ~isnan(G(i))
        B=[B,G(i)];
    end
end