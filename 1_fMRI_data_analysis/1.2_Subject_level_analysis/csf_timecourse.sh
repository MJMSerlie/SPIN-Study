#!/bin/bash
# Script by A. Schrantee and K.A. van Galen - 2020

# Generate CSF timeseries
reference_image=$AMC/fsl-6.0.0/data/standard/MNI152lin_T1_2mm_brain.nii.gz
outdir=$HOME/lood_storage/divi/Projects/spin/BIDS/3-Analysis_BIDS_output/CSF_freesurfer_mask
scratch=$HOME/scratch/analysis/CSF/Mask
nifti=$HOME/lood_storage/divi/Projects/spin/T1_nii
module load ants/2.3.1

for number in 01 02 03 04 05 06 08 09 11 12 13 14 15 16 17 19 20 21 22 23 24 25 26 27 28 29 30; do
	i="sub-"$number
	j="SPIN_"$number

	output_mask=$outdir/MNI_space/"$i"_CSF_mask_freesurfer_in_MNI.nii.gz
	CSF_freesurfer_mask_thresholded=$outdir/MNI_space_thresholded/"$i"_CSF_mask_freesurfer_in_MNI_thresholded.nii.gz
	Ldir=$HOME/lood_storage/divi/Projects/spin/BIDS/2-BIDS_output/"$i"/fmriprep/"$i"
	freesurferdir=$HOME/lood_storage/divi/Projects/spin/SPECT/Freesurfer_output/"$j"/mri 
	
	# Run freesurfer segmentation
	recon-all -all -s $j -i $nifti/$j"_MPRAGE_1mm_CS.nii.gz"
	
	# Select CSF mask in freesurfer output
	mkdir $scratch/$i/
	fslmaths "$freesurferdir"/aseg2raw.nii.gz -uthr 5 -thr 4 $scratch/$i/left_lat_vent
	fslmaths "$freesurferdir"/aseg2raw.nii.gz -uthr 24 -thr 24 $scratch/$i/csf
	fslmaths "$freesurferdir"/aseg2raw.nii.gz -uthr 44 -thr 43 $scratch/$i/right_lat_vent
	fslmaths $scratch/$i/left_lat_vent -add $scratch/$i/right_lat_vent -bin $scratch/$i/lat_vent
	fslmaths $scratch/$i/csf -bin $scratch/$i/csf_bin_vent
	fslmaths $scratch/$i/lat_vent -add $scratch/$i/csf_bin_vent $outdir/"T1w_space"/"$i"_CSF_freesurfer_T1.nii.gz
	CSF_freesurfer_mask=$outdir/T1w_space/"$i"_CSF_freesurfer_T1.nii.gz

	# Transform CSF mask from T1 to MNI space
	warp=$Ldir/anat/"$i"_from-T1w_to-MNI152NLin2009cAsym_mode-image_xfm.h5
	antsApplyTransforms -i $CSF_freesurfer_mask -t $warp -r $reference_image -o $output_mask -n Linear
	
	# Threshold CSF mask
	fslmaths $output_mask -thr 0.95 -bin $CSF_freesurfer_mask_thresholded

	# Extraxt CSF timeseries and remove first 3 volumes of CSF timeseries
	for run in run-1 run-2 run-3; do
		echo "doing " $i $run
		fslmeants -i $Ldir/func/"$i"_task-rest_"$run"_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz -m $CSF_freesurfer_mask_thresholded > $outdir/Timeserie_CSF_thresholded/"$i"_"$run"_timeserie_CSF.txt
	
		awk -F"\t" '{print $1}' $outdir/Timeserie_CSF_thresholded/"$i"_"$run"_timeserie_CSF.txt | tail -n +4 > $outdir/Timeserie_CSF_thresholded/"$i"_"$run"_timeserie_CSF.txt
	done

done

