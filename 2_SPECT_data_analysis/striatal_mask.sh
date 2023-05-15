#!/bin/bash
# Script by A. Schrantee and K.A. van Galen - 2020

# Run Freesurfer for segmentation of T1w anatomical scans
T1w=$HOME/lood_storage/divi/Projects/spin/SPECT/T1_nii 
SPECT_DIR=$HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_DIR
export SUBJECTS_DIR=$HOME/lood_storage/divi/Projects/spin/SPECT/Freesurfer_output 
cd $T1w

for number in 01 02 03 04 05 06 08 09 11 12 13 14 15 16 17 19 20 21 22 23 24 25 26 27 28 29 30; do 
	i="SPIN_"$number
  	recon-all -all -s $i -i $T1w/$i"_MPRAGE_1mm_CS.nii.gz"

done

# Select striatal mask from Freesurfer segmentation
SUBJECTS_DIR=$HOME/lood_storage/divi/Projects/spin/SPECT/Freesurfer_output
cd $SUBJECTS_DIR

for i in $(ls); do

	if test -f "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz;then
		echo ""$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz exists"

	else
		echo doing "$i"
		mri_convert -rl "$SUBJECTS_DIR"/"$i"/mri/rawavg.mgz -rt nearest "$SUBJECTS_DIR"/"$i"/mri/aseg.mgz "$SUBJECTS_DIR"/"$i"/mri/aseg2raw.nii.gz

		mkdir "$SPECT_DIR"/"$i"/

		fslmaths "$SUBJECTS_DIR"/"$i"/mri/aseg2raw.nii.gz -uthr 12 -thr 11 "$SPECT_DIR"/"$i"/"$i"_left_striatum.nii.gz
		fslmaths "$SUBJECTS_DIR"/"$i"/mri/aseg2raw.nii.gz -uthr 51 -thr 50 "$SPECT_DIR"/"$i"/"$i"_right_striatum.nii.gz
		fslmaths "$SPECT_DIR"/"$i"/"$i"_right_striatum.nii.gz -add "$SPECT_DIR"/"$i"/"$i"_left_striatum.nii.gz -bin "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz
		echo finished "$i"
	fi
done

# Combine T1w scan with striatal mask
cd $SPECT_DIR
for i in $(ls); do

	if test -f "$SPECT_DIR"/"$i"/"$i"_T1_striatum.nii.gz; then
		echo ""$SPECT_DIR"/"$i"/"$i"_T1_striatum.nii.gz exists"

	else
		echo "$i"
		fslmaths "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz -mul 60000 "$SPECT_DIR"/"$i"/"$i"_striatum_mul.nii.gz
		fslmaths "$SPECT_DIR"/"$i"/"$i"_striatum_mul.nii.gz -add $HOME/lood_storage/divi/Projects/spin/SPECT/T1_nii/"$i"_MPRAGE_1mm_CS.nii.gz "$SPECT_DIR"/"$i"/"$i"_T1_striatum.nii.gz 
		gunzip "$SPECT_DIR"/"$i"/"$i"_T1_striatum.nii.gz
	fi
done
