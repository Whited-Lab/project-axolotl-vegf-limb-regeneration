# project-axolotl-vegf-limb-regeneration

## Introduction

This repository contains analysis scripts for the publication:

> **Savage, Aaron M., et al.** (2025). *VEGF signaling promotes blastema growth and proliferation of vascular and non-vascular cells during axolotl limb regeneration.* Developmental Biology.  
> [https://doi.org/10.1016/j.ydbio.2025.05.030](https://doi.org/10.1016/j.ydbio.2025.05.030)

To reproduce the analysis, download this repository and follow the steps in **"To Run Analysis Pipeline"** below. All scripts are designed to automatically download required data into the expected folder structure.

Computational analysis was performed using the [Harvard FASRC Cluster](https://www.rc.fas.harvard.edu/) in 2024.

---


## Raw Data Sources

- **Raw sequencing data**  
  [Harvard Dataverse – https://doi.org/10.7910/DVN/VY3J77](https://doi.org/10.7910/DVN/VY3J77)

- **Transcriptome reference**  
  AmexT_v47 from [https://www.axolotl-omics.org/assemblies](https://www.axolotl-omics.org/assemblies)

- **Quantification tool**  
  [`kallisto v0.48.0`](https://pachterlab.github.io/kallisto/about.html) used via Singularity container (`kallisto_ubuntu-22.04.sif`), automatically downloaded into `./bin/` from Harvard Dataverse through Step 1 below.

- **Precomputed results**  
  See `./supplementary_files/` for DESeq2, KEGG, and GO output tables and plots.


---


## To Run Analysis Pipeline

### 1. Raw Data and References
From the `./scripts` directory, run scripts 0-3 to download the data, prepare the references and align/quantify 

### 2. DESeq2 Differential Expression 
Run `./scripts/4_Final_DEG_Volcano_Heatmap_PCA.Rmd` which will output DESeq analysis, volcano/heatmap plots and tables to `./scripts/output/`

- uses DESeq2 to generate DE results table (`deseq_result_sig.xlsx`)

- volcano plots with annotated genes (sourced from `volcano_gene_names.txt` & `volcano_gene_amexid.txt`)

- heatmaps with annotated genes (sourced from `heatmap_gene_list_v3.csv`)

- PCA plots

### 3. KEGG/GO Analysis
Run `./scripts/5_Final_KEGG_GO_analysis.Rmd` which will output KEGG and GO analysis to `./scripts/output/`

- uses KEGG analysis from `018_Illumina_res_g.rds` object (generated in `4_Final_DEG_Volcano_Heatmap_PCA.Rmd` as "res_g") to generate pathway analysis table `pathway_analysis_results.xlsx`

- uses GO analysis from KEGG data prep ("tidy.liv2" object) to generate GO results table (`GO_results.csv`)

---


## Experimental Overview

| Condition      | Samples                                  |
|----------------|-------------------------------------------|
| **DAPT treated**  | A01v1_A2_S1, B01v1_C2_S2, C01v1_D2_S3 |
| **AV951 treated**  | D01v1_F2_S4, E01v1_G2_S5, F01v1_I2_S6   |
| **Control**        | G01v1_M2_S7, H01v1_N2_S8, A02v1_O2_S9   |

*Note: DAPT-treated samples were excluded from downstream analysis*

---

## Contact & Authorship

This repository is maintained by members of the **Whited Lab** at the **Harvard University Department of Stem Cell and Regenerative Biology**.

**Creator / Contact**  
- **Name:** Hani Singer  
- **Email:** [hani_singer@fas.harvard.edu](mailto:hani_singer@fas.harvard.edu)  
- **Role:** Laboratory Research Manager  

**Principal Investigator**  
- **Name:** Dr. Jessica L. Whited  
- **Lab Website:** [www.whitedlab.com](http://www.whitedlab.com)  
- **Email:** [whitedlab@gmail.com](mailto:whitedlab@gmail.com)

For questions, bug reports, or contributions, please [open an Issue](https://github.com/Whited-Lab/project-axolotl-vegf-limb-regeneration/issues) or contact us via email.
