# project-axolotl-vegf-limb-regeneration

This repository contains scripts used for doi: https://doi.org/10.1016/j.ydbio.2025.05.030 .

## Raw Data

    Raw sequencing data can be found in the Harvard Whited Lab Dataverse Dataset for this project:
    https://doi.org/10.7910/DVN/VY3J77

    Raw data was aligned to AmexT_v47 transcriptome ( https://www.axolotl-omics.org/assemblies ) 


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



Three replicates were collected for each condition as follows (note that DAPT samples are removed from analysis) : 

    DAPT treated = "A01v1_A2_S1", "B01v1_C2_S2", "C01v1_D2_S3" 
    AV951 treated = "D01v1_F2_S4", "E01v1_G2_S5", "F01v1_I2_S6" 
    Control = "G01v1_M2_S7", "H01v1_N2_S8", "A02v1_O2_S9"
        


