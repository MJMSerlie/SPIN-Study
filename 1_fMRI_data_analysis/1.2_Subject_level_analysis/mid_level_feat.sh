#!/bin/bash
# Script by A. Schrantee and K.A. van Galen - 2020

OUTDIR=$SCRATCH/GLM/midlevel

for sub in sub-*; do

	SUB_OUTDIR=$OUTDIR/"$sub"

	# Personalize FSL FEAT mid-level design file for subject level analysis for specific subject
	cp $OUTDIR/design/design_mid_level_feat.fsf $SUB_OUTDIR/midlevel_"$sub".fsf
	sed -i -e 's/CHANGESUB/'$sub'/g' $SUB_OUTDIR/midlevel_"$sub".fsf

	# Run FSL feat mid-level analysis
	feat $SUB_OUTDIR/midlevel_"$sub".fsf

done
