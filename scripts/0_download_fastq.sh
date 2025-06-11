#!/bin/bash
#SBATCH -c 16
#SBATCH -t 0-02:00
#SBATCH -p test
#SBATCH --mem=128G
#SBATCH -o ./log/output_%j.out
#SBATCH -e ./log/errors_%j.err

# DOI for Dataverse dataset
DOI="doi:10.7910/DVN/VY3J77"

# Directories
DEST_DIR="../data"
BIN_DIR="../bin"

# Ensure necessary directories exist
mkdir -p "${DEST_DIR}"
mkdir -p "${BIN_DIR}"

# Filename for dataset zip
DEST="${DEST_DIR}/dataset_bundle.zip"

# Download the dataset
curl -L "https://dataverse.harvard.edu/api/access/dataset/:persistentId/?persistentId=${DOI}" -o "${DEST}"

# Unzip with zip bomb protection disabled
UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE unzip "${DEST}" -d "${DEST_DIR}" && rm "${DEST}"

# Move the .sif file (if it exists) into ./bin/
if [ -f "${DEST_DIR}/kallisto_ubuntu-22.04.sif" ]; then
    mv "${DEST_DIR}/kallisto_ubuntu-22.04.sif" "${BIN_DIR}/"
    echo "Moved kallisto_ubuntu-22.04.sif to ${BIN_DIR}/"
else
    echo "Warning: kallisto_ubuntu-22.04.sif not found in ${DEST_DIR}"
fi

echo "Download and extraction complete."
