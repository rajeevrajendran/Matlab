function params = processparams_local(params) % #ok<FNDEF>
%PROCESSPARAMS_LOCAL temporarily and locally override analysis parameters
%
%  Do not edit processparams_local_org.m but make a copy
%  processparams_local.m and edit this instead. 
%
% 2014, Alexander Heimel

% Changes here
%experiment = ''
addpath('C:\Software\InVivoTools\General');

%%%%%%%%%%%%%         Mito project           %%%%%%%%%%%%%%
%%%%%%%%%%%%%         Rajeev                 %%%%%%%%%%%%%%
% Mito quant unblind ref transform
switch lower(experiment)
     case '11.12_ls'
        % default gamma values for 11.12 (mito quant)
        params.viewing_default_gamma(1) = 0.9;
        params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
        params.bouton_close_minimum_intensity_rel2dendrite(2) = 0;
     case '11.12_ls2'
        % default gamma values for 11.12 (mito quant)
        params.viewing_default_gamma(1) = 0.9;
        params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
        params.bouton_close_minimum_intensity_rel2dendrite(2) = 0;
     case '11.12_ls_axons'
        % default gamma values for 11.12 (mito quant)
        params.viewing_default_gamma(1) = 0.9;
        params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
        params.bouton_close_minimum_intensity_rel2dendrite(2) = 0;
     case '12.34'
        %params.viewing_default_gamma(1) = 0.9;
        %params.viewing_default_gamma(2) = 0.8;
        params.blind_fields = {'date','slice','laser','location','comment','mouse'};
        params.blind_shuffle = true;
end

params.bouton_close_minimum_intensity_rel2dendrite(2) = 0; 

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