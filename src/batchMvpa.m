clear ;
clc;

%% set paths
  % spm
  warning('off');
  addpath(genpath('/Users/shahzad/Documents/MATLAB/spm12'));
  % cosmo
  cosmo = '~/Documents/MATLAB/CoSMoMVPA';
  addpath(genpath(cosmo));
  cosmo_warning('once');

  % libsvm
  libsvm = '~/Documents/MATLAB/libsvm';
  addpath(genpath(libsvm));
  % verify it worked.
  cosmo_check_external('libsvm'); % should not give an error
  
  % add cpp repo
  run ../../tactileMotion_fMRI_analysis/lib/CPP_SPM/initCppSpm.m;
%   run ../lib/CPP_SPM/initCppSpm.m;
     
  % load your options
  opt = getOptionMvpa();

  %% run mvpa 
  
  % use parcels or NS masks?
%   roiSource = 'hmat'; % 'freesurfer', 'neurosynth', ...
%   accuracy = calculateMvpa(opt, roiSource);
    maskVoxel = calculateMaskSize(opt);
    
    % take the most responsive xx nb of voxels
  opt.mvpa.ratioToKeep = 250; %363;%157 for sub-001 and 392 for sub-002 % 100 150 250 350 420
  
%   accuracy = calculateMvpa(opt);
  
  accuracyWithinModality = calculateMvpaWithinModality(opt);
  accuracyCrossModal = calculateMvpaCrossModal(opt);
  
  