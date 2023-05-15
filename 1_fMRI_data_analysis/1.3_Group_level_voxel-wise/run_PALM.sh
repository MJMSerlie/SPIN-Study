#!/bin/bash
#Script by A. Schrantee and K.A. van Galen - 2020

indir=$HOME/scratch/GLM/highlevel/PALM/4D_files
outdir=$HOME/scratch/GLM/highlevel/PALM/Output_glucose_lean/

#Inputs are the merged 4D files for each time bin - example below for the effect of glucose in subjects with a healthy bodyweight. 
in1=$indir/4D_lean_gluc_cope15.nii #T1
in2=$indir/4D_lean_gluc_cope16.nii #T2
in3=$indir/4D_lean_gluc_cope17.nii #T3
in4=$indir/4D_lean_gluc_cope18.nii #T4
in5=$indir/4D_lean_gluc_cope19.nii #T5
in6=$indir/4D_lean_gluc_cope20.nii #T6
in7=$indir/4D_lean_gluc_cope21.nii #T7
in8=$indir/4D_lean_gluc_cope22.nii #T8
in9=$indir/4D_lean_gluc_cope23.nii #T9
in10=$indir/4D_lean_gluc_cope24.nii #T10
in11=$indir/4D_lean_gluc_cope25.nii #T11
in12=$indir/4D_lean_gluc_cope26.nii #T12
in13=$indir/4D_lean_gluc_cope27.nii #T13

palm -i $in1 -i $in2 -i $in3 -i $in4 -i $in5 -i $in6 -i $in7 -i $in8 -i $in9 -i $in10 -i $in11 -i $in12 -i $in13 -o $outdir -m $indir/GM_thr50.nii -n 5000 -nouncorrected -approx tail -T -corrmod -corrcon -ise

