#!/bin/bash 
# Script by A. Schrantee and K.A. van Galen - 2020

#Warp occipital cortex mask to individual T1w MRI
SUBJECTS_DIR=$HOME/lood_storage/divi/Projects/spin/SPECT/Freesurfer_output
SPECT_DIR=/$HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_DIR 

cd $SUBJECTS_DIR
for i in SPIN_?? ; do 

	if test -f "$SPECT_DIR"/"$i"/"$i"_occipital.nii.gz; then
	echo ""$SPECT_DIR"/"$i"/"$i"_occipital.nii.gz exists"
	else
		echo doing "$i"
		$SCRATCH/scripts/mni152reg.csh --s $i 
		mri_label2vol --seg $HOME/lood_storage/divi/Projects/spin/SPECT/occipital_mask/Occipital_Lobe_thr25.nii.gz --temp "$SUBJECTS_DIR"/"$i"/mri/orig.mgz --reg "$SUBJECTS_DIR"/"$i"/mri/transforms/reg.mni152.2mm.dat --invertmtx --o "$SPECT_DIR"/"$i"/"$i"_occipital.mgz	
		mri_convert -rl "$SUBJECTS_DIR"/"$i"/mri/rawavg.mgz -rt nearest "$SPECT_DIR"/"$i"/"$i"_occipital.mgz "$SPECT_DIR"/"$i"/"$i"_occipital.nii.gz	 
	fi
done

