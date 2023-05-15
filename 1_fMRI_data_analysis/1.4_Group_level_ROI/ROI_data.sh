#!/bin/bash
#Script by A. Schrantee and K.A. van Galen - 2020

for i in 01 02 03 04 05 06 08 09 11 12 13 14 15 16 17 19 20 21 22 23 24 25 26 27 28 29 30; do #Subjects

	for mask in Nac_t30 Putamen_t30 Caudate_t30; do #ROI masks
		for cope in 15 16 17 18 19 20 21 22 23 24 25 26 27; do #These positive contrasts represent time bins T1-T13

		#Calculates mean and variability of the percentage change from baseline for the mask for glucose-water (cope1) and lipid-water (cope2)
		/scratch/opt/fsl-6.0.0/bin/featquery 1 $HOME/lood_storage/divi/Projects/spin/GLM/midlevel.gfeat/midlevel_persubject/sub-$i.gfeat/cope$cope.feat 4  stats/cope1 stats/cope2 stats/varcope1 stats/varcope2 featquery_perc_"$mask" -p -s $HOME/lood_storage/divi/Projects/spin/GLM/midlevel.gfeat/Masks/"$mask".nii.gz

		done
	done
done
