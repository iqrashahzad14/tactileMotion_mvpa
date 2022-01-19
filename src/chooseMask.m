function [opt] = chooseMask(opt)

    for iSub = 1:numel(opt.subjects)

        subID = opt.subjects{iSub};
        % get subject folder name
        subFolder = ['sub-', subID];

        opt.maskPath = fullfile(fileparts(mfilename('fullpath')), '..','..', '..','derivatives' ,'cpp_spm-roi',subFolder);

        % masks to decode/use
        opt.maskName = {strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-V5_desc-visual_radius-10mm_mask.nii'), ...
            strcat('sub-',num2str(subID),'_hemi-R_space-MNI_label-V5_desc-visual_radius-10mm_mask.nii'), ...
            strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-S1_desc-tactile_radius-10mm_mask.nii'), ...
            strcat('sub-',num2str(subID),'_hemi-L_space-MNI_label-V5_desc-tactile_radius-10mm_mask.nii'), ...
            strcat('sub-',num2str(subID),'_hemi-R_space-MNI_label-V5_desc-tactile_radius-10mm_mask.nii')};

        % use in output roi name
        opt.maskLabel = {'visLV5', 'visRV5', 'tacLS1', 'tacLV5', 'tacRV5'};
    end
    
end