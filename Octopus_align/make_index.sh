#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=00:50:00
#SBATCH --mem=100GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


## Loading modules 

module load STAR/2.5.3a-foss-2016b
module load GCC/6.3.0-2.27


## Generating Index files using 2nd assembly 

Octopus_genomeDIR=//fast/users/a1654797/Octopus
genomeDir=//fast/users/a1654797/Octopus

STAR --runMode genomeGenerate --genomeDir $genomeDir/Octupus_indexes --genomeFastaFiles $Octopus_genomeDIR/GCF_001194135.1_Octopus_bimaculoides_v2_0_genomic.fna --limitGenomeGenerateRAM 200000000000 --runThreadN 16 
