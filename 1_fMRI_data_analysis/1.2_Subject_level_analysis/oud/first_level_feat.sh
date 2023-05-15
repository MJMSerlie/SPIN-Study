#!/bin/bash
#Script by K.A. van Galen
OUTDIR=$HOME/lood_storage/divi/Projects/spin/GLM

for sub in sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-08 sub-09 sub-11 sub-12 sub-13 sub-14 sub-15 sub-16 sub-17 sub-19 sub-20 sub-21 sub-22 sub-23 sub-24 sub-25 sub-26 sub-27 sub-28 sub-29 sub-30; do 

	SUB_OUTDIR=$OUTDIR/"$sub"	
	for run in run-1 run-2 run-3; do # Run-1 = water, run-2 = glucose, run-3 = lipid
		
		# Personalize FSL FEAT first level design file for subject level analysis for specific subject and run
		cp $OUTDIR/design/design_first_level_feat.fsf $SUB_OUTDIR/"$sub"_"$run".fsf 
		sed -i -e 's/CHANGESUB/'$sub'/g' $SUB_OUTDIR/"$sub"_"$run".fsf 
		sed -i -e 's/CHANGERUN/'$run'/g' $SUB_OUTDIR/"$sub"_"$run".fsf 

		# Run FSL feat first level analysis 		
		feat $SUB_OUTDIR/"$sub"_"$run".fsf 		
	done
done
	  
