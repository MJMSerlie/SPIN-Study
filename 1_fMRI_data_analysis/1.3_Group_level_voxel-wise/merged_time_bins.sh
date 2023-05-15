#!/bin/bash
#Script by A. Schrantee and K.A. van Galen - 2020

middir=$HOME/lood_storage/divi/Projects/spin/GLM/midlevel.gfeat/midlevel_persubject
outdir=$HOME/lood_storage/divi/Projects/spin/GLM/midlevel.gfeat/4D_files

#Merge glucose for all time bins
for cope in 15 16 17 18 19 20 21 22 23 24 25 26 27; do #These contrasts from the mid-level subject analysis represent time bin T1 to T13; cope1=glucose (corrected for water), cope2=lipid (corrected for water)

	file1=$middir/sub-01.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file2=$middir/sub-02.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file3=$middir/sub-03.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file4=$middir/sub-04.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file5=$middir/sub-05.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file6=$middir/sub-06.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file7=$middir/sub-08.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file8=$middir/sub-09.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file9=$middir/sub-11.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file10=$middir/sub-12.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file11=$middir/sub-13.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file12=$middir/sub-14.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file13=$middir/sub-15.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file14=$middir/sub-16.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file15=$middir/sub-17.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file16=$middir/sub-19.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file17=$middir/sub-20.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file18=$middir/sub-21.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file19=$middir/sub-22.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file20=$middir/sub-23.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file21=$middir/sub-24.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file22=$middir/sub-25.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file23=$middir/sub-26.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file24=$middir/sub-27.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file25=$middir/sub-28.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file26=$middir/sub-29.gfeat/cope$cope.feat/stats/cope1.nii.gz
	file27=$middir/sub-30.gfeat/cope$cope.feat/stats/cope1.nii.gz

	fslmerge -t $outdir/4D_lean_gluc_cope"$cope".nii $file1 $file2 $file3 $file4 $file5 $file6 $file7 $file8 $file9 $file10 $file11 $file12 $file13 $file14 $file15 $file16 $file17 $file18 $file19 $file20 $file21 $file22 $file23 $file24 $file25 $file26 $file27
	gunzip $outdir/4D_lean_gluc_cope"$cope".nii.gz 

done

#Merge lipid for alle time bins
for cope in 15 16 17 18 19 20 21 22 23 24 25 26 27; do #These contrasts from the mid-level subject analysis represent time bin T1 to T13; cope1=glucose (corrected for water), cope2=lipid (corrected for water)

	file1=$middir/sub-01.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file2=$middir/sub-02.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file3=$middir/sub-03.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file4=$middir/sub-04.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file5=$middir/sub-05.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file6=$middir/sub-06.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file7=$middir/sub-08.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file8=$middir/sub-09.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file9=$middir/sub-11.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file10=$middir/sub-12.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file11=$middir/sub-13.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file12=$middir/sub-14.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file13=$middir/sub-15.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file14=$middir/sub-16.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file15=$middir/sub-17.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file16=$middir/sub-19.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file17=$middir/sub-20.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file18=$middir/sub-21.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file19=$middir/sub-22.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file20=$middir/sub-23.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file21=$middir/sub-24.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file22=$middir/sub-25.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file23=$middir/sub-26.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file24=$middir/sub-27.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file25=$middir/sub-28.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file26=$middir/sub-29.gfeat/cope$cope.feat/stats/cope2.nii.gz
	file27=$middir/sub-30.gfeat/cope$cope.feat/stats/cope2.nii.gz

	fslmerge -t $outdir/4D_lean_lipid_cope"$cope".nii $file1 $file2 $file3 $file4 $file5 $file6 $file7 $file8 $file9 $file10 $file11 $file12 $file13 $file14 $file15 $file16 $file17 $file18 $file19 $file20 $file21 $file22 $file23 $file24 $file25 $file26 $file27
	gunzip $outdir/4D_lean_lipid_cope"$cope".nii.gz 

done
