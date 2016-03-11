function mito_shuffle
%MITO_SHUFFLE
%
%  Shuffles mitos along axons and recomputes distance2mito
%
% 2014, Alexander Heimel

global testdb

n_shuffles = 10;%00;
if n_shuffles<50
    logmsg('For final publishable result, please increase sample number perhaps to 1000 or so');
end

groupname = '11.12 no lesion';
%groupname = '11.12 all';

logmsg('Refine sampling of axons for picking random locations');

experiment('11.12_rr_101_pretty_ls');
if ~exist('testdb','var') || isempty(testdb) % temp for script
    testdb = load_expdatabase('tptestdb_olympus');
end

groupdb = load_groupdb;
ind = find_record(groupdb,['name=' groupname]);
selection = groupdb(ind).filter;
logmsg(['Group is ' groupname ', selection is ' selection ]);
ind = find_record(testdb,selection);
db = testdb(ind);
distance2mito_org = [];
distance2mito_shuf = [];
distance2bouton_org = [];
distance2bouton_shuf = [];


default_params = tpreadconfig( testdb(1) );
if isempty(default_params)
    default_params.x_step = 0.1973;
    default_params.x_unit = 'um';
    default_params.y_step = 0.1973;
    default_params.y_unit = 'um';
    default_params.z_step = 1;
    default_params.z_unit = 'um';
end

density_bouton = [];
density_mito = [];
axon_length = [];


for i=1:length(db)
    logmsg(['Record ' num2str(i) ' of ' num2str(length(db))]);
%     if isempty(db(i).measures) || ...
%             ~isfield(db(i).measures,'timepoint') || ...
%             db(i).measures(1).timepoint~=0 % only take timepoint 1 (second tp)
%         continue
%     end
    if axons2d( db(i) )
        continue
    end
    processparams = tpprocessparams(db(i));

    params = tpreadconfig( db(i) );
    if isempty(params)
        params = default_params;
    end
    
    params.add_puncta_to_axons = true;
    params.pull_mito2axons = false;
    params.pull_boutons2axons = false; % conditional on mito's being pulled
    
    db(i) = interpolate_axons( db(i), params );
    
    % pulling real data to axons
    % db(i) = pull_mito2axons( db(i), params );
    
    db(i) = tp_mito_close( db(i),params,processparams);
    db(i) = tp_bouton_close( db(i),params,processparams);

    axon = [db(i).measures.axon];

    density_bouton = [density_bouton db(i).measures(axon).density_bouton];
    density_mito = [density_mito db(i).measures(axon).density_mito];
    axon_length = [axon_length db(i).measures(axon).length];
    

    
    if ~isempty(db(i).measures) && isfield(db(i).measures,'bouton')
        bouton = [db(i).measures.bouton] & [db(i).measures.present];
        distance2mito_org = [distance2mito_org [db(i).measures(bouton).distance2mito]];

        mito = [db(i).measures.mito] & [db(i).measures.present];
        distance2bouton_org = [distance2bouton_org [db(i).measures(mito).distance2bouton]];
        
        if params.pull_mito2axons 
            db(i) = pull_mito2axons( db(i), params );
        end
        
        for j=1:n_shuffles
            shuffled_mitos_record = shuffle_mitos( db(i),'mito');
            shuffled_mitos_record = tp_mito_close( shuffled_mitos_record,params,processparams );
            shuffled_boutons_record = shuffle_mitos( db(i),'bouton');
            shuffled_boutons_record = tp_bouton_close( shuffled_boutons_record,params,processparams  );
            distance2mito_shuf = [distance2mito_shuf ...
                [shuffled_mitos_record.measures(bouton).distance2mito] ];
            distance2bouton_shuf = [distance2bouton_shuf ...
                [shuffled_boutons_record.measures(mito).distance2bouton] ];
        end
    end
end

plotdistances( distance2mito_org,distance2mito_shuf,n_shuffles,groupname,'Distance to mito')
plotdistances( distance2bouton_org,distance2bouton_shuf,n_shuffles,groupname,'Distance to bouton')

