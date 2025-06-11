# project-axolotl-vegf-limb-regeneration

## Introduction

This repository contains scripts used for doi: https://doi.org/10.1016/j.ydbio.2025.05.030 . To run the analysis, download this repo and follow "## To Run Analysis Pipeline" steps below. Scripts have been designed to download all necessary data into the directory structure of this repo.

Computational work was performed using the resources of the Harvard University Faculty of Arts and Sciences Research Computing (FASRC) cluster in 2024. 
 

## Raw Data Sources

    Raw sequencing data can be found in the Harvard Whited Lab Dataverse Dataset for this project:
    https://doi.org/10.7910/DVN/VY3J77

    Raw data was aligned to AmexT_v47 transcriptome ( https://www.axolotl-omics.org/assemblies ) 

    Kallisto v0.48.0 was used as a singularity image ("kallisto_ubuntu-22.04.sif") in ./bin/ - this .sif file is included in the dataverse and should be downloaded into ./bin/ using step #1 below. 

    For those who immediately want to look at the output files, we have included ./supplementary_files/ which include Deseq2, KEGG and GO analysis output tables. 


## To Run Analysis Pipeline


    1) RAW DATA/REFERENCES: in ./scripts run scripts 0-3 to download the data, prepare the references and align/quantify

    2) DESEQ: in ./scripts run "4_Final_DEG_Volcano_Heatmap_PCA.Rmd" which will output DESeq analysis, volcano/heatmap plots and tables to "./scripts/output/"

        a) uses DESeq2 to generate DE results table (deseq_result_sig.xlsx)

        b) volcano plots with annotated genes (volcano_gene_names.txt / volcano_gene_amexid.txt)

        c) heatmaps with annotated genes (heatmap_gene_list_v3.csv)

        d) PCA plots

    3) KEGG/GO: in ./scripts run "5_Final_KEGG_GO_analysis.Rmd" which will output KEGG and GO analysis to "./scripts/output/"

        a) uses KEGG analysis from "018_Illumina_res_g.rds" object (generated in Final_DEG_Volcano_Heatmap_PCA.Rmd as "res_g") to generate pathway analysis table (pathway_analysis_results.xlsx)

        2) uses GO analysis from KEGG data prep (tidy.liv2 object) to 
        generate GO results table (GO_results.csv)


## Further Info

Three replicates were collected for each condition as follows (note that DAPT samples are removed from analysis) : 

    DAPT treated = "A01v1_A2_S1", "B01v1_C2_S2", "C01v1_D2_S3" 
    AV951 treated = "D01v1_F2_S4", "E01v1_G2_S5", "F01v1_I2_S6" 
    Control = "G01v1_M2_S7", "H01v1_N2_S8", "A02v1_O2_S9"
        

## Contact & Authorship

This repository is maintained by members of the Whited Lab at Harvard University Department of Stem Cell and Regenerative Biology.

Creator/Contact:
    Name: Hani Singer
    Email: hani_singer@fas.harvard.edu
    Role: Laoratory Research Manager

Principal Investigator:
    Name: Jessica L. Whited
    Lab Website: www.whitedlab.com
    Lab Email: whitedlab@gmail.com

For questions, bug reports, or contributions, please open an Issue or contact us via email.


## Citation

Savage, Aaron M., et al. “VEGF signaling promotes blastema growth and proliferation of vascular and non-vascular cells during axolotl limb regeneration.” Developmental Biology, June 2025, https://doi.org/10.1016/j.ydbio.2025.05.030. 

