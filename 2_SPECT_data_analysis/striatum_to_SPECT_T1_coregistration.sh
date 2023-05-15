#!/bin/bash 
## Script by A. Schrantee and K.A. van Galen - 2020

SPECT_DIR=$HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_DIR
SPECT_nii=$HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_nii
SPECT_output=$HOME/lood_storage/divi/Projects/spin/SPECT/SPECT_output
cd $SPECT_DIR

# Reslice striatal mask and combine with T1w coregistered SPECT data (before (2h) and after (4h) glucose or lipid infusion) to extract data for the striatal mask

#Glucose 2h
for i in $(ls); do
	if test -f "$SPECT_DIR"/"$i"/"$i"_G_2H_striatum_to_SPECT.nii.gz; then
		echo ""$SPECT_DIR"/"$i"/"$i"_G_2H_striatum_to_SPECT.nii.gz exists"
	else
		echo "doing $i"
		flirt -in "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz -ref "$SPECT_nii"/"$i"/"glucose"/"2h"/"$i"_glucose_2h.nii -applyxfm -usesqform -out "$SPECT_DIR"/"$i"/"$i"_G_2H_striatum_to_SPECT.nii.gz
		fslstats "$SPECT_nii"/"$i"/"glucose"/"2h"/"$i"_glucose_2h.nii -k "$SPECT_DIR"/"$i"/"$i"_G_2H_striatum_to_SPECT.nii.gz -V -M -S > "$SPECT_output"/""$i"_G_2H_striatum".txt
	fi
done

#Glucose 4h
for i in $(ls); do
	if test -f "$SPECT_DIR"/"$i"/"$i"_G_4H_striatum_to_SPECT.nii.gz; then
		echo ""$SPECT_DIR"/"$i"/"$i"_G_4H_striatum_to_SPECT.nii.gz exists"
	else
		echo "doing $i"
		flirt -in "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz -ref "$SPECT_nii"/"$i"/"glucose"/"4h"/"$i"_glucose_4h.nii -applyxfm -usesqform -out "$SPECT_DIR"/"$i"/"$i"_G_4H_striatum_to_SPECT.nii.gz
		fslstats "$SPECT_nii"/"$i"/"glucose"/"4h"/"$i"_glucose_4h.nii -k "$SPECT_DIR"/"$i"/"$i"_G_4H_striatum_to_SPECT.nii.gz -V -M -S > "$SPECT_output"/""$i"_G_4H_striatum".txt
	fi
done

#Lipid 2h
for i in $(ls); do
	if test -f "$SPECT_DIR"/"$i"/"$i"_L_2H_striatum_to_SPECT.nii.gz; then
		echo ""$SPECT_DIR"/"$i"/"$i"_L_2H_striatum_to_SPECT.nii.gz exists"
	else
		echo "doing $i"
		flirt -in "$SPECT_DIR"/"$i"/"$i"__striatum.nii.gz -ref "$SPECT_nii"/"$i"/"lipid"/"2h"/"$i"_lipid_2h.nii -applyxfm -usesqform -out "$SPECT_DIR"/"$i"/"$i"_L_2H_striatum_to_SPECT.nii.gz
		fslstats "$SPECT_nii"/"$i"/"lipid"/"2h"/"$i"_lipid_2h.nii -k "$SPECT_DIR"/"$i"/"$i"_L_2H_striatum_to_SPECT.nii.gz -V -M -S > "$SPECT_output"/""$i"_L_2H_striatum".txt
	fi
done

#Lipid 4h
for i in $(ls); do
	if test -f "$SPECT_DIR"/"$i"/"$i"_L_4H_striatum_to_SPECT.nii.gz; then
		echo ""$SPECT_DIR"/"$i"/"$i"_L_4H_striatum_to_SPECT.nii.gz exists"
	else
		echo "doing $i"
		flirt -in "$SPECT_DIR"/"$i"/"$i"_striatum.nii.gz -ref "$SPECT_nii"/"$i"/"lipid"/"4h"/"$i"_lipid_4h.nii -applyxfm -usesqform -out "$SPECT_DIR"/"$i"/"$i"_L_4H_striatum_to_SPECT.nii.gz
		fslstats "$SPECT_nii"/"$i"/"lipid"/"4h"/"$i"_lipid_4h.nii -k "$SPECT_DIR"/"$i"/"$i"_L_4H_striatum_to_SPECT.nii.gz -V -M -S > "$SPECT_output"/""$i"_L_4H_striatum".txt
	fi
done
