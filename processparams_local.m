function params = processparams_local(params) % #ok<FNDEF>
%PROCESSPARAMS_LOCAL temporarily and locally override analysis parameters
%
%  Do not edit processparams_local_org.m but make a copy
%  processparams_local.m and edit this instead. 
%
% 2014, Alexander Heimel

% Changes here
% add experiment variable
addpath('C:\Software\InVivoTools\General');

%%%%%%%%%%%%%         Mito project           %%%%%%%%%%%%%%
%%%%%%%%%%%%%         Rajeev                 %%%%%%%%%%%%%%
% Mito quant unblind ref transform
switch lower(experiment)
     case {'11.12_ls','11.12_rr','11.12_ls2','11.12_ls_axons',...
             '11.12_rr_all','11.12_rr_101','11.12_rr_101_pretty'}
        % default gamma values for 11.12 (mito quant)
        params.viewing_default_gamma(1) = 0.9;
        params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
        params.bouton_close_minimum_intensity_rel2dendrite(2) = 0;
        params.get_intensities = false;
end


params.tp_rank_only_present = false; % change to true for only_present 'type'

%%%%%%%%%%%%%         PV bouton project      %%%%%%%%%%%%%%
%%%%%%%%%%%%%         Rajeev                 %%%%%%%%%%%%%%

switch lower(experiment)
    case '12.34'
        %params.viewing_default_gamma(1) = 0.9;
        %params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
end

if isfield(params,'series_measures')
    params.series_measures = [params.series_measures, 'persistent'];
        params.series_measures = [params.series_measures, 'mito_close'];
        params.series_measures = [params.series_measures, 'bouton_close'];

end


% params.bouton_close_minimum_intensity_rel2dendrite(1) = 100; 

%
% e.g.
% params.tpdatapath_localroot = ''
% params.tpdatapath_networkroot = ''
% params.ecdatapath_localroot = '';  
%
% params.pre_window = [-Inf 0];
%

% 
% params.load_general = 0; % necessary for host function
% params.load_nelsonlabtools = 0; % needed for analysis, should be phased out
% params.load_newstim = 0; % needed for visual stimulation NewStim package
% params.load_neuralanalysis = 0; % needed for electrophysiology analysis
% params.load_twophoton = 0; % needed for twophoton analysis
% params.load_intrinsicsignal = 0; % needed for optical imaging analysis
% params.load_erg =0; % need for ERG stimulation and analysis
% params.load_electrophys = 0; % needed for electrophysiology recording and analysis
% params.load_expdatatools = 0; % needed for InVivoTools analysis
% params.load_studies = {}; % folders of Studies to load

%