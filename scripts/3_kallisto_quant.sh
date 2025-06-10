#!/bin/bash
#SBATCH -c 16
#SBATCH -t 0-02:00
#SBATCH -p test
#SBATCH --mem=128G
#SBATCH -o ./log/output_%j.out
#SBATCH -e ./log/errors_%j.err


mkdir -p ../data/output

for R1 in ../data/*_R1_001.fastq.gz; do

    R2=$(echo $R1 | sed 's/R1_001.fastq.gz$/R2_001.fastq.gz/')

    dir_name=$(basename $R1 | sed 's/.*465_\(.*\)_R1_001.fastq.gz$/\1/')
    output_dir="../data/output/$dir_name"

    # Remove existing output dir if present
    [ -d "$output_dir" ] && rm -r "$output_dir"

    mkdir -p "$output_dir"

    singularity exec ../bin/kallisto_ubuntu-22.04.sif kallisto quant -t 16 \
        -i ../ref/ki_AmexT_v47_dna.idx \
        -o "$output_dir" \
        "$R1" "$R2"

done