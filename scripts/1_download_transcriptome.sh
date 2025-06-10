#!/bin/bash
#SBATCH -c 16
#SBATCH -t 0-02:00
#SBATCH -p test
#SBATCH --mem=128G
#SBATCH -o ./log/output_%j.out
#SBATCH -e ./log/errors_%j.err

wget "http://www.axolotl-omics.org/api?method=Assembly.getSequences&assembly=47&type=dna" -O ../ref/AmexT_v47_dna.fasta

echo "Download completed: ../ref/AmexT_v47_dna.fasta"
