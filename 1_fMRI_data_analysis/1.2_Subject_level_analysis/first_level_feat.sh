#!/bin/bash
# Script by A. Schrantee and K.A. van Galen - 2020

OUTDIR=$HOME/lood_storage/divi/Projects/spin/GLM

for sub in sub-*; do 

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
