# SPIN-Study

This repository contains custom codes of the following project:

# Brain responses to nutrients are severely impaired and not reversed by weight 2 loss in humans with obesity: a randomized crossover study 
### Katy A. van Galen, Anouk Schrantee, Kasper W. ter Horst, Susanne E. la Fleur, Jan Booij, R. Todd Constable, Gary J. Schwartz, Ralph J. DiLeone, Mireille J. Serlie


## 1. 	fMRI data analysis

### 1.1 	Preprocessing
fMRI data were preprocessed using FMRIPREP v1.2.3 [RRID: SCR_016216] (`run_fmriprep.txt` in `1.1_Preprocessing`).

### 1.2 	Subject level analysis
First level analysis was performed using the Functional Magnetic Resonance Imaging of the Brain (FMRIB) Software Library (FSL 6.0, Oxford, UK; http://www.fmrib.ox.ac.uk/fsl) and the FMRI Expert Analysis Tool (FEAT): `first_level_feat.sh` in `1.2_Subject_level_analysis`. The first three volumes from each functional scan were removed. The remaining 1407 volumes were divided over 14 consecutive time bins (details in `Timebins` in `1.2_Subject_level_analysis`). Contrasts were set up to compare T1-T13 with baseline (T0) within every functional brain scan (design in `design_first_level_feat.fsf` in `1.2_Subject_level_analysis`). The time course of the BOLD signal of the cerebrospinal fluid (CSF) of each scan was extracted (`csf_timecourse.sh` in `1.2_Subject_level_analysis`) and included as covariate to adjust for general, non-infusion related changes in BOLD signal. 
Next in the mid-level analysis, for each subject, the maps of T1-T13 of the water infusion session were subtracted from the maps of T1-T13 of the glucose and lipids infusion session: `mid_level_feat.sh` and `design_mid_level_feat.fsf` in `1.2_Subject_level_analysis`.

### 1.3	Group level analysis - voxel-wise analysis
We performed whole-brain voxel-wise analysis to explore the cerebral BOLD signal response to intragastric glucose or lipid infusion. 
Output from the subject level analysis was merged for each time bin: `merged_time_bins.sh` in `1.3_Group_level_voxel-wise`. 
Clusters of grey-matter voxels that showed a significant increase or decrease from baseline (T0) for each time bin (T1-T13) were identified using Threshold Free Cluster Enhancement (TFCE) and permutation testing using Permutation Analysis of Linear Models (PALM) v.alpha116: `run_PALM.sh` in `1.3_Group_level_voxel-wise`. 

### 1.4	Group level analysis - region-of-interest (ROI) analysis
We complemented the explorative voxel-wise analysis with a targeted ROI analysis to assess the striatal BOLD response to post-ingestive nutrient signals. Therefore the mean change (%) in BOLD signal from baseline (T0) was extracted for each time bin (T1-T13) for each ROI: `ROI_data.sh` in `1.4_Group_level_ROI`. 

## 2. 	SPECT data analysis
We applied SPECT imaging in combination with the radiotracer [123I]-iodobenzamide ([123-I]IBZM) in order to determine striatal dopamine D2/3 receptor (D2/3R) availability at baseline and after nutrient infusions. Each step is described below.

Freesurfer (version 5.3.0) was used to obtain striatal masks from individual T1w MRI scans: `striatal_mask.sh` in `SPECT_data_analysis`. SPECT and T1w MRI scans were coregistered: `SPECT_T1_coregistration.m` in `SPECT_data_analysis`. The striatal masks were combined with the coregistered SPECT and T1w MRI scans to extract the data on striatal dopamine D2/3R availability: `striatum_to_SPECT_T1_coregistration.sh` in `SPECT_data_analysis`. 
The occipital cortex was used as reference region to quantify nonspecific radiotracer activity. Occipital cortex masks were obtained by warping the occipital cortex from the Harvard-Oxford cortical atlas to individual T1w MRI using: `FSL occipital_mask.sh` in `SPECT_data_analysis`. The occipital cortex masks were combined with the coregistered SPECT and T1w MRI scans to extract the data on occipital cortex dopamine D2/3R availability: `occipital_to_SPECT_T1_coregistration.sh` in `SPECT_data_analysis`.
