#!/bin/bash
#SBATCH -c 16
#SBATCH -t 0-02:00
#SBATCH -p test
#SBATCH --mem=128G
#SBATCH -o ./log/output_%j.out
#SBATCH -e ./log/errors_%j.err

# DOI for Dataverse dataset
DOI="doi:10.7910/DVN/VY3J77"

# Destination directory for data
DEST_DIR="../data"

# Filename for dataset zip
DEST="${DEST_DIR}/dataset_bundle.zip"

# Download the dataset
curl -L "https://dataverse.harvard.edu/api/access/dataset/:persistentId/?persistentId=${DOI}" -o "${DEST}"

# Unzip directly into the data directory
UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE unzip "${DEST}" -d "${DEST_DIR}" && rm "${DEST}"

echo "Download and extraction complete."