% logmsg('Clipping high shuffle distances');
% distance2mito_shuf(distance2mito_shuf<20)=NaN;
% distance2mito_org(distance2mito_org<20)=NaN;


function plotdistances( distance2mito_org,distance2mito_shuf,n_shuffles,groupname,xlab)


d2mito=reshape(distance2mito_shuf,n_shuffles,length(distance2mito_shuf)/n_shuffles);
mean_mito_org = nanmean(distance2mito_org);
means_mito_shu = nanmean(d2mito,2);

distance2mito_org = distance2mito_org(~isnan(distance2mito_org));
distance2mito_shuf = distance2mito_shuf(~isnan(distance2mito_shuf));

% make figures
bin_size = 2; % micron
edges = 0:bin_size:100;
bin_size_shuf = bin_size; %micron
edges_shuf = 0:bin_size_shuf:100;

plot_per_micron = false;

[n_org]=histc(distance2mito_org,edges);
n_org = n_org / length(distance2mito_org) ;
[n_shuf]=histc(distance2mito_shuf,edges_shuf);
n_shuf = n_shuf / length(distance2mito_shuf) ;

if plot_per_micron
    n_org = n_org / bin_size; %#ok<UNRCH>
    n_shuf = n_shuf / bin_size_shuf;
end

n_org = n_org(1:end-1); % remove right edge
n_shuf = n_shuf(1:end-1);% remove right edge
x=edges(1:end-1)+(edges(2)-edges(1))/2;
x_shuf=edges_shuf(1:end-1)+(edges_shuf(2)-edges_shuf(1))/2;
figure;
hold on;
h.shu = bar(x_shuf,n_shuf,1);
c.su = get(h.shu, 'child');
color_shu = [0.3 0.3 0.3];
color_org = [0.7 0.7 0.7];
set(h.shu,'facecolor',color_shu);
set(h.shu,'edgecolor',color_shu);
set(h.shu,'linestyle','none');
%set(c.su,'facea',0.3);

h.org = bar(x,n_org,1);
set(h.org,'facecolor',color_org);
set(h.org,'edgecolor',color_org);

% outline of shuffled data
x_shuf=flatten([edges_shuf;edges_shuf]);
x_shuf = x_shuf(2:end-1);
y = flatten([n_shuf;n_shuf]);
plot(x_shuf,y,'color',color_shu,'linewidth',3);

xlabel([xlab '(um)']);
if plot_per_micron
    ylabel('Fraction per um'); %#ok<UNRCH>
else
    ylabel('Fraction');
end
legend([h.org,h.shu],'Data','Shuffled')
legend boxoff
xlim([0 30]);
%x=0:0.1:30;plot(x,0.093*exp(-x/5.3),'g');

save_figure(subst_filechars(['mito_shuffle_' xlab '_' groupname '.png']));

% statistics

logmsg(['Original mean ' xlab ' = ' num2str(mean(distance2mito_org),3) ' +- ' num2str(sem(distance2mito_org),3) ' um (SEM), n = ' num2str(length(distance2mito_org))]);
logmsg(['Shuffled mean ' xlab ' = ' num2str(mean(distance2mito_shuf),3) ' +- ' num2str(sem(distance2mito_shuf),3) ' um (SEM), n = ' num2str(length(distance2mito_shuf))]);
[h,p] = kstest2(distance2mito_org,distance2mito_shuf); %#ok<ASGLU>
logmsg(['p = ' num2str(p,3) ', Kolmogorov-Smirnov, but this p value is certainly too low. I would not report it']);
logmsg(['True mean higher than shuffled mean in ' ...
    num2str(sum(mean_mito_org>means_mito_shu)/length(means_mito_shu)*100) ...
    ' % of ' num2str(n_shuffles) ' shuffles, i.e. p = ' num2str(sum(mean_mito_org>means_mito_shu)/length(means_mito_shu))]);


