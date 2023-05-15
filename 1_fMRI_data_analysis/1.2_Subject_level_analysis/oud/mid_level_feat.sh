#!/bin/bash


OUTDIR=/scratch/kavangalen/GLM/midlevel

for sub in sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-08 sub-09 sub-11 sub-12 sub-13 sub-14 sub-15 sub-16 sub-17 sub-19 sub-20 sub-21 sub-22 sub-23 sub-24 sub-25 sub-26 sub-27 sub-28 sub-29 sub-30; do     
	
	SUB_OUTDIR=$OUTDIR/"$sub"
			
	# Personalize FSL FEAT mid-level design file for subject level analysis for specific subject
	cp $OUTDIR/design/design_mid_level_feat.fsf $SUB_OUTDIR/midlevel_"$sub".fsf 
	sed -i -e 's/CHANGESUB/'$sub'/g' $SUB_OUTDIR/midlevel_"$sub".fsf 

	# Run FSL feat mid-level analysis 		
	feat $SUB_OUTDIR/midlevel_"$sub".fsf 				

done
	  
