function remove_nans_single
Left_bar = values_y{1,2};
Left=[];
for i=1:length(Left_bar)
    if ~isnan(Left_bar(i))
        Left=[Left,Left_bar(i)];
    end
end
Left_bar = values_y{1,1};
Left=[];
for i=1:length(Left_bar)
    if ~isnan(Left_bar(i))
        Left=[Left,Left_bar(i)];
    end
end