figure;
hist(means_mito_shu,max(10,ceil(n_shuffles/35)));
% xlims = xlim;
%xlim([3 8]);
c = get(gca,'children');
set(c,'facecolor',color_shu)
set(c,'edgecolor',color_shu)
hold on
plot([mean_mito_org mean_mito_org],ylim,'color',color_org,'linewidth',2);
xlabel('Mean distance (um)');
ylabel('Count');
save_figure(subst_filechars(['means_mito_shuffle_' xlab '_' groupname '.png']));



function record = interpolate_axons( record, params)
celllist = record.ROIs.celllist;
ind_axons = find(strncmp('axon',{celllist.type},4));
for i=1:length(ind_axons)
    axon = celllist(ind_axons(i));
    
    
    if params.add_puncta_to_axons
    % need to add present bouton and mito's
    %neurites = reshape([celllist.neurite],2,[]);
    %neurites = neurites(1,:);
    neurites = [record.measures(:).linked2neurite];
    
    ind_on_axon = find(neurites==axon.index & [celllist.present]==1);
    for j=ind_on_axon(:)'
        punctum = celllist(j);
        ind = find_closest_ind_on_axon(punctum,axon,params);
        xi = mean(punctum.xi);
        yi = mean(punctum.yi);
        zi = mean(punctum.zi);
        
        if ind==1
            axon.xi = [axon.xi(1) xi axon.xi(2:end)];
            axon.yi = [axon.yi(1) yi axon.yi(2:end)];
            axon.zi = [axon.zi(1) zi axon.zi(2:end)];
        elseif ind == length(axon.xi)
            axon.xi = [axon.xi(1:end-1) xi axon.xi(end)];
            axon.yi = [axon.yi(1:end-1) yi axon.yi(end)];
            axon.zi = [axon.zi(1:end-1) zi axon.zi(end)];
        else % somewhere in the middle
            % add before
            axon_before = axon;
            axon_before.xi = [axon.xi(1:ind-1) xi axon.xi(ind:end)];
            axon_before.yi = [axon.yi(1:ind-1) yi axon.yi(ind:end)];
            axon_before.zi = [axon.zi(1:ind-1) zi axon.zi(ind:end)];
            axonlength_before = tp_get_neurite_length( axon_before, record,params );
            axon_after = axon;
            axon_after.xi = [axon.xi(1:ind) xi axon.xi(ind+1:end)];
            axon_after.yi = [axon.yi(1:ind) yi axon.yi(ind+1:end)];
            axon_after.zi = [axon.zi(1:ind) zi axon.zi(ind+1:end)];
            axonlength_after = tp_get_neurite_length( axon_after, record,params );
            if axonlength_before < axonlength_after
                axon = axon_before;
            else
                axon = axon_after;
            end
        end
    end
    
    end
    
    
    if length(axon.zi)>1
        meanstep_pixel = mean(sqrt((diff(axon.xi)).^2+(diff(axon.yi)).^2+(diff(axon.zi)).^2));
    else
        meanstep_pixel = mean(sqrt((diff(axon.xi)).^2+(diff(axon.yi)).^2));
    end
    meanstep_um = meanstep_pixel * params.x_step;
    required_step_um = 0.1; % minimum interpolation step
    reinterpolate = ceil(meanstep_um/required_step_um);
    
    x = 1:length(axon.xi);
    nx = 1:1/reinterpolate:length(axon.xi);
    axon.xi = interp1(x,axon.xi,nx);
    axon.yi = interp1(x,axon.yi,nx);
    if length(axon.zi)>1
        axon.zi = interp1(x,axon.zi,nx,'spline');
    end
    
    
    celllist(ind_axons(i)) = axon;
end
record.ROIs.celllist = celllist;



function record = shuffle_mitos( record,roitype)
debug = false;

if debug
    open_tptestrecord(record);
end

