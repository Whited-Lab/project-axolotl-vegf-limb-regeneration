# project-axolotl-vegf-limb-regeneration

This repository contains scripts used for doi: https://doi.org/10.1101/2024.10.01.616057 .

## Raw Data

    Raw sequencing data is in the Harvard Whited Lab Dataverse 
    https://dataverse.harvard.edu/privateurl.xhtml?token=a1456a30-ec6c-40b3-804b-6b3f791aeaf4

    Raw data was aligned to AmexT_v47 transcriptome ( https://www.axolotl-omics.org/assemblies ) 
    
    Using kallisto: 
            kallisto quant -t 16 \
                -i ki_AmexT_v47_dna.idx \
                -o $dir_name \
                $R1 $R2

## DEG / Volcano / Heatmap / PCA analysis

    R Markdown script "Final_DEG_Volcano_Heatmap_PCA.Rmd" 

        1) uses DESeq2 to generate DE results table (deseq_result_sig.xlsx)
        2) volcano plots with annotated genes (volcano_gene_names.txt / volcano_gene_amexid.txt)
        3) heatmaps with annotated genes (heatmap_gene_list_v3.csv)
        4) PCA plots

## KEGG / Gene Ontology Analysis

    R Markdown script "Final_KEGG_GO_analysis.Rmd" 

        1) uses KEGG analysis from "018_Illumina_res_g.rds" object (generated in Final_DEG_Volcano_Heatmap_PCA.Rmd as "res_g") to generate pathway analysis table (pathway_analysis_results.xlsx)
        2) uses GO analysis from KEGG data prep (tidy.liv2 object) to generate GO results table (GO_results.csv)


        


