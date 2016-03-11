
neurites1 = unique(values_x{1});
neurites2 = unique(values_x{2});

if ~isempty(setdiff(neurites1,neurites2))
    logmsg('Something odd. neurites not the same before and after');
end

neurites = neurites1;

for t = 1:2
    for i=1:length(neurites)
        gain{t}(i) = nanmean(values_y{t}(values_x{t}==neurites(i)));
    end
end

ind = ~isnan(gain{1}) & ~isnan(gain{2});
for t =1:2
    gain{t} = gain{t}(ind);
end

graph(gain,[],'showpairing',true)