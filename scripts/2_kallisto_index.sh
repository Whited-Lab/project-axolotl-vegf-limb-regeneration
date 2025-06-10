#!/bin/bash
#SBATCH -c 16
#SBATCH -t 0-02:00
#SBATCH -p test
#SBATCH --mem=128G
#SBATCH -o ./log/output_%j.out
#SBATCH -e ./log/errors_%j.err

singularity exec ../bin/kallisto_ubuntu-22.04.sif kallisto index -i ../ref/ki_AmexT_v47_dna.idx \
    --make-unique \
   ../ref/AmexT_v47_dna.fasta
