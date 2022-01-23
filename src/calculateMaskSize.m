function maskVoxel = calculateMaskSize(opt)

% get the smoothing parameter for 4D map
  funcFWHM = opt.funcFWHM;

  % choose masks to be used
  opt = chooseMask(opt);
    
  %% MVPA options

  % set cosmo mvpa structure
  condLabelNb = [1 2 3 4];
  condLabelName = {'visual_vertical', 'visual_horizontal', 'tactile_vertical', 'tactile_horizontal'};
%   decodingCondition = 'visual_vertical_vs_visual_horizontal';%'tactile_vertical_vs_tactile_horizontal';

  count = 1;

  for iSub = 1:numel(opt.subjects)

    % get FFX path
    subID = opt.subjects{iSub};
    ffxDir = getFFXdir(subID, funcFWHM, opt);

    % get subject folder name
    subFolder = ['sub-', subID];

    for iImage = 1:length(opt.mvpa.map4D)

      for iMask = 1:length(opt.maskName)

        % choose the mask
        mask = fullfile(opt.maskPath, opt.maskName{iMask});

        % display the used mask
        disp(opt.maskName{iMask});
        
        % 4D image
        imageName = ['4D_', opt.mvpa.map4D{iImage}, '_', num2str(funcFWHM), '.nii'];
        image = fullfile(ffxDir, imageName);

        % load cosmo input
        ds = cosmo_fmri_dataset(image, 'mask', mask);

        % Getting rid off zeros
        zeroMask = all(ds.samples == 0, 1);
        ds = cosmo_slice(ds, ~zeroMask, 2);

        % set cosmo structure
        ds = setCosmoStructure(opt, ds, condLabelNb, condLabelName);

        % slice the ds according to your targers (choose your
        % train-test conditions
%         ds = cosmo_slice(ds, ds.sa.targets == 1 | ds.sa.targets == 2);%%??

        % remove constant features
%         ds = cosmo_remove_useless_data(ds);

        % calculate the mask size
        maskVoxel = size(ds.samples, 2);
        % display the mask size
        disp(maskVoxel);
      end

        % increase the counter and allons y!
        count = count + 1;
    end
   
  end

end

function ds = setCosmoStructure(opt, ds, condLabelNb, condLabelName)
  % sets up the target, chunk, labels by stimuli condition labels, runs,
  % number labels.

  % design info from opt
  nbRun = opt.mvpa.nbRun;
  betasPerCondition = opt.mvpa.nbTrialRepetition;

  % chunk (runs), target (condition), labels (condition names)
  conditionPerRun = length(condLabelNb);
  betasPerRun = betasPerCondition * conditionPerRun;

  chunks = repmat((1:nbRun)', 1, betasPerRun);
  chunks = chunks(:);

  targets = repmat(condLabelNb', 1, nbRun)';
  targets = targets(:);
  targets = repmat(targets, betasPerCondition, 1);

  condLabelName = repmat(condLabelName', 1, nbRun)';
  condLabelName = condLabelName(:);
  condLabelName = repmat(condLabelName, betasPerCondition, 1);

  % assign our 4D image design into cosmo ds git
  ds.sa.targets = targets;
  ds.sa.chunks = chunks;
  ds.sa.labels = condLabelName;

  % figure; imagesc(ds.sa.chunks);

end