celllist = record.ROIs.celllist;
ind_axons = find(strncmp('axon',{celllist.type},4));
ind_mito = find(strncmp(roitype,{celllist.type},4) & [celllist.present]==1);
for i=1:length(ind_axons)
    axon = celllist(ind_axons(i));
    index = axon.index;
    ind_mito_on_axon = ind_mito(cellfun(@(x) x(1),{celllist(ind_mito).neurite})==index);
    
    if length(axon.zi) ~= length(axon.xi)
        logmsg(['Axon is 2D only. Shuffle is not possible for ' recordfilter(record)]);
        record = [];
        return
    end
    
    random_pos_on_axon = random('unid',length(axon.xi),length(ind_mito_on_axon),1);
    random_x = axon.xi(random_pos_on_axon);
    random_y = axon.yi(random_pos_on_axon);
    random_z = axon.zi(random_pos_on_axon);
    
    for j=1:length(ind_mito_on_axon) % move mito to random position on axon
        mito = celllist(ind_mito_on_axon(j));
        %         mito.xi = mito.xi - sum(mito.xi)/length(mito.xi) + random_x(j);
        %         mito.yi = mito.yi - sum(mito.yi)/length(mito.yi) + random_y(j);
        %         mito.zi = mito.zi - mean(mito.zi) + random_z(j);
        mito.xi = random_x(j);
        mito.yi = random_y(j);
        mito.zi = random_z(j);
        
        %           logmsg('Offset and swap x,y for debugging');
        %           mito.xi = mito.xi + 10/params.x_step;
        
        celllist(ind_mito_on_axon(j)) = mito;
        % pixelinds is not updated!
    end % j
end %  i
record.ROIs.celllist = celllist;


if debug
    open_tptestrecord(record);
    keyboard
end



function res = axons2d( record)
res = false;
celllist = record.ROIs.celllist;
ind_axons = find(strncmp('axon',{celllist.type},4));
for i=1:length(ind_axons)
    axon = celllist(ind_axons(i));
    if length(axon.zi)<length(axon.xi)
        res = true;
        return
    end
end

function record = pull_mito2axons( record, params ) % is pulling both mitos and boutons to axon
celllist = record.ROIs.celllist;

switch params.pull_boutons2axons
    case true
        ind_mito = find(strncmp('mito',{celllist.type},4) | strncmp('bouton',{celllist.type},6));
    case false
        ind_mito = find(strncmp('mito',{celllist.type},4) );
end

ind_axons = find(strncmp('axon',{celllist.type},4));

for i=1:length(ind_axons)
    axon = celllist(ind_axons(i));
    index = axon.index;
    ind_mito_on_axon = ind_mito(cellfun(@(x) x(1),{celllist(ind_mito).neurite})==index);
    
    if length(axon.zi) ~= length(axon.xi)
        logmsg(['Axon is 2D only. Pulling mitos to their axon is not possible for ' recordfilter(record)]);
        record = [];
        return
    end
    
    for j=1:length(ind_mito_on_axon) % move mito to random position on axon
        mito = celllist(ind_mito_on_axon(j));
        ind = find_closest_ind_on_axon(mito,axon,params);
%         mito.xi = mito.xi - mean(mito.xi) + axon.xi(ind);
%         mito.yi = mito.yi - mean(mito.yi) + axon.yi(ind);
%         mito.zi = mito.zi - mean(mito.zi) + axon.zi(ind);
        mito.xi = axon.xi(ind);
        mito.yi = axon.yi(ind);
        mito.zi = axon.zi(ind);
        celllist(ind_mito_on_axon(j)) = mito;
        % pixelinds is not updated!
    end % j
end %  i
record.ROIs.celllist = celllist;



function ind = find_closest_ind_on_axon(punctum,axon,params)
center = [mean(punctum.xi); mean(punctum.yi); mean(punctum.zi)];
axonr = [axon.xi ; axon.yi; axon.zi];
d = axonr - repmat(center,1,length(axon.xi));
d = d.*repmat([params.x_step;params.y_step;params.z_step],1,size(d,2));
[m,ind]=min(sum(d.^2)); %#ok<ASGLU>  axon spot closest to center
