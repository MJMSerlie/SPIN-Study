
%% SCRIPT COREGISTRATION OF D2/3 SPECT SCAN AND T1
%% Script by A. Schrantee and K.A. van Galen - 2020

%--------------------------------------------------------------------------
%% set environmental settings

SPMpath='AMC/matlab/toolbox/spm12_r7487'; % <------CHANGE TO AVAILABLE SPM TOOLBOX 
addpath(SPMpath) % add SPM12 to path

spm_jobman('initcfg')

%%
headdir='/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii';  

participants = dir(['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii/']); 

for i=3:length(participants)
    i=participants(i).name;
   
condition = dir(['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii/',i]); 

    for c=3:length(condition)

    c=condition(c).name;
 
 session = dir(['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii/',i,'/',c]); 

        for s=3:length(session)
        
        s=session(s).name;
            

T1=['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_DIR/',i,'/',i,'_T1_dorsal_striatum.nii'];
DAT= ['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii/',i,'/',c,'/',s,'/',i,'_',c,'_',s,'.nii.gz'];
rDAT= ['/HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii/',i,'/',c,'/',s,'/r',i,'_',c,'_',s,'.nii'];


if exist(rDAT) 
    disp(['rDAT ' i ' ' c ' ' s ' does exists']);  
else
    if exist(DAT) == 0
         disp(['DAT ' i ' ' c ' ' s ' does not exist']);  
    else DATgz=gunzip(DAT)
   
    clear matlabbatch
    matlabbatch{1}.spm.spatial.coreg.estwrite.ref = cellstr(strcat(T1,',1')); % T1
    %matlabbatch{1}.spm.spatial.coreg.estimate.ref = cellstr(orT1); % reoriented T1
    matlabbatch{1}.spm.spatial.coreg.estwrite.source = cellstr(DATgz); % FP-CIT
    matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
    matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
    spm('defaults', 'FMRI');
    spm_jobman('run',matlabbatch);

    end
end
        end
    end
end

        
