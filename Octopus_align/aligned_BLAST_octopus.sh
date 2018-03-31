#!/bin/bash

#SBATCH -p batch
#SBATCH -n 20
#SBATCH -N 1 
#SBATCH --time=3-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

#loading modules
module load BLAST+/2.6.0-foss-2016b-Python-2.7.13

ReadsDIR=/fast/users/a1654797/Homology_with_octopus/STAR_alignments/Cuttlefish/first_alignment_default/fasta_format
outDIR=/fast/users/a1654797/Homology_with_octopus/BLAST_aligned_reads/Octopus
DataDIR=//fast/users/a1654797/Blast_and_Database/Octopus/Protein

#checking to see if the $outDIR exists
echo "Initialising files:"
date

if [ -d $outDIR ]; then
    echo "Folder $outDIR exists ..."
else
    mkdir $outDIR
fi

# opens ReadsDIR
cd ${ReadsDIR}

READS=$(ls *_default.fasta)


for f in ${READS} ;
do 

	readname=${f%_default.fasta}
	echo "BLASTing ${readname} aganist Octopus"

#running blast
blastx -query $ReadsDIR/${readname}_default.fasta -db $DataDIR/GCF_001194135.1_Octopus_bimaculoides_v2_0_protein.faa \
        -out $outDIR/${readname}_blastoutfmt6 \
        -evalue 1e-5 -num_threads 16 -max_target_seqs 1 -outfmt 6


done
